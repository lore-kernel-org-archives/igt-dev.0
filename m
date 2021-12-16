Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC10710F81F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 12:10:58 +0000 (UTC)
Date: Thu, 16 Dec 2021 13:10:53 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YbsszSOOsIQFXA/u@zkempczy-mobl2>
References: <20211216051758.3919-1-sai.gowtham.ch@intel.com>
 <163964183362.14057.18074604742930214334@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163964183362.14057.18074604742930214334@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fsuspend=3A_Add_support_for_local_memory_=28re?=
 =?utf-8?b?djQp?=
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
Cc: sai.gowtham.ch@intel.com, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 16, 2021 at 08:03:53AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/i915/gem_exec_suspend: Add support for local memory (rev4) 
>    URL:     https://patchwork.freedesktop.org/series/95706/                  
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6499/index.html   
> 
>          CI Bug Log - changes from CI_DRM_11006_full -> IGTPW_6499_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6499_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6499_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6499/index.html
> 
> Participating hosts (10 -> 7)
> 
>    Missing (3): pig-skl-6260u pig-glk-j5005 shard-rkl
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6499_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
>           * shard-tglb: NOTRUN -> INCOMPLETE

Unrelated, change was in gem_exec_suspend test only.

--
Zbigniew
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11006_full and
>    IGTPW_6499_full:
> 
>   New IGT tests (4)
> 
>      * igt@gem_exec_suspend@basic-s3-devices@smem:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [6.45, 10.48] s
>      * igt@gem_exec_suspend@basic-s3@smem:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [2.50, 5.60] s
>      * igt@gem_exec_suspend@basic-s4-devices@smem:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [7.26, 10.73] s
>      * igt@gem_exec_suspend@basic@smem:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.22, 1.39] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6499_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658])
>      * igt@gem_ctx_persistence@legacy-engines-queued:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +2 similar
>             issues
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: NOTRUN -> TIMEOUT ([i915#3063] / [i915#3648])
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#3354])
> 
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4525]) +3 similar issues
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4525]) +2 similar issues
>      * igt@gem_exec_capture@pi@vcs0:
> 
>           * shard-iclb: PASS -> INCOMPLETE ([i915#3371])
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842]) +2 similar issues
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_params@no-vebox:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109283])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
> 
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112283])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112283])
> 
>      * igt@gem_exec_whisper@basic-fds-forked-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118]) +1 similar issue
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
> 
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613])
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +3 similar issues
>      * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +3 similar issues
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109312])
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297])
> 
>      * igt@gen7_exec_parse@basic-allowed:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +2 similar issues
>      * igt@gen7_exec_parse@bitmasks:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +2 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856])
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#1436] / [i915#716])
> 
>      * igt@i915_pm_backlight@bad-brightness:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +69 similar issues
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271])
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] /
>             [i915#2411])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110892])
> 
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1769])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1769])
> 
>      * igt@kms_big_fb@linear-32bpp-rotate-0:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#118])
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614]) +1
>             similar issue
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +1 similar issue
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +2 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723])
> 
>      * igt@kms_big_joiner@basic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2705])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2705])
> 
>      * igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +1
>             similar issue
>      * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +4 similar
>             issues
>      * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +2 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +4 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +2 similar
>             issues
> 
>      * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +3
>             similar issues
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +8 similar issues
>      * igt@kms_chamelium@dp-edid-change-during-suspend:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +10
>             similar issues
>      * igt@kms_chamelium@hdmi-crc-multiple:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
>      * igt@kms_color@pipe-d-ctm-red-to-blue:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
>      * igt@kms_color_chamelium@pipe-a-degamma:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +17
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +13
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-0-5:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +6
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-degamma:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +6
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
> 
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111828])
>      * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +6 similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +4
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279])
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_cursor_crc@pipe-b-cursor-suspend:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +2 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +28 similar issues
>      * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +4
>             similar issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2346])
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4103]) +2 similar issues
>      * igt@kms_dsc@basic-dsc-enable:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-apl: PASS -> INCOMPLETE ([i915#180])
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@2x-flip-vs-wf_vblank:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +2 similar issues
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701]) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +16 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +36 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +176 similar issues
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#1188])
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_lowres@pipe-a-tiling-y:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536]) +1 similar issue
>      * igt@kms_plane_lowres@pipe-d-tiling-x:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536]) +2 similar issues
>      * igt@kms_plane_lowres@pipe-d-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [fdo#112054])
>      * igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920])
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#111068] / [i915#658])
>      * igt@kms_psr@psr2_cursor_mmap_gtt:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467])
>      * igt@kms_psr@psr2_primary_blt:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441])
>      * igt@kms_setmode@basic:
> 
>           * shard-glk: PASS -> FAIL ([i915#31])
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-apl: NOTRUN -> FAIL ([IGT#2])
> 
>           * shard-kbl: NOTRUN -> FAIL ([IGT#2])
> 
>      * igt@kms_vblank@pipe-d-query-forked-hang:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +145 similar issues
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2437])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2437])
> 
>      * igt@nouveau_crc@pipe-a-source-outp-inactive:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530])
> 
>      * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +107 similar issues
>      * igt@perf@polling-parameterized:
> 
>           * shard-iclb: PASS -> FAIL ([i915#1542])
>      * igt@prime_nv_pcopy@test1_macro:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291]) +4 similar issues
>      * igt@prime_nv_test@nv_i915_sharing:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291]) +3 similar issues
