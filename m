Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6A36E3EF
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Aug 2021 17:37:18 +0000 (UTC)
Date: Wed, 25 Aug 2021 19:36:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210825173652.GA3705@zkempczy-mobl2>
References: <20210825075149.81624-1-zbigniew.kempczynski@intel.com>
 <162990213109.17675.5419389391882293639@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162990213109.17675.5419389391882293639@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Fparams=3A_Fix_context_within_which_batch_is_execut?=
 =?utf-8?q?ed?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 25, 2021 at 02:35:31PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/gem_exec_params: Fix context within which batch is executed 
>    URL:     https://patchwork.freedesktop.org/series/93991/                   
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/index.html    
> 
>          CI Bug Log - changes from CI_DRM_10519_full -> IGTPW_6152_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6152_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6152_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6152_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip_event_leak:
>           * shard-tglb: PASS -> INCOMPLETE

Unrelated, I've changed only single subtest within gem_exec_params.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6152_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#3002)
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#3002)
> 
>      * igt@gem_ctx_persistence@engines-queued:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +1 similar
>             issue
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#3354)
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: PASS -> FAIL (i915#2846)
> 
>           * shard-apl: NOTRUN -> FAIL (i915#2846)
> 
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-kbl: PASS -> FAIL (i915#2842) +2 similar issues
>      * igt@gem_pread@exhaustion:
> 
>           * shard-snb: NOTRUN -> WARN (i915#2658)
>      * igt@gem_render_copy@yf-tiled-to-vebox-linear:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768)
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#180)
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#3318)
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +1 similar issue
>      * igt@i915_pm_rpm@gem-mmap-type@fixed:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3976)
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-snb: NOTRUN -> INCOMPLETE (i915#3921)
>      * igt@kms_big_fb@linear-32bpp-rotate-0:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#118 / i915#95) +1 similar
>             issue
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
> 
>           * shard-glk: PASS -> FAIL (i915#1888)
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-iclb: PASS -> DMESG-WARN (i915#3621)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3777) +2 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723)
> 
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +12 similar
>             issues
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886)
> 
>      * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +366 similar issues
>      * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +18 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +2 similar issues
> 
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +242 similar issues
>      * igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +18 similar
>             issues
>      * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +21 similar
>             issues
>      * igt@kms_color_chamelium@pipe-d-ctm-max:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-apl: NOTRUN -> TIMEOUT (i915#1319) +1 similar issue
>      * igt@kms_cursor_crc@pipe-b-cursor-size-change:
> 
>           * shard-kbl: PASS -> FAIL (i915#3444)
> 
>           * shard-glk: PASS -> FAIL (i915#3444)
> 
>           * shard-apl: NOTRUN -> FAIL (i915#3444)
> 
>           * shard-iclb: PASS -> FAIL (i915#3444)
> 
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@pipe-d-cursor-64x21-random:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +6 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque:
> 
>           * shard-tglb: PASS -> FAIL (i915#2124) +1 similar issue
>      * igt@kms_draw_crc@fill-fb:
> 
>           * shard-glk: PASS -> FAIL (i915#1888 / i915#3451)
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274)
>      * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
> 
>           * shard-glk: PASS -> FAIL (i915#79)
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280)
>      * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#533) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / i915#265) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> 
>           * shard-apl: NOTRUN -> FAIL (fdo#108145 / i915#265) +5 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#265)
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +3 similar
>             issues
>      * igt@kms_psr2_su@page_flip:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109642 / fdo#111068 / i915#658)
>      * igt@kms_psr@cursor_plane_onoff:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +16 similar issues
>      * igt@kms_psr@psr2_cursor_plane_move:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441)
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-apl: NOTRUN -> FAIL (IGT#2)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437) +1 similar
>             issue
>      * igt@sysfs_clients@fair-7:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994)
> 
>     Possible fixes
> 
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-tglb: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-kbl: FAIL (i915#2842) -> PASS
>      * igt@gem_mmap_gtt@cpuset-big-copy-xy:
> 
>           * shard-iclb: FAIL (i915#2428) -> PASS +1 similar issue
>      * igt@i915_selftest@live@requests:
> 
>           * shard-tglb: DMESG-FAIL -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +3 similar issues
>      * igt@kms_psr@psr2_primary_mmap_gtt:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS
>      * igt@kms_rotation_crc@sprite-rotation-180:
> 
>           * shard-glk: FAIL (i915#1888 / i915#65) -> PASS
>      * igt@kms_vblank@pipe-c-wait-forked-busy-hang:
> 
>           * shard-kbl: SKIP (fdo#109271) -> PASS
> 
>     Warnings
> 
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-iclb: WARN (i915#2684) -> WARN (i915#1804 / i915#2684) +1
>             similar issue
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#2920) +1 similar issue
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658) +2 similar issues
>      * igt@runner@aborted:
> 
>           * shard-iclb: (FAIL, FAIL) (i915#3002) -> (FAIL, FAIL, FAIL)
>             (i915#1814 / i915#3002)
> 
>           * shard-apl: (FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#1814 /
>             i915#3002 / i915#3363) -> (FAIL, FAIL, FAIL, FAIL) (fdo#109271 /
>             i915#180 / i915#3002 / i915#3363)
> 
> Participating hosts (11 -> 7)
> 
>    Missing (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6185 -> IGTPW_6152
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_10519: 3edb12bf2c3cd732bc930e3e418e4aeaaaf32ffa @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_6152: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6152/index.html
>    IGT_6185: 5dca04416f50576f464ebbd9aea96edccd7e4eab @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
