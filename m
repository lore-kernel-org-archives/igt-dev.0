Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1696751783902714241=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Date: Fri, 21 Oct 2022 03:55:59 -0000
Message-ID: <166632455909.18264.5066756405244461651@emeril.freedesktop.org>
References: <20221020210859.446086-1-aurabindo.pillai@amd.com>
In-Reply-To: <20221020210859.446086-1-aurabindo.pillai@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fcursor=3A_Wait_for_an_extra_vblank_on_AMD_hw?=
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

--===============1696751783902714241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_cursor: Wait for an extra vblank on AMD hw
URL   : https://patchwork.freedesktop.org/series/109970/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12268_full -> IGTPW_7993_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_7993_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7993_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/index.html

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7993_full:

### IGT changes ###

#### Warnings ####

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          [INCOMPLETE][1] ([i915#7296]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-glk7/igt@gem_pwrite@basic-exhaustion.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk9/igt@gem_pwrite@basic-exhaustion.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_pread@exhaustion:
    - {shard-rkl}:        NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-5/igt@gem_pread@exhaustion.html

  * igt@i915_pm_rps@engine-order:
    - {shard-rkl}:        [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-4/igt@i915_pm_rps@engine-order.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-5/igt@i915_pm_rps@engine-order.html

  
Known issues
------------

  Here are the changes found in IGTPW_7993_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#1839]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@feature_discovery@display-3x.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#5327])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#5325])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][9] ([i915#4991])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl1/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][10] ([i915#4991])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb7/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][11] ([i915#4991])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk6/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@hang:
    - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-snb7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][13] ([i915#280])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#4525]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb1/igt@gem_exec_balancer@parallel.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#4525]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglb:         NOTRUN -> [FAIL][17] ([i915#6117])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][20] ([i915#2842]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb2/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][21] ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2842]) +8 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#4613]) +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4613]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl2/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#4270]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#4270])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb7/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#768]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109290])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb5/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@probe:
    - shard-iclb:         NOTRUN -> [FAIL][34] ([i915#7224])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@gem_userptr_blits@probe.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109289]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#2527] / [i915#2856]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb8/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#2856]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_module_load@resize-bar:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#6412])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@i915_module_load@resize-bar.html
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#6412])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#658]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#6590])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#6590])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb7/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109303])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb3/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109303])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109302])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][46] -> [DMESG-WARN][47] ([i915#180]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-apl3/igt@i915_suspend@sysfs-reader.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#5286]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb5/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#5286]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271]) +74 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111614])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         [PASS][53] -> [FAIL][54] ([i915#3743]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-tglb7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111615]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110723])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#2705])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@kms_big_joiner@2x-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#2705])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278]) +27 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111615] / [i915#3689]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3886]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3689] / [i915#3886]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [i915#3886]) +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3689] / [i915#6095]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3689]) +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#6095]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#3886]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk1/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-crc-fast:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb8/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl6/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_chamelium@hdmi-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk8/igt@kms_chamelium@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-snb5/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-0-75@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][73] ([i915#315] / [i915#6946]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_color@ctm-0-75@pipe-a-edp-1.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#3116])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#7118])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#6944] / [i915#7118])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3555]) +7 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#3359])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#3359])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271]) +106 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl1/igt@kms_cursor_crc@cursor-sliding-32x32.html
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3555]) +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109274] / [fdo#111825]) +7 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb3/igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109274]) +21 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa@legacy.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#426])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][85] -> [FAIL][86] ([i915#79])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109274] / [fdo#111825] / [i915#3637]) +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#2587] / [i915#2672]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2587] / [i915#2672]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#2672] / [i915#3555]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2672]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#6497]) +6 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109280]) +37 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109280] / [fdo#111825]) +25 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109289])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#3536]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#5176]) +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#5176]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-edp-1.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#6524])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#111068] / [i915#658]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#2920])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#658]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-snb:          NOTRUN -> [SKIP][103] ([fdo#109271]) +164 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-snb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#2920]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-glk:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#658]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109642] / [fdo#111068] / [i915#658])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][107] ([i915#5939]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_psr2_su@page_flip-p010@pipe-b-edp-1.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][108] -> [SKIP][109] ([fdo#109441])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb2/igt@kms_psr@psr2_basic.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109441]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_writeback@writeback-check-output:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#2437])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#2437])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_writeback@writeback-check-output.html

  * igt@prime_vgem@fence-read-hang:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109295])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@prime_vgem@fence-read-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#109295])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_clients@pidname:
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2994]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl2/igt@sysfs_clients@pidname.html
    - shard-tglb:         NOTRUN -> [SKIP][116] ([i915#2994]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb3/igt@sysfs_clients@pidname.html
    - shard-glk:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2994]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-glk5/igt@sysfs_clients@pidname.html

  * igt@sysfs_clients@split-10:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([i915#2994]) +3 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][119] ([i915#658]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb5/igt@feature_discovery@psr2.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_busy@close-race:
    - shard-iclb:         [TIMEOUT][121] ([i915#6016]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb4/igt@gem_busy@close-race.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@gem_busy@close-race.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-rkl}:        [FAIL][123] ([i915#6268]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-3/igt@gem_ctx_exec@basic-nohangcheck.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
    - shard-tglb:         [FAIL][125] ([i915#6268]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [FAIL][127] ([i915#5784]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-tglb1/igt@gem_eio@reset-stress.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][129] ([i915#4525]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - {shard-rkl}:        [SKIP][131] ([i915#6247]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-6/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][133] ([i915#2842]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][135] ([i915#7276]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_pwrite_snooped:
    - {shard-rkl}:        [SKIP][137] ([i915#3282]) -> [PASS][138] +5 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-4/igt@gem_pwrite_snooped.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-5/igt@gem_pwrite_snooped.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - {shard-rkl}:        [SKIP][139] ([i915#3281]) -> [PASS][140] +6 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-single-offset:
    - shard-iclb:         [FAIL][141] ([i915#4171]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb2/igt@gem_softpin@evict-single-offset.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@gem_softpin@evict-single-offset.html

  * igt@gen9_exec_parse@basic-rejected:
    - {shard-rkl}:        [SKIP][143] ([i915#2527]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-3/igt@gen9_exec_parse@basic-rejected.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-5/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_pm_backlight@fade:
    - {shard-rkl}:        [SKIP][145] ([i915#3012]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-3/igt@i915_pm_backlight@fade.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-6/igt@i915_pm_backlight@fade.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][147] ([fdo#109271]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [INCOMPLETE][149] ([i915#4528] / [i915#4817]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         [FAIL][151] ([i915#3743]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-tglb1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         [FAIL][153] -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [INCOMPLETE][155] ([i915#180] / [i915#4939]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][157] ([i915#180]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_pipe_crc_basic@bad-source:
    - {shard-rkl}:        [SKIP][159] ([i915#1845] / [i915#4098]) -> [PASS][160] +5 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-1/igt@kms_pipe_crc_basic@bad-source.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html

  * igt@kms_plane@plane-position-hole@pipe-b-planes:
    - {shard-rkl}:        [SKIP][161] ([i915#3558]) -> [PASS][162] +1 similar issue
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-4/igt@kms_plane@plane-position-hole@pipe-b-planes.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [SKIP][163] ([i915#5176]) -> [PASS][164] +1 similar issue
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][165] ([i915#5235]) -> [PASS][166] +2 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][167] ([fdo#109441]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb5/igt@kms_psr@psr2_dpms.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@perf@enable-disable:
    - shard-tglb:         [INCOMPLETE][169] -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-tglb6/igt@perf@enable-disable.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb8/igt@perf@enable-disable.html
    - shard-iclb:         [DMESG-WARN][171] ([i915#4391]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb7/igt@perf@enable-disable.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@perf@enable-disable.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - {shard-dg1}:        [FAIL][173] ([i915#4521]) -> [PASS][174] +2 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vecs0.html

  * igt@prime_vgem@basic-read:
    - {shard-rkl}:        [SKIP][175] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-rkl-4/igt@prime_vgem@basic-read.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-5/igt@prime_vgem@basic-read.html

  
#### Warnings ####

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][177] ([i915#2920]) -> [SKIP][178] ([i915#658])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][179] ([i915#658]) -> [SKIP][180] ([i915#2920])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][181], [FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188], [FAIL][189]) ([i915#3002] / [i915#4312] / [i915#7300]) -> ([FAIL][190], [FAIL][191], [FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195]) ([i915#4312])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb8/igt@runner@aborted.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb7/igt@runner@aborted.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb7/igt@runner@aborted.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb5/igt@runner@aborted.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb5/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb4/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb3/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb2/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb4/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6016]: https://gitlab.freedesktop.org/drm/intel/issues/6016
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7224]: https://gitlab.freedesktop.org/drm/intel/issues/7224
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7296]: https://gitlab.freedesktop.org/drm/intel/issues/7296
  [i915#7300]: https://gitlab.freedesktop.org/drm/intel/issues/7300
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7021 -> IGTPW_7993
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12268: 86e8558e32834db40b393d598a5a183c1c6b8b98 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7993: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/index.html
  IGT_7021: b99f94fc3652f6838b8803032373a419372b17b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/index.html

--===============1696751783902714241==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_cursor: Wait for an extra vb=
lank on AMD hw</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109970/">https://patchwork.freedesktop.org/series/109970/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7993/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12268_full -&gt; IGTPW_7993_full</=
h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_7993_full need to be verified<br=
 />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7993_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/index.=
html</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7993=
_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@gem_pwrite@basic-exhaustion:<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-glk7/igt@gem_pwrite@basic-exhaustion.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7296">i915#7=
296</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_79=
93/shard-glk9/igt@gem_pwrite@basic-exhaustion.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-rkl-5/igt@gem_pread@exhaustion.html">INCOMPL=
ETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-4/igt@i915_pm_rps@engine-order.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-5=
/igt@i915_pm_rps@engine-order.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7993_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@feature_discovery@display-3x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327=
">i915#5327</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325=
">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-apl1/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991=
">i915#4991</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb7/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-glk6/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991=
">i915#4991</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-snb7/igt@gem_ctx_persistence@hang.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/10=
99">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb2/igt@gem_ctx_sseu@invalid-sseu.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb1/igt@gem_exec_balancer@parallel.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-icl=
b6/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@gem_exec_balancer@parallel-bb-firs=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@gem_exec_balancer@parallel-orderin=
g.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6117">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-=
tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb2/igt@gem_exec_fair@basic-none@bcs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/s=
hard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@gem_lmem_swapping@heavy-verify-mul=
ti.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4613">i915#4613</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb1/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-apl2/igt@gem_lmem_swapping@smem-oom.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb5/igt@gem_pxp@dmabuf-shared-protected-dst=
-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4270">i915#4270</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb7/igt@gem_pxp@dmabuf-shared-protected-dst=
-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/768">i915#768</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb5/igt@gem_userptr_blits@coherency-sync.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9290">fdo#109290</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@probe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@gem_userptr_blits@probe.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7224">i915=
#7224</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@gen7_exec_parse@load-register-reg.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb8/igt@gen9_exec_parse@batch-invalid-leng=
th.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2856">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@gen9_exec_parse@bb-start-param.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/285=
6">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb7/igt@i915_module_load@resize-bar.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">i=
915#6412</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb1/igt@i915_module_load@resize-bar.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">i=
915#6412</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb1/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
90">i915#6590</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb7/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
90">i915#6590</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb3/igt@i915_query@query-topology-known-pci=
-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109303">fdo#109303</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb2/igt@i915_query@query-topology-known-pci=
-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109303">fdo#109303</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@i915_query@query-topology-unsuppor=
ted.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-apl3/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl3/=
igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb5/igt@kms_big_fb@4-tiled-32bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@kms_big_fb@linear-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
0725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-glk3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +74 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-tglb7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb3/igt@kms_big_fb@y-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3743">i915#3743</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb1/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i91=
5#2705</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i91=
5#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@kms_ccs@pipe-a-missing-ccs-buffer-=
yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-apl1/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@kms_ccs@pipe-b-missing-ccs-buffer-=
y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_ccs@pipe-c-random-ccs-data-4_t=
iled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-glk1/igt@kms_ccs@pipe-c-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@kms_chamelium@dp-crc-fast.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">f=
do#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb8/igt@kms_chamelium@dp-crc-multiple.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
4">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-apl6/igt@kms_chamelium@dp-frame-dump.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-glk8/igt@kms_chamelium@hdmi-hpd-after-suspen=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-snb5/igt@kms_chamelium@vga-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_color@ctm-0-75@pipe-a-edp-1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/31=
5">i915#315</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6946">i915#6946</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_content_protection@dp-mst-lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb1/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7118"=
>i915#7118</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb2/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6944"=
>i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/7118">i915#7118</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@kms_cursor_crc@cursor-offscreen-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3555">i915#3555</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb8/igt@kms_cursor_crc@cursor-onscreen-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb5/igt@kms_cursor_crc@cursor-onscreen-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-apl1/igt@kms_cursor_crc@cursor-sliding-32x32.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +106 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb8/igt@kms_cursor_crc@cursor-sliding-32x32=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3555">i915#3555</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb3/igt@kms_cursor_legacy@cursorb-vs-flipa=
@atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa=
@legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/426">i915#426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7993/shard-glk1/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb5/igt@kms_flip@2x-plain-flip-fb-recreate=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3637">i915#3637</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-yfti=
leccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-yfti=
leccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i91=
5#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/6497">i915#6497</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +25 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-ed=
p-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-d-ed=
p-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-tglb7/igt@kms_prime@basic-crc-hybrid.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6524">i=
915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-snb6/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +164 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2920">i915#2920</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-glk7/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb1/igt@kms_psr2_su@frontbuffer-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9642">fdo#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_psr2_su@page_flip-p010@pipe-b-=
edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5939">i915#5939</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@k=
ms_psr@psr2_basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo=
#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb6/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb6/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-iclb8/igt@prime_vgem@fence-read-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb5/igt@prime_vgem@fence-read-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-apl2/igt@sysfs_clients@pidname.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-tglb3/igt@sysfs_clients@pidname.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7993/shard-glk5/igt@sysfs_clients@pidname.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@sysfs_clients@split-10.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#=
2994</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-icl=
b2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb4/igt@gem_busy@close-race.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/6016">i915#6016</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-i=
clb6/igt@gem_busy@close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12268/shard-rkl-3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/=
shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12268/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/=
shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-tglb1/igt@gem_eio@reset-stress.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tg=
lb6/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7993/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6247">i915#624=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993=
/shard-rkl-6/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
993/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7276">i915#=
7276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
993/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-4/igt@gem_pwrite_snooped.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-rkl-5=
/igt@gem_pwrite_snooped.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">=
i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7993/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">PASS<=
/a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb2/igt@gem_softpin@evict-single-offset.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#41=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_799=
3/shard-iclb1/igt@gem_softpin@evict-single-offset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-3/igt@gen9_exec_parse@basic-rejected.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#252=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993=
/shard-rkl-5/igt@gen9_exec_parse@basic-rejected.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-3/igt@i915_pm_backlight@fade.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-r=
kl-6/igt@i915_pm_backlight@fade.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-apl=
1/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4528"=
>i915#4528</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7993/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-tglb1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb7/igt@kms_big_fb@y-tiled-max-h=
w-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-0-hflip-async-flip.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7993/shard-iclb2/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i915=
#4939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7993/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
993/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@bad-source:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-1/igt@kms_pipe_crc_basic@bad-source.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i91=
5#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7993/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html">PASS</a> +5 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-4/igt@kms_plane@plane-position-hole@pipe-b-planes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7993/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.h=
tml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb8/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.ht=
ml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb4/igt@kms_plane_=
scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html">=
PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb5/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb=
2/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12268/shard-tglb6/igt@perf@enable-disable.html">INCOMPLETE</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-tglb8=
/igt@perf@enable-disable.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12268/shard-iclb7/igt@perf@enable-disable.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard=
-iclb6/igt@perf@enable-disable.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-dg1-15/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4521">i91=
5#4521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7993/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo#109295</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708">i91=
5#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7993/shard-rkl-5/igt@prime_vgem@basic-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7993/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7993/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12268/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb7/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12268/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb5/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12268/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12268/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/shard-iclb2/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_12268/shard-iclb4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/7300">i915#7300</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shar=
d-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7993/shard-iclb3/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-icl=
b6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7993/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/shard-iclb7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7993/shard-iclb7/igt@runner@aborted.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</=
li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7021 -&gt; IGTPW_7993</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12268: 86e8558e32834db40b393d598a5a183c1c6b8b98 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7993: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7993/index.htm=
l<br />
  IGT_7021: b99f94fc3652f6838b8803032373a419372b17b1 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1696751783902714241==--
