Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B7C11BFE8
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 05:54:59 +0000 (UTC)
Date: Thu, 11 Aug 2022 07:54:47 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YvSZp5Q57m2KEbVd@zkempczy-mobl2>
References: <20220810081949.17706-1-zbigniew.kempczynski@intel.com>
 <166015809357.12353.10522193492513009159@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166015809357.12353.10522193492513009159@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdevice=5Fscan=3A_Rescan_pci_properties_if_PCI=5FSLOT=5FNAME?=
 =?utf-8?q?_wasn=27t_found?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 07:01:33PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_device_scan: Rescan pci properties if PCI_SLOT_NAME       
>             wasn't found                                                      
>    URL:     https://patchwork.freedesktop.org/series/107112/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7627/index.html    
> 
>          CI Bug Log - changes from CI_DRM_11981_full -> IGTPW_7627_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7627_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7627_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7627/index.html
> 
> Participating hosts (10 -> 7)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7627_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_sequence@queue-idle@dp-1-pipe-b:
>           * shard-apl: PASS -> FAIL +1 similar issue

Not related to change in the patch.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_7627_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@drm_buddy@all:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#6433)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6433)
> 
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: PASS -> SKIP (i915#658)
>      * igt@gem_eio@in-flight-10ms:
> 
>           * shard-iclb: PASS -> DMESG-WARN (i915#4391)
>      * igt@gem_eio@kms:
> 
>           * shard-tglb: PASS -> FAIL (i915#5784)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#3354)
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: PASS -> FAIL (i915#2849)
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#112283)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#112283)
> 
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>           * shard-tglb: PASS -> SKIP (i915#2190)
> 
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +2 similar
>             issues
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +2 similar
>             issues
>      * igt@gem_pread@exhaustion:
> 
>           * shard-kbl: NOTRUN -> WARN (i915#2658)
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +156 similar issues
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +22 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768)
> 
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3323)
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#4991)
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#4991)
> 
>      * igt@gen7_exec_parse@chained-batch:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>      * igt@gen7_exec_parse@cmd-crossing-page:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#5566 / i915#716) +1 similar
>             issue
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856)
> 
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-iclb: PASS -> FAIL (i915#454)
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#454)
> 
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#180) +1 similar issue
>      * igt@i915_suspend@forcewake:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286)
> 
>      * igt@kms_big_fb@linear-16bpp-rotate-180:
> 
>           * shard-glk: PASS -> DMESG-FAIL (i915#118 / i915#1888) +1 similar
>             issue
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#1982 / i915#62)
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +10 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +1 similar
>             issue
> 
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +8 similar
>             issues
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886)
> 
>      * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +250 similar issues
>      * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278)
>      * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +10 similar
>             issues
>      * igt@kms_chamelium@vga-hpd-without-ddc:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +5 similar
>             issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4103)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4103)
> 
>      * igt@kms_cursor_legacy@flip-vs-cursor@toggle:
> 
>           * shard-iclb: PASS -> FAIL (i915#2346) +3 similar issues
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
> 
>           * shard-apl: PASS -> DMESG-FAIL (i915#62)
>      * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled:
> 
>           * shard-glk: PASS -> FAIL (fdo#108145 / i915#1888 / i915#5160)
>      * igt@kms_dsc@dsc-with-bpp:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3828)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3828)
> 
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
> 
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
> 
>           * shard-glk: PASS -> FAIL (i915#79)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672) +6 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#1982 / i915#62)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-iclb: PASS -> FAIL (i915#1888 / i915#2546)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +2 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6497) +4 similar issues
>      * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#1188)
>      * igt@kms_lease@lease_again:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#62)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1839)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1839)
> 
>      * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / i915#265) +2 similar
>             issues
> 
>           * shard-apl: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#265)
>      * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
> 
>           * shard-apl: NOTRUN -> DMESG-FAIL (fdo#108145 / i915#62)
>      * igt@kms_plane_cursor@pipe-b-viewport-size-128:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#62) +19 similar issues
>      * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +1 similar issue
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
> 
>           * shard-iclb: PASS -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +2 similar
>             issues
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658) +2 similar
>             issues
>      * igt@kms_psr@psr2_primary_mmap_gtt:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441)
> 
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>      * igt@perf@polling-small-buf:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +35 similar issues
>      * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109291) +1 similar issue
>      * igt@prime_nv_pcopy@test3_3:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291) +1 similar issue
>      * igt@sysfs_clients@fair-7:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +2 similar
>             issues
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>      * igt@sysfs_timeslice_duration@timeout@vecs0:
> 
>           * shard-kbl: PASS -> FAIL (i915#1755)
> 
>     Possible fixes
> 
>      * igt@gem_eio@in-flight-contexts-1us:
> 
>           * shard-apl: TIMEOUT (i915#3063) -> PASS
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +3 similar issues
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-kbl: FAIL (i915#2842) -> PASS +1 similar issue
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: SKIP (fdo#109271) -> PASS
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +4 similar issues
>      * igt@kms_cursor_legacy@cursor-vs-flip@varying-size:
> 
>           * shard-iclb: FAIL (i915#5072) -> PASS +1 similar issue
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
> 
>           * shard-kbl: FAIL (i915#1188) -> PASS
>      * igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
>      * igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
> 
>           * shard-apl: DMESG-WARN (i915#1982 / i915#62) -> PASS +1 similar
>             issue
>      * igt@kms_vblank@pipe-a-accuracy-idle:
> 
>           * shard-apl: DMESG-WARN (i915#62) -> PASS +6 similar issues
>      * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
> 
>           * shard-apl: FAIL -> PASS
>      * igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +3 similar issues
>      * igt@perf@polling-parameterized:
> 
>           * shard-glk: FAIL (i915#5639) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: SKIP (i915#4525) -> FAIL (i915#6117)
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-kbl: INCOMPLETE -> DMESG-WARN (i915#180)
>      * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>           * shard-apl: FAIL (fdo#108145 / i915#265) -> DMESG-FAIL (fdo#108145
>             / i915#62)
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-iclb: SKIP (fdo#109642 / fdo#111068 / i915#658) -> FAIL
>             (i915#5939)
>      * igt@runner@aborted:
> 
>           * shard-kbl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL) (fdo#109271 / i915#180 / i915#3002 / i915#4312
>             / i915#5257 / i915#92) -> (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL) (i915#180 / i915#3002 / i915#4312 / i915#5257)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6619 -> IGTPW_7627
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_11981: 6f207fdd93a13166b4adfe2f3a2972a9c632e757 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7627: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7627/index.html
>    IGT_6619: ec2ab8e3a151ce05bd2726319c528c2ab99e8a96 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
