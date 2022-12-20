Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5308E10E06B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 07:04:58 +0000 (UTC)
Date: Tue, 20 Dec 2022 08:04:40 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221220070440.roisvpkh6o5ncp7e@zkempczy-mobl2>
References: <20221219115834.55838-1-zbigniew.kempczynski@intel.com>
 <167150657610.18781.5696736044673082855@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167150657610.18781.5696736044673082855@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IGlu?=
 =?utf-8?q?valid_usage_of_put=5Foffset=28=29_=28rev2=29?=
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

On Tue, Dec 20, 2022 at 03:22:56AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Fix invalid usage of put_offset() (rev2)                       
>    URL:     https://patchwork.freedesktop.org/series/112056/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html 
> 
>            CI Bug Log - changes from IGT_7099_full -> IGTPW_8247_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8247_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8247_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html
> 
> Participating hosts (11 -> 10)
> 
>    Missing (1): shard-dg10
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8247_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>           * shard-apl: PASS -> INCOMPLETE +1 similar issue

Unrelated to above regression.

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@gem_ccs@block-multicopy-inplace}:
> 
>           * {shard-tglu}: NOTRUN -> SKIP
>      * igt@i915_pm_rpm@system-suspend-devices:
> 
>           * {shard-rkl}: PASS -> FAIL
>      * {igt@vc4/vc4_perfmon@destroy-invalid-perfmon}:
> 
>           * {shard-dg1}: NOTRUN -> SKIP +6 similar issues
>      * {igt@vc4/vc4_tiling@get-bad-flags}:
> 
>           * {shard-rkl}: NOTRUN -> SKIP +5 similar issues
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8247_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_caching@read-writes:
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#7708)
>      * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +1 similar
>             issue
>      * igt@gem_exec_whisper@basic-queues-priority-all:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#118)
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
> 
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +111 similar issues
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3323)
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#4991)
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#5566 / i915#716)
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +2 similar
>             issues
>      * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +3 similar
>             issues
>      * igt@kms_chamelium@dp-crc-single:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar
>             issues
>      * igt@kms_color_chamelium@ctm-red-to-blue:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
> 
>      * igt@kms_content_protection@atomic@pipe-a-dp-1:
> 
>           * shard-apl: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
> 
>           * shard-glk: PASS -> FAIL (i915#2346)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#7205)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#4767)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +90 similar issues
>      * igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +2 similar
>             issues
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +42 similar issues
>      * igt@perf@stress-open-close:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#5213)
>      * igt@sysfs_clients@fair-1:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +2 similar
>             issues
>      * igt@sysfs_clients@split-10:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>     Possible fixes
> 
>      * igt@core_hotunplug@unbind-rebind:
> 
>           * shard-snb: DMESG-WARN (i915#4528) -> PASS
>      * igt@drm_read@short-buffer-block:
> 
>           * {shard-rkl}: SKIP (i915#4098) -> PASS +1 similar issue
>      * igt@gem_ctx_isolation@nonpriv-switch@vcs1:
> 
>           * {shard-dg1}: FAIL (i915#7673) -> PASS +24 similar issues
>      * igt@gem_ctx_isolation@preservation-s3@bcs0:
> 
>           * {shard-rkl}: FAIL (i915#7673) -> PASS +12 similar issues
>      * igt@gem_ctx_persistence@engines-hang@bcs0:
> 
>           * {shard-rkl}: SKIP (i915#6252) -> PASS
>      * igt@gem_eio@in-flight-suspend:
> 
>           * {shard-rkl}: FAIL -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * {shard-dg1}: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +1 similar issue
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
> 
>      * igt@gem_exec_reloc@basic-cpu-read:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +3 similar issues
>      * igt@gem_mmap_gtt@hang-user:
> 
>           * shard-glk: SKIP (fdo#109271) -> PASS
> 
>           * shard-apl: SKIP (fdo#109271) -> PASS
> 
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS +6 similar issues
>      * igt@gem_softpin@noreloc-s3:
> 
>           * {shard-rkl}: FAIL (fdo#103375) -> PASS
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * {shard-rkl}: SKIP (i915#2527) -> PASS +2 similar issues
>      * igt@i915_pm_dc@dc5-psr:
> 
>           * {shard-rkl}: SKIP (i915#658) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>           * {shard-dg1}: FAIL (i915#3591) -> PASS +1 similar issue
>      * igt@i915_pm_rpm@cursor-dpms:
> 
>           * {shard-tglu}: SKIP (i915#1849) -> PASS +2 similar issues
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * {shard-rkl}: SKIP (i915#1397) -> PASS
>      * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:
> 
>           * {shard-tglu}: SKIP -> PASS +6 similar issues
>      * igt@kms_fbcon_fbt@psr:
> 
>           * {shard-rkl}: SKIP (i915#3955) -> PASS
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * {shard-rkl}: SKIP (fdo#110189 / i915#3955) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +14 similar
>             issues
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
> 
>           * shard-snb: SKIP (fdo#109271) -> PASS
>      * igt@kms_psr@primary_render:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS +1 similar issue
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * {shard-rkl}: SKIP (i915#5461) -> PASS
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +23 similar
>             issues
>      * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b:
> 
>           * {shard-rkl}: SKIP (i915#4070 / i915#4098) -> PASS
>      * igt@perf_pmu@busy-idle@vcs0:
> 
>           * {shard-dg1}: FAIL (i915#4349) -> PASS +2 similar issues
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * {shard-rkl}: SKIP (fdo#109295 / i915#3708 / i915#4098) -> PASS
> 
>     Warnings
> 
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
> 
>           * shard-apl: DMESG-FAIL (IGT#6) -> FAIL (i915#4573) +1 similar
>             issue
>      * igt@runner@aborted:
> 
>           * shard-apl: FAIL (i915#3002 / i915#4312) -> (FAIL, FAIL)
>             (fdo#109271 / i915#3002 / i915#4312)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7099 -> IGTPW_8247
> 
>    CI-20190529: 20190529
>    CI_DRM_12515: 25905f33e9cb1630d94ce04688d5a6c756f96e9d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8247: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8247/index.html
>    IGT_7099: 62e8be3ca2935a079de4fabd4923df58278a9ed0 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
