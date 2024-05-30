Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01665C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 20:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8F110E646;
	Thu, 30 May 2024 20:49:41 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6202F10E0EC;
 Thu, 30 May 2024 20:49:38 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239] helo=hazy.lan)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sCmiL-00000001J3T-08rV; Thu, 30 May 2024 23:49:35 +0300
Message-ID: <1f8488e1dbabb4b1fcfc5b0269e3d599f790fb02.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Thu, 30 May 2024 23:49:32 +0300
In-Reply-To: <171706666388.2237378.3459889553843631519@8e613ede5ea5>
References: <20240530085908.564733-1-luciano.coelho@intel.com>
 <171706666388.2237378.3459889553843631519@8e613ede5ea5>
Content-Type: multipart/alternative; boundary="=-9kZpRTEOa34VEYGxXYAA"
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.xeFULL: failure for check
 drmModeGetConnector() return value in some missing places (rev4)
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--=-9kZpRTEOa34VEYGxXYAA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This failure is not related to my patch. =C2=A0Can this please be re-
reported?

Thanks!

--
Cheers,
Luca.


On Thu, 2024-05-30 at 10:57 +0000, Patchwork wrote:
> Patch Details
> Series:check drmModeGetConnector() return value in some missing
> places (rev4)
> URL:https://patchwork.freedesktop.org/series/133953/
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/index.html
> CI Bug Log - changes from XEIGT_7873_full -> XEIGTPW_11206_fullSummaryFAI=
LURE
> Serious unknown changes coming with XEIGTPW_11206_full absolutely
> need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11206_full, please notify your bug team (I915-
> ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Participating hosts (3 -> 2)Missing (1): shard-adlp=20
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> XEIGTPW_11206_full:
> IGT changesPossible regressions * igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-spr-indfb-draw-
>    blt:shard-dg2-set2: NOTRUN -> DMESG-WARN
>  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:shard-dg2-set2:
>    NOTRUN -> FAIL +2 other tests fail
> SuppressedThe following results come from untrusted machines, tests, or
> statuses.
> They do not affect the overall result.
>  * igt@kms_psr@psr-primary-page-flip@edp-1:{shard-lnl}: NOTRUN -> FAIL
>    +1 other test fail
> Known issuesHere are the changes found in XEIGTPW_11206_full that come fr=
om known
> issues:
> IGT changesIssues hit * igt@core_setmaster@master-drop-set-root:shard-dg2=
-set2: NOTRUN ->
>    DMESG-WARN (Intel XE#1162)
>  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / Intel XE#623)
>  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-
>    6-4-mc-ccs:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel
>    XE#801) +23 other tests skip
>  * igt@kms_async_flips@invalid-async-flip:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#873)
>  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#1201 / Intel XE#316) +19 other tests skip
>  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#316) +1 other test skip
>  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:shard-dg2-set2: NOTRUN ->
>    INCOMPLETE (Intel XE#1195) +2 other tests incomplete
>  * igt@kms_big_fb@y-tiled-addfb:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1201 / Intel XE#619)
>  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / Intel XE#607) +1 other test skip
>  * igt@kms_big_fb@y-tiled-addfb-size-overflow:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#610) +1 other test skip
>  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:shard-
>    dg2-set2: NOTRUN -> SKIP (Intel XE#1124 / Intel XE#1201) +50 other
>    tests skip
>  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1124) +5 other tests skip
>  * igt@kms_big_joiner@invalid-modeset:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#1201 / Intel XE#346)
>  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#367) +2 other tests skip
>  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / Intel XE#367) +11 other tests skip
>  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-
>    6:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#787) +447
>    other tests skip
>  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:shard-dg2-set2: NOTRUN -
>    > SKIP (Intel XE#1201 / Intel XE#1252) +4 other tests skip
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:shard-dg2-
>    set2: NOTRUN -> TIMEOUT (Intel XE#1850)
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-
>    a-6:shard-dg2-set2: NOTRUN -> TIMEOUT (Intel XE#1713)
>  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:shard-
>    dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455 / Intel
>    XE#787) +127 other tests skip
>  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:shard-dg2-
>    set2: NOTRUN -> SKIP (Intel XE#787) +20 other tests skip
>  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:shard-dg2-
>    set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +5 other tests
>    skip
>  * igt@kms_cdclk@mode-transition-all-outputs:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#314)
>  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#314) +3 other tests skip
>  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1152 / Intel XE#1201) +3 other tests skip
>  * igt@kms_chamelium_color@ctm-red-to-blue:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#306) +8 other tests skip
>  * igt@kms_chamelium_color@gamma:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#306)
>  * igt@kms_chamelium_frames@hdmi-frame-dump:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#373) +6 other tests skip
>  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:shard-dg2-set2: NOTRUN -
>    > SKIP (Intel XE#1201 / Intel XE#373) +48 other tests skip
>  * igt@kms_content_protection@dp-mst-type-0:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#307) +4 other tests skip
>  * igt@kms_content_protection@legacy@pipe-a-dp-4:shard-dg2-set2: NOTRUN
>    -> FAIL (Intel XE#1178) +5 other tests fail
>  * igt@kms_content_protection@lic-type-0:shard-dg2-set2: NOTRUN -> FAIL
>    (Intel XE#1204) +1 other test fail
>  * igt@kms_content_protection@lic-type-1:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#455) +5 other tests skip
>  * igt@kms_content_protection@uevent:shard-dg2-set2: NOTRUN -> FAIL
>    (Intel XE#1188) +1 other test fail
>  * igt@kms_cursor_crc@cursor-offscreen-512x512:shard-dg2-set2: NOTRUN -
>    > SKIP (Intel XE#308) +1 other test skip
>  * igt@kms_cursor_crc@cursor-onscreen-512x170:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#308) +6 other tests skip
>  * igt@kms_cursor_edge_walk@256x256-top-bottom:shard-dg2-set2: NOTRUN -
>    > DMESG-WARN (Intel XE#282) +2 other tests dmesg-warn
>  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:shard-dg2-set2:
>    NOTRUN -> DMESG-WARN (Intel XE#282 / Intel XE#910)
>  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:shard-
>    dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#323) +4 other
>    tests skip
>  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:shard-
>    dg2-set2: NOTRUN -> SKIP (Intel XE#323)
>  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:shard-dg2-
>    set2: NOTRUN -> DMESG-WARN (Intel XE#1214 / Intel XE#282) +47 other
>    tests dmesg-warn
>  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-
>    size:shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#1214 / Intel
>    XE#282 / Intel XE#910)
>  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#455 / Intel XE#929)
>  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:shard-dg2-set2: NOTRUN
>    -> SKIP (Intel XE#1201 / Intel XE#1927)
>  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / i915#3804)
>  * igt@kms_fbcon_fbt@psr:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201
>    / Intel XE#776) +1 other test skip
>  * igt@kms_feature_discovery@display-3x:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#703)
>  * igt@kms_feature_discovery@display-4x:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#1138 / Intel XE#1201)
>  * igt@kms_feature_discovery@dp-mst:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#1137 / Intel XE#1201)
>  * igt@kms_feature_discovery@psr1:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1135 / Intel XE#1201) +1 other test skip
>  * igt@kms_force_connector_basic@prune-stale-modes:shard-dg2-set2:
>    NOTRUN -> SKIP (i915#5274)
>  * igt@kms_frontbuffer_tracking@drrs-suspend:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#651) +151 other tests skip
>  * igt@kms_frontbuffer_tracking@fbc-tiling-y:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#658) +1 other test skip
>  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>    onoff:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +18 other tests
>    skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>    blt:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#653)
>    +152 other tests skip
>  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:shard-
>    dg2-set2: NOTRUN -> SKIP (Intel XE#653) +14 other tests skip
>  * igt@kms_getfb@getfb-reject-ccs:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1201 / Intel XE#605)
>  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:shard-dg2-set2:
>    NOTRUN -> FAIL (Intel XE#616) +18 other tests fail
>  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / Intel XE#356)
>  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:shard-dg2-
>    set2: NOTRUN -> DMESG-FAIL (Intel XE#1162) +3 other tests dmesg-fail
>  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:shard-dg2-set2:
>    NOTRUN -> FAIL (Intel XE#361) +2 other tests fail
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>    modifiers:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel
>    XE#498) +1 other test skip
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>    modifiers@pipe-a-hdmi-a-6:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#498) +2 other tests skip
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>    format:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455
>    / Intel XE#498) +1 other test skip
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>    format@pipe-c-hdmi-a-6:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201
>    / Intel XE#498) +2 other tests skip
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-
>    scaling:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#305 / Intel XE#455)
>    +1 other test skip
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-
>    scaling@pipe-a-hdmi-a-6:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#305) +2 other tests skip
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-
>    6:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#305 /
>    Intel XE#455) +8 other tests skip
>  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-
>    25@pipe-c-hdmi-a-6:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 /
>    Intel XE#305) +17 other tests skip
>  * igt@kms_pm_backlight@fade-with-suspend:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#870) +4 other tests skip
>  * igt@kms_pm_dc@dc5-psr:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1129
>    / Intel XE#1201) +1 other test skip
>  * igt@kms_pm_dc@dc6-dpms:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201
>    / Intel XE#908)
>  * igt@kms_psr2_su@page_flip-nv12:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1122 / Intel XE#1201) +3 other tests skip
>  * igt@kms_psr@fbc-psr-sprite-render:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#929) +10 other tests skip
>  * igt@kms_psr@psr-dpms:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 /
>    Intel XE#929) +92 other tests skip
>  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:shard-dg2-
>    set2: NOTRUN -> SKIP (Intel XE#1149 / Intel XE#1201) +1 other test
>    skip
>  * igt@kms_rmfb@close-fd:shard-dg2-set2: NOTRUN -> FAIL (Intel XE#294)
>    +2 other tests fail
>  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1127 / Intel XE#1201) +2 other tests skip
>  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / Intel XE#327) +9 other tests skip
>  * igt@kms_tiled_display@basic-test-pattern:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#362)
>  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:shard-dg2-
>    set2: NOTRUN -> SKIP (Intel XE#1500)
>  * igt@kms_tv_load_detect@load-detect:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#1201 / Intel XE#330)
>  * igt@kms_universal_plane@cursor-fb-leak:shard-dg2-set2: NOTRUN ->
>    FAIL (Intel XE#771 / Intel XE#899)
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:shard-dg2-
>    set2: NOTRUN -> FAIL (Intel XE#899)
>  * igt@kms_vrr@flipline:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 /
>    Intel XE#455) +93 other tests skip
>  * igt@kms_writeback@writeback-check-output-xrgb2101010:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / Intel XE#756) +2 other tests skip
>  * igt@kms_writeback@writeback-fb-id-xrgb2101010:shard-dg2-set2: NOTRUN
>    -> SKIP (Intel XE#756)
>  * igt@sriov_basic@enable-vfs-autoprobe-on:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1091 / Intel XE#1201) +3 other tests skip
>  * igt@xe_compute@ccs-mode-compute-kernel:shard-dg2-set2: NOTRUN ->
>    FAIL (Intel XE#1050) +1 other test fail
>  * igt@xe_compute_preempt@compute-preempt:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#1280 / Intel XE#455) +5 other tests
>    skip
>  * igt@xe_copy_basic@mem-copy-linear-0xfffe:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1123 / Intel XE#1201) +2 other tests skip
>  * igt@xe_copy_basic@mem-set-linear-0xfffe:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1126 / Intel XE#1201) +3 other tests skip
>  * igt@xe_evict@evict-beng-mixed-many-threads-large:shard-dg2-set2:
>    NOTRUN -> TIMEOUT (Intel XE#1041 / Intel XE#1473 / Intel XE#392) +1
>    other test timeout
>  * igt@xe_evict@evict-beng-mixed-threads-large:shard-dg2-set2: NOTRUN -
>    > TIMEOUT (Intel XE#1473 / Intel XE#392)
>  * igt@xe_evict@evict-large-multi-vm-cm:shard-dg2-set2: NOTRUN -> FAIL
>    (Intel XE#1600)
>  * igt@xe_evict@evict-mixed-threads-large:shard-dg2-set2: NOTRUN ->
>    INCOMPLETE (Intel XE#1195 / Intel XE#1473 / Intel XE#392) +1 other
>    test incomplete
>  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:shard-dg2-
>    set2: NOTRUN -> SKIP (Intel XE#288) +14 other tests skip
>  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / Intel XE#288) +126 other tests skip
>  * igt@xe_exec_reset@gt-reset-stress:shard-dg2-set2: NOTRUN -> DMESG-
>    WARN (Intel XE#1214 / Intel XE#1638)
>  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr:shard-dg2-
>    set2: NOTRUN -> INCOMPLETE (Intel XE#1169 / Intel XE#1356)
>  * igt@xe_exec_threads@threads-hang-rebind-err:shard-dg2-set2: NOTRUN -
>    > FAIL (Intel XE#1256)
>  * igt@xe_gt_freq@freq_low_max:shard-dg2-set2: NOTRUN -> FAIL (Intel
>    XE#1045 / Intel XE#1204)
>  * igt@xe_huc_copy@huc_copy:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1201 / Intel XE#255)
>  * igt@xe_media_fill@media-fill:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#560)
>  * igt@xe_mmap@small-bar:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201
>    / Intel XE#512)
>  * igt@xe_module_load@force-load:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1201 / Intel XE#378)
>  * igt@xe_module_load@reload:shard-dg2-set2: NOTRUN -> FAIL (Intel
>    XE#1132)
>  * igt@xe_pat@display-vs-wb-transient:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#1201 / Intel XE#1337)
>  * igt@xe_pat@pat-index-xe2:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1201 / Intel XE#977)
>  * igt@xe_pat@pat-index-xehpc:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1201 / Intel XE#979) +1 other test skip
>  * igt@xe_peer2peer@read:shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1173)
>    +3 other tests fail
>  * igt@xe_pm@s3-basic-exec:shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel
>    XE#1162 / Intel XE#1214) +15 other tests dmesg-warn
>  * igt@xe_pm@s3-d3cold-basic-exec:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1201 / Intel XE#366) +6 other tests skip
>  * igt@xe_pm@s3-vm-bind-prefetch:shard-dg2-set2: NOTRUN -> DMESG-WARN
>    (Intel XE#1162 / Intel XE#1551)
>  * igt@xe_pm@s3-vm-bind-unbind-all:shard-dg2-set2: NOTRUN -> DMESG-WARN
>    (Intel XE#1162 / Intel XE#1214 / Intel XE#1941)
>  * igt@xe_pm@vram-d3cold-threshold:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#1201 / Intel XE#579)
>  * igt@xe_query@multigpu-query-cs-cycles:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#1201 / Intel XE#944) +13 other tests skip
>  * igt@xe_query@multigpu-query-uc-fw-version-guc:shard-dg2-set2: NOTRUN
>    -> SKIP (Intel XE#944)
>  * igt@xe_wedged@basic-wedged:shard-dg2-set2: NOTRUN -> DMESG-WARN
>    (Intel XE#1214 / Intel XE#1760)
>  * igt@xe_wedged@wedged-at-any-timeout:shard-dg2-set2: NOTRUN -> DMESG-
>    WARN (Intel XE#1760)
> Possible fixes * igt@kms_big_fb@4-tiled-64bpp-rotate-180:{shard-lnl}: FAI=
L (Intel
>    XE#1659) -> PASS +1 other test pass
>  * igt@kms_pm_dc@dc6-psr:{shard-lnl}: FAIL (Intel XE#1430) -> PASS
>  * igt@xe_exec_fault_mode@invalid-va:{shard-lnl}: FAIL (Intel XE#1488)
>    -> PASS
>  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:{shard-lnl}:
>    ABORT (Intel XE#1761) -> PASS
> {name}: This element is suppressed. This means it is ignored when
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes * IGT: IGT_7873 -> IGTPW_11206
>  * Linux: xe-1353-abaeae202dfb4e361edd660a124e22178340725d -> xe-1374-
>    55d6179b96e0390025f2ba101c03b94b50cab7a1
> IGTPW_11206: 11206
> IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1353-abaeae202dfb4e361edd660a124e22178340725d:
> abaeae202dfb4e361edd660a124e22178340725d
> xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1:
> 55d6179b96e0390025f2ba101c03b94b50cab7a1


--=-9kZpRTEOa34VEYGxXYAA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;"><div style=3D"caret-color: rgb(0, 0, 0); color: rg=
b(0, 0, 0); font-family: Cantarell; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans:=
 auto; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: r=
gba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">=
Hi,</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font=
-family: Cantarell; font-size: 12px; font-style: normal; font-variant-caps:=
 normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; wido=
ws: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4=
); -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div><div s=
tyle=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Cantar=
ell; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; widows: auto; word-=
spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text=
-stroke-width: 0px; text-decoration: none;">This failure is not related to =
my patch. &nbsp;Can this please be re-reported?</div><div style=3D"caret-co=
lor: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Cantarell; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -w=
ebkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0=
px; text-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: Cantarell; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: auto; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tap-highl=
ight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decora=
tion: none;">Thanks!</div><div style=3D"caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0); font-family: Cantarell; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: auto; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: =
rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"=
><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); fo=
nt-family: Cantarell; font-size: 12px; font-style: normal; font-variant-cap=
s: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wi=
dows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0=
.4); -webkit-text-stroke-width: 0px; text-decoration: none;">--</div><div s=
tyle=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Cantar=
ell; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; widows: auto; word-=
spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text=
-stroke-width: 0px; text-decoration: none;">Cheers,</div><div style=3D"care=
t-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Cantarell; font-si=
ze: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; widows: auto; word-spacing: 0px=
; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-widt=
h: 0px; text-decoration: none;">Luca.</div><div><br></div><div><br></div><d=
iv>On Thu, 2024-05-30 at 10:57 +0000, Patchwork wrote:</div><blockquote typ=
e=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;paddin=
g-left:1ex"><div><b>Patch Details</b></div><div><table><tbody><tr><td><b>Se=
ries:</b></td><td>check drmModeGetConnector() return value in some missing =
places (rev4)</td></tr><tr><td><b>URL:</b></td><td><a href=3D"https://patch=
work.freedesktop.org/series/133953/">https://patchwork.freedesktop.org/seri=
es/133953/</a></td></tr><tr><td><b>State:</b></td><td>failure</td></tr> <tr=
><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11206/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_11206/index.html</a></td></tr></tbody></table> </div><h1>CI Bug Log - c=
hanges from XEIGT_7873_full -&gt; XEIGTPW_11206_full</h1><h2>Summary</h2><p=
><strong>FAILURE</strong></p><p>Serious unknown changes coming with XEIGTPW=
_11206_full absolutely need to be<br> verified manually.</p><p>If you think=
 the reported changes have nothing to do with the changes<br> introduced in=
 XEIGTPW_11206_full, please notify your bug team (I915-ci-infra@lists.freed=
esktop.org) to allow them<br> to document this new failure mode, which will=
 reduce false positives in CI.</p><h2>Participating hosts (3 -&gt; 2)</h2><=
p>Missing (1): shard-adlp </p><h2>Possible new issues</h2><p>Here are the u=
nknown changes that may have been introduced in XEIGTPW_11206_full:</p><h3>=
IGT changes</h3><h4>Possible regressions</h4><ul><li><p>igt@kms_frontbuffer=
_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p><ul><li>shard-dg2-set2: NO=
TRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206=
/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-=
blt.html">DMESG-WARN</a></li></ul></li><li><p>igt@xe_live_ktest@xe_mocs@xe_=
live_mocs_kernel_kunit:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@xe_=
live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests =
fail</li></ul></li></ul><h4>Suppressed</h4><p>The following results come fr=
om untrusted machines, tests, or statuses.<br> They do not affect the overa=
ll result.</p><ul><li>igt@kms_psr@psr-primary-page-flip@edp-1:<ul><li>{shar=
d-lnl}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_11206/shard-lnl-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">FAIL</=
a> +1 other test fail</li></ul></li></ul><h2>Known issues</h2><p>Here are t=
he changes found in XEIGTPW_11206_full that come from known issues:</p><h3>=
IGT changes</h3><h4>Issues hit</h4><ul><li><p>igt@core_setmaster@master-dro=
p-set-root:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@core_setmaster@=
master-drop-set-root.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li></ul></li><li><=
p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p><ul><li>shard-dg2-se=
t2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11206/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/623">Intel XE#623</a>)</li></ul></li><li><p>igt@kms_async_flip=
s@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p><ul><li>sha=
rd-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_11206/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip=
-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +=
23 other tests skip</li></ul></li><li><p>igt@kms_async_flips@invalid-async-=
flip:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_async_flips@inval=
id-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/873">Intel XE#873</a>)</li></ul></li><li><p>igt@kms_big_f=
b@4-tiled-8bpp-rotate-90:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-466/igt=
@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)=
 +19 other tests skip</li></ul></li><li><p>igt@kms_big_fb@x-tiled-16bpp-rot=
ate-270:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_big_fb@x-tiled=
-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li></ul></=
li><li><p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p><ul><li>shard-dg2-set2:=
 NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11=
206/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Int=
el XE#1195</a>) +2 other tests incomplete</li></ul></li><li><p>igt@kms_big_=
fb@y-tiled-addfb:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-433/igt@kms_big_f=
b@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li></ul></li><li>=
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p><ul><li>shard-dg2-=
set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11206/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li></ul></li><li=
><p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p><ul><li>shard-dg2-set2: =
NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_112=
06/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/610">Intel XE#610</a>) +1 other test skip</li></ul></li><li><p>igt@kms_b=
ig_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p><ul><li>shard-dg2-se=
t2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11206/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +50 other tests skip</li><=
/ul></li><li><p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p><ul><li>shard-=
dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11206/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
4">Intel XE#1124</a>) +5 other tests skip</li></ul></li><li><p>igt@kms_big_=
joiner@invalid-modeset:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-434/igt@kms=
_big_joiner@invalid-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li></=
ul></li><li><p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p><ul><li>s=
hard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_11206/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x10=
80p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +2 other tests skip</li></ul></li><li><p>igt=
@kms_bw@linear-tiling-4-displays-2160x1440p:</p><ul><li>shard-dg2-set2: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/=
shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/367">Intel XE#367</a>) +11 other tests skip</li></ul></li><li><p>igt@km=
s_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p><ul><li>sh=
ard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_11206/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-=
ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +447 other =
tests skip</li></ul></li><li><p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs=
:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_11206/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4=
-tiled-xe2-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +4 other tests sk=
ip</li></ul></li><li><p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-=
ccs:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@kms_ccs@crc-sprite-pla=
nes-basic-4-tiled-dg2-mc-ccs.html">TIMEOUT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1850">Intel XE#1850</a>)</li></ul></li>=
<li><p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a=
-6:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@kms_ccs@crc-sprite-plan=
es-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1713">Intel XE#1713</a>)=
</li></ul></li><li><p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pip=
e-d-dp-4:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-436/igt@kms_ccs@missing-c=
cs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) +127 other tests skip</li></ul></li><li><p>igt@kms_ccs@m=
issing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p><ul><li>shard-dg2-set2: NOTR=
UN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/s=
hard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>) +20 other tests skip</li></ul></li><li><p>igt@kms_ccs@=
missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:</p><ul><li>shard-dg2-set2: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/=
shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/787">Intel XE#787</a>) +5 other tests skip</li></ul></li><li><p>=
igt@kms_cdclk@mode-transition-all-outputs:</p><ul><li>shard-dg2-set2: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/sh=
ard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/314=
">Intel XE#314</a>)</li></ul></li><li><p>igt@kms_cdclk@mode-transition@pipe=
-c-dp-4:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_cdclk@mode-tra=
nsition@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li></ul=
></li><li><p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p><ul><li>shard-dg2-=
set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11206/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">In=
tel XE#1152</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1201">Intel XE#1201</a>) +3 other tests skip</li></ul></li><li><p>igt=
@kms_chamelium_color@ctm-red-to-blue:</p><ul><li>shard-dg2-set2: NOTRUN -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-d=
g2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel=
 XE#306</a>) +8 other tests skip</li></ul></li><li><p>igt@kms_chamelium_col=
or@gamma:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_chamelium_col=
or@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li></ul></li><li><p>igt@kms_chamelium_=
frames@hdmi-frame-dump:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms=
_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests=
 skip</li></ul></li><li><p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>=
<ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-for-=
each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +48 other tests skip</li=
></ul></li><li><p>igt@kms_content_protection@dp-mst-type-0:</p><ul><li>shar=
d-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_11206/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +4 other tests skip</li></ul></li><li><=
p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p><ul><li>shard-dg2-set2:=
 NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11=
206/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a>) +5 other tests fail</li></ul></li><li><p>igt@kms_content_=
protection@lic-type-0:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/igt@kms_=
content_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fa=
il</li></ul></li><li><p>igt@kms_content_protection@lic-type-1:</p><ul><li>s=
hard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_11206/shard-dg2-432/igt@kms_content_protection@lic-type-1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a>) +5 other tests skip</li></ul></li><li><p>igt@kms_cont=
ent_protection@uevent:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-466/igt@kms_=
content_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</=
li></ul></li><li><p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p><ul><li=
>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_11206/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x5=
12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/308">Intel XE#308</a>) +1 other test skip</li></ul></li><li><p>igt@k=
ms_cursor_crc@cursor-onscreen-512x170:</p><ul><li>shard-dg2-set2: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-=
dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">=
Intel XE#308</a>) +6 other tests skip</li></ul></li><li><p>igt@kms_cursor_e=
dge_walk@256x256-top-bottom:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/ig=
t@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) =
+2 other tests dmesg-warn</li></ul></li><li><p>igt@kms_cursor_legacy@2x-lon=
g-cursor-vs-flip-atomic:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@km=
s_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">In=
tel XE#910</a>)</li></ul></li><li><p>igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-atomic:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@kms_c=
ursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">=
Intel XE#323</a>) +4 other tests skip</li></ul></li><li><p>igt@kms_cursor_l=
egacy@basic-busy-flip-before-cursor-legacy:</p><ul><li>shard-dg2-set2: NOTR=
UN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/s=
hard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/323">Intel XE#323</a>)</li></ul></li><li><p>igt@kms_cursor_legacy@cursor-v=
s-flip-atomic-transitions:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-466/igt=
@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel =
XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/282">Intel XE#282</a>) +47 other tests dmesg-warn</li></ul></li><li><p>ig=
t@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p><ul>=
<li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_11206/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-a=
tomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">In=
tel XE#910</a>)</li></ul></li><li><p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp=
-4:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb=
-ioctl@a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li></ul=
></li><li><p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p><ul><li>shard=
-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_11206/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1927">Intel XE#1927</a>)</li></ul></li><li><p>igt@kms_dithe=
r@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p><ul><li>shard-dg2-set2: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shar=
d-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3804">i915#3804</a>)</li></ul></li><li><p>igt@kms_fbcon_fbt@psr:<=
/p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_11206/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/776">Intel XE#776</a>) +1 other test skip</li></ul></li><li><p>igt=
@kms_feature_discovery@display-3x:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-=
432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li></u=
l></li><li><p>igt@kms_feature_discovery@display-4x:</p><ul><li>shard-dg2-se=
t2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11206/shard-dg2-464/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel X=
E#1138</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201">Intel XE#1201</a>)</li></ul></li><li><p>igt@kms_feature_discovery@dp=
-mst:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@kms_feature_discovery=
@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li></ul></li><li><p>igt=
@kms_feature_discovery@psr1:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/ig=
t@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 =
other test skip</li></ul></li><li><p>igt@kms_force_connector_basic@prune-st=
ale-modes:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_force_connec=
tor_basic@prune-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li></ul></li><li>=
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p><ul><li>shard-dg2-set2: NO=
TRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206=
/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
651">Intel XE#651</a>) +151 other tests skip</li></ul></li><li><p>igt@kms_f=
rontbuffer_tracking@fbc-tiling-y:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-4=
34/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel X=
E#658</a>) +1 other test skip</li></ul></li><li><p>igt@kms_frontbuffer_trac=
king@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p><ul><li>shard-dg2-set2: NOTRUN=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/sha=
rd-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/651">Intel XE#651</a>) +18 other tests skip</li></ul></li><li><p>igt@k=
ms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p><ul><li>s=
hard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_11206/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-prim=
scrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +152 other=
 tests skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@psr-1p-primsc=
rn-shrfb-pgflip-blt:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +14 other tests skip</li></ul></li><li><p>igt@kms_getfb@getfb-reject-cc=
s:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_11206/shard-dg2-435/igt@kms_getfb@getfb-reject-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/605">Intel XE#605</a>)</li></ul></li><li><p>igt@kms_hd=
r@static-toggle-suspend@pipe-a-hdmi-a-6:</p><ul><li>shard-dg2-set2: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shar=
d-dg2-464/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel =
XE#616</a>) +18 other tests fail</li></ul></li><li><p>igt@kms_multipipe_mod=
eset@basic-max-pipe-crc-check:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/=
igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">=
Intel XE#356</a>)</li></ul></li><li><p>igt@kms_plane@plane-panning-bottom-r=
ight-suspend@pipe-b:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/igt@kms_pl=
ane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162=
</a>) +3 other tests dmesg-fail</li></ul></li><li><p>igt@kms_plane_scaling@=
intel-max-src-size@pipe-a-dp-4:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463=
/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361=
</a>) +2 other tests fail</li></ul></li><li><p>igt@kms_plane_scaling@plane-=
downscale-factor-0-25-with-modifiers:</p><ul><li>shard-dg2-set2: NOTRUN -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-d=
g2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/498">Intel XE#498</a>) +1 other test skip</li></ul></li><li><p=
>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hd=
mi-a-6:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_plane_scaling@p=
lane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE=
#498</a>) +2 other tests skip</li></ul></li><li><p>igt@kms_plane_scaling@pl=
ane-downscale-factor-0-25-with-pixel-format:</p><ul><li>shard-dg2-set2: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/=
shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-=
format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test s=
kip</li></ul></li><li><p>igt@kms_plane_scaling@plane-downscale-factor-0-25-=
with-pixel-format@pipe-c-hdmi-a-6:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-=
466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pip=
e-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</=
li></ul></li><li><p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unit=
y-scaling:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_plane_scalin=
g@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) +1 other test skip</li></ul></li><li><p>igt@kms_plane_scaling@plan=
es-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p><ul><li>shard-dg=
2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_11206/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25=
-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests sk=
ip</li></ul></li><li><p>igt@kms_plane_scaling@planes-downscale-factor-0-25@=
pipe-d-hdmi-a-6:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-434/igt@kms_plane_=
scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/305"=
>Intel XE#305</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>) +8 other tests skip</li></ul></li><li><p>igt=
@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-=
hdmi-a-6:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/igt@kms_plane_scaling=
@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/305">Intel XE#305</a>) +17 other tests skip</li></ul></li><li><p>i=
gt@kms_pm_backlight@fade-with-suspend:</p><ul><li>shard-dg2-set2: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-=
dg2-463/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel=
 XE#870</a>) +4 other tests skip</li></ul></li><li><p>igt@kms_pm_dc@dc5-psr=
:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_11206/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
9">Intel XE#1129</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a>) +1 other test skip</li></ul></li><li><p=
>igt@kms_pm_dc@dc6-dpms:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-436/igt@km=
s_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li></ul></li><li=
><p>igt@kms_psr2_su@page_flip-nv12:</p><ul><li>shard-dg2-set2: NOTRUN -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2=
-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>) +3 other tests skip</li></ul></li><li><p>igt@kms_psr@fbc-psr-sprite-r=
ender:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_psr@fbc-psr-spri=
te-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li></ul></li><li=
><p>igt@kms_psr@psr-dpms:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/igt=
@kms_psr@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +92 other tests =
skip</li></ul></li><li><p>igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-434/igt@kms_psr_stress_test=
@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)=
 +1 other test skip</li></ul></li><li><p>igt@kms_rmfb@close-fd:</p><ul><li>=
shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11206/shard-dg2-432/igt@kms_rmfb@close-fd.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#29=
4</a>) +2 other tests fail</li></ul></li><li><p>igt@kms_rotation_crc@primar=
y-yf-tiled-reflect-x-180:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-466/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a>) +2 other tests skip</li></ul></li><li><p>igt@kms_rotation_=
crc@sprite-rotation-90-pos-100-0:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-4=
66/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"=
>Intel XE#327</a>) +9 other tests skip</li></ul></li><li><p>igt@kms_tiled_d=
isplay@basic-test-pattern:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/igt=
@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</=
a>)</li></ul></li><li><p>igt@kms_tiled_display@basic-test-pattern-with-cham=
elium:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@kms_tiled_display@ba=
sic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li></ul></li>=
<li><p>igt@kms_tv_load_detect@load-detect:</p><ul><li>shard-dg2-set2: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/sh=
ard-dg2-436/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel=
 XE#330</a>)</li></ul></li><li><p>igt@kms_universal_plane@cursor-fb-leak:</=
p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_11206/shard-dg2-433/igt@kms_universal_plane@cursor-f=
b-leak.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/771">Intel XE#771</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/899">Intel XE#899</a>)</li></ul></li><li><p>igt@kms_=
universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p><ul><li>shard-dg2-set2: =
NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_112=
06/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/899">Intel XE#899</a>)</li></ul></li><li><p>igt@kms_vrr@flipline:</p><ul><=
li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_11206/shard-dg2-435/igt@kms_vrr@flipline.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
455">Intel XE#455</a>) +93 other tests skip</li></ul></li><li><p>igt@kms_wr=
iteback@writeback-check-output-xrgb2101010:</p><ul><li>shard-dg2-set2: NOTR=
UN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/s=
hard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/756">Intel XE#756</a>) +2 other tests skip</li></ul></li><li><p>ig=
t@kms_writeback@writeback-fb-id-xrgb2101010:</p><ul><li>shard-dg2-set2: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/=
shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel =
XE#756</a>)</li></ul></li><li><p>igt@sriov_basic@enable-vfs-autoprobe-on:</=
p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@sriov_basic@enable-vfs-autop=
robe-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>=
</ul></li><li><p>igt@xe_compute@ccs-mode-compute-kernel:</p><ul><li>shard-d=
g2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_11206/shard-dg2-436/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">=
Intel XE#1050</a>) +1 other test fail</li></ul></li><li><p>igt@xe_compute_p=
reempt@compute-preempt:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-435/igt@xe_=
compute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +5 other tests skip</li></ul></li><li><p>igt@xe_copy_basic@mem-=
copy-linear-0xfffe:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/igt@xe_copy=
_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2=
 other tests skip</li></ul></li><li><p>igt@xe_copy_basic@mem-set-linear-0xf=
ffe:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-433/igt@xe_copy_basic@mem-set-=
linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1126">Intel XE#1126</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests ski=
p</li></ul></li><li><p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p=
><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_11206/shard-dg2-435/igt@xe_evict@evict-beng-mixed-man=
y-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +=
1 other test timeout</li></ul></li><li><p>igt@xe_evict@evict-beng-mixed-thr=
eads-large:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/igt@xe_evict@evict-=
beng-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li></=
ul></li><li><p>igt@xe_evict@evict-large-multi-vm-cm:</p><ul><li>shard-dg2-s=
et2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_11206/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel =
XE#1600</a>)</li></ul></li><li><p>igt@xe_evict@evict-mixed-threads-large:</=
p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_11206/shard-dg2-434/igt@xe_evict@evict-mixed-threads=
-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 othe=
r test incomplete</li></ul></li><li><p>igt@xe_exec_fault_mode@twice-bindexe=
cqueue-rebind-imm:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@xe_exec_=
fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 ot=
her tests skip</li></ul></li><li><p>igt@xe_exec_fault_mode@twice-userptr-re=
bind-imm:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@xe_exec_fault_mod=
e@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +126 ot=
her tests skip</li></ul></li><li><p>igt@xe_exec_reset@gt-reset-stress:</p><=
ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11206/shard-dg2-433/igt@xe_exec_reset@gt-reset-stress.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1638">Intel XE#1638</a>)</li></ul></li><li><p>igt@xe=
_exec_threads@threads-bal-mixed-shared-vm-userptr:</p><ul><li>shard-dg2-set=
2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
11206/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1169">Intel XE#1169</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li></ul></li><li><p>igt@=
xe_exec_threads@threads-hang-rebind-err:</p><ul><li>shard-dg2-set2: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shar=
d-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#12=
56</a>)</li></ul></li><li><p>igt@xe_gt_freq@freq_low_max:</p><ul><li>shard-=
dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11206/shard-dg2-463/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1=
045</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
04">Intel XE#1204</a>)</li></ul></li><li><p>igt@xe_huc_copy@huc_copy:</p><u=
l><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_11206/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/255">Intel XE#255</a>)</li></ul></li><li><p>igt@xe_media_fill@media-=
fill:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@xe_media_fill@media-f=
ill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/560">Intel XE#560</a>)</li></ul></li><li><p>igt@xe_mmap@small-bar:<=
/p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_11206/shard-dg2-435/igt@xe_mmap@small-bar.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/512">Intel XE#512</a>)</li></ul></li><li><p>igt@xe_module_load@for=
ce-load:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-464/igt@xe_module_load@for=
ce-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li></ul></li><li><p>igt@x=
e_module_load@reload:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-434/igt@xe_mo=
dule_load@reload.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1132">Intel XE#1132</a>)</li></ul></li><li><p>igt@xe_p=
at@display-vs-wb-transient:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/igt=
@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)<=
/li></ul></li><li><p>igt@xe_pat@pat-index-xe2:</p><ul><li>shard-dg2-set2: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1120=
6/shard-dg2-435/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#97=
7</a>)</li></ul></li><li><p>igt@xe_pat@pat-index-xehpc:</p><ul><li>shard-dg=
2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_11206/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">=
Intel XE#979</a>) +1 other test skip</li></ul></li><li><p>igt@xe_peer2peer@=
read:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-434/igt@xe_peer2peer@read.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1173">Intel XE#1173</a>) +3 other tests fail</li></ul></li><li><p>igt@xe_p=
m@s3-basic-exec:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-435/igt@xe_pm@s3-b=
asic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +15 other tests =
dmesg-warn</li></ul></li><li><p>igt@xe_pm@s3-d3cold-basic-exec:</p><ul><li>=
shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11206/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/366">Intel XE#366</a>) +6 other tests skip</li></ul></li><li><p>igt@=
xe_pm@s3-vm-bind-prefetch:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt=
@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)=
</li></ul></li><li><p>igt@xe_pm@s3-vm-bind-unbind-all:</p><ul><li>shard-dg2=
-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_11206/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Int=
el XE#1162</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1941">Intel XE#1941</a>)</li></ul></li><li><p>igt@xe_pm@=
vram-d3cold-threshold:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-463/igt@xe_p=
m@vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li></ul><=
/li><li><p>igt@xe_query@multigpu-query-cs-cycles:</p><ul><li>shard-dg2-set2=
: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
1206/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
944">Intel XE#944</a>) +13 other tests skip</li></ul></li><li><p>igt@xe_que=
ry@multigpu-query-uc-fw-version-guc:</p><ul><li>shard-dg2-set2: NOTRUN -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg=
2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</=
a>)</li></ul></li><li><p>igt@xe_wedged@basic-wedged:</p><ul><li>shard-dg2-s=
et2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_11206/shard-dg2-435/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1=
214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
60">Intel XE#1760</a>)</li></ul></li><li><p>igt@xe_wedged@wedged-at-any-tim=
eout:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11206/shard-dg2-432/igt@xe_wedged@wedged-at-a=
ny-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li></ul></li></ul><h4>Possib=
le fixes</h4><ul><li><p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p><ul><li=
>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7873=
/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#165=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_112=
06/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> +1 ot=
her test pass</li></ul></li><li><p>igt@kms_pm_dc@dc6-psr:</p><ul><li>{shard=
-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7873/shard-=
lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11206/shard-lnl-3/igt@kms_pm=
_dc@dc6-psr.html">PASS</a></li></ul></li><li><p>igt@xe_exec_fault_mode@inva=
lid-va:</p><ul><li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7873/shard-lnl-1/igt@xe_exec_fault_mode@invalid-va.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488">=
Intel XE#1488</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_11206/shard-lnl-5/igt@xe_exec_fault_mode@invalid-va.html">PASS</a>=
</li></ul></li><li><p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:<=
/p><ul><li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7873/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1761">Intel XE#1761</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11206/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-i=
nvalidate-race.html">PASS</a></li></ul></li></ul><p>{name}: This element is=
 suppressed. This means it is ignored when computing<br> the status of the =
difference (SUCCESS, WARNING, or FAILURE).</p><h2>Build changes</h2><ul><li=
>IGT: IGT_7873 -&gt; IGTPW_11206</li><li>Linux: xe-1353-abaeae202dfb4e361ed=
d660a124e22178340725d -&gt; xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a=
1</li></ul><p>IGTPW_11206: 11206<br> IGT_7873: b9bcded9123ac56ce05748de6c48=
70fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br> xe-=
1353-abaeae202dfb4e361edd660a124e22178340725d: abaeae202dfb4e361edd660a124e=
22178340725d<br> xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1: 55d6179b=
96e0390025f2ba101c03b94b50cab7a1</p></blockquote><div><br></div><div><span>=
</span></div></body></html>

--=-9kZpRTEOa34VEYGxXYAA--
