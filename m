Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34EF10E21B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 10:02:42 +0000 (UTC)
Date: Mon, 19 Dec 2022 11:02:24 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221219100224.7lwx5nppw2m2ltg5@zkempczy-mobl2>
References: <20221219070120.18630-1-zbigniew.kempczynski@intel.com>
 <167144061592.5873.1791238451824106083@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167144061592.5873.1791238451824106083@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5F*=3A_Fix_release_offsets?=
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

On Mon, Dec 19, 2022 at 09:03:35AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/gem_*: Fix release offsets                               
>    URL:     https://patchwork.freedesktop.org/series/112038/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8244/index.html 
> 
>            CI Bug Log - changes from IGT_7097_full -> IGTPW_8244_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8244_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8244_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8244/index.html
> 
> Participating hosts (11 -> 11)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8244_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>           * shard-apl: PASS -> INCOMPLETE +1 similar issue
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@gem_eio@hibernate:
> 
>           * {shard-rkl}: NOTRUN -> FAIL
>      * {igt@i915_hwmon@hwmon-read}:
> 
>           * {shard-tglu-9}: NOTRUN -> SKIP
>      * igt@kms_big_fb@x-tiled-addfb:
> 
>           * {shard-tglu}: NOTRUN -> SKIP +8 similar issues
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * {shard-tglu}: PASS -> SKIP +2 similar issues

Above are not related to the series, see comments below.

> 
> Known issues
> 
>    Here are the changes found in IGTPW_8244_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar
>             issue
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar
>             issue
>      * igt@gem_pread@exhaustion:
> 
>           * shard-apl: NOTRUN -> WARN (i915#2658)
> 
>           * shard-snb: NOTRUN -> WARN (i915#2658)
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
> 
>      * igt@gem_sync@basic-all:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#118)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3323)
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#4991)
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#5566 / i915#716)
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#1937)
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#1937)
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +6 similar
>             issues
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +6 similar
>             issues
>      * igt@kms_chamelium@dp-edid-change-during-suspend:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +5 similar
>             issues
>      * igt@kms_chamelium@vga-hpd-after-suspend:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +3 similar
>             issues
>      * igt@kms_color_chamelium@ctm-0-50:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7 similar
>             issues
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#4767) +1 similar issue
> 
>           * shard-glk: NOTRUN -> FAIL (i915#4767)
> 
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL (i915#79)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +92 similar issues
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#4573) +2 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +83 similar issues
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>      * igt@perf@stress-open-close:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#5213)
>      * igt@sysfs_clients@pidname:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +2 similar
>             issues
>      * igt@sysfs_clients@split-50:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
>      * igt@v3d/v3d_perfmon@destroy-valid-perfmon:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +127 similar issues
> 
>     Possible fixes
> 
>      * igt@fbdev@write:
> 
>           * {shard-rkl}: SKIP (i915#2582) -> PASS
>      * igt@gem_bad_reloc@negative-reloc:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +7 similar issues
>      * igt@gem_caching@read-writes:
> 
>           * shard-apl: INCOMPLETE -> PASS +1 similar issue
>      * igt@gem_ctx_isolation@nonpriv-switch@vcs1:
> 
>           * {shard-dg1}: FAIL (i915#7673) -> PASS +24 similar issues
>      * igt@gem_ctx_isolation@preservation@bcs0:

Series fixes above test. I don't see fix in gem_blits test:

Previous run:
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7097/shard-rkl-6/igt@gem_blits@basic.html

Run with this series:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8244/shard-rkl-4/igt@gem_blits@basic.html

--
Zbigniew

> 
>           * {shard-rkl}: FAIL (i915#7673) -> PASS +12 similar issues
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * {shard-rkl}: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +1 similar issue
>      * igt@gem_partial_pwrite_pread@write:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS +4 similar issues
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk: DMESG-WARN (i915#5566 / i915#716) -> PASS
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * {shard-rkl}: SKIP (i915#2527) -> PASS +1 similar issue
>      * igt@i915_pm_rpm@modeset-lpsp:
> 
>           * {shard-dg1}: SKIP (i915#1397) -> PASS
>      * igt@i915_pm_rpm@system-suspend-modeset:
> 
>           * {shard-rkl}: SKIP (fdo#109308) -> PASS
>      * igt@i915_pm_rps@engine-order:
> 
>           * shard-apl: FAIL (i915#6537) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +12 similar
>             issues
>      * igt@kms_psr@cursor_plane_move:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS
>      * igt@kms_vblank@pipe-a-ts-continuation-idle:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +26 similar
>             issues
>      * igt@perf@polling-small-buf:
> 
>           * {shard-rkl}: FAIL (i915#1722) -> PASS
>      * igt@prime_vgem@basic-read:
> 
>           * {shard-rkl}: SKIP (fdo#109295 / i915#3291 / i915#3708) -> PASS
> 
>     Warnings
> 
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
> 
>           * shard-apl: FAIL (i915#4573) -> DMESG-FAIL (IGT#6) +1 similar
>             issue
>      * igt@runner@aborted:
> 
>           * shard-apl: FAIL (i915#3002 / i915#4312) -> (FAIL, FAIL, FAIL)
>             (fdo#109271 / i915#3002 / i915#4312)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7097 -> IGTPW_8244
> 
>    CI-20190529: 20190529
>    CI_DRM_12513: bac367fdc42d61f6ccbb94875e381e37d8104215 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8244: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8244/index.html
>    IGT_7097: 1ff2643cb7187ddd01b0c34c59113721303e65a2 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
