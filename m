Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF8F10F649
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 08:43:18 +0000 (UTC)
Date: Tue, 22 Feb 2022 09:43:14 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YhSiIqffmlySeHcJ@zkempczy-mobl2>
References: <20220221130023.59748-1-zbigniew.kempczynski@intel.com>
 <164547240453.21413.10700523097316492852@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164547240453.21413.10700523097316492852@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9n?=
 =?utf-8?q?em=5Fexec=5Fcapture=3A_Fix_alignment_for_discrete?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 07:40:04PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  test/gem_exec_capture: Fix alignment for discrete              
>    URL:     https://patchwork.freedesktop.org/series/100493/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6666/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11263_full -> IGTPW_6666_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6666_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6666_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6666/index.html
> 
> Participating hosts (13 -> 8)
> 
>    Missing (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6666_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_eio@in-flight-contexts-1us:
>           * shard-snb: PASS -> FAIL

Unrelated to the change (gem_exec_capture). 

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6666_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_persistence@legacy-engines-cleanup:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099])
>      * igt@gem_ctx_shared@q-smoketest@rcs0:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118])
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_eio@in-flight-10ms:
> 
>           * shard-tglb: PASS -> TIMEOUT ([i915#3063])
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#232]) +1 similar issue
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#3354])
> 
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-kbl: NOTRUN -> DMESG-FAIL ([i915#5076])
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +106 similar issues
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2846])
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
> 
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: PASS -> SKIP ([i915#2190])
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4613]) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613]) +2 similar issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
> 
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +3 similar
>             issues
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111656])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109292])
> 
>      * igt@gem_pread@exhaustion:
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2658])
> 
>           * shard-iclb: NOTRUN -> WARN ([i915#2658])
> 
>      * igt@gem_pxp@create-regular-context-2:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +3 similar issues
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +3 similar issues
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +188 similar issues
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +5 similar issues
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>      * igt@gen7_exec_parse@basic-offset:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +3 similar issues
>      * igt@gen7_exec_parse@load-register-reg:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +5 similar issues
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +1 similar
>             issue
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +1 similar issue
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#454])
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#454])
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2681] / [i915#2684])
> 
>           * shard-iclb: NOTRUN -> WARN ([i915#2684])
> 
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109293] / [fdo#109506]) +1
>             similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109506] / [i915#2411]) +1
>             similar issue
> 
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4387])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4387])
> 
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109303])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109303])
> 
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-snb: PASS -> INCOMPLETE ([i915#3921])
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1769])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1769])
> 
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614]) +2
>             similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +1 similar issue
> 
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +1 similar
>             issue
> 
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +6 similar issues
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +3 similar issues
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +6 similar
>             issues
>      * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +11
>             similar issues
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +6 similar
>             issues
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +11
>             similar issues
>      * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +5 similar
>             issues
>      * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +3 similar issues
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +5
>             similar issues
>      * igt@kms_chamelium@dp-edid-change-during-suspend:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +10
>             similar issues
>      * igt@kms_chamelium@hdmi-crc-single:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +19
>             similar issues
>      * igt@kms_color@pipe-d-ctm-max:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149]) +1
>             similar issue
>      * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +15
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +16
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
> 
>      * igt@kms_content_protection@atomic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_content_protection@content_type_change:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066]) +1
>             similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1063])
> 
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3116])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3116] / [i915#3299])
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +4
>             similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> INCOMPLETE ([i915#2828])
>      * igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +42 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +4
>             similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-max-size-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +5 similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319])
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +3
>             similar issues
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#180] / [i915#636])
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +7 similar issues
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825]) +10
>             similar issues
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +5 similar issues
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#636])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>           * shard-glk: PASS -> FAIL ([i915#4911])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701])
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109280] / [fdo#111825]) +42
>             similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +195 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +43 similar issues
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1187])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1187])
> 
>      * igt@kms_invalid_mode@clock-too-high:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4278])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4278])
> 
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>      * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +4 similar
>             issues
>      * igt@kms_plane_lowres@pipe-a-tiling-none:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536]) +2 similar issues
> 
>      * igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920])
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +1 similar
>             issue
>      * igt@kms_psr@psr2_cursor_plane_onoff:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441])
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441]) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467])
> 
>      * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5030]) +3 similar issues
>      * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
> 
>           * shar
