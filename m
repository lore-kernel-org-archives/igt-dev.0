Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3465944739603146096=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Petri Latvala" <petri.latvala@intel.com>
Date: Mon, 09 May 2022 15:11:30 -0000
Message-ID: <165210909053.22805.15365988613457383158@emeril.freedesktop.org>
References: <20220427080853.9535-1-petri.latvala@intel.com>
In-Reply-To: <20220427080853.9535-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Correctly_handle_abort_before_first_test_=28rev3=29?=
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

--===============3465944739603146096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Correctly handle abort before first test (rev3)
URL   : https://patchwork.freedesktop.org/series/96659/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11625_full -> IGTPW_7064_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7064_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rps@min-max-config-loaded:
    - {shard-dg1}:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-dg1-16/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - {shard-dg1}:        NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-dg1-17/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling:
    - {shard-rkl}:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-1/igt@kms_plane_scaling@scaler-with-modifier-unity-scaling.html

  
Known issues
------------

  Here are the changes found in IGTPW_7064_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#1839])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@feature_discovery@display-3x.html
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#1839])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@feature_discovery@display-3x.html

  * igt@gem_ccs@block-copy-inplace:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#5327])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@gem_ccs@block-copy-inplace.html
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#3555] / [i915#5325])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb2/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][8] ([i915#4991]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-snb2/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#4525])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][12] ([i915#5076] / [i915#5614])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@gem_exec_balancer@parallel-bb-first.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][13] ([i915#5614])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][14] ([i915#5076] / [i915#5614]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          NOTRUN -> [FAIL][15] ([i915#2846])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#2842]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#2842]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb1/igt@gem_exec_fair@basic-pace@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-snb:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-snb4/igt@gem_exec_flush@basic-wb-pro-default.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-snb6/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl8/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk1/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#4613]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-glk:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk7/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][31] ([i915#2658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk4/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#4270])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb6/igt@gem_pxp@verify-pxp-stale-buf-execution.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#4270])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#768]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][36] ([i915#4991])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/igt@gem_userptr_blits@input-checking.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109289]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#5566] / [i915#716])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7/igt@gen9_exec_parse@allowed-single.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#2527] / [i915#2856])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#2856])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][42] ([fdo#109271]) +100 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-snb2/igt@i915_hangman@engine-engine-hang.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][43] ([i915#454])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#4387])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@i915_pm_sseu@full-enable.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271]) +86 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#5286]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#5286]) +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +258 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111614]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111615]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#110723]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3689]) +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#3886]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl1/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3689] / [i915#3886]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3886]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk9/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278] / [i915#3886]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3886]) +10 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111615] / [i915#3689])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk2/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb5/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-snb:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-snb4/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl6/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][67] ([i915#1319])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][68] ([i915#1319]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3116] / [i915#3299])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3359]) +11 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#3319]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][73] ([i915#180]) +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109278]) +20 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109279] / [i915#3359]) +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-iclb:         [PASS][77] -> [FAIL][78] ([i915#2346])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109274])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#5287]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#5287])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109274]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109274] / [fdo#111825]) +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-tglb:         [PASS][84] -> [DMESG-WARN][85] ([i915#2411])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-tglb6/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [PASS][86] -> [INCOMPLETE][87] ([i915#3614])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-iclb:         [PASS][88] -> [SKIP][89] ([i915#3701])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271]) +101 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109280]) +20 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109280] / [fdo#111825]) +29 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a:
    - shard-apl:          [PASS][93] -> [FAIL][94] ([i915#1188])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl2/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl6/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][95] ([i915#180])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#3555]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#533]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#533]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#533]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-apl:          [PASS][100] -> [DMESG-WARN][101] ([i915#180]) +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][102] ([fdo#108145] / [i915#265]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#3536]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb2/igt@kms_plane_lowres@pipe-b-tiling-y.html
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#3536])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#111615] / [fdo#112054])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-edp-1-downscale-with-pixel-format:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#5176]) +5 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb3/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-edp-1-downscale-with-pixel-format.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-downscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#5176]) +7 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale:
    - shard-iclb:         [PASS][108] -> [SKIP][109] ([i915#5235]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#658])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2920])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][112] -> [SKIP][113] ([fdo#109441]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][114] ([i915#132] / [i915#3467]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([i915#5030]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#5030]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb4/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([i915#3555]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#109309])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2437])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#2530])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb2/igt@nouveau_crc@pipe-b-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#2530]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109289]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb1/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_nv_api@i915_nv_double_export:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([fdo#109291]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@prime_nv_api@i915_nv_double_export.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#109291]) +4 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@prime_nv_pcopy@test3_1.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([fdo#109295])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb6/igt@prime_vgem@fence-flip-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][126] ([fdo#109295])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@prime_vgem@fence-flip-hang.html

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - shard-apl:          NOTRUN -> [DMESG-WARN][127] ([i915#5098])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][128] ([i915#5098])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk8/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][129] ([i915#5098])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@syncobj_timeline@invalid-transfer-non-existent-point.html

  * igt@syncobj_timeline@transfer-timeline-point:
    - shard-iclb:         NOTRUN -> [DMESG-FAIL][130] ([i915#5098])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-apl:          NOTRUN -> [DMESG-FAIL][131] ([i915#5098])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl7/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][132] ([i915#5098])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk9/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-snb:          NOTRUN -> [DMESG-FAIL][133] ([i915#5098])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-snb4/igt@syncobj_timeline@transfer-timeline-point.html

  * igt@sysfs_clients@fair-1:
    - shard-tglb:         NOTRUN -> [SKIP][134] ([i915#2994]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@fair-7:
    - shard-iclb:         NOTRUN -> [SKIP][135] ([i915#2994]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb1/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][136] ([fdo#109271] / [i915#2994])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl3/igt@sysfs_clients@recycle-many.html
    - shard-glk:          NOTRUN -> [SKIP][137] ([fdo#109271] / [i915#2994])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk4/igt@sysfs_clients@recycle-many.html
    - shard-kbl:          NOTRUN -> [SKIP][138] ([fdo#109271] / [i915#2994]) +3 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-block:
    - {shard-rkl}:        [SKIP][139] ([i915#4098]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-2/igt@drm_read@short-buffer-block.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@drm_read@short-buffer-block.html

  * igt@fbdev@unaligned-read:
    - {shard-rkl}:        [SKIP][141] ([i915#2582]) -> [PASS][142] +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-4/igt@fbdev@unaligned-read.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@fbdev@unaligned-read.html

  * igt@gem_ctx_persistence@many-contexts:
    - {shard-rkl}:        [FAIL][143] ([i915#2410]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-5/igt@gem_ctx_persistence@many-contexts.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-2/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-iclb:         [TIMEOUT][145] ([i915#3070]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb6/igt@gem_eio@in-flight-contexts-immediate.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][147] ([i915#2842]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [FAIL][149] ([i915#2842]) -> [PASS][150] +3 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-tglu}:       [FAIL][151] ([i915#2842]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][153] ([i915#2842]) -> [PASS][154] +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-snb:          [SKIP][155] ([fdo#109271]) -> [PASS][156] +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [DMESG-WARN][157] ([i915#5566] / [i915#716]) -> [PASS][158] +1 similar issue
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-glk4/igt@gen9_exec_parse@allowed-single.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk2/igt@gen9_exec_parse@allowed-single.html
    - shard-apl:          [DMESG-WARN][159] ([i915#5566] / [i915#716]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl1/igt@gen9_exec_parse@allowed-single.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rpm@pm-tiling:
    - {shard-rkl}:        [SKIP][161] ([fdo#109308]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-2/igt@i915_pm_rpm@pm-tiling.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_selftest@mock@objects:
    - {shard-rkl}:        [INCOMPLETE][163] -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-5/igt@i915_selftest@mock@objects.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-4/igt@i915_selftest@mock@objects.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-iclb:         [FAIL][165] ([i915#2521]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb8/igt@kms_async_flips@alternate-sync-async-flip.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [FAIL][167] ([i915#1888] / [i915#5138]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-glk5/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - {shard-rkl}:        [SKIP][169] ([i915#1845] / [i915#4098]) -> [PASS][170] +21 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-rapid-movement:
    - shard-glk:          [DMESG-WARN][171] ([i915#118]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-rapid-movement.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][173] ([i915#2346] / [i915#533]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - {shard-rkl}:        [SKIP][175] ([fdo#111825]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-4/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - {shard-rkl}:        [SKIP][177] ([i915#4098] / [i915#4369]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - {shard-rkl}:        [SKIP][179] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][180] +1 similar issue
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][181] ([i915#180]) -> [PASS][182] +2 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][183] ([i915#1849] / [i915#4098]) -> [PASS][184] +23 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [DMESG-WARN][185] ([i915#2411]) -> [PASS][186] +1 similar issue
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-tglb8/igt@kms_frontbuffer_tracking@psr-suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane@pixel-format@pipe-a-planes:
    - {shard-rkl}:        [SKIP][187] ([i915#3558]) -> [PASS][188] +1 similar issue
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-1/igt@kms_plane@pixel-format@pipe-a-planes.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_plane@pixel-format@pipe-a-planes.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-none:
    - {shard-rkl}:        [SKIP][189] ([i915#3558] / [i915#4070]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-4/igt@kms_plane_multiple@atomic-pipe-b-tiling-none.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-none.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][191] ([fdo#109441]) -> [PASS][192] +2 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - {shard-rkl}:        [SKIP][193] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][195] ([i915#180]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][197] ([i915#5639]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-glk8/igt@perf@polling-parameterized.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk8/igt@perf@polling-parameterized.html

  * igt@perf_pmu@rc6-suspend:
    - {shard-rkl}:        [FAIL][199] ([fdo#103375]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-5/igt@perf_pmu@rc6-suspend.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-1/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-flip:
    - {shard-rkl}:        [SKIP][201] ([i915#3708] / [i915#4098]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [DMESG-WARN][203] ([i915#5614]) -> [SKIP][204] ([i915#4525])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [DMESG-FAIL][205] ([i915#5614]) -> [SKIP][206] ([i915#4525])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][207] ([i915#4525]) -> [DMESG-WARN][208] ([i915#5614])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         [SKIP][209] ([fdo#109300]) -> [SKIP][210] ([fdo#109300] / [fdo#111066])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-iclb4/igt@kms_content_protection@mei_interface.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@kms_content_protection@mei_interface.html
    - shard-tglb:         [SKIP][211] ([fdo#109300]) -> [SKIP][212] ([i915#1063])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-tglb7/igt@kms_content_protection@mei_interface.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_content_protection@mei_interface.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][213], [FAIL][214], [FAIL][215], [FAIL][216], [FAIL][217], [FAIL][218], [FAIL][219], [FAIL][220], [FAIL][221], [FAIL][222], [FAIL][223], [FAIL][224], [FAIL][225], [FAIL][226], [FAIL][227], [FAIL][228], [FAIL][229], [FAIL][230]) ([i915#180] / [i915#4312] / [i915#5257] / [i915#92]) -> ([FAIL][231], [FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239], [FAIL][240], [FAIL][241], [FAIL][242], [FAIL][243], [FAIL][244], [FAIL][245], [FAIL][246], [FAIL][247], [FAIL][248]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716] / [i915#92])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl6/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl3/igt@runner@aborted.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl4/igt@runner@aborted.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7/igt@runner@aborted.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl6/igt@runner@aborted.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl3/igt@runner@aborted.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7/igt@runner@aborted.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl1/igt@runner@aborted.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl4/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl1/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7/igt@runner@aborted.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl6/igt@runner@aborted.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl3/igt@runner@aborted.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl4/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl4/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl6/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl6/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl6/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl6/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl7/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@aborted.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl3/igt@runner@aborted.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl6/igt@runner@aborted.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl7/igt@runner@aborted.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@aborted.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@runner@aborted.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@aborted.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][249], [FAIL][250], [FAIL][251], [FAIL][252]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][253], [FAIL][254], [FAIL][255], [FAIL][256], [FAIL][257], [FAIL][258], [FAIL][259], [FAIL][260]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl1/igt@runner@aborted.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl2/igt@runner@aborted.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl2/igt@runner@aborted.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl3/igt@runner@aborted.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl7/igt@runner@aborted.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl1/igt@runner@aborted.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl8/igt@runner@aborted.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl3/igt@runner@aborted.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl3/igt@runner@aborted.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/igt@runner@aborted.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/igt@runner@aborted.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
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
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5303]: https://gitlab.freedesktop.org/drm/intel/issues/5303
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5849]: https://gitlab.freedesktop.org/drm/intel/issues/5849
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6468 -> IGTPW_7064
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11625: d14ec2169b06f7f6e946fd856b0bd702234d5800 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7064: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/index.html
  IGT_6468: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/index.html

--===============3465944739603146096==
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
<tr><td><b>Series:</b></td><td>runner: Correctly handle abort before first =
test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/96659/">https://patchwork.freedesktop.org/series/96659/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7064/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11625_full -&gt; IGTPW_7064_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7064=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-dg1-16/igt@i915_pm_rps@min-max-config-loaded=
.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-dg1-17/igt@kms_cursor_crc@pipe-c-cursor-susp=
end.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-rkl-1/igt@kms_plane_scaling@scaler-with-modi=
fier-unity-scaling.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7064_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb7/igt@feature_discovery@display-3x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb3/igt@feature_discovery@display-3x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb8/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i9=
15#5327</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb2/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i9=
15#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/53=
25">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-snb2/igt@gem_ctx_persistence@engines-cleanup=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/=
shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb6/igt@gem_exec_balancer@parallel-bb-first=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5614">i915#5614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5614">i915#5614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@gem_exec_balancer@parallel-out-fenc=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5614">i915#5614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-glk5/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">=
i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11625/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/sh=
ard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 si=
milar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11625/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/sh=
ard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-=
iclb1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-snb4/igt@gem_exec_flush@basic-wb-pro-default.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/s=
hard-snb6/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-apl8/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-glk1/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb3/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#21=
90</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@gem_lmem_swapping@basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915=
#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-glk7/igt@gem_lmem_swapping@heavy-multi.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-glk4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb6/igt@gem_pxp@verify-pxp-stale-buf-execut=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb6/igt@gem_pxp@verify-pxp-stale-buf-execut=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb4/igt@gem_render_copy@x-tiled-to-vebox-y=
f-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/768">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-apl2/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@gen7_exec_parse@basic-offset.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-kbl7/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-=
kbl1/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">=
i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb8/igt@gen9_exec_parse@bb-start-cmd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">=
i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-snb2/igt@i915_hangman@engine-engine-hang.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) +100 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@i915_pm_sseu@full-enable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i91=
5#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-glk4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +86 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +258 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb5/igt@kms_big_fb@x-tiled-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D110723">fdo#110723</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3689">i915#3689</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-apl1/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-glk9/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb6/igt@kms_ccs@pipe-a-missing-ccs-buffer-=
y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-glk2/igt@kms_chamelium@hdmi-audio-edid.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb5/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-snb4/igt@kms_chamelium@hdmi-hpd-enable-disabl=
e-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-apl6/igt@kms_color_chamelium@pipe-b-ctm-0-5.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-0-5=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-apl2/igt@kms_content_protection@atomic-dpms.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1319">i915#1319</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-kbl3/igt@kms_content_protection@atomic-dpms.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1319">i915#1319</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_content_protection@dp-mst-lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x5=
12-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3359">i915#3359</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-onscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3319">i915#3319</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspen=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3359">i915#3359</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb1/igt@kms_cursor_legacy@2x-nonblocking-m=
odeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
064/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@kms_display_modes@extended-mode-ba=
sic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb21010=
10-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb21010=
10-pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@kms_flip@2x-modeset-vs-vblank-race=
-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111825">fdo#111825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-tglb6/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7064/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7064/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
614">i915#3614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp=
-ytile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7064/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3701">i915#3701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-apl8/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +101 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +20 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +29 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11625/shard-apl2/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-d=
p-1-pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7064/shard-apl6/igt@kms_hdr@bpc-switch-suspend@bpc-switch-su=
spend-dp-1-pipe-a.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1188">i915#1188</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@bpc-switc=
h-suspend-dp-1-pipe-a.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/180">i915#180</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@kms_hdr@static-swap.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-glk1/igt@kms_pipe_crc_basic@hang-read-crc-pi=
pe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/533">i915#533</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-apl3/igt@kms_pipe_crc_basic@nonblocking-crc-=
pipe-d-frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/533">i915#533</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-d.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7064/shard-apl2/igt@kms_plane@plane-panning-bottom-right-s=
uspend@pipe-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb2/igt@kms_plane_lowres@pipe-b-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb8/igt@kms_plane_lowres@pipe-b-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-a-edp=
-1-downscale-with-pixel-format:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb3/igt@kms_plane_scaling@downscale-with-p=
ixel-format-factor-0-25@pipe-a-edp-1-downscale-with-pixel-format.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915=
#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-d=
ownscale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_plane_scaling@downscale-with-r=
otation-factor-0-75@pipe-b-edp-1-downscale-with-rotation.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-e=
dp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb4/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb2/i=
gt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1=
-planes-upscale-downscale.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb7/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-iclb7/=
igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb3/igt@kms_psr@psr2_sprite_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb6/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb4/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb8/igt@kms_setmode@invalid-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb5/igt@kms_tv_load_detect@load-detect.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1093=
09">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb2/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb7/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb1/igt@perf@per-context-mode-unprivileged=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_export:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb7/igt@prime_nv_api@i915_nv_double_export=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb8/igt@prime_nv_pcopy@test3_1.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb6/igt@prime_vgem@fence-flip-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-tglb7/igt@prime_vgem@fence-flip-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-non-existent-point:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-apl2/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-glk8/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-kbl4/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@transfer-timeline-point:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-iclb8/igt@syncobj_timeline@transfer-timeline-=
point.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-apl7/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-glk9/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-snb4/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-tglb7/igt@sysfs_clients@fair-1.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7064/shard-iclb1/igt@sysfs_clients@fair-7.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-apl3/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-glk4/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7064/shard-kbl1/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>) +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-2/igt@drm_read@short-buffer-block.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/sh=
ard-rkl-6/igt@drm_read@short-buffer-block.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-4/igt@fbdev@unaligned-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rk=
l-6/igt@fbdev@unaligned-read.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-5/igt@gem_ctx_persistence@many-contexts.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#=
2410</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
064/shard-rkl-2/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb6/igt@gem_eio@in-flight-contexts-immediate.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3070"=
>i915#3070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7064/shard-iclb8/igt@gem_eio@in-flight-contexts-immediate.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
064/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/s=
hard-glk3/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i9=
15#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7064/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/=
shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7064/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-uc=
.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11625/shard-glk4/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915=
#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716"=
>i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7064/shard-glk2/igt@gen9_exec_parse@allowed-single.html">PASS</a> +1 si=
milar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11625/shard-apl1/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915=
#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716"=
>i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7064/shard-apl2/igt@gen9_exec_parse@allowed-single.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo#109308</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-=
rkl-6/igt@i915_pm_rpm@pm-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@objects:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-5/igt@i915_selftest@mock@objects.html">INCOMPLETE</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/sha=
rd-rkl-4/igt@i915_selftest@mock@objects.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb8/igt@kms_async_flips@alternate-sync-async-flip.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/252=
1">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7064/shard-iclb4/igt@kms_async_flips@alternate-sync-async-flip.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-glk5/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915=
#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5138=
">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7064/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_big_fb@x-til=
ed-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> +21 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-rapid-movement:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-rapid-movem=
ent.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/118">i915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7064/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-ra=
pid-movement.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-glk7/igt@kms_cursor_legacy@flip=
-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-4/igt@kms_cursor_legacy@long-nonblocking-modeset-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111825">fdo#111825</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_cursor_legacy@long-nonb=
locking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untile=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-pwri=
te-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb5=
65-render-ytiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7064/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-d=
p1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-s=
pr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_frontbuffer=
_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +23 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-tglb8/igt@kms_frontbuffer_tracking@psr-suspend.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
11">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7064/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html">PAS=
S</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-1/igt@kms_plane@pixel-format@pipe-a-planes.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3558">i9=
15#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7064/shard-rkl-6/igt@kms_plane@pixel-format@pipe-a-planes.html">PASS</a> =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-none:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-4/igt@kms_plane_multiple@atomic-pipe-b-tiling-none.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3558">i915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tilin=
g-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
64/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-4/igt@kms_universal_plane@universal-plane-gen9-feat=
ures-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-rkl-6/igt@kms_universal_plane@=
universal-plane-gen9-features-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7064/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-glk8/igt@perf@polling-parameterized.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shar=
d-glk8/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-5/igt@perf_pmu@rc6-suspend.html">FAIL</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103375">fdo#103375</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-=
rkl-1/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#=
4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
064/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5614">i915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7064/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit=
-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/561=
4">i915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7064/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#=
4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7064/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i91=
5#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11625/shard-iclb4/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fd=
o#109300</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7064/shard-iclb8/igt@kms_content_protection@mei_interface.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#109=
300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111066"=
>fdo#111066</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11625/shard-tglb7/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fd=
o#109300</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7064/shard-tglb3/igt@kms_content_protection@mei_interface.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i915#106=
3</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11625/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11625/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl3/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1625/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl1/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1162=
5/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/s=
hard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shar=
d-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11625/shard-kbl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-k=
bl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_11625/shard-kbl4/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-kbl7=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_11625/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#431=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i9=
15#5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/92=
">i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7064/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
64/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shar=
d-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl6/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7064/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl1/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7064/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7064/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_706=
4/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard=
-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7064/shard-kbl4/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11625/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl2/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11625/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11625/shard-apl3/igt@runner@aborte=
d.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl7/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
64/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl8/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shar=
d-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7064/shard-apl3/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7064/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/shard-apl2/igt@run=
ner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6468 -&gt; IGTPW_7064</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11625: d14ec2169b06f7f6e946fd856b0bd702234d5800 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7064: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7064/index.htm=
l<br />
  IGT_6468: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============3465944739603146096==--
