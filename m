Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8A610E674
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 08:07:24 +0000 (UTC)
Date: Thu, 10 Nov 2022 10:07:30 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Message-ID: <Y2yxQpwJBLzeJoF3@platvala-desk.ger.corp.intel.com>
References: <20221108100733.2378106-1-petri.latvala@intel.com>
 <166801357979.3409.15074174518297701489@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166801357979.3409.15074174518297701489@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/6=5D_runner=3A_Use_a_bigger_bu?=
 =?utf-8?q?ffer_for_receiving_test_outputs_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 05:06:19PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,v2,1/6] runner: Use a bigger buffer for receiving test outputs (rev2)
> URL   : https://patchwork.freedesktop.org/series/110657/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12360_full -> IGTPW_8077_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8077_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8077_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/index.html
> 
> Participating hosts (11 -> 8)
> ------------------------------
> 
>   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8077_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1:
>     - shard-glk:          [PASS][1] -> [INCOMPLETE][2] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-glk7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1.html

Lakshmi, two incompletes from being killed for disk space usage. Not
caused by patch series.


-- 
Petri Latvala



> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - {shard-rkl}:        [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8077_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@feature_discovery@display-4x:
>     - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#1839])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb6/igt@feature_discovery@display-4x.html
>     - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#1839])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb5/igt@feature_discovery@display-4x.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +1 similar issue
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-snb2/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#280])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb1/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-apl:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#2190])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl2/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@verify:
>     - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#4613])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@gem_lmem_swapping@verify.html
>     - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl6/igt@gem_lmem_swapping@verify.html
>     - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#4613])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb6/igt@gem_lmem_swapping@verify.html
>     - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk2/igt@gem_lmem_swapping@verify.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-iclb:         NOTRUN -> [SKIP][14] ([i915#4270])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb5/igt@gem_pxp@protected-raw-src-copy-not-readible.html
>     - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#4270])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#768])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#109290])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb8/igt@gem_userptr_blits@coherency-sync.html
>     - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#110542])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb1/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#3297])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb8/igt@gem_userptr_blits@readonly-pwrite-unsync.html
>     - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#3297])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb5/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#2527] / [i915#2856]) +2 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb7/igt@gen9_exec_parse@cmd-crossing-page.html
>     - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#2856]) +2 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb7/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-untiled:
>     - shard-apl:          NOTRUN -> [FAIL][23] ([i915#7036])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl7/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - shard-tglb:         NOTRUN -> [WARN][24] ([i915#2681]) +3 similar issues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#111644] / [i915#1397] / [i915#2411])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
>     - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#110892])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4387])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb1/igt@i915_pm_sseu@full-enable.html
>     - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#4387])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb6/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
>     - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#2521])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>     - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#5286])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
>     - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#5286])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110725] / [fdo#111614]) +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb6/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111614]) +1 similar issue
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#5138])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-glk7/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +1 similar issue
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#110723])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278]) +10 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb6/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs.html
>     - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3689] / [i915#6095])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb5/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#6095]) +2 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3886]) +3 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl6/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271]) +64 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3689] / [i915#3886])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
>     - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
>     - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#3886]) +1 similar issue
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb1/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271]) +153 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl1/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689]) +4 similar issues
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb8/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111615] / [i915#3689]) +3 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb7/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html
> 
>   * igt@kms_chamelium@dp-crc-single:
>     - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +3 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl7/igt@kms_chamelium@dp-crc-single.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
>     - shard-apl:          NOTRUN -> [TIMEOUT][51] ([i915#7173])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109274] / [fdo#111825])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-apl:          NOTRUN -> [FAIL][53] ([i915#4767])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl1/igt@kms_fbcon_fbt@fbc.html
>     - shard-tglb:         NOTRUN -> [FAIL][54] ([i915#4767])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb2/igt@kms_fbcon_fbt@fbc.html
>     - shard-glk:          NOTRUN -> [FAIL][55] ([i915#4767])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk7/igt@kms_fbcon_fbt@fbc.html
>     - shard-iclb:         NOTRUN -> [FAIL][56] ([i915#4767])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb1/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb7/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274]) +3 similar issues
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
>     - shard-glk:          [PASS][59] -> [FAIL][60] ([i915#2122])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#3555]) +1 similar issue
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#2672]) +3 similar issues
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#2587] / [i915#2672]) +5 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#2672] / [i915#3555])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109280]) +7 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>     - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#6497]) +5 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109280] / [fdo#111825]) +8 similar issues
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#3555])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb5/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
>     - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109289])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
>     - shard-iclb:         [PASS][70] -> [SKIP][71] ([i915#5176]) +1 similar issue
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-a-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#5176]) +2 similar issues
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb1/igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-edp-1:
>     - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#5176]) +3 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb2/igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>     - shard-iclb:         [PASS][74] -> [SKIP][75] ([i915#5235]) +2 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>     - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#658])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
>     - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#658])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
>     - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2920])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
>     - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@psr2_cursor_plane_onoff:
>     - shard-iclb:         [PASS][80] -> [SKIP][81] ([fdo#109441])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html
> 
>   * igt@kms_psr@psr2_suspend:
>     - shard-tglb:         NOTRUN -> [FAIL][82] ([i915#132] / [i915#3467]) +1 similar issue
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb7/igt@kms_psr@psr2_suspend.html
>     - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109441])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb7/igt@kms_psr@psr2_suspend.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#5519])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-tglb:         [PASS][85] -> [SKIP][86] ([i915#5519])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-snb:          NOTRUN -> [SKIP][87] ([fdo#109271]) +87 similar issues
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-snb7/igt@kms_tv_load_detect@load-detect.html
>     - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109309])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb2/igt@kms_tv_load_detect@load-detect.html
>     - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109309])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb1/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2437])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl1/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@gen12-mi-rpc:
>     - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109289]) +2 similar issues
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@perf@gen12-mi-rpc.html
> 
>   * igt@sysfs_clients@fair-1:
>     - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2994])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl6/igt@sysfs_clients@fair-1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - {shard-rkl}:        [INCOMPLETE][93] ([i915#7134]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@drm_read@short-buffer-nonblock:
>     - {shard-rkl}:        [SKIP][95] ([i915#4098]) -> [PASS][96] +1 similar issue
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-1/igt@drm_read@short-buffer-nonblock.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-6/igt@drm_read@short-buffer-nonblock.html
> 
>   * igt@feature_discovery@psr2:
>     - shard-iclb:         [SKIP][97] ([i915#658]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb7/igt@feature_discovery@psr2.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@feature_discovery@psr2.html
> 
>   * igt@gem_exec_balancer@parallel-contexts:
>     - shard-iclb:         [SKIP][99] ([i915#4525]) -> [PASS][100] +2 similar issues
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - {shard-rkl}:        [FAIL][101] ([i915#2846]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglb:         [FAIL][103] ([i915#2842]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - {shard-rkl}:        [FAIL][105] ([i915#2842]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-apl:          [FAIL][107] ([i915#2842]) -> [PASS][108]
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          [FAIL][109] ([i915#2842]) -> [PASS][110] +1 similar issue
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - {shard-rkl}:        [SKIP][111] ([i915#3281]) -> [PASS][112] +7 similar issues
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>   * igt@gem_madvise@dontneed-before-pwrite:
>     - {shard-rkl}:        [SKIP][113] ([i915#3282]) -> [PASS][114] +3 similar issues
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-4/igt@gem_madvise@dontneed-before-pwrite.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-5/igt@gem_madvise@dontneed-before-pwrite.html
> 
>   * igt@gem_softpin@evict-single-offset:
>     - {shard-rkl}:        [FAIL][115] ([i915#4171]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-1/igt@gem_softpin@evict-single-offset.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-1/igt@gem_softpin@evict-single-offset.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - {shard-rkl}:        [SKIP][117] ([i915#2527]) -> [PASS][118] +2 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - {shard-rkl}:        [FAIL][119] ([i915#3989]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-3/igt@i915_pm_dc@dc6-dpms.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-4/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_rpm@cursor:
>     - {shard-rkl}:        [SKIP][121] ([i915#1849]) -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-1/igt@i915_pm_rpm@cursor.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-6/igt@i915_pm_rpm@cursor.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - {shard-rkl}:        [FAIL][123] ([fdo#103375]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-6/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - {shard-rkl}:        [SKIP][125] ([i915#1845] / [i915#4098]) -> [PASS][126] +20 similar issues
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
>     - shard-iclb:         [FAIL][127] ([i915#7076]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
>     - shard-apl:          [DMESG-WARN][129] ([i915#180]) -> [PASS][130] +2 similar issues
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl7/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>     - shard-glk:          [FAIL][131] ([i915#2346]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@varying-size:
>     - shard-iclb:         [FAIL][133] ([i915#2346]) -> [PASS][134] +2 similar issues
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@varying-size.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb3/igt@kms_cursor_legacy@flip-vs-cursor@varying-size.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - {shard-rkl}:        [SKIP][135] ([i915#1849] / [i915#4098]) -> [PASS][136] +13 similar issues
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_psr@cursor_render:
>     - {shard-rkl}:        [SKIP][137] ([i915#1072]) -> [PASS][138] +2 similar issues
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-1/igt@kms_psr@cursor_render.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-6/igt@kms_psr@cursor_render.html
> 
>   * igt@kms_psr@psr2_sprite_blt:
>     - shard-iclb:         [SKIP][139] ([fdo#109441]) -> [PASS][140]
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb8/igt@kms_psr@psr2_sprite_blt.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-iclb:         [SKIP][141] ([i915#5519]) -> [PASS][142]
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@perf_pmu@busy-double-start@vcs0:
>     - {shard-dg1}:        [FAIL][143] ([i915#4349]) -> [PASS][144] +1 similar issue
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-dg1-19/igt@perf_pmu@busy-double-start@vcs0.html
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs0.html
> 
>   * igt@prime_vgem@basic-write:
>     - {shard-rkl}:        [SKIP][145] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-rkl-1/igt@prime_vgem@basic-write.html
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-rkl-5/igt@prime_vgem@basic-write.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-iclb:         [FAIL][147] ([i915#6117]) -> [SKIP][148] ([i915#4525])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-apl:          [WARN][149] ([i915#2658]) -> [INCOMPLETE][150] ([i915#7248])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-apl7/igt@gem_pread@exhaustion.html
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl7/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk:          [INCOMPLETE][151] ([i915#7248]) -> [WARN][152] ([i915#2658])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-glk5/igt@gem_pwrite@basic-exhaustion.html
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-glk1/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-1:
>     - shard-apl:          [INCOMPLETE][153] ([i915#1319] / [i915#7121] / [i915#7173]) -> [TIMEOUT][154] ([i915#7173])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-apl6/igt@kms_content_protection@legacy@pipe-a-dp-1.html
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl7/igt@kms_content_protection@legacy@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@lic@pipe-a-dp-1:
>     - shard-apl:          [INCOMPLETE][155] ([i915#7121] / [i915#7173]) -> [TIMEOUT][156] ([i915#7173]) +2 similar issues
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-apl2/igt@kms_content_protection@lic@pipe-a-dp-1.html
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl8/igt@kms_content_protection@lic@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@mei_interface:
>     - shard-tglb:         [SKIP][157] ([i915#7118]) -> [SKIP][158] ([fdo#109300])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-tglb2/igt@kms_content_protection@mei_interface.html
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-tglb8/igt@kms_content_protection@mei_interface.html
>     - shard-iclb:         [SKIP][159] ([i915#7118]) -> [SKIP][160] ([fdo#109300])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb1/igt@kms_content_protection@mei_interface.html
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb5/igt@kms_content_protection@mei_interface.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-iclb:         [SKIP][161] ([i915#2920]) -> [SKIP][162] ([i915#658])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-iclb:         [SKIP][163] ([i915#2920]) -> [SKIP][164] ([fdo#111068] / [i915#658])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@runner@aborted:
>     - shard-apl:          ([FAIL][165], [FAIL][166], [FAIL][167], [FAIL][168]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][169], [FAIL][170]) ([i915#3002] / [i915#4312])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-apl3/igt@runner@aborted.html
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-apl1/igt@runner@aborted.html
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-apl3/igt@runner@aborted.html
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12360/shard-apl6/igt@runner@aborted.html
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl1/igt@runner@aborted.html
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/shard-apl2/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
>   [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
>   [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
>   [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
>   [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
>   [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#7036]: https://gitlab.freedesktop.org/drm/intel/issues/7036
>   [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
>   [i915#7076]: https://gitlab.freedesktop.org/drm/intel/issues/7076
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7121]: https://gitlab.freedesktop.org/drm/intel/issues/7121
>   [i915#7134]: https://gitlab.freedesktop.org/drm/intel/issues/7134
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
>   [i915#7248]: https://gitlab.freedesktop.org/drm/intel/issues/7248
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7048 -> IGTPW_8077
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12360: 83ef9bf841a2427c464cc3a9f5a6e57948a12963 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8077: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/index.html
>   IGT_7048: 5edd5c539f1fdf1c02157bf43fa1fd22d4ad2c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8077/index.html
