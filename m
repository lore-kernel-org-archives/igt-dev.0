Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D386EA1C
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Mar 2021 14:01:29 +0000 (UTC)
Date: Wed, 10 Mar 2021 15:01:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210310140117.GA80726@zkempczy-mobl2>
References: <20210310094502.75748-1-zbigniew.kempczynski@intel.com>
 <161537930742.2307.7050438440568897713@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161537930742.2307.7050438440568897713@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev25=29?=
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

On Wed, Mar 10, 2021 at 12:28:27PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Introduce IGT allocator (rev25)                                
>    URL:     https://patchwork.freedesktop.org/series/82954/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5587/index.html 
> 
>            CI Bug Log - changes from IGT_6027_full -> IGTPW_5587_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5587_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5587_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5587/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5587_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * {igt@api_intel_bb@last-page} (NEW):
> 
>           * shard-glk: NOTRUN -> FAIL
> 
>           * shard-kbl: NOTRUN -> FAIL

Those failures occurs on few gens (+skylake too, but was not in this shard run)
so test expose them. Newer gens likely are not prone to hang in last page. 
As the allocator default vm size exludes that page (due to hang exposed here) 
we at least should have single test which uses that page with rcs and shows 
is gen will got hang or not.  

> 
>      * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
> 
>           * shard-tglb: PASS -> INCOMPLETE

Likely not related to changes in allocator series.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between IGT_6027_full and IGTPW_5587_full:
> 
>   New IGT tests (44)
> 
>      * igt@api_intel_allocator@alloc-simple:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@execbuf-with-allocator:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_allocator@fork-simple-once:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.01, 0.04] s
>      * igt@api_intel_allocator@fork-simple-stress:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [5.40, 5.49] s
>      * igt@api_intel_allocator@fork-simple-stress-signal:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [5.41, 5.53] s
>      * igt@api_intel_allocator@open-vm:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0, 0.00] s
>      * igt@api_intel_allocator@print-random:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@print-simple:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@random-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@random-allocator@basic:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.0, 0.00] s
>      * igt@api_intel_allocator@random-allocator@parallel-one:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_allocator@reopen:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_allocator@reopen-fork:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.24] s
>      * igt@api_intel_allocator@reserve:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@reserve-simple:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@reuse:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@simple-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@simple-allocator@basic:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_allocator@simple-allocator@parallel-one:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.08, 0.18] s
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
>           * Statuses : 4 pass(s)
>           * Exec time: [0.02, 0.06] s
>      * igt@api_intel_allocator@two-level-inception:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [5.41, 5.56] s
>      * igt@api_intel_allocator@two-level-inception-interruptible:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@add-remove-objects:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00, 0.02] s
>      * igt@api_intel_bb@bb-with-allocator:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@bb-with-vm:
> 
>           * Statuses : 4 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.03] s
>      * igt@api_intel_bb@blit-noreloc-keep-cache-random:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.02] s
>      * igt@api_intel_bb@blit-noreloc-purge-cache-random:
> 
>           * Statuses : 3 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.02] s
>      * igt@api_intel_bb@destroy-bb:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.01, 0.03] s
>      * igt@api_intel_bb@last-page:
> 
>           * Statuses : 2 fail(s) 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 6.73] s
>      * igt@api_intel_bb@object-noreloc-keep-cache-random:
> 
>           * Statuses : 4 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@object-noreloc-keep-cache-simple:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@object-noreloc-purge-cache-random:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@object-noreloc-purge-cache-simple:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@purge-bb:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@reset-bb:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_softpin@allocator-basic:
> 
>           * Statuses : 4 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.30] s
>      * igt@gem_softpin@allocator-basic-reserve:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.07, 0.29] s
>      * igt@gem_softpin@allocator-fork:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 2.50] s
>      * igt@gem_softpin@allocator-nopin:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.30] s
>      * igt@gem_softpin@allocator-nopin-reserve:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.07, 0.28] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_5587_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN ([i915#3002]) +1 similar issue
>      * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +3 similar
>             issues
>      * igt@gem_exec_balancer@hang:
> 
>           * shard-iclb: PASS -> INCOMPLETE ([i915#1895])
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842])
> 
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2849])
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112283])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112283])
> 
>      * igt@gem_exec_reloc@basic-many-active@rcs0:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#2389]) +2 similar issues
>      * igt@gem_exec_reloc@basic-parallel:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1729])
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1729])
> 
>      * igt@gem_exec_schedule@u-fairslice@rcs0:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#1610])
>      * igt@gem_exec_whisper@basic-contexts-forked-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118] / [i915#95])
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2190])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2190])
> 
>      * igt@gem_mmap_gtt@cpuset-big-copy:
> 
>           * shard-iclb: PASS -> FAIL ([i915#307])
>      * igt@gem_pread@exhaustion:
> 
>           * shard-apl: NOTRUN -> WARN ([i915#2658])
> 
>           * shard-snb: NOTRUN -> WARN ([i915#2658])
> 
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +35 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768])
> 
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#3002])
>      * igt@gem_userptr_blits@process-exit-mmap@wb:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#1699]) +3 similar
>             issues
>      * igt@gem_userptr_blits@process-exit-mmap@wc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1699]) +3 similar issues
>      * igt@gem_vm_create@destroy-race:
> 
>           * shard-tglb: PASS -> TIMEOUT ([i915#2795])
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#1436] / [i915#716])
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112306])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112306])
> 
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#1937])
>      * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-b:
> 
>           * shard-kbl: PASS -> FAIL ([i915#3168]) +1 similar issue
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614]) +1
>             similar issue
> 
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723])
> 
>      * igt@kms_big_joiner@basic:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2705])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2705])
> 
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +322 similar issues
>      * igt@kms_color@pipe-a-gamma:
> 
>           * shard-tglb: PASS -> FAIL ([i915#1149])
>      * igt@kms_color@pipe-d-ctm-0-75:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#1149] / [i915#315])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
> 
>      * igt@kms_color_chamelium@pipe-a-ctm-0-5:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +19
>             similar issues
>      * igt@kms_color_chamelium@pipe-a-ctm-max:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +1
>             similar issue
>      * igt@kms_color_chamelium@pipe-a-degamma:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +18
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-degamma:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +2
>             similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +4
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
> 
>      * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +13
>             similar issues
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111828]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066])
> 
>      * igt@kms_content_protection@legacy:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319]) +1 similar issue
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319]) +1 similar issue
>      * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#54])
> 
>           * shard-kbl: PASS -> FAIL ([i915#54])
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +3 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279])
>      * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
> 
>           * shard-apl: PASS -> FAIL ([i915#54])
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#54])
> 
>      * igt@kms_cursor_crc@pipe-c-cursor-512x512-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279]) +1 similar issue
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-glk: PASS -> FAIL ([i915#72])
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278])
>      * igt@kms_dp_tiled_display@basic-test-pattern:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#426])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#426])
> 
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +15 similar issues
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2598])
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@kms_flip@flip-vs-suspend@b-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2672])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2642])
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +9 similar issues
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1187])
>      * igt@kms_invalid_dotclock:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#110577])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109310])
> 
>      * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes:
> 
>           * shard-tglb: PASS -> DMESG-WARN ([i915#1436] / [i915#1602] /
>             [i915#2411])
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +4 similar issues
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +1 similar issue
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar
>             issues
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658])
> 
>      * igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441])
>      * igt@kms_setmode@basic:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#31])
>      * igt@kms_vblank@pipe-d-wait-forked-hang:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +212 similar issues
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109502])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109502])
> 
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437]) +2 similar
>             issues
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
