Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8825506702317675184=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 11 Jul 2022 08:51:29 -0000
Message-ID: <165752948986.5766.7328053993209582759@emeril.freedesktop.org>
References: <20220704133249.335053-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220704133249.335053-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2CV2=2C1/2=5D_lib/igt=5Fkms=3A_Add_a_he?=
 =?utf-8?q?lper_to_check_the_max=5Fbpc_constraints_=28rev2=29?=
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

--===============8825506702317675184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,V2,1/2] lib/igt_kms: Add a helper to check the max_bpc constraints (rev2)
URL   : https://patchwork.freedesktop.org/series/105905/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11862_full -> IGTPW_7494_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/index.html

Participating hosts (10 -> 9)
------------------------------

  Additional (2): shard-rkl shard-tglu 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7494_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - {shard-rkl}:        NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11862_full and IGTPW_7494_full:

### New IGT tests (1) ###

  * igt@kms_legacy_colorkey@basic:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_7494_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][2] ([i915#4991])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][3] ([i915#4991])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-apl6/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-iclb:         [PASS][4] -> [DMESG-WARN][5] ([i915#2867])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglb:         NOTRUN -> [FAIL][6] ([i915#2410])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb3/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-snb4/igt@gem_ctx_persistence@process.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#4525])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-kbl:          NOTRUN -> [FAIL][10] ([i915#6117])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb3/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb4/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#2842]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb1/igt@gem_exec_fair@basic-pace@bcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb6/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#2842])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#4613]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#4270])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb7/igt@gem_pxp@create-regular-buffer.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#4270]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb1/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_softpin@evict-single-offset:
    - shard-kbl:          NOTRUN -> [FAIL][30] ([i915#4171])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@gem_softpin@evict-single-offset.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109312])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][32] ([fdo#109271]) +51 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-snb5/igt@gem_vm_create@invalid-create.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglb:         NOTRUN -> [WARN][33] ([i915#2681]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111615])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109278] / [i915#3886])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb8/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-apl3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3886])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3689] / [i915#3886])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3689]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb2/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#6095]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb8/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271]) +14 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-apl3/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615] / [i915#3689]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb8/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk7/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109284] / [fdo#111827])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_content_protection@lic:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#1063])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][54] ([i915#1319]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - shard-apl:          [PASS][55] -> [DMESG-WARN][56] ([i915#180]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109274] / [fdo#111825])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#1888] / [i915#5160])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [FAIL][60] ([i915#4767])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][61] ([i915#180] / [i915#4939])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109274] / [fdo#111825] / [i915#3637])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [PASS][63] -> [FAIL][64] ([i915#79])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][65] ([i915#180]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2672]) +7 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#2672])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#3555])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#5439])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109280])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109280] / [fdo#111825]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][72] -> [FAIL][73] ([i915#1188])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#6403]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109289]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#2920])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-glk:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][82] -> [SKIP][83] ([fdo#109642] / [fdo#111068] / [i915#658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][84] -> [SKIP][85] ([fdo#109441])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb4/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-d-wait-busy-hang:
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271]) +27 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk1/igt@kms_vblank@pipe-d-wait-busy-hang.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109289])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb8/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109291])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb1/igt@prime_nv_api@i915_nv_import_vs_close.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109291])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb7/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@sysfs_clients@sema-25:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2994]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@sysfs_clients@sema-25.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271]) +190 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93] +5 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][94] ([i915#4525]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][96] ([i915#2842]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][98] ([i915#2842]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][100] ([i915#2849]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][102] ([i915#118]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [TIMEOUT][104] ([i915#3953]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][106] ([i915#3921]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-snb6/igt@i915_selftest@live@hangcheck.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-snb2/igt@i915_selftest@live@hangcheck.html
    - shard-tglb:         [DMESG-WARN][108] ([i915#5591]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb3/igt@i915_selftest@live@hangcheck.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][110] ([i915#180]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-apl4/igt@i915_suspend@fence-restore-untiled.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-apl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1:
    - shard-kbl:          [FAIL][112] ([i915#2122]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          [DMESG-FAIL][114] ([i915#180]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_plane@plane-position-covered@pipe-b-planes:
    - shard-tglb:         [INCOMPLETE][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb8/igt@kms_plane@plane-position-covered@pipe-b-planes.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb2/igt@kms_plane@plane-position-covered@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
    - shard-glk:          [DMESG-FAIL][118] ([i915#118] / [i915#1888]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2:
    - shard-glk:          [FAIL][120] ([i915#1888]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][122] ([fdo#109441]) -> [PASS][123] +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb8/igt@kms_psr@psr2_primary_blt.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][124] ([i915#5519]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [INCOMPLETE][126] ([i915#3614] / [i915#4939] / [i915#794]) -> [DMESG-WARN][127] ([i915#180])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-iclb:         [FAIL][128] ([i915#2684]) -> [WARN][129] ([i915#2684])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][130] ([i915#658]) -> [SKIP][131] ([i915#2920])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][132] ([i915#2920]) -> [SKIP][133] ([fdo#111068] / [i915#658])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3953]: https://gitlab.freedesktop.org/drm/intel/issues/3953
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5160]: https://gitlab.freedesktop.org/drm/intel/issues/5160
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6563 -> IGTPW_7494
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11862: ffee806d103b9604db7eb9cd689c098aca1ffa96 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7494: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/index.html
  IGT_6563: 7d43b49bf10788d4870668f93a800888fc8ab339 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/index.html

--===============8825506702317675184==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,V2,1/2] lib/igt_=
kms: Add a helper to check the max_bpc constraints (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105905/">https://patchwork.freedesktop.org/series/105905/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7494/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11862_full -&gt; IGTPW_7494_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/index.=
html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Additional (2): shard-rkl shard-tglu <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7494=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rc6_residency@rc6-idle@vcs0:<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs=
0.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11862_full and IGTPW_7494_=
full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_legacy_colorkey@basic:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7494_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-kbl4/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991=
">i915#4991</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-apl6/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991=
">i915#4991</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
94/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#=
2867</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb3/igt@gem_ctx_persistence@hostile.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">=
i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-snb4/igt@gem_ctx_persistence@process.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/=
shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl7/igt@gem_exec_balancer@parallel-ordering=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6117">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-=
tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-tglb3/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-iclb4/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-a=
pl8/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb1/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-=
iclb6/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-g=
lk9/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-k=
bl4/igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-=
kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-iclb7/igt@gem_pxp@create-regular-buffer.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270"=
>i915#4270</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-tglb1/igt@gem_pxp@create-regular-buffer.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270"=
>i915#4270</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/417=
1">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@gem_softpin@evict-snoop-interrupti=
ble.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@invalid-create:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-snb5/igt@gem_vm_create@invalid-create.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>) +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle@rcs=
0.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2681">i915#2681</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
494/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-iclb8/igt@kms_ccs@pipe-a-bad-pixel-format-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-apl3/igt@kms_ccs@pipe-a-bad-pixel-format-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-glk7/igt@kms_ccs@pipe-a-bad-pixel-format-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb2/igt@kms_ccs@pipe-b-bad-pixel-format-y_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb8/igt@kms_ccs@pipe-c-bad-pixel-format-4_=
tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-apl3/igt@kms_ccs@pipe-c-bad-pixel-format-yf_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a>) +14 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-tglb5/igt@kms_ccs@pipe-c-bad-pixel-format-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-iclb8/igt@kms_ccs@pipe-d-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-glk7/igt@kms_chamelium@dp-hpd-fast.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@kms_chamelium@hdmi-audio.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_content_protection@lic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i=
915#1063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@kms_content_protection@srm.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7494/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-curso=
r-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7494/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888"=
>i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5160">i915#5160</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-glk7/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915=
#4767</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4939">i915#4939</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb2/igt@kms_flip@2x-modeset-vs-vblank-race=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494=
/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +7=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +4 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/s=
hard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-tglb1/igt@kms_pipe_b_c_ivb@enable-pipe-c-whi=
le-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-co=
ntinuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-glk5/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard=
-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-iclb4/igt=
@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-busy-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-glk1/igt@kms_vblank@pipe-d-wait-busy-hang.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-iclb8/igt@perf@unprivileged-single-ctx-count=
ers.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-tglb1/igt@prime_nv_api@i915_nv_import_vs_clos=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7494/shard-iclb7/igt@prime_nv_api@i915_nv_import_vs_clos=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@tools_test@sysfs_l3_parity.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a>) +190 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7494/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PAS=
S</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7494/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/s=
hard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/s=
hard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
494/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/118">i915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7494/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3953">i915#3953</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7494/shard-tglb2/igt@i915_module_load@reload-with-fault-inject=
ion.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3=
921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
94/shard-snb2/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11862/shard-tglb3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#=
5591</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
494/shard-tglb1/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-apl4/igt@i915_suspend@fence-restore-untiled.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7494/shard-apl4/igt@i915_suspend@fence-restore-untiled.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible@c-d=
p1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7494/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible=
@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">D=
MESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7494/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-planes:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb8/igt@kms_plane@plane-position-covered@pipe-b-plane=
s.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7494/shard-tglb2/igt@kms_plane@plane-position-covered@pipe-b-pl=
anes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7494/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a=
-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888=
">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7494/shard-glk8/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb8/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/sha=
rd-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7494/shard-tglb7/igt@kms_psr_stress_test@flip-primary-inva=
lidate-overlay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-kbl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3614">i915#3614</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i915#=
4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/794">=
i915#794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7494/shard-kbl1/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7494/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7494/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11862/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7494/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11862/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11862/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11862/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl4/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11862/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11862/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_118=
62/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-k=
bl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7494/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl1/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7494/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl4/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7494/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7494/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/shard-kbl6/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
0">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6563 -&gt; IGTPW_7494</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11862: ffee806d103b9604db7eb9cd689c098aca1ffa96 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7494: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7494/index.htm=
l<br />
  IGT_6563: 7d43b49bf10788d4870668f93a800888fc8ab339 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8825506702317675184==--
