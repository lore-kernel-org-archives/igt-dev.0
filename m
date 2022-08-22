Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C90929A1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Aug 2022 15:00:32 +0000 (UTC)
Date: Mon, 22 Aug 2022 11:00:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <YwOaBc87Ec8xF4xq@intel.com>
References: <20220819003753.27004-1-vinay.belgaumkar@intel.com>
 <166095507672.27059.5418432032686188975@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <166095507672.27059.5418432032686188975@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?uc=3A_Disable_i915=5Fpm=5Frps_when_SLPC_is_enabled_=28rev2=29?=
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

On Sat, Aug 20, 2022 at 12:24:36AM -0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  i915/guc: Disable i915_pm_rps when SLPC is enabled (rev2)
>    URL:     [1]https://patchwork.freedesktop.org/series/107472/
>    State:   failure
>    Details:
>    [2]https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/index.html
> 
>          CI Bug Log - changes from CI_DRM_12002_full -> IGTPW_7663_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7663_full absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7663_full, please notify your bug team to allow
>    them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/index.html
> 
> Participating hosts (12 -> 9)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7663_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_eio@hibernate:
>           + shard-glk: NOTRUN -> [3]INCOMPLETE +1 similar issue
>      * igt@i915_suspend@sysfs-reader:
>           + shard-glk: [4]PASS -> [5]INCOMPLETE
>           + shard-iclb: [6]PASS -> [7]INCOMPLETE +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
>           + shard-iclb: NOTRUN -> [8]INCOMPLETE +5 similar issues

false positives here since new igt_skips couldn't cause this and the
debugfs check is correct.

So I pushed this patch. Thanks for the patch.

> 
> Known issues
> 
>    Here are the changes found in IGTPW_7663_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
>           + shard-iclb: NOTRUN -> [9]SKIP ([10]i915#6230)
>           + shard-tglb: NOTRUN -> [11]SKIP ([12]i915#6230)
>      * igt@feature_discovery@chamelium:
>           + shard-iclb: NOTRUN -> [13]SKIP ([14]fdo#111827)
>      * igt@feature_discovery@display-3x:
>           + shard-iclb: NOTRUN -> [15]SKIP ([16]i915#1839)
>      * igt@gem_ctx_persistence@smoketest:
>           + shard-snb: NOTRUN -> [17]SKIP ([18]fdo#109271 / [19]i915#1099)
>             +5 similar issues
>      * igt@gem_eio@hibernate:
>           + shard-snb: NOTRUN -> [20]INCOMPLETE ([21]i915#6598)
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
>           + shard-iclb: [22]PASS -> [23]SKIP ([24]i915#4525) +1 similar
>             issue
>      * igt@gem_exec_capture@capture-recoverable:
>           + shard-iclb: NOTRUN -> [25]SKIP ([26]i915#6344)
>      * igt@gem_exec_fair@basic-deadline:
>           + shard-kbl: [27]PASS -> [28]FAIL ([29]i915#2846)
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
>           + shard-glk: NOTRUN -> [30]FAIL ([31]i915#2842) +4 similar
>             issues
>      * igt@gem_exec_fair@basic-none@vecs0:
>           + shard-iclb: NOTRUN -> [32]FAIL ([33]i915#2842) +6 similar
>             issues
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
>           + shard-apl: [34]PASS -> [35]FAIL ([36]i915#2842)
>      * igt@gem_exec_fair@basic-pace@rcs0:
>           + shard-kbl: [37]PASS -> [38]FAIL ([39]i915#2842) +1 similar
>             issue
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>           + shard-iclb: NOTRUN -> [40]SKIP ([41]fdo#109313)
>      * igt@gem_exec_params@secure-non-root:
>           + shard-iclb: NOTRUN -> [42]SKIP ([43]fdo#112283) +1 similar
>             issue
>      * igt@gem_lmem_swapping@parallel-random-engines:
>           + shard-iclb: NOTRUN -> [44]SKIP ([45]i915#4613) +3 similar
>             issues
>           + shard-kbl: NOTRUN -> [46]SKIP ([47]fdo#109271 / [48]i915#4613)
>      * igt@gem_lmem_swapping@smem-oom:
>           + shard-apl: NOTRUN -> [49]SKIP ([50]fdo#109271 / [51]i915#4613)
>             +2 similar issues
>           + shard-glk: NOTRUN -> [52]SKIP ([53]fdo#109271 / [54]i915#4613)
>             +3 similar issues
>      * igt@gem_pxp@create-valid-protected-context:
>           + shard-iclb: NOTRUN -> [55]SKIP ([56]i915#4270) +3 similar
>             issues
>           + shard-tglb: NOTRUN -> [57]SKIP ([58]i915#4270)
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>           + shard-glk: NOTRUN -> [59]SKIP ([60]fdo#109271) +226 similar
>             issues
>      * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
>           + shard-iclb: NOTRUN -> [61]SKIP ([62]i915#768) +4 similar
>             issues
>      * igt@gem_userptr_blits@dmabuf-sync:
>           + shard-apl: NOTRUN -> [63]SKIP ([64]fdo#109271 / [65]i915#3323)
>           + shard-glk: NOTRUN -> [66]SKIP ([67]fdo#109271 / [68]i915#3323)
>           + shard-iclb: NOTRUN -> [69]SKIP ([70]i915#3323)
>      * igt@gem_userptr_blits@input-checking:
>           + shard-iclb: NOTRUN -> [71]DMESG-WARN ([72]i915#4991)
>           + shard-apl: NOTRUN -> [73]DMESG-WARN ([74]i915#4991)
>           + shard-glk: NOTRUN -> [75]DMESG-WARN ([76]i915#4991)
>      * igt@gem_userptr_blits@unsync-overlap:
>           + shard-iclb: NOTRUN -> [77]SKIP ([78]i915#3297) +2 similar
>             issues
>      * igt@gen3_mixed_blits:
>           + shard-iclb: NOTRUN -> [79]SKIP ([80]fdo#109289) +8 similar
>             issues
>      * igt@gen7_exec_parse@basic-allowed:
>           + shard-tglb: NOTRUN -> [81]SKIP ([82]fdo#109289) +2 similar
>             issues
>      * igt@gen9_exec_parse@allowed-all:
>           + shard-glk: [83]PASS -> [84]DMESG-WARN ([85]i915#5566 /
>             [86]i915#716)
>      * igt@gen9_exec_parse@bb-start-param:
>           + shard-iclb: NOTRUN -> [87]SKIP ([88]i915#2856) +3 similar
>             issues
>      * igt@i915_module_load@load:
>           + shard-tglb: NOTRUN -> [89]SKIP ([90]i915#6227)
>           + shard-iclb: NOTRUN -> [91]SKIP ([92]i915#6227)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
>           + shard-iclb: NOTRUN -> [93]SKIP ([94]i915#6590)
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>           + shard-apl: NOTRUN -> [95]SKIP ([96]fdo#109271 / [97]i915#1937)
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>           + shard-glk: NOTRUN -> [98]SKIP ([99]fdo#109271 /
>             [100]i915#1937)
>      * igt@i915_pm_rpm@system-suspend-devices:
>           + shard-glk: NOTRUN -> [101]INCOMPLETE ([102]i915#6598) +4
>             similar issues
>      * igt@i915_pm_rpm@system-suspend-execbuf:
>           + shard-apl: NOTRUN -> [103]INCOMPLETE ([104]i915#4939)
>      * igt@i915_query@test-query-geometry-subslices:
>           + shard-iclb: NOTRUN -> [105]SKIP ([106]i915#5723)
>      * igt@i915_suspend@fence-restore-tiled2untiled:
>           + shard-apl: NOTRUN -> [107]DMESG-WARN ([108]i915#180)
>      * igt@i915_suspend@sysfs-reader:
>           + shard-apl: [109]PASS -> [110]INCOMPLETE ([111]i915#4939)
>           + shard-snb: [112]PASS -> [113]INCOMPLETE ([114]i915#4817 /
>             [115]i915#4939)
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
>           + shard-iclb: NOTRUN -> [116]SKIP ([117]i915#1769)
>           + shard-tglb: NOTRUN -> [118]SKIP ([119]i915#1769)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>           + shard-iclb: NOTRUN -> [120]SKIP ([121]i915#5286) +4 similar
>             issues
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>           + shard-iclb: NOTRUN -> [122]SKIP ([123]fdo#110725 /
>             [124]fdo#111614) +6 similar issues
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>           + shard-iclb: NOTRUN -> [125]SKIP ([126]fdo#110723) +2 similar
>             issues
>           + shard-tglb: NOTRUN -> [127]SKIP ([128]fdo#111615)
>      * igt@kms_big_joiner@basic:
>           + shard-iclb: NOTRUN -> [129]SKIP ([130]i915#2705) +1 similar
>             issue
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>           + shard-glk: NOTRUN -> [131]SKIP ([132]fdo#109271 /
>             [133]i915#3886) +16 similar issues
>      * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
>           + shard-apl: NOTRUN -> [134]SKIP ([135]fdo#109271) +233 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:
>           + shard-tglb: NOTRUN -> [136]SKIP ([137]i915#3689 /
>             [138]i915#6095)
>      * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:
>           + shard-tglb: NOTRUN -> [139]SKIP ([140]i915#3689 /
>             [141]i915#3886)
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc
>        :
>           + shard-apl: NOTRUN -> [142]SKIP ([143]fdo#109271 /
>             [144]i915#3886) +20 similar issues
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
>           + shard-iclb: NOTRUN -> [145]SKIP ([146]fdo#109278) +37 similar
>             issues
>      * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_ccs:
>           + shard-tglb: NOTRUN -> [147]SKIP ([148]i915#3689)
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc
>        :
>           + shard-iclb: NOTRUN -> [149]SKIP ([150]fdo#109278 /
>             [151]i915#3886) +18 similar issues
>      * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
>           + shard-kbl: NOTRUN -> [152]SKIP ([153]fdo#109271 /
>             [154]i915#3886) +6 similar issues
>      * igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
>           + shard-tglb: NOTRUN -> [155]SKIP ([156]fdo#111615 /
>             [157]i915#3689) +1 similar issue
>      * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
>           + shard-tglb: NOTRUN -> [158]SKIP ([159]i915#6095)
>      * igt@kms_cdclk@plane-scaling:
>           + shard-iclb: NOTRUN -> [160]SKIP ([161]i915#3742) +1 similar
>             issue
>      * igt@kms_chamelium@dp-hpd-storm:
>           + shard-kbl: NOTRUN -> [162]SKIP ([163]fdo#109271 /
>             [164]fdo#111827) +4 similar issues
>      * igt@kms_chamelium@dp-mode-timings:
>           + shard-iclb: NOTRUN -> [165]SKIP ([166]fdo#109284 /
>             [167]fdo#111827) +16 similar issues
>      * igt@kms_chamelium@hdmi-crc-multiple:
>           + shard-glk: NOTRUN -> [168]SKIP ([169]fdo#109271 /
>             [170]fdo#111827) +15 similar issues
>      * igt@kms_chamelium@vga-hpd-without-ddc:
>           + shard-snb: NOTRUN -> [171]SKIP ([172]fdo#109271 /
>             [173]fdo#111827) +13 similar issues
>      * igt@kms_color_chamelium@ctm-0-50:
>           + shard-apl: NOTRUN -> [174]SKIP ([175]fdo#109271 /
>             [176]fdo#111827) +17 similar issues
>      * igt@kms_color_chamelium@ctm-blue-to-red:
>           + shard-tglb: NOTRUN -> [177]SKIP ([178]fdo#109284 /
>             [179]fdo#111827)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
>           + shard-iclb: NOTRUN -> [180]SKIP ([181]i915#3116)
>      * igt@kms_content_protection@type1:
>           + shard-iclb: NOTRUN -> [182]SKIP ([183]fdo#109300 /
>             [184]fdo#111066) +2 similar issues
>      * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>           + shard-tglb: NOTRUN -> [185]SKIP ([186]fdo#109274 /
>             [187]fdo#111825)
>      * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-siz
>        e:
>           + shard-glk: NOTRUN -> [188]FAIL ([189]i915#2346)
>      * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
>           + shard-tglb: NOTRUN -> [190]SKIP ([191]i915#5287)
>      * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled:
>           + shard-iclb: NOTRUN -> [192]SKIP ([193]i915#5287) +1 similar
>             issue
>      * igt@kms_dsc@dsc-with-formats:
>           + shard-iclb: NOTRUN -> [194]SKIP ([195]i915#3555 /
>             [196]i915#3828)
>      * igt@kms_flip@2x-blocking-wf_vblank:
>           + shard-iclb: NOTRUN -> [197]SKIP ([198]fdo#109274) +11 similar
>             issues
>      * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
>           + shard-glk: [199]PASS -> [200]FAIL ([201]i915#2122)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
>           + shard-glk: [202]PASS -> [203]FAIL ([204]i915#79)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-dow
>        nscaling@pipe-a-valid-mode:
>           + shard-iclb: NOTRUN -> [205]SKIP ([206]i915#2672) +5 similar
>             issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downsc
>        aling@pipe-a-default-mode:
>           + shard-iclb: NOTRUN -> [207]SKIP ([208]i915#2672 /
>             [209]i915#3555)
>      * igt@kms_force_connector_basic@force-load-detect:
>           + shard-iclb: NOTRUN -> [210]SKIP ([211]fdo#109285)
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
>           + shard-kbl: NOTRUN -> [212]SKIP ([213]fdo#109271) +63 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
>           + shard-snb: NOTRUN -> [214]INCOMPLETE ([215]i915#6598 /
>             [216]i915#6625)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwri
>        te:
>           + shard-tglb: NOTRUN -> [217]SKIP ([218]fdo#109280 /
>             [219]fdo#111825) +1 similar issue
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cp
>        u:
>           + shard-snb: NOTRUN -> [220]SKIP ([221]fdo#109271) +360 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc
>        :
>           + shard-iclb: NOTRUN -> [222]SKIP ([223]fdo#109280) +48 similar
>             issues
>      * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
>           + shard-apl: NOTRUN -> [224]INCOMPLETE ([225]i915#6598) +2
>             similar issues
>      * igt@kms_hdr@static-toggle:
>           + shard-iclb: NOTRUN -> [226]SKIP ([227]i915#3555) +4 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>           + shard-apl: NOTRUN -> [228]FAIL ([229]i915#265) +1 similar
>             issue
>           + shard-glk: NOTRUN -> [230]FAIL ([231]i915#265)
>      * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>           + shard-kbl: NOTRUN -> [232]FAIL ([233]fdo#108145 /
>             [234]i915#265)
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
>           + shard-apl: NOTRUN -> [235]FAIL ([236]fdo#108145 /
>             [237]i915#265) +3 similar issues
>           + shard-glk: NOTRUN -> [238]FAIL ([239]fdo#108145 /
>             [240]i915#265) +2 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25
>        @pipe-c-edp-1:
>           + shard-iclb: NOTRUN -> [241]SKIP ([242]i915#5176) +5 similar
>             issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pi
>        pe-b-edp-1:
>           + shard-iclb: NOTRUN -> [243]SKIP ([244]i915#5235) +2 similar
>             issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pi
>        pe-d-edp-1:
>           + shard-tglb: NOTRUN -> [245]SKIP ([246]i915#5235) +3 similar
>             issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0
>        -5@pipe-a-edp-1:
>           + shard-iclb: [247]PASS -> [248]SKIP ([249]i915#5235) +2 similar
>             issues
>      * igt@kms_prime@basic-modeset-hybrid:
>           + shard-iclb: NOTRUN -> [250]SKIP ([251]i915#6524)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>           + shard-iclb: NOTRUN -> [252]SKIP ([253]i915#658)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>           + shard-glk: NOTRUN -> [254]SKIP ([255]fdo#109271 /
>             [256]i915#658) +4 similar issues
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>           + shard-apl: NOTRUN -> [257]SKIP ([258]fdo#109271 /
>             [259]i915#658) +3 similar issues
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>           + shard-iclb: NOTRUN -> [260]SKIP ([261]fdo#111068 /
>             [262]i915#658)
>           + shard-kbl: NOTRUN -> [263]SKIP ([264]fdo#109271 /
>             [265]i915#658)
>      * igt@kms_psr2_su@page_flip-nv12:
>           + shard-iclb: NOTRUN -> [266]SKIP ([267]fdo#109642 /
>             [268]fdo#111068 / [269]i915#658)
>      * igt@kms_psr2_su@page_flip-p010:
>           + shard-iclb: NOTRUN -> [270]FAIL ([271]i915#5939)
>      * igt@kms_psr@psr2_cursor_render:
>           + shard-iclb: [272]PASS -> [273]SKIP ([274]fdo#109441) +1
>             similar issue
>      * igt@kms_psr@psr2_no_drrs:
>           + shard-iclb: NOTRUN -> [275]SKIP ([276]fdo#109441) +4 similar
>             issues
>      * igt@kms_tv_load_detect@load-detect:
>           + shard-iclb: NOTRUN -> [277]SKIP ([278]fdo#109309)
>      * igt@kms_vblank@pipe-a-ts-continuation-suspend:
>           + shard-snb: [279]PASS -> [280]INCOMPLETE ([281]i915#4939 /
>             [282]i915#6598) +1 similar issue
>      * igt@kms_vblank@pipe-b-ts-continuation-suspend:
>           + shard-apl: [283]PASS -> [284]INCOMPLETE ([285]i915#4939 /
>             [286]i915#6598) +2 similar issues
>           + shard-iclb: [287]PASS -> [288]INCOMPLETE ([289]fdo#111764)
>      * igt@kms_writeback@writeback-pixel-formats:
>           + shard-glk: NOTRUN -> [290]SKIP ([291]fdo#109271 /
>             [292]i915#2437)
>           + shard-iclb: NOTRUN -> [293]SKIP ([294]i915#2437)
>      * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
>           + shard-tglb: NOTRUN -> [295]SKIP ([296]i915#2530)
>      * igt@nouveau_crc@pipe-a-ctx-flip-detection:
>           + shard-iclb: NOTRUN -> [297]SKIP ([298]i915#2530) +4 similar
>             issues
>      * igt@nouveau_crc@pipe-d-source-outp-inactive:
>           + shard-iclb: NOTRUN -> [299]SKIP ([300]fdo#109278 /
>             [301]i915#2530)
>      * igt@prime_nv_test@i915_import_pread_pwrite:
>           + shard-iclb: NOTRUN -> [302]SKIP ([303]fdo#109291) +6 similar
>             issues
>      * igt@sysfs_clients@recycle-many:
>           + shard-iclb: NOTRUN -> [304]SKIP ([305]i915#2994) +1 similar
>             issue
>      * igt@sysfs_clients@sema-50:
>           + shard-apl: NOTRUN -> [306]SKIP ([307]fdo#109271 /
>             [308]i915#2994) +2 similar issues
>           + shard-glk: NOTRUN -> [309]SKIP ([310]fdo#109271 /
>             [311]i915#2994) +2 similar issues
>      * igt@tools_test@sysfs_l3_parity:
>           + shard-iclb: NOTRUN -> [312]SKIP ([313]fdo#109307)
> 
>     Possible fixes
> 
>      * igt@device_reset@unbind-reset-rebind:
>           + {shard-rkl}: [314]FAIL ([315]i915#4778) -> [316]PASS
>      * igt@gem_busy@close-race:
>           + shard-kbl: [317]TIMEOUT -> [318]PASS
>      * igt@gem_ctx_persistence@heartbeat-close:
>           + {shard-rkl}: [319]SKIP ([320]fdo#109315) -> [321]PASS +3
>             similar issues
>      * igt@gem_eio@kms:
>           + shard-tglb: [322]FAIL ([323]i915#5784) -> [324]PASS
>      * igt@gem_exec_balancer@parallel-out-fence:
>           + shard-iclb: [325]SKIP ([326]i915#4525) -> [327]PASS
>      * igt@gem_exec_capture@pi@vcs0:
>           + {shard-tglu}: [328]INCOMPLETE ([329]i915#3371) -> [330]PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
>           + shard-glk: [331]FAIL ([332]i915#2842) -> [333]PASS
>      * igt@gem_exec_fair@basic-pace@vcs0:
>           + shard-kbl: [334]SKIP ([335]fdo#109271) -> [336]PASS
>      * igt@gem_exec_fair@basic-pace@vcs1:
>           + shard-kbl: [337]FAIL ([338]i915#2842) -> [339]PASS +1 similar
>             issue
>      * igt@gem_ppgtt@blt-vs-render-ctxn:
>           + {shard-rkl}: [340]INCOMPLETE ([341]i915#3692) -> [342]PASS
>      * igt@gen9_exec_parse@allowed-single:
>           + shard-apl: [343]DMESG-WARN ([344]i915#5566 / [345]i915#716) ->
>             [346]PASS
>      * igt@i915_pm_dc@dc9-dpms:
>           + {shard-rkl}: [347]SKIP ([348]i915#3361) -> [349]PASS
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>           + {shard-tglu}: [350]FAIL ([351]i915#3825) -> [352]PASS
>      * igt@i915_pm_rc6_residency@rc6-fence:
>           + {shard-tglu}: [353]WARN ([354]i915#2681) -> [355]PASS
>      * igt@i915_pm_rpm@system-suspend:
>           + shard-iclb: [356]INCOMPLETE -> [357]PASS
>      * igt@i915_selftest@perf@engine_cs:
>           + shard-snb: [358]SKIP ([359]fdo#109271) -> [360]PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
>           + {shard-tglu}: [361]FAIL ([362]i915#2346) -> [363]PASS
>      * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
>           + shard-kbl: [364]FAIL ([365]i915#1188) -> [366]PASS
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>           + {shard-tglu}: [367]DMESG-WARN ([368]i915#5122) -> [369]PASS +1
>             similar issue
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
>           + shard-apl: [370]DMESG-WARN ([371]i915#180) -> [372]PASS
>      * igt@kms_psr@psr2_primary_page_flip:
>           + shard-iclb: [373]SKIP ([374]fdo#109441) -> [375]PASS
>      * igt@kms_vblank@pipe-c-ts-continuation-suspend:
>           + shard-kbl: [376]INCOMPLETE ([377]i915#4939) -> [378]PASS
>      * igt@syncobj_wait@wait-all-interrupted:
>           + {shard-rkl}: [379]SKIP ([380]i915#2575) -> [381]PASS +1
>             similar issue
> 
>     Warnings
> 
>      * igt@gem_eio@suspend:
>           + shard-snb: [382]INCOMPLETE -> [383]INCOMPLETE ([384]i915#6598)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>           + shard-iclb: [385]SKIP ([386]i915#658) -> [387]SKIP
>             ([388]i915#2920)
>      * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
>           + shard-snb: [389]SKIP ([390]fdo#109271) -> [391]INCOMPLETE
>             ([392]i915#4939 / [393]i915#6598)
>      * igt@runner@aborted:
>           + shard-apl: ([394]FAIL, [395]FAIL) ([396]fdo#109271 /
>             [397]i915#3002 / [398]i915#4312 / [399]i915#5257 /
>             [400]i915#6599) -> ([401]FAIL, [402]FAIL, [403]FAIL)
>             ([404]i915#180 / [405]i915#3002 / [406]i915#4312 /
>             [407]i915#5257 / [408]i915#6599)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6632 -> IGTPW_7663
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_12002: d97b20df74df568772dda6a32ee447884fd4286a @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7663:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/index.html
>    IGT_6632: a0ac4d449e551fd5c78b56f85cd534330ea60507 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
> 
> References
> 
>    1. https://patchwork.freedesktop.org/series/107472/
>    2. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/index.html
>    3. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk2/igt@gem_eio@hibernate.html
>    4. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-glk5/igt@i915_suspend@sysfs-reader.html
>    5. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk6/igt@i915_suspend@sysfs-reader.html
>    6. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-iclb2/igt@i915_suspend@sysfs-reader.html
>    7. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb1/igt@i915_suspend@sysfs-reader.html
>    8. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    9. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb4/igt@api_intel_bb@crc32.html
>   10. https://gitlab.freedesktop.org/drm/intel/issues/6230
>   11. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@api_intel_bb@crc32.html
>   12. https://gitlab.freedesktop.org/drm/intel/issues/6230
>   13. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@feature_discovery@chamelium.html
>   14. https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   15. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb1/igt@feature_discovery@display-3x.html
>   16. https://gitlab.freedesktop.org/drm/intel/issues/1839
>   17. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb6/igt@gem_ctx_persistence@smoketest.html
>   18. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   19. https://gitlab.freedesktop.org/drm/intel/issues/1099
>   20. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb5/igt@gem_eio@hibernate.html
>   21. https://gitlab.freedesktop.org/drm/intel/issues/6598
>   22. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html
>   23. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@gem_exec_balancer@parallel-keep-in-fence.html
>   24. https://gitlab.freedesktop.org/drm/intel/issues/4525
>   25. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@gem_exec_capture@capture-recoverable.html
>   26. https://gitlab.freedesktop.org/drm/intel/issues/6344
>   27. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-kbl4/igt@gem_exec_fair@basic-deadline.html
>   28. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
>   29. https://gitlab.freedesktop.org/drm/intel/issues/2846
>   30. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
>   31. https://gitlab.freedesktop.org/drm/intel/issues/2842
>   32. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@gem_exec_fair@basic-none@vecs0.html
>   33. https://gitlab.freedesktop.org/drm/intel/issues/2842
>   34. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>   35. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>   36. https://gitlab.freedesktop.org/drm/intel/issues/2842
>   37. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
>   38. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html
>   39. https://gitlab.freedesktop.org/drm/intel/issues/2842
>   40. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>   41. https://bugs.freedesktop.org/show_bug.cgi?id=109313
>   42. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@gem_exec_params@secure-non-root.html
>   43. https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   44. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb1/igt@gem_lmem_swapping@parallel-random-engines.html
>   45. https://gitlab.freedesktop.org/drm/intel/issues/4613
>   46. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl1/igt@gem_lmem_swapping@parallel-random-engines.html
>   47. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   48. https://gitlab.freedesktop.org/drm/intel/issues/4613
>   49. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl2/igt@gem_lmem_swapping@smem-oom.html
>   50. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   51. https://gitlab.freedesktop.org/drm/intel/issues/4613
>   52. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk7/igt@gem_lmem_swapping@smem-oom.html
>   53. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   54. https://gitlab.freedesktop.org/drm/intel/issues/4613
>   55. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@gem_pxp@create-valid-protected-context.html
>   56. https://gitlab.freedesktop.org/drm/intel/issues/4270
>   57. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb5/igt@gem_pxp@create-valid-protected-context.html
>   58. https://gitlab.freedesktop.org/drm/intel/issues/4270
>   59. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
>   60. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   61. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html
>   62. https://gitlab.freedesktop.org/drm/intel/issues/768
>   63. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html
>   64. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   65. https://gitlab.freedesktop.org/drm/intel/issues/3323
>   66. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk6/igt@gem_userptr_blits@dmabuf-sync.html
>   67. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   68. https://gitlab.freedesktop.org/drm/intel/issues/3323
>   69. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb4/igt@gem_userptr_blits@dmabuf-sync.html
>   70. https://gitlab.freedesktop.org/drm/intel/issues/3323
>   71. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@gem_userptr_blits@input-checking.html
>   72. https://gitlab.freedesktop.org/drm/intel/issues/4991
>   73. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl2/igt@gem_userptr_blits@input-checking.html
>   74. https://gitlab.freedesktop.org/drm/intel/issues/4991
>   75. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk6/igt@gem_userptr_blits@input-checking.html
>   76. https://gitlab.freedesktop.org/drm/intel/issues/4991
>   77. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb4/igt@gem_userptr_blits@unsync-overlap.html
>   78. https://gitlab.freedesktop.org/drm/intel/issues/3297
>   79. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@gen3_mixed_blits.html
>   80. https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   81. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb5/igt@gen7_exec_parse@basic-allowed.html
>   82. https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   83. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-glk2/igt@gen9_exec_parse@allowed-all.html
>   84. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk3/igt@gen9_exec_parse@allowed-all.html
>   85. https://gitlab.freedesktop.org/drm/intel/issues/5566
>   86. https://gitlab.freedesktop.org/drm/intel/issues/716
>   87. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb5/igt@gen9_exec_parse@bb-start-param.html
>   88. https://gitlab.freedesktop.org/drm/intel/issues/2856
>   89. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@i915_module_load@load.html
>   90. https://gitlab.freedesktop.org/drm/intel/issues/6227
>   91. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb4/igt@i915_module_load@load.html
>   92. https://gitlab.freedesktop.org/drm/intel/issues/6227
>   93. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb2/igt@i915_pm_freq_mult@media-freq@gt0.html
>   94. https://gitlab.freedesktop.org/drm/intel/issues/6590
>   95. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
>   96. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   97. https://gitlab.freedesktop.org/drm/intel/issues/1937
>   98. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
>   99. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  100. https://gitlab.freedesktop.org/drm/intel/issues/1937
>  101. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk8/igt@i915_pm_rpm@system-suspend-devices.html
>  102. https://gitlab.freedesktop.org/drm/intel/issues/6598
>  103. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl8/igt@i915_pm_rpm@system-suspend-execbuf.html
>  104. https://gitlab.freedesktop.org/drm/intel/issues/4939
>  105. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@i915_query@test-query-geometry-subslices.html
>  106. https://gitlab.freedesktop.org/drm/intel/issues/5723
>  107. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
>  108. https://gitlab.freedesktop.org/drm/intel/issues/180
>  109. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-apl7/igt@i915_suspend@sysfs-reader.html
>  110. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl3/igt@i915_suspend@sysfs-reader.html
>  111. https://gitlab.freedesktop.org/drm/intel/issues/4939
>  112. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-snb5/igt@i915_suspend@sysfs-reader.html
>  113. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb6/igt@i915_suspend@sysfs-reader.html
>  114. https://gitlab.freedesktop.org/drm/intel/issues/4817
>  115. https://gitlab.freedesktop.org/drm/intel/issues/4939
>  116. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition.html
>  117. https://gitlab.freedesktop.org/drm/intel/issues/1769
>  118. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html
>  119. https://gitlab.freedesktop.org/drm/intel/issues/1769
>  120. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>  121. https://gitlab.freedesktop.org/drm/intel/issues/5286
>  122. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
>  123. https://bugs.freedesktop.org/show_bug.cgi?id=110725
>  124. https://bugs.freedesktop.org/show_bug.cgi?id=111614
>  125. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
>  126. https://bugs.freedesktop.org/show_bug.cgi?id=110723
>  127. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
>  128. https://bugs.freedesktop.org/show_bug.cgi?id=111615
>  129. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb5/igt@kms_big_joiner@basic.html
>  130. https://gitlab.freedesktop.org/drm/intel/issues/2705
>  131. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk5/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
>  132. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  133. https://gitlab.freedesktop.org/drm/intel/issues/3886
>  134. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl7/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html
>  135. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  136. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html
>  137. https://gitlab.freedesktop.org/drm/intel/issues/3689
>  138. https://gitlab.freedesktop.org/drm/intel/issues/6095
>  139. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb3/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html
>  140. https://gitlab.freedesktop.org/drm/intel/issues/3689
>  141. https://gitlab.freedesktop.org/drm/intel/issues/3886
>  142. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
>  143. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  144. https://gitlab.freedesktop.org/drm/intel/issues/3886
>  145. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html
>  146. https://bugs.freedesktop.org/show_bug.cgi?id=109278
>  147. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_ccs.html
>  148. https://gitlab.freedesktop.org/drm/intel/issues/3689
>  149. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
>  150. https://bugs.freedesktop.org/show_bug.cgi?id=109278
>  151. https://gitlab.freedesktop.org/drm/intel/issues/3886
>  152. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl1/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
>  153. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  154. https://gitlab.freedesktop.org/drm/intel/issues/3886
>  155. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb3/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html
>  156. https://bugs.freedesktop.org/show_bug.cgi?id=111615
>  157. https://gitlab.freedesktop.org/drm/intel/issues/3689
>  158. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html
>  159. https://gitlab.freedesktop.org/drm/intel/issues/6095
>  160. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@kms_cdclk@plane-scaling.html
>  161. https://gitlab.freedesktop.org/drm/intel/issues/3742
>  162. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl7/igt@kms_chamelium@dp-hpd-storm.html
>  163. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  164. https://bugs.freedesktop.org/show_bug.cgi?id=111827
>  165. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@kms_chamelium@dp-mode-timings.html
>  166. https://bugs.freedesktop.org/show_bug.cgi?id=109284
>  167. https://bugs.freedesktop.org/show_bug.cgi?id=111827
>  168. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk7/igt@kms_chamelium@hdmi-crc-multiple.html
>  169. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  170. https://bugs.freedesktop.org/show_bug.cgi?id=111827
>  171. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.html
>  172. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  173. https://bugs.freedesktop.org/show_bug.cgi?id=111827
>  174. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl8/igt@kms_color_chamelium@ctm-0-50.html
>  175. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  176. https://bugs.freedesktop.org/show_bug.cgi?id=111827
>  177. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@kms_color_chamelium@ctm-blue-to-red.html
>  178. https://bugs.freedesktop.org/show_bug.cgi?id=109284
>  179. https://bugs.freedesktop.org/show_bug.cgi?id=111827
>  180. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb1/igt@kms_content_protection@dp-mst-lic-type-1.html
>  181. https://gitlab.freedesktop.org/drm/intel/issues/3116
>  182. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb1/igt@kms_content_protection@type1.html
>  183. https://bugs.freedesktop.org/show_bug.cgi?id=109300
>  184. https://bugs.freedesktop.org/show_bug.cgi?id=111066
>  185. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>  186. https://bugs.freedesktop.org/show_bug.cgi?id=109274
>  187. https://bugs.freedesktop.org/show_bug.cgi?id=111825
>  188. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
>  189. https://gitlab.freedesktop.org/drm/intel/issues/2346
>  190. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html
>  191. https://gitlab.freedesktop.org/drm/intel/issues/5287
>  192. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled.html
>  193. https://gitlab.freedesktop.org/drm/intel/issues/5287
>  194. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb3/igt@kms_dsc@dsc-with-formats.html
>  195. https://gitlab.freedesktop.org/drm/intel/issues/3555
>  196. https://gitlab.freedesktop.org/drm/intel/issues/3828
>  197. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@kms_flip@2x-blocking-wf_vblank.html
>  198. https://bugs.freedesktop.org/show_bug.cgi?id=109274
>  199. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
>  200. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk1/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
>  201. https://gitlab.freedesktop.org/drm/intel/issues/2122
>  202. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
>  203. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
>  204. https://gitlab.freedesktop.org/drm/intel/issues/79
>  205. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
>  206. https://gitlab.freedesktop.org/drm/intel/issues/2672
>  207. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
>  208. https://gitlab.freedesktop.org/drm/intel/issues/2672
>  209. https://gitlab.freedesktop.org/drm/intel/issues/3555
>  210. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb5/igt@kms_force_connector_basic@force-load-detect.html
>  211. https://bugs.freedesktop.org/show_bug.cgi?id=109285
>  212. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
>  213. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  214. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>  215. https://gitlab.freedesktop.org/drm/intel/issues/6598
>  216. https://gitlab.freedesktop.org/drm/intel/issues/6625
>  217. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html
>  218. https://bugs.freedesktop.org/show_bug.cgi?id=109280
>  219. https://bugs.freedesktop.org/show_bug.cgi?id=111825
>  220. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
>  221. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  222. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>  223. https://bugs.freedesktop.org/show_bug.cgi?id=109280
>  224. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
>  225. https://gitlab.freedesktop.org/drm/intel/issues/6598
>  226. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@kms_hdr@static-toggle.html
>  227. https://gitlab.freedesktop.org/drm/intel/issues/3555
>  228. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
>  229. https://gitlab.freedesktop.org/drm/intel/issues/265
>  230. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
>  231. https://gitlab.freedesktop.org/drm/intel/issues/265
>  232. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
>  233. https://bugs.freedesktop.org/show_bug.cgi?id=108145
>  234. https://gitlab.freedesktop.org/drm/intel/issues/265
>  235. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
>  236. https://bugs.freedesktop.org/show_bug.cgi?id=108145
>  237. https://gitlab.freedesktop.org/drm/intel/issues/265
>  238. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
>  239. https://bugs.freedesktop.org/show_bug.cgi?id=108145
>  240. https://gitlab.freedesktop.org/drm/intel/issues/265
>  241. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb4/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-edp-1.html
>  242. https://gitlab.freedesktop.org/drm/intel/issues/5176
>  243. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1.html
>  244. https://gitlab.freedesktop.org/drm/intel/issues/5235
>  245. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html
>  246. https://gitlab.freedesktop.org/drm/intel/issues/5235
>  247. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-iclb4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
>  248. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
>  249. https://gitlab.freedesktop.org/drm/intel/issues/5235
>  250. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb7/igt@kms_prime@basic-modeset-hybrid.html
>  251. https://gitlab.freedesktop.org/drm/intel/issues/6524
>  252. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>  253. https://gitlab.freedesktop.org/drm/intel/issues/658
>  254. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk9/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>  255. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  256. https://gitlab.freedesktop.org/drm/intel/issues/658
>  257. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl8/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>  258. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  259. https://gitlab.freedesktop.org/drm/intel/issues/658
>  260. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
>  261. https://bugs.freedesktop.org/show_bug.cgi?id=111068
>  262. https://gitlab.freedesktop.org/drm/intel/issues/658
>  263. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
>  264. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  265. https://gitlab.freedesktop.org/drm/intel/issues/658
>  266. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html
>  267. https://bugs.freedesktop.org/show_bug.cgi?id=109642
>  268. https://bugs.freedesktop.org/show_bug.cgi?id=111068
>  269. https://gitlab.freedesktop.org/drm/intel/issues/658
>  270. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
>  271. https://gitlab.freedesktop.org/drm/intel/issues/5939
>  272. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
>  273. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
>  274. https://bugs.freedesktop.org/show_bug.cgi?id=109441
>  275. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
>  276. https://bugs.freedesktop.org/show_bug.cgi?id=109441
>  277. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb3/igt@kms_tv_load_detect@load-detect.html
>  278. https://bugs.freedesktop.org/show_bug.cgi?id=109309
>  279. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-snb6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
>  280. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb5/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
>  281. https://gitlab.freedesktop.org/drm/intel/issues/4939
>  282. https://gitlab.freedesktop.org/drm/intel/issues/6598
>  283. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
>  284. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
>  285. https://gitlab.freedesktop.org/drm/intel/issues/4939
>  286. https://gitlab.freedesktop.org/drm/intel/issues/6598
>  287. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
>  288. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
>  289. https://bugs.freedesktop.org/show_bug.cgi?id=111764
>  290. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk2/igt@kms_writeback@writeback-pixel-formats.html
>  291. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  292. https://gitlab.freedesktop.org/drm/intel/issues/2437
>  293. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb3/igt@kms_writeback@writeback-pixel-formats.html
>  294. https://gitlab.freedesktop.org/drm/intel/issues/2437
>  295. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html
>  296. https://gitlab.freedesktop.org/drm/intel/issues/2530
>  297. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html
>  298. https://gitlab.freedesktop.org/drm/intel/issues/2530
>  299. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb5/igt@nouveau_crc@pipe-d-source-outp-inactive.html
>  300. https://bugs.freedesktop.org/show_bug.cgi?id=109278
>  301. https://gitlab.freedesktop.org/drm/intel/issues/2530
>  302. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@prime_nv_test@i915_import_pread_pwrite.html
>  303. https://bugs.freedesktop.org/show_bug.cgi?id=109291
>  304. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb6/igt@sysfs_clients@recycle-many.html
>  305. https://gitlab.freedesktop.org/drm/intel/issues/2994
>  306. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl3/igt@sysfs_clients@sema-50.html
>  307. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  308. https://gitlab.freedesktop.org/drm/intel/issues/2994
>  309. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk1/igt@sysfs_clients@sema-50.html
>  310. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  311. https://gitlab.freedesktop.org/drm/intel/issues/2994
>  312. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb3/igt@tools_test@sysfs_l3_parity.html
>  313. https://bugs.freedesktop.org/show_bug.cgi?id=109307
>  314. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html
>  315. https://gitlab.freedesktop.org/drm/intel/issues/4778
>  316. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-rkl-1/igt@device_reset@unbind-reset-rebind.html
>  317. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-kbl7/igt@gem_busy@close-race.html
>  318. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl4/igt@gem_busy@close-race.html
>  319. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-rkl-5/igt@gem_ctx_persistence@heartbeat-close.html
>  320. https://bugs.freedesktop.org/show_bug.cgi?id=109315
>  321. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-rkl-2/igt@gem_ctx_persistence@heartbeat-close.html
>  322. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-tglb5/igt@gem_eio@kms.html
>  323. https://gitlab.freedesktop.org/drm/intel/issues/5784
>  324. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglb7/igt@gem_eio@kms.html
>  325. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html
>  326. https://gitlab.freedesktop.org/drm/intel/issues/4525
>  327. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html
>  328. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-tglu-1/igt@gem_exec_capture@pi@vcs0.html
>  329. https://gitlab.freedesktop.org/drm/intel/issues/3371
>  330. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglu-4/igt@gem_exec_capture@pi@vcs0.html
>  331. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
>  332. https://gitlab.freedesktop.org/drm/intel/issues/2842
>  333. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
>  334. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html
>  335. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  336. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html
>  337. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html
>  338. https://gitlab.freedesktop.org/drm/intel/issues/2842
>  339. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html
>  340. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctxn.html
>  341. https://gitlab.freedesktop.org/drm/intel/issues/3692
>  342. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-rkl-1/igt@gem_ppgtt@blt-vs-render-ctxn.html
>  343. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-apl3/igt@gen9_exec_parse@allowed-single.html
>  344. https://gitlab.freedesktop.org/drm/intel/issues/5566
>  345. https://gitlab.freedesktop.org/drm/intel/issues/716
>  346. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl6/igt@gen9_exec_parse@allowed-single.html
>  347. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html
>  348. https://gitlab.freedesktop.org/drm/intel/issues/3361
>  349. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-rkl-1/igt@i915_pm_dc@dc9-dpms.html
>  350. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-tglu-6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
>  351. https://gitlab.freedesktop.org/drm/intel/issues/3825
>  352. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglu-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
>  353. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html
>  354. https://gitlab.freedesktop.org/drm/intel/issues/2681
>  355. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-fence.html
>  356. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-iclb5/igt@i915_pm_rpm@system-suspend.html
>  357. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb2/igt@i915_pm_rpm@system-suspend.html
>  358. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-snb6/igt@i915_selftest@perf@engine_cs.html
>  359. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  360. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb4/igt@i915_selftest@perf@engine_cs.html
>  361. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-tglu-2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
>  362. https://gitlab.freedesktop.org/drm/intel/issues/2346
>  363. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglu-6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
>  364. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
>  365. https://gitlab.freedesktop.org/drm/intel/issues/1188
>  366. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
>  367. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-tglu-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>  368. https://gitlab.freedesktop.org/drm/intel/issues/5122
>  369. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-tglu-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>  370. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
>  371. https://gitlab.freedesktop.org/drm/intel/issues/180
>  372. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
>  373. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html
>  374. https://bugs.freedesktop.org/show_bug.cgi?id=109441
>  375. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
>  376. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
>  377. https://gitlab.freedesktop.org/drm/intel/issues/4939
>  378. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
>  379. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-rkl-5/igt@syncobj_wait@wait-all-interrupted.html
>  380. https://gitlab.freedesktop.org/drm/intel/issues/2575
>  381. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-rkl-5/igt@syncobj_wait@wait-all-interrupted.html
>  382. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-snb2/igt@gem_eio@suspend.html
>  383. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb6/igt@gem_eio@suspend.html
>  384. https://gitlab.freedesktop.org/drm/intel/issues/6598
>  385. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>  386. https://gitlab.freedesktop.org/drm/intel/issues/658
>  387. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>  388. https://gitlab.freedesktop.org/drm/intel/issues/2920
>  389. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-snb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
>  390. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  391. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-snb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
>  392. https://gitlab.freedesktop.org/drm/intel/issues/4939
>  393. https://gitlab.freedesktop.org/drm/intel/issues/6598
>  394. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-apl3/igt@runner@aborted.html
>  395. https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12002/shard-apl3/igt@runner@aborted.html
>  396. https://bugs.freedesktop.org/show_bug.cgi?id=109271
>  397. https://gitlab.freedesktop.org/drm/intel/issues/3002
>  398. https://gitlab.freedesktop.org/drm/intel/issues/4312
>  399. https://gitlab.freedesktop.org/drm/intel/issues/5257
>  400. https://gitlab.freedesktop.org/drm/intel/issues/6599
>  401. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl3/igt@runner@aborted.html
>  402. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl2/igt@runner@aborted.html
>  403. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7663/shard-apl1/igt@runner@aborted.html
>  404. https://gitlab.freedesktop.org/drm/intel/issues/180
>  405. https://gitlab.freedesktop.org/drm/intel/issues/3002
>  406. https://gitlab.freedesktop.org/drm/intel/issues/4312
>  407. https://gitlab.freedesktop.org/drm/intel/issues/5257
>  408. https://gitlab.freedesktop.org/drm/intel/issues/6599
