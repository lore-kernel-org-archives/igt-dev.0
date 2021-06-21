Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D02789A08
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 06:33:35 +0000 (UTC)
Date: Mon, 21 Jun 2021 08:33:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210621063324.GB4192@zkempczy-mobl2>
References: <20210621030010.9956-1-zbigniew.kempczynski@intel.com>
 <162424993326.19771.2735079104605691784@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <162424993326.19771.2735079104605691784@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdummyload=3A_Fix_undefined_behavior_in_bitshift?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 04:32:13AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_dummyload: Fix undefined behavior in bitshift          
>    URL:     https://patchwork.freedesktop.org/series/91713/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10248_full -> IGTPW_5945_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5945_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5945_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5945_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_pm_rpm@gem-execbuf-stress:
>           * shard-iclb: PASS -> INCOMPLETE

It is unrelated, patch influence on spinner offsets only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_5945_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +5 similar
>             issues
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-kbl: PASS -> FAIL (i915#2842) +2 similar issues
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180)
>      * igt@gem_exec_whisper@basic-fds-priority-all:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#118 / i915#95) +1 similar
>             issue
>      * igt@gem_mmap_gtt@cpuset-big-copy:
> 
>           * shard-iclb: PASS -> FAIL (i915#2428)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3323)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3323)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3323)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3323)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3323)
> 
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#3002)
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#3002)
> 
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#2724)
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#3296)
>      * igt@i915_suspend@forcewake:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +1 similar issue
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614)
> 
>      * igt@kms_big_joiner@2x-modeset:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2705)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2705)
> 
>      * igt@kms_chamelium@hdmi-audio:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar
>             issue
> 
>      * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
>      * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +14 similar
>             issues
>      * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +3 similar
>             issues
>      * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +19 similar
>             issues
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT (i915#1319)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#2105)
>      * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
> 
>           * shard-kbl: PASS -> FAIL (i915#3444)
> 
>           * shard-apl: NOTRUN -> FAIL (i915#3444)
> 
>           * shard-glk: PASS -> FAIL (i915#3444)
> 
>      * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +5 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359) +1 similar issue
> 
>      * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109279 / i915#3359) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109279)
> 
>      * igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3319)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274 / fdo#109278)
>      * igt@kms_flip@2x-flip-vs-rmfb:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111825) +7 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +2 similar issues
> 
>      * igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>           * shard-kbl: PASS -> INCOMPLETE (i915#155)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2672)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +3 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
> 
>           * shard-glk: PASS -> FAIL (i915#2546 / i915#49)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +68 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +198 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +51 similar issues
>      * igt@kms_invalid_dotclock:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#110577)
>      * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#533)
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL (fdo#108145 / i915#265)
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (fdo#108145 / i915#265)
>      * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615)
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +4 similar
>             issues
>      * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +290 similar issues
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>      * igt@nouveau_crc@pipe-a-source-outp-complete:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2530)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2530)
> 
>      * igt@sysfs_clients@recycle-many:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>     Possible fixes
> 
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-kbl: SKIP (fdo#109271) -> PASS
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: FAIL (i915#2849) -> PASS
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: SKIP (i915#2190) -> PASS
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS
>      * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
> 
>           * shard-kbl: FAIL (i915#3444) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +3 similar issues
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglb: SKIP (i915#433) -> PASS
>      * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
> 
>           * shard-glk: FAIL (i915#2472) -> PASS
>      * igt@kms_psr@psr2_primary_blt:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
>      * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
> 
>           * shard-kbl: INCOMPLETE (i915#155 / i915#2828) -> PASS
>      * igt@perf@polling-parameterized:
> 
>           * shard-tglb: FAIL (i915#1542) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-iclb: FAIL (i915#2852) -> FAIL (i915#2842)
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-iclb: WARN (i915#2684) -> WARN (i915#1804 / i915#2684)
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658) +2 similar issues
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#2920)
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL) (i915#180 / i915#1814 / i915#3363)
>             -> (FAIL, FAIL, FAIL) (i915#180 / i915#3002 / i915#3363)
> 
> Participating hosts (10 -> 7)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6113 -> IGTPW_5945
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_10248: 940478dea0bccfe1ef632c6cbfca66c5d3fc345e @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_5945: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/index.html
>    IGT_6113: 138a29e30277b1039e9934fca5c782dc1e7a9f99 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
