Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1205B10F26A
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 06:42:56 +0000 (UTC)
Date: Thu, 24 Feb 2022 07:42:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yhco62/kou0bBmV/@zkempczy-mobl2>
References: <20220223103303.24510-1-zbigniew.kempczynski@intel.com>
 <164565406531.25287.94525241670514386@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164565406531.25287.94525241670514386@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVXNlIHNh?=
 =?utf-8?q?fe_alignment_as_a_default?=
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

On Wed, Feb 23, 2022 at 10:07:45PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Use safe alignment as a default                                
>    URL:     https://patchwork.freedesktop.org/series/100627/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11270_full -> IGTPW_6682_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6682_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6682_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/index.html
> 
> Participating hosts (12 -> 8)
> 
>    Missing (4): pig-skl-6260u pig-kbl-iris shard-dg1 pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6682_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_module_load@reload-with-fault-injection:
>           * shard-tglb: NOTRUN -> INCOMPLETE

Unrelated to the change. BTW notrun (->incomplete).

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@kms_display_modes@extended-mode-basic}:
> 
>           * {shard-tglu}: NOTRUN -> SKIP
> 
>           * shard-tglb: NOTRUN -> SKIP
> 
>      * {igt@kms_plane_scaling@downscale-with-rotation-factor-4@pipe-c-downscale-with-rotation}:
> 
>           * shard-iclb: PASS -> SKIP +2 similar issues
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11270_full and
>    IGTPW_6682_full:
> 
>   New IGT tests (1)
> 
>      * igt@api_intel_allocator@alignment:
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6682_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN ([i915#4991])
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109314])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109314])
> 
>      * igt@gem_ctx_persistence@legacy-engines-queued:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +2 similar
>             issues
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_exec_capture@pi@bcs0:
> 
>           * shard-iclb: PASS -> INCOMPLETE ([i915#3371])
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842])
> 
>      * igt@gem_exec_parallel@fds@bcs0:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#118])
>      * igt@gem_exec_params@no-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613]) +1 similar issue
> 
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +5 similar
>             issues
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111656])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109292])
> 
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +3 similar issues
>      * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +4 similar issues
>      * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +1 similar issue
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109312])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109312])
> 
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3323])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3323])
> 
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297])
>      * igt@gen7_exec_parse@basic-allowed:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +3 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
> 
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +1 similar
>             issue
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#454])
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2681] / [i915#2684])
> 
>           * shard-iclb: NOTRUN -> WARN ([i915#1804] / [i915#2684])
> 
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109303])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109303])
> 
>      * igt@i915_selftest@mock@hugepages:
> 
>           * shard-tglb: NOTRUN -> INCOMPLETE ([i915#5123])
> 
>           * shard-kbl: NOTRUN -> INCOMPLETE ([i915#5123])
> 
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +4 similar issues
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3826])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3826])
> 
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +3 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614]) +2
>             similar issues
> 
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118])
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +6 similar
>             issues
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +2 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +6 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +1 similar issue
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +2 similar
>             issues
>      * igt@kms_big_joiner@basic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2705]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2705])
> 
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +6 similar
>             issues
>      * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +18
>             similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +5
>             similar issues
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +6 similar
>             issues
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +6
>             similar issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +4 similar
>             issues
> 
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +6 similar issues
>      * igt@kms_chamelium@dp-edid-read:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
>      * igt@kms_chamelium@dp-hpd-storm-disable:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +6
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-storm:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +18
>             similar issues
>      * igt@kms_color@pipe-d-ctm-0-25:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149]) +2
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-0-5:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +14
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-max:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +5
>             similar issues
> 
>      * igt@kms_color_chamelium@pipe-d-degamma:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_content_protection@content_type_change:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066]) +2
>             similar issues
>      * igt@kms_content_protection@legacy:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_content_protection@srm:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1063]) +2 similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +2 similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +3
>             similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +10 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +36 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +8
>             similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +272 similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278])
>      * igt@kms_cursor_legacy@pipe-d-single-bo:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +2 similar
>             issues
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825]) +10
>             similar issues
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +4 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701]) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +119 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +27 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +199 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109280] / [fdo#111825]) +44
>             similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +101 similar issues
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1187])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1187])
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +3 similar
>             issues
>      * igt@kms_plane_lowres@pipe-c-tiling-x:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536])
> 
>      * igt@kms_plane_lowres@pipe-d-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [fdo#112054])
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920])
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +1 similar issue
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +4 similar
>             issues
>      * igt@kms_psr@psr2_suspend:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441]) +3 similar issues
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-apl: NOTRUN -> FAIL ([IGT#2])
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109502])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109502])
> 
>      * igt@nouveau_crc@pipe-a-source-outp-inactive:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530]) +1 similar issue
>      * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530]) +3 similar issues
>      * igt@perf_pmu@rc6-suspend:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +3 similar issues
>      * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291]) +5 similar issues
>      * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291]) +9 similar issues
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109295])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109295])
> 
>      * igt@syncobj_timeline@invalid-transfer-non-existent-point:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#5098])
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN ([i915#5098])
> 
>      * igt@syncobj_timeline@transfer-timeline-point:
> 
>           * shard-kbl: NOTRUN -> DMESG-FAIL ([i915#5098])
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL ([i915#5098])
> 
>      * igt@sysfs_clients@fair-1:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2994]) +1 similar issue
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +2 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994]) +3 similar issues
