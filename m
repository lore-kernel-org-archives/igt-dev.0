Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2713040216543983618=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Fri, 18 Mar 2022 14:14:03 -0000
Message-ID: <164761284333.31587.8513567969157267727@emeril.freedesktop.org>
References: <20220318110455.490869-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220318110455.490869-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_Add_support_to_handle_displays_having_5k+_mode?=
 =?utf-8?q?s?=
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

--===============2713040216543983618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Add support to handle displays having 5k+ modes
URL   : https://patchwork.freedesktop.org/series/101534/
State : success

== Summary ==

CI Bug Log - changes from IGT_6386_full -> IGTPW_6801_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_6801_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-iclb:         NOTRUN -> [SKIP][1] ([fdo#109314])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-snb5/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#280])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][4] -> [FAIL][5] ([i915#232]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-tglb6/igt@gem_eio@unwedge-stress.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@gem_eio@unwedge-stress.html
    - shard-iclb:         [PASS][6] -> [TIMEOUT][7] ([i915#2481] / [i915#3070])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb6/igt@gem_eio@unwedge-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109313])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#109283]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#109283]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@gem_exec_params@no-blt.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl6/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][23] ([i915#2658])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#4270]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb7/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#4270]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#768])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109312])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109312])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb4/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109290])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#3323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109289]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@gen3_render_mixed_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109289])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271]) +167 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl8/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#2527] / [i915#2856]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][36] -> [FAIL][37] ([i915#454])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#1937])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111644] / [i915#1397] / [i915#2411])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110892])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#5286]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#5286]) +7 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#118])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111614]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110725] / [fdo#111614])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3777])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3777])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110723]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111615]) +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [i915#3886]) +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3689]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3886]) +12 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3689] / [i915#3886]) +7 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#3886]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3886]) +9 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111615] / [i915#3689]) +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-snb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk9/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109284] / [fdo#111827]) +16 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][65] ([i915#1319])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#3116])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3116] / [i915#3299])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109300] / [fdo#111066])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb4/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#1063])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][70] ([i915#1319])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3359]) +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109278] / [fdo#109279]) +5 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3319]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109279] / [i915#3359]) +8 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109274] / [fdo#111825]) +11 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#5287])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled.html

  * igt@kms_dsc@basic-dsc-enable:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#3840])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_dsc@basic-dsc-enable.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109274]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][80] ([i915#180])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#2587])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-iclb:         [PASS][82] -> [SKIP][83] ([i915#3701])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][84] -> [DMESG-WARN][85] ([i915#180]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109280]) +22 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
    - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271]) +66 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +183 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109280] / [fdo#111825]) +38 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#533]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl7/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-snb:          NOTRUN -> [SKIP][91] ([fdo#109271]) +140 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109278]) +22 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
    - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#533])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#533]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [PASS][95] -> [INCOMPLETE][96] ([i915#3614])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][97] ([fdo#108145] / [i915#265]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][98] ([fdo#108145] / [i915#265]) +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][99] ([fdo#108145] / [i915#265]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#3536]) +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#3536]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#5288])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-a-tiling-4.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#5176]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-edp-1-downscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#5176]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][105] -> [INCOMPLETE][106] ([i915#5243])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb6/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#2920])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#2920]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#658])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#658]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-apl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#658]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][112] -> [SKIP][113] ([fdo#109441])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][114] ([i915#132] / [i915#3467]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109441])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@kms_psr@psr2_suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([fdo#109502])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2437])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#2437])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-kbl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2437])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#2530]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#2530]) +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109291]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#109291]) +4 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@prime_nv_pcopy@test3_1.html

  * igt@sysfs_clients@create:
    - shard-glk:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#2994]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@sysfs_clients@create.html
    - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#2994]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@sysfs_clients@create.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#2994]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl6/igt@sysfs_clients@recycle-many.html
    - shard-iclb:         NOTRUN -> [SKIP][127] ([i915#2994]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@sysfs_clients@recycle-many.html
    - shard-kbl:          NOTRUN -> [SKIP][128] ([fdo#109271] / [i915#2994]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl1/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][129] ([i915#658]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/index.html

--===============2713040216543983618==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Add support to handle displays having 5k+ modes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101534/">https://patchwork.freedesktop.org/series/101534/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6386_full -&gt; IGTPW_6801_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6801_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-snb5/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb7/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-tglb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#232]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2481] / [i915#3070])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb7/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb4/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#109290])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl8/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +167 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> ([i915#5286]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#5286]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-snb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk9/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl3/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb4/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@kms_content_protection@lic.html">SKIP</a> ([i915#1063])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl4/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">SKIP</a> ([i915#3359]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +11 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled.html">SKIP</a> ([i915#5287])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_dsc@basic-dsc-enable.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109280]) +22 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109271]) +66 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +183 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl7/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271]) +140 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109278]) +22 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOMPLETE</a> ([i915#3614])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-none.html">SKIP</a> ([i915#3536]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_plane_lowres@pipe-a-tiling-x.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-a-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-a-tiling-4.html">SKIP</a> ([i915#5288])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation.html">SKIP</a> ([i915#5176]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-edp-1-downscale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-edp-1-downscale-with-rotation.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb6/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html">INCOMPLETE</a> ([i915#5243])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl2/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6386/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.html">FAIL</a> ([i915#132] / [i915#3467]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb6/igt@kms_psr@psr2_suspend.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@kms_vrr@flip-basic.html">SKIP</a> ([fdo#109502])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb5/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-complete.html">SKIP</a> ([i915#2530]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb6/igt@prime_nv_pcopy@test3_1.html">SKIP</a> ([fdo#109291]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-glk5/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-tglb3/igt@sysfs_clients@create.html">SKIP</a> ([i915#2994]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-apl6/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-iclb3/igt@sysfs_clients@recycle-many.html">SKIP</a> ([i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6801/shard-kbl1/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@feature_discovery@psr2:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6">SKIP</a> ([i915#658]) -&gt; [PASS][130]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2713040216543983618==--
