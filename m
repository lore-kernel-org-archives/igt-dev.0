Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8018725928276892710=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 07 Apr 2022 22:14:51 -0000
Message-ID: <164936969119.14670.11357374703649414957@emeril.freedesktop.org>
References: <20220407203631.13363-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220407203631.13363-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_IGT_cleanup?=
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

--===============8018725928276892710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: IGT cleanup
URL   : https://patchwork.freedesktop.org/series/102370/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11472_full -> IGTPW_6901_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6901_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6901_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/index.html

Participating hosts (12 -> 6)
------------------------------

  Missing    (6): shard-skl pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u shard-rkl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6901_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-glk:          NOTRUN -> [FAIL][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-glk9/igt@core_setmaster@master-drop-set-root.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-kbl:          NOTRUN -> [FAIL][2] +4 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-kbl7/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-apl:          NOTRUN -> [FAIL][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglb:         NOTRUN -> [FAIL][4] +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb8/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify:
    - shard-iclb:         NOTRUN -> [FAIL][5] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@gem_lmem_swapping@verify.html

  * igt@i915_module_load@reload:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb4/igt@i915_module_load@reload.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-kbl3/igt@i915_module_load@reload.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-glk7/igt@i915_module_load@reload.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][9] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb1/igt@i915_module_load@reload.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl1/igt@i915_module_load@reload.html

  * igt@i915_selftest@perf:
    - shard-snb:          NOTRUN -> [FAIL][11] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb5/igt@i915_selftest@perf.html

  * igt@i915_selftest@perf@request:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-glk3/igt@i915_selftest@perf@request.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-iclb:         NOTRUN -> [SKIP][13] +523 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@perf@non-sampling-read-error:
    - shard-tglb:         NOTRUN -> [SKIP][14] +34 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@perf@non-sampling-read-error.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@random-engines:
    - shard-apl:          [SKIP][15] ([fdo#109271]) -> [FAIL][16] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl4/igt@gem_lmem_swapping@random-engines.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl8/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-glk:          [SKIP][17] ([fdo#109271]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-glk4/igt@gem_lmem_swapping@verify-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-glk1/igt@gem_lmem_swapping@verify-random.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43]) -> ([FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58], [FAIL][59], [FAIL][60], [FAIL][61], [FAIL][62], [FAIL][63], [FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68]) ([i915#4312])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb6/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb6/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb7/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb4/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb5/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb5/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb2/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb2/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb6/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb4/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb7/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb6/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb5/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb2/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb6/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb2/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb4/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb2/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb4/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb7/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb7/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb4/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb5/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb7/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb5/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb4/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb7/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb4/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb4/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb2/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb2/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb5/igt@runner@aborted.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb6/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb5/igt@runner@aborted.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb7/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb2/igt@runner@aborted.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb7/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb6/igt@runner@aborted.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb6/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb4/igt@runner@aborted.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb5/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb4/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb5/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb6/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb7/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb7/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb2/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb2/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb6/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb5/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_6901_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-in-order:
    - shard-snb:          NOTRUN -> [SKIP][69] ([fdo#109271]) +89 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb5/igt@gem_ctx_shared@q-in-order.html

  * igt@gem_exec_fence@basic-wait-all:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109315]) +757 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@gem_exec_fence@basic-wait-all.html

  * igt@gem_exec_params@invalid-bsd2-flag-on-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109276] / [fdo#109315]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb3/igt@gem_exec_params@invalid-bsd2-flag-on-vebox.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109283] / [fdo#109315])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@gem_exec_params@no-vebox.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271]) +696 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109315] / [i915#2613])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109315] / [i915#2575] / [i915#2613])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_wait@invalid-flags:
    - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271]) +832 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-glk1/igt@gem_wait@invalid-flags.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109315] / [fdo#111615] / [i915#2575]) +23 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [fdo#109315]) +17 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb1/igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_color@pipe-b-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([i915#1149]) +7 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb4/igt@kms_color@pipe-b-gamma.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#1149] / [i915#2575]) +11 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb7/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278] / [i915#1149]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109278]) +54 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#2575]) +349 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb7/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#2575] / [i915#5341])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109315] / [i915#2575]) +472 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#111615] / [i915#2575]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271]) +753 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl8/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109291]) +9 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb8/igt@prime_nv_pcopy@test3_1.html

  * igt@prime_nv_pcopy@test3_3:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109291]) +11 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@prime_nv_pcopy@test3_3.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          [FAIL][90] -> [SKIP][91] ([fdo#109271]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-glk2/igt@gem_lmem_swapping@parallel-multi.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-glk1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random:
    - shard-apl:          [FAIL][92] -> [SKIP][93] ([fdo#109271]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl1/igt@gem_lmem_swapping@random.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl2/igt@gem_lmem_swapping@random.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][94] -> [INCOMPLETE][95] ([i915#1373])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-kbl6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111]) ([fdo#109271] / [i915#4312]) -> ([FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125]) ([i915#4312])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl3/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl3/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl4/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl1/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl2/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl1/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl3/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl4/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl1/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl4/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl3/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl7/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl8/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl3/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl8/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl8/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl4/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl2/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl6/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl3/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl6/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([i915#1759] / [i915#3690] / [i915#4312] / [i915#5257]) -> ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157], [FAIL][158], [FAIL][159], [FAIL][160], [FAIL][161], [FAIL][162], [FAIL][163], [FAIL][164], [FAIL][165], [FAIL][166]) ([i915#3690] / [i915#4312] / [i915#5257])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb2/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb5/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb6/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb1/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb1/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb5/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb5/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb1/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb2/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb2/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb7/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb2/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb7/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb2/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb1/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb7/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb3/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb3/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb1/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb2/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb2/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb2/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb1/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb8/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb8/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb8/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb3/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb7/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb6/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb7/igt@runner@aborted.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb6/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb6/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][167], [FAIL][168], [FAIL][169], [FAIL][170], [FAIL][171], [FAIL][172], [FAIL][173], [FAIL][174], [FAIL][175], [FAIL][176], [FAIL][177], [FAIL][178], [FAIL][179], [FAIL][180], [FAIL][181], [FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188], [FAIL][189]) ([i915#1814] / [i915#3690] / [i915#4312] / [i915#5257]) -> ([FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199], [FAIL][200], [FAIL][201], [FAIL][202], [FAIL][203], [FAIL][204], [FAIL][205], [FAIL][206], [FAIL][207]) ([i915#3690] / [i915#4312] / [i915#5257])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb5/igt@runner@aborted.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb3/igt@runner@aborted.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb1/igt@runner@aborted.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb1/igt@runner@aborted.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb6/igt@runner@aborted.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb1/igt@runner@aborted.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb6/igt@runner@aborted.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb4/igt@runner@aborted.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb5/igt@runner@aborted.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb2/igt@runner@aborted.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb4/igt@runner@aborted.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb7/igt@runner@aborted.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb2/igt@runner@aborted.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb5/igt@runner@aborted.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb4/igt@runner@aborted.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb7/igt@runner@aborted.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb2/igt@runner@aborted.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb4/igt@runner@aborted.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb6/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb1/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb2/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb5/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb6/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb8/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb4/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb4/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb3/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb8/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb7/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb8/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb7/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb4/igt@runner@aborted.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb3/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb7/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb2/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/index.html

--===============8018725928276892710==
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
<tr><td><b>Series:</b></td><td>tests/kms: IGT cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/102370/">https://patchwork.freedesktop.org/series/102370/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6901/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6901/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11472_full -&gt; IGTPW_6901_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6901_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6901_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/index.=
html</p>
<h2>Participating hosts (12 -&gt; 6)</h2>
<p>Missing    (6): shard-skl pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-=
6260u shard-rkl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6901=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-glk9/igt@core_setmaster@master-drop-set-root=
.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-kbl7/igt@gem_lmem_swapping@parallel-random.h=
tml">FAIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-apl6/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-tglb8/igt@gem_lmem_swapping@parallel-random-=
verify.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@gem_lmem_swapping@verify.html">FAI=
L</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6901/shard-iclb4/igt@i915_module_load@reload.html">INCOM=
PLETE</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6901/shard-kbl3/igt@i915_module_load@reload.html">INCOMP=
LETE</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6901/shard-glk7/igt@i915_module_load@reload.html">INCOMP=
LETE</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6901/shard-tglb1/igt@i915_module_load@reload.html">INCOM=
PLETE</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6901/shard-apl1/igt@i915_module_load@reload.html">INCOMP=
LETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-snb5/igt@i915_selftest@perf.html">FAIL</a> +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@request:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-glk3/igt@i915_selftest@perf@request.html">DM=
ESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-64x64=
-random.html">SKIP</a> +523 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@non-sampling-read-error:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@perf@non-sampling-read-error.html"=
>SKIP</a> +34 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11472/shard-apl4/igt@gem_lmem_swapping@random-engines.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
901/shard-apl8/igt@gem_lmem_swapping@random-engines.html">FAIL</a> +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11472/shard-glk4/igt@gem_lmem_swapping@verify-random.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_69=
01/shard-glk1/igt@gem_lmem_swapping@verify-random.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-snb:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11472/shard-snb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11472/shard-snb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb4/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11472/shard-snb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb5/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11472/shard-snb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb2/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_114=
72/shard-snb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb4/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/=
shard-snb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb6/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/sha=
rd-snb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_11472/shard-snb2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-=
snb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_11472/shard-snb2/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb=
4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_11472/shard-snb2/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_11472/shard-snb7/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb7/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_11472/shard-snb4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb5/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11472/shard-snb7/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-snb5/igt@runne=
r@aborted.html">FAIL</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6901/shard-snb4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb7/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6901/shard-snb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb4/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6901/shard-snb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb2/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901=
/shard-snb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb6/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-=
snb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_6901/shard-snb7/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb2/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6901/shard-snb7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb6/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6901/shard-snb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb4/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6901/shard-snb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901=
/shard-snb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb6/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-=
snb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_6901/shard-snb7/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb2/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6901/shard-snb2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-snb6/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6901/shard-snb5/igt@runner@aborted.html">FAIL</a>) ([i915#4312])<=
/li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6901_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_shared@q-in-order:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-snb5/igt@gem_ctx_shared@q-in-order.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a>) +89 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@gem_exec_fence@basic-wait-all.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10931=
5">fdo#109315</a>) +757 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@invalid-bsd2-flag-on-vebox:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb3/igt@gem_exec_params@invalid-bsd2-flag-=
on-vebox.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109276">fdo#109276</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109315">fdo#109315</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@gem_exec_params@no-vebox.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fd=
o#109283</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +696 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6901/shard-iclb5/igt@gem_tiled_swapping@non-threaded.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1093=
15">fdo#109315</a> / [i915#2613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6901/shard-tglb5/igt@gem_tiled_swapping@non-threaded.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1093=
15">fdo#109315</a> / [i915#2575] / [i915#2613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@invalid-flags:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-glk1/igt@gem_wait@invalid-flags.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +832 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109315">fdo#109315</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111615">fdo#111615</a> / [i915#2575]) +23 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb1/igt@kms_ccs@pipe-d-bad-rotation-90-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb4/igt@kms_color@pipe-b-gamma.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#=
1149</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-tglb7/igt@kms_color@pipe-d-ctm-0-75.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i9=
15#1149</a> / [i915#2575]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-tglb7/igt@kms_cursor_edge_walk@pipe-a-256x25=
6-right-edge.html">SKIP</a> ([i915#2575]) +349 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@kms_pipe_crc_basic@compare-crc-san=
itycheck-pipe-c.html">SKIP</a> ([i915#2575] / [i915#5341])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-tglb2/igt@kms_psr2_su@page_flip-nv12.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109315">=
fdo#109315</a> / [i915#2575]) +472 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-270.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111615">fdo#111615</a> / [i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-apl8/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a>) +753 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-tglb8/igt@prime_nv_pcopy@test3_1.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@prime_nv_pcopy@test3_3.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +11 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11472/shard-glk2/igt@gem_lmem_swapping@parallel-multi.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shar=
d-glk1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +3 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11472/shard-apl1/igt@gem_lmem_swapping@random.html">FAIL</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl2/i=
gt@gem_lmem_swapping@random.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11472/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.h=
tml">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_6901/shard-kbl6/igt@i915_module_load@reload-with-fault-injection.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/">=
i915#1373</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11472/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11472/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11472/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl2/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1472/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl1/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1147=
2/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-apl4/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/s=
hard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11472/shard-apl4/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shar=
d-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11472/shard-apl3/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-a=
pl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_11472/shard-apl6/igt@runner@aborted.html">FAIL</a>) =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / [i915#4312]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6901/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl8/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6901/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl8/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_69=
01/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl6/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shar=
d-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_6901/shard-apl4/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl1/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6901/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl6/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6901/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-apl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6901/shard-apl6/igt@runner@aborted.html">FAIL</a>) ([i915#4312])</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11472/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb2/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11472/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb7/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11472/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11472/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb1/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_11472/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb5/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11472/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11472/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb2/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_11472/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb7/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11472/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb7/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1472/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-tglb1/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11=
472/shard-tglb7/igt@runner@aborted.html">FAIL</a>) ([i915#1759] / [i915#369=
0] / [i915#4312] / [i915#5257]) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6901/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb3/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6901/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb2/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6901/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb2/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6901/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6901/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb8/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_690=
1/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb7/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/sha=
rd-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6901/shard-tglb5/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tg=
lb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6901/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb5/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6901/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-tglb6/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6901/shard-tglb7/igt@runner@aborted.html">FAIL</a>) ([i915#3690=
] / [i915#4312] / [i915#5257])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11472/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb3/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11472/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11472/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11472/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb4/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_11472/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11472/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11472/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb5/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_11472/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb7/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11472/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb4/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1472/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb1/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11=
472/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11472/shard-iclb5/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_114=
72/shard-iclb6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#3690=
] / [i915#4312] / [i915#5257]) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6901/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb4/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6901/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb3/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6901/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb7/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6901/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb8/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6901/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901=
/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb4/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shar=
d-iclb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6901/shard-iclb7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-icl=
b2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6901/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6901/shard-iclb6/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6901/shard-iclb3/igt@runner@aborted.html">FAIL</a>) ([i915#=
3690] / [i915#4312] / [i915#5257])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============8018725928276892710==--
