Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A224C10E3D9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 10:14:13 +0000 (UTC)
Date: Wed, 28 Sep 2022 12:14:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YzQecbTumKxP57Mq@kamilkon-desk1>
References: <20220927162419.38735-1-kamil.konieczny@linux.intel.com>
 <166434679405.596.5524054752930898298@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166434679405.596.5524054752930898298@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYWRkIEk5?=
 =?utf-8?q?15=5FMMAP=5FOFFSET=5FFIXED_tests_part_2/2?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On 2022-09-28 at 06:33:14 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: add I915_MMAP_OFFSET_FIXED tests part 2/2
> URL   : https://patchwork.freedesktop.org/series/109129/
> State : failure
`> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12191_full -> IGTPW_7851_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7851_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7851_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/index.html
> 
> Participating hosts (9 -> 6)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

This is quite a drop in number of tests machines.

> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7851_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@nouveau_crc@pipe-b-source-outp-inactive:
>     - shard-tglb:         NOTRUN -> [SKIP][1] +48 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@nouveau_crc@pipe-b-source-outp-inactive.html
> 
>   * igt@prime_nv_test@i915_blt_fill_nv_read:
>     - shard-iclb:         NOTRUN -> [SKIP][2] +48 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@prime_nv_test@i915_blt_fill_nv_read.html

Above are not related to the change in gem_mmap_offset.

Regards,
Kamil

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7851_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@display-2x:
>     - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#1839])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@feature_discovery@display-2x.html
>     - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#1839])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@feature_discovery@display-2x.html
> 
>   * igt@gem_ctx_persistence@smoketest:
>     - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#5099])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl1/igt@gem_ctx_persistence@smoketest.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@gem_ctx_persistence@smoketest.html
> 
>   * igt@gem_exec_balancer@parallel-bb-first:
>     - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#4525]) +1 similar issue
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#2842])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-tglb:         NOTRUN -> [SKIP][11] ([i915#4613]) +1 similar issue
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@parallel-random:
>     - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#4613])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@gem_lmem_swapping@parallel-random.html
>     - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk2/igt@gem_lmem_swapping@parallel-random.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-2:
>     - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4270]) +1 similar issue
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@gem_pxp@reject-modify-context-protection-off-2.html
>     - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#4270]) +1 similar issue
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-off-2.html
> 
>   * igt@gem_userptr_blits@input-checking:
>     - shard-tglb:         NOTRUN -> [DMESG-WARN][17] ([i915#4991])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@gem_userptr_blits@input-checking.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#3297])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@gem_userptr_blits@readonly-pwrite-unsync.html
>     - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#3297])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-apl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl3/igt@gem_workarounds@suspend-resume-fd.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@gen7_exec_parse@basic-rejected:
>     - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109289])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@gen7_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@bb-secure:
>     - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#2527] / [i915#2856]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@gen9_exec_parse@bb-secure.html
>     - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#2856])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@gen9_exec_parse@bb-secure.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109289]) +2 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#110892])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>     - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@i915_selftest@live@hugepages:
>     - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#5904]) +35 similar issues
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl2/igt@i915_selftest@live@hugepages.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@i915_selftest@live@hugepages.html
> 
>   * igt@kms_addfb_basic@size-max:
>     - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#5904] / [i915#62]) +3 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl2/igt@kms_addfb_basic@size-max.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_addfb_basic@size-max.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#5286]) +1 similar issue
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#5286]) +2 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#110725] / [fdo#111614])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
>     - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111614])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][36] ([i915#5904] / [i915#62])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +1 similar issue
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3689] / [i915#6095])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3689] / [i915#3886]) +2 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111615] / [i915#3689])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3689]) +5 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3886]) +4 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
>     - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3886]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk7/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278] / [i915#3886]) +1 similar issue
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
>     - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#6095]) +2 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271]) +119 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278]) +6 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_chamelium@dp-crc-fast:
>     - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +3 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@kms_chamelium@dp-crc-fast.html
>     - shard-snb:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb6/igt@kms_chamelium@dp-crc-fast.html
> 
>   * igt@kms_chamelium@dp-crc-single:
>     - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +4 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_chamelium@dp-crc-single.html
> 
>   * igt@kms_chamelium@dp-hpd:
>     - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk3/igt@kms_chamelium@dp-hpd.html
> 
>   * igt@kms_chamelium@vga-frame-dump:
>     - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +5 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@kms_chamelium@vga-frame-dump.html
> 
>   * igt@kms_color@ctm-0-25@pipe-b-edp-1:
>     - shard-iclb:         NOTRUN -> [FAIL][53] ([i915#315] / [i915#6946]) +2 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_color@ctm-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_color@ctm-0-25@pipe-c-edp-1:
>     - shard-tglb:         NOTRUN -> [FAIL][54] ([i915#315]) +3 similar issues
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_color@ctm-0-25@pipe-c-edp-1.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3555]) +3 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109274] / [fdo#111825])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109274] / [fdo#111825] / [i915#3637] / [i915#3966])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-busy-flip:
>     - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274]) +1 similar issue
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_flip@2x-busy-flip.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>     - shard-apl:          NOTRUN -> [DMESG-WARN][60] ([i915#180])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#2672]) +4 similar issues
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#2587] / [i915#2672]) +2 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#2587] / [i915#2672]) +1 similar issue
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#3555]) +1 similar issue
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
>     - shard-apl:          [PASS][65] -> [DMESG-WARN][66] ([i915#1982] / [i915#5904] / [i915#62])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#6497]) +3 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109280]) +10 similar issues
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109280] / [fdo#111825]) +16 similar issues
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
>     - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#6403]) +3 similar issues
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
>     - shard-apl:          [PASS][71] -> [SKIP][72] ([fdo#109271]) +4 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271]) +82 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_psr@psr2_dpms:
>     - shard-iclb:         [PASS][74] -> [SKIP][75] ([fdo#109441])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@kms_psr@psr2_dpms.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_psr@psr2_dpms.html
> 
>   * igt@kms_psr@psr2_primary_mmap_gtt:
>     - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109441])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html
> 
>   * igt@kms_psr@psr2_sprite_render:
>     - shard-tglb:         NOTRUN -> [FAIL][77] ([i915#132] / [i915#3467]) +2 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_psr@psr2_sprite_render.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#111615] / [i915#5289])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_sequence@get-forked@dp-1-pipe-c:
>     - shard-apl:          [PASS][79] -> [DMESG-WARN][80] ([i915#180] / [i915#5904] / [i915#62]) +9 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl7/igt@kms_sequence@get-forked@dp-1-pipe-c.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_sequence@get-forked@dp-1-pipe-c.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#2437])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_writeback@writeback-fb-id.html
>     - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#2437])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk8/igt@kms_writeback@writeback-fb-id.html
>     - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#2437])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2437]) +1 similar issue
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@prime_nv_pcopy@test3_5:
>     - shard-snb:          NOTRUN -> [SKIP][85] ([fdo#109271]) +109 similar issues
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb5/igt@prime_nv_pcopy@test3_5.html
> 
>   * igt@sysfs_clients@fair-0:
>     - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2994])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@sysfs_clients@fair-0.html
>     - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2994])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk9/igt@sysfs_clients@fair-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#2994])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@sysfs_clients@fair-0.html
> 
>   * igt@sysfs_clients@sema-50:
>     - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2994]) +1 similar issue
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@sysfs_clients@sema-50.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_import_export@flink:
>     - shard-tglb:         [INCOMPLETE][90] -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-tglb5/igt@drm_import_export@flink.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@drm_import_export@flink.html
> 
>   * igt@gem_eio@in-flight-contexts-1us:
>     - shard-iclb:         [TIMEOUT][92] ([i915#3070]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@gem_eio@in-flight-contexts-1us.html
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@gem_eio@in-flight-contexts-1us.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-tglb:         [FAIL][94] ([i915#2842]) -> [PASS][95] +1 similar issue
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html
>     - shard-iclb:         [FAIL][96] ([i915#2842]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][98] ([i915#2842]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [FAIL][100] ([i915#2842]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * {igt@gem_mmap_offset@clear@smem0}:
>     - shard-snb:          [FAIL][102] -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-snb2/igt@gem_mmap_offset@clear@smem0.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb7/igt@gem_mmap_offset@clear@smem0.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-iclb:         [FAIL][104] ([i915#3989] / [i915#454]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-glk:          [DMESG-FAIL][106] ([i915#118] / [i915#1888]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
>     - shard-glk:          [FAIL][108] ([i915#79]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-iclb:         [SKIP][110] ([i915#3555]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
>     - shard-iclb:         [SKIP][112] ([i915#5235]) -> [PASS][113] +2 similar issues
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
> 
>   * igt@kms_psr@psr2_no_drrs:
>     - shard-iclb:         [SKIP][114] ([fdo#109441]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglb:         [SKIP][116] ([i915#5519]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     - shard-iclb:         [SKIP][118] ([i915#5519]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-glk:          [FAIL][120] -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@perf_pmu@rc6-suspend:
>     - shard-apl:          [DMESG-WARN][122] ([i915#180]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl1/igt@perf_pmu@rc6-suspend.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl6/igt@perf_pmu@rc6-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-iclb:         [SKIP][124] ([i915#4525]) -> [FAIL][125] ([i915#6117])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@kms_content_protection@mei_interface:
>     - shard-tglb:         [SKIP][126] ([i915#1063]) -> [SKIP][127] ([fdo#109300])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-tglb8/igt@kms_content_protection@mei_interface.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_content_protection@mei_interface.html
>     - shard-iclb:         [SKIP][128] ([fdo#109300] / [fdo#111066]) -> [SKIP][129] ([fdo#109300])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@kms_content_protection@mei_interface.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_content_protection@mei_interface.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-iclb:         [SKIP][130] ([i915#658]) -> [SKIP][131] ([i915#2920])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-iclb:         [SKIP][132] ([fdo#111068] / [i915#658]) -> [SKIP][133] ([i915#2920])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle:
>     - shard-apl:          [SKIP][134] ([fdo#109271] / [i915#533]) -> [SKIP][135] ([fdo#109271])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][136], [FAIL][137], [FAIL][138]) ([i915#3002] / [i915#4312]) -> ([FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl1/igt@runner@aborted.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl3/igt@runner@aborted.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl7/igt@runner@aborted.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@runner@aborted.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@runner@aborted.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl8/igt@runner@aborted.html
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
>   [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
>   [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
>   [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
>   [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
>   [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6665 -> IGTPW_7851
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12191: b16161a277e2e302cf488cda83f48d6d1a3052f4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7851: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/index.html
>   IGT_6665: aecdb7ff269899b13b127bfa595d091af9781d94 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/index.html
