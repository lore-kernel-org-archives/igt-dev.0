Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4799319946376209774=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Date: Fri, 11 Mar 2022 16:44:58 -0000
Message-ID: <164701709885.23984.10677433006332399092@emeril.freedesktop.org>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgUnVuIENJ?=
 =?utf-8?q?_on_Qualcomm_devices_=28rev3=29?=
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

--===============4799319946376209774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Run CI on Qualcomm devices (rev3)
URL   : https://patchwork.freedesktop.org/series/101195/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11351_full -> IGTPW_6781_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/index.html

Participating hosts (12 -> 9)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6781_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - {shard-rkl}:        [SKIP][1] ([i915#4098]) -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - {shard-rkl}:        NOTRUN -> [SKIP][3] +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@syncobj_timeline@invalid-query-one-illegal-handle:
    - {shard-rkl}:        [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-rkl-5/igt@syncobj_timeline@invalid-query-one-illegal-handle.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-rkl-5/igt@syncobj_timeline@invalid-query-one-illegal-handle.html

  
Known issues
------------

  Here are the changes found in IGTPW_6781_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@idempotent:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-snb2/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_eio@in-flight-1us:
    - shard-tglb:         [PASS][7] -> [TIMEOUT][8] ([i915#3063]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-tglb2/igt@gem_eio@in-flight-1us.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#4525])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         NOTRUN -> [DMESG-FAIL][11] ([i915#5076])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][12] ([i915#5076])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@gem_exec_balancer@parallel-ordering.html
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][13] ([i915#5076])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([i915#4525])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2842]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109283]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109283]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb5/igt@gem_exec_params@no-vebox.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#2190])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#2190])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#4613]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-kbl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@gem_lmem_swapping@parallel-random.html
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4613])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl7/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][30] ([i915#2658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#4270]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#4270]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271]) +252 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#768]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3297]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#3297]) +4 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109289]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#2527] / [i915#2856]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@gen9_exec_parse@bb-start-param.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#2856])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb1/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#1937])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][41] ([i915#2681] / [i915#2684])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         NOTRUN -> [WARN][42] ([i915#2684])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109506] / [i915#2411])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109303])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-kbl3/igt@i915_suspend@debugfs-reader.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271]) +50 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#5286]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#5286]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#110725] / [fdo#111614]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111614]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3777]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111615]) +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#3777]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110723]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3886])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3689] / [i915#3886]) +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [i915#3886]) +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3886]) +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#3886]) +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111615] / [i915#3689]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278]) +33 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb5/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3689]) +6 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#3742])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb2/igt@kms_cdclk@mode-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3742])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109284] / [fdo#111827]) +18 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109284] / [fdo#111827]) +12 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278] / [i915#1149]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][74] ([i915#1319])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb5/igt@kms_content_protection@content_type_change.html
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#1063]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3116])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3116] / [i915#3299])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#3319]) +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109278] / [fdo#109279]) +5 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][81] ([i915#180]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][82] -> [DMESG-WARN][83] ([i915#180]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109279] / [i915#3359]) +8 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#3359]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#533]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl3/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#5287]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#5287]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109274] / [fdo#111825]) +18 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109274]) +12 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
    - shard-glk:          [PASS][92] -> [FAIL][93] ([i915#2122])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-glk5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#2587]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109285])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [PASS][96] -> [FAIL][97] ([i915#1888] / [i915#2546])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          NOTRUN -> [SKIP][98] ([fdo#109271]) +159 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-snb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109280] / [fdo#111825]) +39 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109280]) +30 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#3555])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#1839])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#533]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][104] ([i915#265]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][105] ([fdo#108145] / [i915#265]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          NOTRUN -> [FAIL][106] ([fdo#108145] / [i915#265]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#3536]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#3536]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#1836])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb8/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#111068] / [i915#658])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#658])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][112] ([i915#132] / [i915#3467]) +5 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb7/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109441]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#109309])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271]) +114 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl6/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([fdo#109502])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2437])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl6/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2437])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#2530]) +4 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#2530]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109289]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb3/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@prime_nv_pcopy@test1_micro:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#109291]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@prime_nv_pcopy@test1_micro.html

  * igt@prime_nv_pcopy@test3_4:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([fdo#109291]) +3 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@prime_nv_pcopy@test3_4.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#109295])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@prime_vgem@fence-write-hang.html

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - shard-apl:          NOTRUN -> [DMESG-WARN][125] ([i915#5098])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl6/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    -

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/index.html

--===============4799319946376209774==
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
<tr><td><b>Series:</b></td><td>Run CI on Qualcomm devices (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101195/">https://patchwork.freedesktop.org/series/101195/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11351_full -&gt; IGTPW_6781_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/index.html</p>
<h2>Participating hosts (12 -&gt; 9)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6781_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-query-one-illegal-handle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-rkl-5/igt@syncobj_timeline@invalid-query-one-illegal-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-rkl-5/igt@syncobj_timeline@invalid-query-one-illegal-handle.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6781_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-snb2/igt@gem_ctx_persistence@idempotent.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-tglb2/igt@gem_eio@in-flight-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@gem_eio@in-flight-1us.html">TIMEOUT</a> ([i915#3063]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> ([i915#5076])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> ([i915#5076])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> ([i915#5076])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb5/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> ([i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +252 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb2/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-kbl3/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl6/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#109271]) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#5286]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([fdo#110723]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb5/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278]) +33 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb8/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb2/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_chamelium@vga-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb5/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@kms_content_protection@content_type_change.html">SKIP</a> ([i915#1063]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl3/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html">SKIP</a> ([i915#5287]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html">SKIP</a> ([i915#5287]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> ([fdo#109274]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-glk5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2587]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11351/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">FAIL</a> ([i915#1888] / [i915#2546])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-snb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#109271]) +159 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-x.html">SKIP</a> ([i915#3536]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_plane_lowres@pipe-b-tiling-y.html">SKIP</a> ([i915#3536]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb8/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb7/igt@kms_psr@psr2_cursor_plane_onoff.html">FAIL</a> ([i915#132] / [i915#3467]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl6/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> ([fdo#109271]) +114 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-kbl6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb7/igt@nouveau_crc@pipe-c-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb3/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_micro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb5/igt@prime_nv_pcopy@test1_micro.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-iclb6/igt@prime_nv_pcopy@test3_4.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-tglb6/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-non-existent-point:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6781/shard-apl6/igt@syncobj_timeline@invalid-transfer-non-existent-point.html">DMESG-WARN</a> ([i915#5098])</li>
</ul>
<p>-</p>
</li>
</ul>

</body>
</html>

--===============4799319946376209774==--
