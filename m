Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8975840492618636668=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Date: Fri, 30 Sep 2022 20:23:06 -0000
Message-ID: <166456938659.23342.15765694290844509421@emeril.freedesktop.org>
References: <20220825111825.74620-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220825111825.74620-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fforce=5Fconnector=5Fbasic=3A_Test_Cleanup_=28rev6=29?=
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

--===============8975840492618636668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_force_connector_basic: Test Cleanup (rev6)
URL   : https://patchwork.freedesktop.org/series/107744/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6670_full -> IGTPW_7893_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7893_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7893_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/index.html

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7893_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_offset@close-race:
    - shard-apl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl7/igt@gem_mmap_offset@close-race.html
    - shard-glk:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk9/igt@gem_mmap_offset@close-race.html

  * igt@perf_pmu@enable-race@vcs1:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-tglb5/igt@perf_pmu@enable-race@vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb8/igt@perf_pmu@enable-race@vcs1.html

  
Known issues
------------

  Here are the changes found in IGTPW_7893_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#6268])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl1/igt@gem_eio@in-flight-suspend.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#4525])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl8/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_mmap_offset@clear@smem0:
    - shard-snb:          [PASS][14] -> [FAIL][15] ([i915#6973])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-snb5/igt@gem_mmap_offset@clear@smem0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-snb6/igt@gem_mmap_offset@clear@smem0.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#4270])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#4270])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#768]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_softpin@evict-single-offset:
    - shard-apl:          NOTRUN -> [FAIL][19] ([i915#4171])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl6/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#3297]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#3297]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb8/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen3_render_tiledx_blits:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109289]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb6/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109289]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#2527] / [i915#2856])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb3/igt@gen9_exec_parse@basic-rejected.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#2856])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb3/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][26] -> [FAIL][27] ([i915#3989] / [i915#454])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#6590])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#6590])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#1937])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#1937])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109303])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#5723])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb4/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#5723])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][35] -> [INCOMPLETE][36] ([i915#6992])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-snb2/igt@i915_selftest@live@hangcheck.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#5286])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#5286])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111614])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110725] / [fdo#111614])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111615]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110723]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#6095]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3689]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +9 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#3886]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689] / [i915#3886]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111615] / [i915#3689]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk9/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl1/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-snb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109284] / [fdo#111827])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color_chamelium@ctm-max:
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk2/igt@kms_color_chamelium@ctm-max.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#3555])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb7/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109274])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb6/igt@kms_flip@2x-flip-vs-panning.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109274] / [fdo#111825] / [i915#3637])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#2587] / [i915#2672]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#2672]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#2587] / [i915#2672]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#2672] / [i915#3555])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#6497]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109280]) +11 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109280] / [fdo#111825]) +10 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][65] -> [SKIP][66] ([i915#433])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#6988]) +30 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb8/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +221 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#6988]) +32 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html

  * igt@kms_plane_lowres@tiling-y@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3536]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@kms_plane_lowres@tiling-y@pipe-c-edp-1.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#3536]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb4/igt@kms_plane_lowres@tiling-y@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#5235]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#5235]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#658]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#111068] / [i915#658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [PASS][76] -> [SKIP][77] ([fdo#109642] / [fdo#111068] / [i915#658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#1911])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb3/igt@kms_psr2_su@page_flip-nv12.html
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk7/igt@kms_psr2_su@page_flip-nv12.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109642] / [fdo#111068] / [i915#658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][81] -> [SKIP][82] ([fdo#109441])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109309])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb3/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109309])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109278]) +7 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb7/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#2437])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb4/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#2437])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb8/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2437])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk7/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#6971]) +45 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#6971]) +44 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271]) +153 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@perf@stress-open-close:
    - shard-glk:          [PASS][92] -> [INCOMPLETE][93] ([i915#5213])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-glk7/igt@perf@stress-open-close.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk3/igt@perf@stress-open-close.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> [SKIP][94] ([fdo#109271]) +184 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-snb5/igt@prime_nv_pcopy@test3_5.html

  * igt@sysfs_clients@sema-50:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2994]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl2/igt@sysfs_clients@sema-50.html
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2994]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk2/igt@sysfs_clients@sema-50.html

  * igt@sysfs_clients@split-50:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#2994]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb7/igt@sysfs_clients@split-50.html
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#2994]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb7/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][99] ([i915#5784]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-tglb1/igt@gem_eio@kms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][101] ([i915#4525]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][103] ([i915#2842]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [DMESG-WARN][105] ([i915#5566] / [i915#716]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl6/igt@gen9_exec_parse@allowed-single.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl2/igt@gen9_exec_parse@allowed-single.html
    - shard-glk:          [DMESG-WARN][107] ([i915#5566] / [i915#716]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-glk2/igt@gen9_exec_parse@allowed-single.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk2/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          [TIMEOUT][109] ([i915#4639]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl1/igt@gen9_exec_parse@bb-large.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl7/igt@gen9_exec_parse@bb-large.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-snb:          [SKIP][111] ([fdo#109271]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-snb2/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-snb2/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_cursor_legacy@flip-vs-cursor@toggle:
    - shard-iclb:         [FAIL][113] ([i915#2346]) -> [PASS][114] +3 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][115] ([i915#2122]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-glk9/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [DMESG-WARN][117] ([i915#180]) -> [PASS][118] +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][119] ([fdo#109441]) -> [PASS][120] +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb6/igt@kms_psr@psr2_basic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [FAIL][121] ([i915#5639]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl1/igt@perf@polling-parameterized.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][123] ([i915#4525]) -> [FAIL][124] ([i915#6117])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-iclb:         [WARN][125] ([i915#2684]) -> [FAIL][126] ([i915#2684])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][127] ([i915#2920]) -> [SKIP][128] ([i915#658])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][129] ([i915#658]) -> [SKIP][130] ([i915#2920]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [SKIP][131] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][132] ([i915#5939])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-iclb7/igt@kms_psr2_su@page_flip-p010.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][138], [FAIL][139], [FAIL][140]) ([i915#3002] / [i915#4312])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl7/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl2/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl3/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl6/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl1/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl1/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4639]: https://gitlab.freedesktop.org/drm/intel/issues/4639
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6971]: https://gitlab.freedesktop.org/drm/intel/issues/6971
  [i915#6973]: https://gitlab.freedesktop.org/drm/intel/issues/6973
  [i915#6988]: https://gitlab.freedesktop.org/drm/intel/issues/6988
  [i915#6992]: https://gitlab.freedesktop.org/drm/intel/issues/6992
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6670 -> IGTPW_7893

  CI-20190529: 20190529
  CI_DRM_12199: 6fa6bc62d3b91e5a70b8e4869436a0b03083abf5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7893: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/index.html
  IGT_6670: d618e9865fe5cbaf511ca43503abad442605d0a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/index.html

--===============8975840492618636668==
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
<tr><td><b>Series:</b></td><td>tests/kms_force_connector_basic: Test Cleanu=
p (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107744/">https://patchwork.freedesktop.org/series/107744/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7893/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6670_full -&gt; IGTPW_7893_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7893_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7893_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/index.=
html</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7893=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_mmap_offset@close-race:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-apl7/igt@gem_mmap_offset@close-race.html">FAI=
L</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-glk9/igt@gem_mmap_offset@close-race.html">FAI=
L</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@vcs1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-tglb5/igt@perf_pmu@enable-race@vcs1.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb8/ig=
t@perf_pmu@enable-race@vcs1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7893_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tgl=
b3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
hostile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-apl1/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl1/igt@=
gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shar=
d-iclb6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-apl8/igt@gem_lmem_swapping@parallel-multi.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear@smem0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-snb5/igt@gem_mmap_offset@clear@smem0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-snb6/ig=
t@gem_mmap_offset@clear@smem0.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/6973">i915#6973</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb7/igt@gem_pxp@protected-encrypted-src-cop=
y-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb7/igt@gem_pxp@protected-encrypted-src-cop=
y-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-=
x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/768">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-apl6/igt@gem_softpin@evict-single-offset.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/417=
1">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3297">i915#3297</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb8/igt@gem_userptr_blits@readonly-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3297">i915#3297</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb6/igt@gen3_render_tiledx_blits.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fd=
o#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@gen7_exec_parse@load-register-reg.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb3/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb3/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb3/igt@i91=
5_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3989">i915#3989</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb1/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
90">i915#6590</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb1/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
90">i915#6590</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi=
-a.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb1/igt@i915_query@query-topology-known-pc=
i-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb4/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb5/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-snb2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-snb6/i=
gt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/6992">i915#6992</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb4/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb5/igt@kms_big_fb@linear-32bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D110723">fdo#110723</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb5/igt@kms_ccs@pipe-a-random-ccs-data-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@kms_ccs@pipe-c-bad-aux-stride-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-glk9/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-apl1/igt@kms_chamelium@dp-hpd-storm-disable.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-snb2/igt@kms_chamelium@hdmi-hpd-enable-disabl=
e-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb7/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-glk2/igt@kms_color_chamelium@ctm-max.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb7/igt@kms_cursor_crc@cursor-offscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb6/igt@kms_flip@2x-flip-vs-panning.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb5/igt@kms_flip@2x-flip-vs-panning.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3637">i915#3637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/6497">i915#6497</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +10 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5=
/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb8/igt@kms_plane_alpha_blend@pipe-b-cover=
age-7efc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/6988">i915#6988</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +221 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@kms_plane_alpha_blend@pipe-c-const=
ant-alpha-mid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6988">i915#6988</a>) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-c-edp-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb5/igt@kms_plane_lowres@tiling-y@pipe-c-ed=
p-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3536">i915#3536</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb4/igt@kms_plane_lowres@tiling-y@pipe-c-ed=
p-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3536">i915#3536</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-=
edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb5/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-=
edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb8/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-i=
clb5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb3/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911">i9=
15#1911</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-glk7/igt@kms_psr2_su@page_flip-nv12.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb3/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">f=
do#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb4/igt@=
kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb3/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb3/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb7/igt@kms_vblank@pipe-d-ts-continuation-=
idle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109278">fdo#109278</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb4/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb8/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-glk7/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/6971">i915#6971</a>) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6971">i915#6971</a>) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-glk2/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +153 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-glk7/igt@perf@stress-open-close.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-glk3/igt@per=
f@stress-open-close.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5213">i915#5213</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7893/shard-snb5/igt@prime_nv_pcopy@test3_5.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +184 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-apl2/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-glk2/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-tglb7/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7893/shard-iclb7/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-tglb1/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-tglb5/igt@gem_ei=
o@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7893/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#28=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_789=
3/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6670/shard-apl6/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#556=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i91=
5#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7893/shard-apl2/igt@gen9_exec_parse@allowed-single.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6670/shard-glk2/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#556=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i91=
5#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7893/shard-glk2/igt@gen9_exec_parse@allowed-single.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-apl1/igt@gen9_exec_parse@bb-large.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4639">i915#4639</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-a=
pl7/igt@gen9_exec_parse@bb-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-snb2/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/=
shard-snb2/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i91=
5#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7893/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html">PASS</a=
> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-glk9/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ac-hdm=
i-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7893/shard-glk1/igt@kms_flip@2x-flip-vs-wf_vblank-in=
terruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7893/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.h=
tml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb6/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-iclb2/i=
gt@kms_psr@psr2_basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-apl1/igt@perf@polling-parameterized.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-ap=
l8/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_789=
3/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#26=
84</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_789=
3/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7893/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-=
sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7893/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6670/shard-iclb7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> =
/ <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i=
915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7893/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6670/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl2/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/=
shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6670/shard-apl3/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6670/shard-apl6/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl3/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7893/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/shard-apl1/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6670 -&gt; IGTPW_7893</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12199: 6fa6bc62d3b91e5a70b8e4869436a0b03083abf5 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7893: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7893/index.htm=
l<br />
  IGT_6670: d618e9865fe5cbaf511ca43503abad442605d0a5 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8975840492618636668==--
