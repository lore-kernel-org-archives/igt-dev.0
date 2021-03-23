Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24596E908
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 16:32:38 +0000 (UTC)
Date: Tue, 23 Mar 2021 17:32:30 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210323163230.GA26105@zkempczy-mobl2>
References: <20210322123750.94772-1-zbigniew.kempczynski@intel.com>
 <161651329373.20052.16954756600126751953@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161651329373.20052.16954756600126751953@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev31=29?=
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

On Tue, Mar 23, 2021 at 03:28:13PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Introduce IGT allocator (rev31)                                
>    URL:     https://patchwork.freedesktop.org/series/82954/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5634/index.html 
> 
>          CI Bug Log - changes from CI_DRM_9880_full -> IGTPW_5634_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5634_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5634_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5634/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5634_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_mmap_offset@blt-coherency:
>           * shard-tglb: PASS -> INCOMPLETE

I'm not sure but I don't think I'm directly responsible on that bug
occurence. It is failing on calloc() so its weird. I'm not sure we can
report bug at that test exactly because it smells that can be triggered
everywhere and there's other cause we see SIGSEGV on allocation.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_9880_full and
>    IGTPW_5634_full:
> 
>   New IGT tests (47)
> 
>      * igt@api_intel_allocator@alloc-simple:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.0, 0.00] s
>      * igt@api_intel_allocator@execbuf-with-allocator:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_allocator@fork-simple-once:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.01, 0.04] s
>      * igt@api_intel_allocator@fork-simple-stress:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [5.40, 5.53] s
>      * igt@api_intel_allocator@fork-simple-stress-signal:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [5.41, 5.50] s
>      * igt@api_intel_allocator@open-vm:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@random-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@random-allocator@basic:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0, 0.00] s
>      * igt@api_intel_allocator@random-allocator@parallel-one:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_allocator@random-allocator@print:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@reloc-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@reloc-allocator@basic:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00] s
>      * igt@api_intel_allocator@reloc-allocator@parallel-one:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_allocator@reloc-allocator@print:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@reopen:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_allocator@reopen-fork:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [3.24, 3.29] s
>      * igt@api_intel_allocator@reserve:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@reserve-simple:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@reuse:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@simple-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@simple-allocator@basic:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.03] s
>      * igt@api_intel_allocator@simple-allocator@parallel-one:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.07, 0.25] s
>      * igt@api_intel_allocator@simple-allocator@print:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@simple-allocator@reserve:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@simple-allocator@reuse:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@standalone:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.01, 0.05] s
>      * igt@api_intel_allocator@two-level-inception:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [5.41, 5.56] s
>      * igt@api_intel_allocator@two-level-inception-interruptible:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [5.41, 5.57] s
>      * igt@api_intel_bb@add-remove-objects:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@bb-with-allocator:
> 
>           * Statuses : 3 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@bb-with-vm:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.01, 0.03] s
>      * igt@api_intel_bb@blit-noreloc-keep-cache-random:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.01, 0.02] s
>      * igt@api_intel_bb@blit-noreloc-purge-cache-random:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.02] s
>      * igt@api_intel_bb@destroy-bb:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.01, 0.03] s
>      * igt@api_intel_bb@object-noreloc-keep-cache-random:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@object-noreloc-keep-cache-simple:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@object-noreloc-purge-cache-random:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@object-noreloc-purge-cache-simple:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@purge-bb:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@reset-bb:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_softpin@allocator-basic:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.07, 0.28] s
>      * igt@gem_softpin@allocator-basic-reserve:
> 
>           * Statuses : 3 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.20] s
>      * igt@gem_softpin@allocator-fork:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [2.20, 2.37] s
>      * igt@gem_softpin@allocator-nopin:
> 
>           * Statuses : 3 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.28] s
>      * igt@gem_softpin@allocator-nopin-reserve:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.08, 0.31] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_5634_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658]) +1 similar issue
>      * igt@gem_create@create-massive:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN ([i915#3002])
>      * igt@gem_ctx_persistence@clone:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +3 similar
>             issues
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842]) +2 similar issues
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-apl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109283])
> 
>      * igt@gem_exec_reloc@basic-many-active@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2389]) +4 similar issues
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2389])
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2389]) +4 similar issues
> 
>      * igt@gem_exec_reloc@basic-many-active@vcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2389]) +4 similar issues
>      * igt@gem_exec_reloc@basic-parallel:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#3183])
>      * igt@gem_exec_schedule@u-fairslice@vcs1:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#1610] / [i915#2803])
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: PASS -> SKIP ([i915#2190])
>      * igt@gem_mmap_gtt@big-copy:
> 
>           * shard-glk: PASS -> FAIL ([i915#307])
>      * igt@gem_mmap_gtt@cpuset-big-copy:
> 
>           * shard-iclb: PASS -> FAIL ([i915#307])
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +171 similar issues
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#3002])
>      * igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1317]) +3 similar issues
>      * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1317]) +3 similar issues
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#2724])
> 
>           * shard-kbl: NOTRUN -> INCOMPLETE ([i915#2502] / [i915#2667])
> 
>      * igt@gen7_exec_parse@basic-offset:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +206 similar issues
>      * igt@gen9_exec_parse@batch-zero-length:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112306])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112306])
> 
>      * igt@i915_pm_lpsp@screens-disabled:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1902])
>      * igt@i915_selftest@live@blt:
> 
>           * shard-snb: PASS -> DMESG-FAIL ([i915#1409])
>      * igt@i915_selftest@live@client:
> 
>           * shard-glk: PASS -> DMESG-FAIL ([i915#3047])
>      * igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +23 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
> 
>      * igt@kms_big_joiner@basic:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2705]) +1 similar
>             issue
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2705])
>      * igt@kms_chamelium@hdmi-mode-timings:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +18
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +3
>             similar issues
> 
>      * igt@kms_color_chamelium@pipe-a-ctm-green-to-red:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +3
>             similar issues
>      * igt@kms_color_chamelium@pipe-a-degamma:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +15
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-0-25:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +25
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +5
>             similar issues
>      * igt@kms_content_protection@srm:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319]) +1 similar issue
>      * igt@kms_cursor_crc@pipe-a-cursor-size-change:
> 
>           * shard-glk: PASS -> FAIL ([i915#54])
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#54]) +1 similar issue
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#54]) +1 similar issue
> 
>      * igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#54])
>      * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279])
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279]) +2 similar issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
> 
>           * shard-apl: NOTRUN -> DMESG-FAIL ([IGT#6])
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274])
>      * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2598])
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2672]) +1 similar
>             issue
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2642])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2642])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2642])
> 
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#2641])
>      * igt@kms_frontbuffer_tracking@fbc-1p-rte:
> 
>           * shard-glk: PASS -> FAIL ([i915#49])
> 
>           * shard-kbl: PASS -> FAIL ([i915#2546] / [i915#49])
> 
>           * shard-apl: PASS -> FAIL ([i915#49])
> 
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +9 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +7 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +327 similar issues
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180])
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +4 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +3 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +3 similar issues
>      * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +1 similar issue
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +1 similar
>             issue
> 
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +4 similar
>             issues
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2920])
>      * igt@kms_psr@psr2_cursor_plane_move:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441])
>      * igt@kms_psr@psr2_sprite_plane_move:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +4 similar issues
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-kbl: NOTRUN -> FAIL ([IGT#2])
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
>      * igt@kms_vrr@flipline:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109502])
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2437])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2437])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437]) +1 similar
>             issue
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437]) +1 similar
>             issue
> 
>      * igt@sysfs_clients@split-10@bcs0:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3026])
> 
>     Possible fixes
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: TIMEOUT ([i915#2369] / [i915#3063]) -> PASS
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: FAIL ([i915#2842]) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: FAIL ([i915#2842]) -> PASS +3 similar issues
>      * igt@gem_exec_gttfill@all:
> 
>           * shard-glk: DMESG-WARN ([i915#118] / [i915#95]) -> PASS +1 similar
>             issue
>      * igt@gem_mmap_gtt@cpuset-medium-copy:
> 
>           * shard-iclb: FAIL ([i915#2428]) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>           * shard-tglb: FAIL ([i915#2346]) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: [DMESG-WARN][115] ([i915#180]) -> [PASS][116]
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
