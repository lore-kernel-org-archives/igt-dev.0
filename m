Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7221432579249831689=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Date: Thu, 23 Mar 2023 22:04:21 -0000
Message-ID: <167960906197.6629.14712369063235837734@emeril.freedesktop.org>
References: <20230323161808.1439499-1-imre.deak@intel.com>
In-Reply-To: <20230323161808.1439499-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fdp=5Faux=5Fdev=3A_?=
 =?utf-8?q?Factor_out_helper_checking_for_sink_detect_errors?=
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

--===============7221432579249831689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_dp_aux_dev: Factor out helper checking for sink detect errors
URL   : https://patchwork.freedesktop.org/series/115557/
State : success

== Summary ==

CI Bug Log - changes from IGT_7212_full -> IGTPW_8669_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_8669_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#2842]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk5/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_userptr_blits@access-control:
    - shard-glk:          NOTRUN -> [SKIP][3] ([fdo#109271]) +16 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk9/igt@gem_userptr_blits@access-control.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][4] -> [ABORT][5] ([i915#5566])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl1/igt@gen9_exec_parse@allowed-single.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl1/igt@gen9_exec_parse@allowed-single.html
    - shard-glk:          [PASS][6] -> [ABORT][7] ([i915#5566])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk7/igt@gen9_exec_parse@allowed-single.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk5/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][8] -> [INCOMPLETE][9] ([i915#7790])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-snb5/igt@i915_pm_rps@reset.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-snb4/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [PASS][10] -> [INCOMPLETE][11] ([i915#4528] / [i915#4817])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#3886])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#3886])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#2346])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271]) +24 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  
#### Possible fixes ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - {shard-rkl}:        [SKIP][17] ([i915#3281]) -> [PASS][18] +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-3/igt@api_intel_bb@object-reloc-keep-cache.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@fbdev@eof:
    - {shard-rkl}:        [SKIP][19] ([i915#2582]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-3/igt@fbdev@eof.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-4/igt@fbdev@eof.html

  * igt@fbdev@write:
    - {shard-tglu}:       [SKIP][21] ([i915#2582]) -> [PASS][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@fbdev@write.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-5/igt@fbdev@write.html

  * {igt@gem_barrier_race@remote-request@rcs0}:
    - shard-glk:          [ABORT][23] ([i915#8190]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk3/igt@gem_barrier_race@remote-request@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk4/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-tglu}:       [FAIL][25] ([i915#6268]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-1/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@reset-stress:
    - {shard-dg1}:        [FAIL][27] ([i915#5784]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-dg1-15/igt@gem_eio@reset-stress.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_eio@suspend:
    - {shard-rkl}:        [FAIL][29] ([i915#5115] / [i915#7052]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-4/igt@gem_eio@suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@gem_eio@suspend.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][31] ([i915#2846]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk6/igt@gem_exec_fair@basic-deadline.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][33] ([i915#2842]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][35] ([i915#2842]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - {shard-tglu}:       [FAIL][37] ([i915#2842]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - {shard-rkl}:        [SKIP][39] ([i915#3282]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_workarounds@suspend-resume:
    - {shard-rkl}:        [FAIL][41] ([fdo#103375]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-4/igt@gem_workarounds@suspend-resume.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-3/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - {shard-rkl}:        [SKIP][43] ([i915#2527]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc5-dpms:
    - {shard-rkl}:        [FAIL][45] ([i915#7330]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-5/igt@i915_pm_dc@dc5-dpms.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-1/igt@i915_pm_dc@dc5-dpms.html

  * {igt@i915_pm_dc@dc5-dpms-negative}:
    - {shard-tglu}:       [SKIP][47] ([i915#8018]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@i915_pm_dc@dc5-dpms-negative.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-3/igt@i915_pm_dc@dc5-dpms-negative.html

  * igt@i915_pm_dc@dc6-dpms:
    - {shard-rkl}:        [SKIP][49] ([i915#3361]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][51] ([fdo#109271]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-tglu}:       [SKIP][53] ([i915#1397]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs:
    - {shard-rkl}:        [SKIP][55] ([i915#1845] / [i915#4098]) -> [PASS][56] +21 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-5/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:
    - {shard-tglu}:       [SKIP][57] ([i915#1845] / [i915#7651]) -> [PASS][58] +35 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - shard-apl:          [ABORT][59] ([i915#180]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][61] ([i915#2346]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [FAIL][63] ([i915#2346]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@forked-bo@pipe-b:
    - {shard-rkl}:        [INCOMPLETE][65] ([i915#8011]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-6/igt@kms_cursor_legacy@forked-bo@pipe-b.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-4/igt@kms_cursor_legacy@forked-bo@pipe-b.html

  * igt@kms_cursor_legacy@single-bo@pipe-a:
    - {shard-rkl}:        [INCOMPLETE][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-1/igt@kms_cursor_legacy@single-bo@pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-2/igt@kms_cursor_legacy@single-bo@pipe-a.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - {shard-tglu}:       [INCOMPLETE][69] ([i915#8011]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-1/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-9/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_fbcon_fbt@psr:
    - {shard-rkl}:        [SKIP][71] ([i915#3955]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][73] ([i915#2122]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [FAIL][75] ([i915#79]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
    - shard-apl:          [FAIL][77] ([i915#79]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - {shard-tglu}:       [SKIP][79] ([i915#1849]) -> [PASS][80] +13 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - {shard-rkl}:        [SKIP][81] ([i915#1849] / [i915#4098]) -> [PASS][82] +18 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_psr@primary_render:
    - {shard-rkl}:        [SKIP][83] ([i915#1072]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-5/igt@kms_psr@primary_render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@kms_psr@primary_render.html

  * igt@kms_vblank@pipe-d-wait-busy:
    - {shard-tglu}:       [SKIP][85] ([i915#1845]) -> [PASS][86] +27 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-10/igt@kms_vblank@pipe-d-wait-busy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-7/igt@kms_vblank@pipe-d-wait-busy.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-rkl}:        [FAIL][87] ([i915#4349]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-2/igt@perf_pmu@idle@rcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-2/igt@perf_pmu@idle@rcs0.html

  * igt@prime_mmap_kms@buffer-sharing:
    - {shard-tglu}:       [SKIP][89] ([fdo#109274]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@prime_mmap_kms@buffer-sharing.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-5/igt@prime_mmap_kms@buffer-sharing.html

  * igt@testdisplay:
    - {shard-rkl}:        [SKIP][91] ([i915#4098]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-4/igt@testdisplay.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@testdisplay.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7330]: https://gitlab.freedesktop.org/drm/intel/issues/7330
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#7988]: https://gitlab.freedesktop.org/drm/intel/issues/7988
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8018]: https://gitlab.freedesktop.org/drm/intel/issues/8018
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8154]: https://gitlab.freedesktop.org/drm/intel/issues/8154
  [i915#8190]: https://gitlab.freedesktop.org/drm/intel/issues/8190
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7212 -> IGTPW_8669

  CI-20190529: 20190529
  CI_DRM_12905: 3a266f994a6b752953eb974ab7bf1dc382a2d1b8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8669: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/index.html
  IGT_7212: c67b6c8993c509ca06eca222287c58ade43292e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/index.html

--===============7221432579249831689==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_dp_aux_dev: Factor out helper checking for sink detect errors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115557/">https://patchwork.freedesktop.org/series/115557/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7212_full -&gt; IGTPW_8669_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8669_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk5/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk9/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl1/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl1/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk7/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk5/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-snb5/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-snb4/igt@i915_pm_rps@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7790">i915#7790</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +24 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-3/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-3/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-4/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-5/igt@fbdev@write.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_barrier_race@remote-request@rcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk3/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8190">i915#8190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk4/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-dg1-15/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-dg1-18/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-4/igt@gem_eio@suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5115">i915#5115</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7052">i915#7052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@gem_eio@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk3/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-4/igt@gem_workarounds@suspend-resume.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-3/igt@gem_workarounds@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-5/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7330">i915#7330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-1/igt@i915_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@i915_pm_dc@dc5-dpms-negative}:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@i915_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8018">i915#8018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-3/igt@i915_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-2/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-5/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs.html">PASS</a> +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html">PASS</a> +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-6/igt@kms_cursor_legacy@forked-bo@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-4/igt@kms_cursor_legacy@forked-bo@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-1/igt@kms_cursor_legacy@single-bo@pipe-a.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-2/igt@kms_cursor_legacy@single-bo@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-1/igt@kms_cursor_legacy@single-bo@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-9/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html">PASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-5/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@kms_psr@primary_render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-busy:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-10/igt@kms_vblank@pipe-d-wait-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-7/igt@kms_vblank@pipe-d-wait-busy.html">PASS</a> +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-2/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-2/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-tglu-9/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-tglu-5/igt@prime_mmap_kms@buffer-sharing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7212/shard-rkl-4/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/shard-rkl-6/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7212 -&gt; IGTPW_8669</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12905: 3a266f994a6b752953eb974ab7bf1dc382a2d1b8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8669: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8669/index.html<br />
  IGT_7212: c67b6c8993c509ca06eca222287c58ade43292e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7221432579249831689==--
