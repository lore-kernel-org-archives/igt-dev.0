Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508FA10E1EE
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jan 2023 13:56:51 +0000 (UTC)
Date: Mon, 23 Jan 2023 14:56:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230123135646.6nfxuckmbywrv5qx@kamilkon-desk1>
References: <20230118200344.795326-1-jonathan.cavitt@intel.com>
 <167415443455.24698.13445801023004430383@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167415443455.24698.13445801023004430383@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkmod=3A_Allow_some_leeway_in_igt=5Fkmod=5Funload=5Fr_=28rev?=
 =?utf-8?q?4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below failure seems unrelated.

Regards,
Kamil

On 2023-01-19 at 18:53:54 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kmod: Allow some leeway in igt_kmod_unload_r (rev4)
> URL   : https://patchwork.freedesktop.org/series/112566/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12604_full -> IGTPW_8370_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8370_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8370_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/index.html
> 
> Participating hosts (13 -> 11)
> ------------------------------
> 
>   Missing    (2): pig-skl-6260u pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8370_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-apl:          [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8370_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#2842]) +1 similar issue
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - shard-apl:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#4613])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl3/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-snb:          [PASS][6] -> [DMESG-WARN][7] ([i915#4528])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - shard-apl:          [PASS][8] -> [DMESG-FAIL][9] ([i915#5334])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-apl2/igt@i915_selftest@live@gt_heartbeat.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl2/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#3886]) +3 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271]) +62 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
>     - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#2346])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
>     - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#79])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
> 
>   * igt@perf@stress-open-close:
>     - shard-glk:          [PASS][16] -> [INCOMPLETE][17] ([i915#5213])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-glk3/igt@perf@stress-open-close.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-glk1/igt@perf@stress-open-close.html
> 
>   * igt@runner@aborted:
>     - shard-snb:          NOTRUN -> [FAIL][18] ([i915#4312])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-snb4/igt@runner@aborted.html
>     - shard-glk:          NOTRUN -> [FAIL][19] ([i915#4312])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-glk1/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - {shard-rkl}:        [DMESG-WARN][20] ([i915#5507]) -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@drm_fdinfo@virtual-idle:
>     - {shard-rkl}:        [FAIL][22] ([i915#7742]) -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html
> 
>   * igt@gem_caching@read-writes:
>     - shard-apl:          [INCOMPLETE][24] ([i915#7708]) -> [PASS][25] +1 similar issue
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-apl3/igt@gem_caching@read-writes.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl6/igt@gem_caching@read-writes.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - {shard-rkl}:        [FAIL][26] ([i915#6268]) -> [PASS][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - {shard-dg1}:        [FAIL][28] ([i915#5784]) -> [PASS][29] +2 similar issues
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-dg1-18/igt@gem_eio@unwedge-stress.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-dg1-14/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][30] ([i915#2842]) -> [PASS][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          [FAIL][32] ([i915#2842]) -> [PASS][33] +1 similar issue
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - {shard-rkl}:        [SKIP][34] ([i915#3281]) -> [PASS][35] +6 similar issues
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_readwrite@read-bad-handle:
>     - {shard-rkl}:        [SKIP][36] ([i915#3282]) -> [PASS][37]
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-3/igt@gem_readwrite@read-bad-handle.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-5/igt@gem_readwrite@read-bad-handle.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - {shard-rkl}:        [SKIP][38] ([i915#2527]) -> [PASS][39] +2 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@i915_hangman@gt-engine-error@bcs0:
>     - {shard-rkl}:        [SKIP][40] ([i915#6258]) -> [PASS][41]
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-2/igt@i915_hangman@gt-engine-error@bcs0.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-untiled:
>     - {shard-rkl}:        [SKIP][42] ([i915#4098]) -> [PASS][43]
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - {shard-tglu}:       [WARN][44] ([i915#2681]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp:
>     - {shard-dg1}:        [SKIP][46] ([i915#1397]) -> [PASS][47]
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-dg1-15/igt@i915_pm_rpm@modeset-lpsp.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - {shard-rkl}:        [FAIL][48] ([fdo#103375]) -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - {shard-rkl}:        [SKIP][50] ([i915#3955]) -> [PASS][51] +1 similar issue
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
>     - shard-apl:          [FAIL][52] ([i915#79]) -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:
>     - {shard-dg1}:        [FAIL][54] -> [PASS][55]
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-badstride:
>     - {shard-rkl}:        [SKIP][56] ([i915#1849] / [i915#4098]) -> [PASS][57] +8 similar issues
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-badstride.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
>     - shard-apl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
> 
>   * igt@kms_plane@plane-panning-bottom-right@pipe-a-planes:
>     - {shard-rkl}:        [SKIP][60] ([i915#1849]) -> [PASS][61] +4 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right@pipe-a-planes.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right@pipe-a-planes.html
> 
>   * igt@kms_psr@sprite_plane_move:
>     - {shard-rkl}:        [SKIP][62] ([i915#1072]) -> [PASS][63] +1 similar issue
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-4/igt@kms_psr@sprite_plane_move.html
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-6/igt@kms_psr@sprite_plane_move.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - {shard-rkl}:        [SKIP][64] ([i915#5461]) -> [PASS][65]
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_vblank@pipe-b-query-idle:
>     - {shard-rkl}:        [SKIP][66] ([i915#1845] / [i915#4098]) -> [PASS][67] +12 similar issues
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-3/igt@kms_vblank@pipe-b-query-idle.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-6/igt@kms_vblank@pipe-b-query-idle.html
> 
>   * igt@perf@gen12-mi-rpc:
>     - {shard-rkl}:        [SKIP][68] ([fdo#109289]) -> [PASS][69] +1 similar issue
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-rkl-5/igt@perf@gen12-mi-rpc.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-rkl-4/igt@perf@gen12-mi-rpc.html
> 
>   * igt@sysfs_heartbeat_interval@precise@vecs0:
>     - {shard-dg1}:        [FAIL][70] ([i915#1755]) -> [PASS][71]
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12604/shard-dg1-18/igt@sysfs_heartbeat_interval@precise@vecs0.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/shard-dg1-19/igt@sysfs_heartbeat_interval@precise@vecs0.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
>   [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
>   [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5507]: https://gitlab.freedesktop.org/drm/intel/issues/5507
>   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
>   [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
>   [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
>   [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
>   [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
>   [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
>   [i915#7679]: https://gitlab.freedesktop.org/drm/intel/issues/7679
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7708]: https://gitlab.freedesktop.org/drm/intel/issues/7708
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7123 -> IGTPW_8370
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12604: 6f176a01430184278f10d23e6d40c4a209bee4a5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8370: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/index.html
>   IGT_7123: 2b29e8ac07fbcfadc48b9d60e4d736a6e3b289ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8370/index.html
