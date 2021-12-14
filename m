Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4560F10E8C6
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Dec 2021 07:48:48 +0000 (UTC)
Date: Tue, 14 Dec 2021 08:48:42 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YbhMWjpvg+CqJ9Eq@zkempczy-mobl2>
References: <20211213181208.159531-1-zbigniew.kempczynski@intel.com>
 <163944221801.24608.4221888725975850724@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163944221801.24608.4221888725975850724@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/intel=5Fmemory=5Fregion=3A__Handle_-ENODEV_path_individually?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 14, 2021 at 12:36:58AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/i915/intel_memory_region: Handle -ENODEV path individually 
>    URL:     https://patchwork.freedesktop.org/series/97977/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6491/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10995_full -> IGTPW_6491_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6491_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6491_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6491/index.html
> 
> Participating hosts (10 -> 7)
> 
>    Missing (3): pig-skl-6260u pig-glk-j5005 shard-rkl
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6491_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>           * shard-tglb: NOTRUN -> SKIP

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6491_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-4x:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
>      * igt@gem_ctx_persistence@legacy-engines-mixed-process:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +2 similar
>             issues
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: PASS -> TIMEOUT ([i915#3063] / [i915#3648])
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4525]) +1 similar issue
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4525]) +1 similar issue
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-apl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842]) +1 similar issue
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842])
> 
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_params@no-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109283])
> 
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2190])
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613]) +1 similar issue
>      * igt@gem_lmem_swapping@random:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +2 similar
>             issues
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +2 similar
>             issues
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111656])
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-kbl: NOTRUN -> WARN ([i915#2658])
> 
>           * shard-apl: NOTRUN -> WARN ([i915#2658])
> 
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +2 similar issues
>      * igt@gem_pxp@fail-invalid-protected-context:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +2 similar issues
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +2 similar issues
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297])
> 
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#110542])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109290])
> 
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@gen7_exec_parse@cmd-crossing-page:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +3 similar issues
>      * igt@gen7_exec_parse@oacontrol-tracking:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +4 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856]) +1 similar issue
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#1436] / [i915#716])
> 
>      * igt@i915_pm_backlight@bad-brightness:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +106 similar issues
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4281])
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] /
>             [i915#2411])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110892])
> 
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4387])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4387])
> 
>      * igt@i915_selftest@live@gt_lrc:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL ([i915#2373])
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL ([i915#1759])
>      * igt@i915_suspend@forcewake:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +3 similar issues
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1769])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1769])
> 
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118]) +1 similar issue
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
> 
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#118])
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +4 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +1 similar issue
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +5 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +1 similar
>             issue
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +3 similar issues
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +3 similar issues
>      * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +5
>             similar issues
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +184 similar issues
>      * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +12
>             similar issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +15
>             similar issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +6 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +6
>             similar issues
> 
>      * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +1 similar
>             issue
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +279 similar issues
>      * igt@kms_chamelium@hdmi-crc-fast:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +9
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +7
>             similar issues
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
> 
>      * igt@kms_color@pipe-d-degamma:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
>      * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +21
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-0-75:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +12
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-max:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +23
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
>      * igt@kms_content_protection@atomic:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319])
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111828]) +1 similar issue
> 
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066]) +1
>             similar issue
>      * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +4
>             similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +3
>             similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +1 similar issue
>      * igt@kms_cursor_crc@pipe-d-cursor-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +33 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +7 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +269 similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +2
>             similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +35 similar issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2346])
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4103]) +1 similar issue
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#180] / [i915#636])
>      * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274])
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +21 similar issues
>      * igt@kms_hdr@static-swap:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1187])
>      * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +2 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_lowres@pipe-b-tiling-x:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536]) +1 similar issue
> 
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
> 
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1911])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>      * igt@kms_psr@psr2_basic:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +1 similar
>             issue
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +2 similar issues
>      * igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441])
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109309])
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2437])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2437])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>      * igt@nouveau_crc@pipe-b-ctx-flip-detection:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530]) +4 similar issues
>      * igt@nouveau_crc@pipe-b-source-outp-complete:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530]) +2 similar issues
>      * igt@perf@polling-parameterized:
> 
>           * shard-apl: PASS -> FAIL ([i915#1542])
>      * igt@prime_nv_api@i915_nv_double_import:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291]) +4 similar issues
>      * igt@prime_nv_pcopy@test3_3:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291]) +3 similar issues
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-iclb: NOTRUN -> [SKIP][130] ([fdo#10
