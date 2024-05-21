Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6ABC25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 07:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BB910E0A6;
	Tue, 21 May 2024 07:51:16 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A465410E0A6
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 07:51:13 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1s9KH6-000000016h1-1bQR; Tue, 21 May 2024 10:51:10 +0300
Message-ID: <40cd05061aaf28d5fb57d902102ca492e428bf49.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: igt-dev@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Tue, 21 May 2024 10:51:07 +0300
In-Reply-To: <171622391642.2160880.8835794505206307098@8e613ede5ea5>
References: <20240520092216.150083-1-luciano.coelho@intel.com>
 <171622391642.2160880.8835794505206307098@8e613ede5ea5>
Content-Type: multipart/alternative; boundary="=-ZWXPVO/RIjBtPuwAaKaO"
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: =?UTF-8?Q?=E2=9C=97?= CI.xeFULL: failure for lib/igt_kms: add
 retry loop in igt_enable_connectors() (rev3)
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

--=-ZWXPVO/RIjBtPuwAaKaO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These failures are not related to this patchseries, since the new code
doesn't even run in these tests.

--
Cheers,
Luca.

On Mon, 2024-05-20 at 16:51 +0000, Patchwork wrote:
> Patch Details
> Series:lib/igt_kms: add retry loop in igt_enable_connectors() (rev3)
> URL:https://patchwork.freedesktop.org/series/133597/
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/index.html
> CI Bug Log - changes from XEIGT_7864_full -> XEIGTPW_11160_fullSummaryWAR=
NING
> Minor unknown changes coming with XEIGTPW_11160_full need to be
> verified
> manually.
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11160_full, please notify your bug team (I915-
> ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Participating hosts (3 -> 2)Missing (1): shard-adlp=20
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> XEIGTPW_11160_full:
> IGT changesWarnings * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-=
ccs:shard-dg2-
>    set2: TIMEOUT (Intel XE#1850) -> INCOMPLETE
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-
>    a-6:shard-dg2-set2: TIMEOUT (Intel XE#1713) -> INCOMPLETE
> SuppressedThe following results come from untrusted machines, tests, or
> statuses.
> They do not affect the overall result.
>  * igt@kms_properties@connector-properties-legacy:{shard-lnl}: PASS ->
>    INCOMPLETE
>  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:{shard-lnl}: PASS -> FAIL +3
>    other tests fail
>  * igt@xe_exec_threads@threads-hang-rebind-err:{shard-lnl}: PASS ->
>    ABORT
>  * igt@xe_gt_freq@freq_reset_multiple:{shard-lnl}: NOTRUN -> DMESG-WARN
> Known issuesHere are the changes found in XEIGTPW_11160_full that come fr=
om known
> issues:
> IGT changesIssues hit * igt@core_hotunplug@hotrebind:shard-dg2-set2: NOTR=
UN -> DMESG-FAIL
>    (Intel XE#1548)
>  * igt@kms_big_fb@linear-64bpp-rotate-270:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#316)
>  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1124 / Intel XE#1201)
>  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / Intel XE#367)
>  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:shard-dg2-
>    set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455 / Intel XE#787)
>    +2 other tests skip
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-
>    hdmi-a-6:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel
>    XE#787) +13 other tests skip
>  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:shard-dg2-set2: NOTRUN -
>    > SKIP (Intel XE#1201 / Intel XE#1252)
>  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:shard-dg2-set2:
>    NOTRUN -> SKIP (Intel XE#1201 / Intel XE#373) +1 other test skip
>  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:shard-dg2-
>    set2: PASS -> DMESG-WARN (Intel XE#1214 / Intel XE#282) +7 other
>    tests dmesg-warn
>  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:shard-dg2-set2:
>    NOTRUN -> DMESG-WARN (Intel XE#1214 / Intel XE#282)
>  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:shard-dg2-
>    set2: PASS -> DMESG-WARN (Intel XE#282)
>  * igt@kms_feature_discovery@psr1:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1135 / Intel XE#1201)
>  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:shard-
>    dg2-set2: PASS -> DMESG-WARN (Intel XE#1162) +1 other test dmesg-
>    warn
>  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@bd-hdmi-a6-
>    dp4:shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1195) +1 other test
>    incomplete
>  * igt@kms_frontbuffer_tracking@drrs-slowdraw:shard-dg2-set2: NOTRUN ->
>    SKIP (Intel XE#1201 / Intel XE#651) +4 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-
>    move:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651)
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-
>    onoff:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +1 other test
>    skip
>  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:shard-
>    dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#653) +1 other
>    test skip
>  * igt@kms_hdmi_inject@inject-audio:shard-dg2-set2: PASS -> SKIP (Intel
>    XE#1201 / Intel XE#417)
>  * igt@kms_hdr@invalid-hdr:shard-dg2-set2: PASS -> SKIP (Intel XE#1201
>    / Intel XE#455)
>  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:shard-dg2-set2:
>    NOTRUN -> FAIL (Intel XE#616)
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-
>    6:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#305) +2
>    other tests skip
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-
>    6:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#305 /
>    Intel XE#455) +1 other test skip
>  * igt@kms_pm_backlight@fade-with-dpms:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#870)
>  * igt@kms_properties@get_properties-sanity-atomic:shard-dg2-set2: PASS
>    -> SKIP (Intel XE#1201) +1 other test skip
>  * igt@kms_psr@fbc-psr2-suspend:shard-dg2-set2: NOTRUN -> SKIP (Intel
>    XE#1201 / Intel XE#929) +2 other tests skip
>  * igt@kms_universal_plane@cursor-fb-leak:shard-dg2-set2: PASS -> FAIL
>    (Intel XE#771 / Intel XE#899)
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:shard-dg2-
>    set2: PASS -> FAIL (Intel XE#899) +1 other test fail
>  * igt@xe_evict@evict-beng-mixed-threads-large:shard-dg2-set2: PASS ->
>    TIMEOUT (Intel XE#1473 / Intel XE#392)
>  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-
>    imm:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#288) +5
>    other tests skip
>  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-
>    prefetch:shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288)
>  * igt@xe_exec_threads@threads-hang-fd-userptr:shard-dg2-set2: PASS ->
>    DMESG-WARN (Intel XE#358)
>  * igt@xe_pm@s3-vm-bind-prefetch:shard-dg2-set2: PASS -> DMESG-WARN
>    (Intel XE#1162 / Intel XE#1551)
>  * igt@xe_pm@s3-vm-bind-unbind-all:shard-dg2-set2: PASS -> DMESG-WARN
>    (Intel XE#1162 / Intel XE#1214) +2 other tests dmesg-warn
>  * igt@xe_pm@s4-basic:shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1162
>    / Intel XE#1214 / Intel XE#1551)
>  * igt@xe_query@multigpu-query-engines:shard-dg2-set2: NOTRUN -> SKIP
>    (Intel XE#1201 / Intel XE#944)
> Possible fixes * igt@core_setmaster@master-drop-set-user:shard-dg2-set2: =
DMESG-WARN
>    (Intel XE#1162) -> PASS +2 other tests pass
>  * igt@kms_addfb_basic@bo-too-small:shard-dg2-set2: SKIP (Intel XE#1201
>    / i915#6077) -> PASS
>  * igt@kms_atomic@atomic-invalid-params:{shard-lnl}: FAIL -> PASS
>  * igt@kms_cursor_crc@cursor-offscreen-64x64:shard-dg2-set2: SKIP
>    (Intel XE#1201 / Intel XE#1226) -> PASS
>  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:shard-dg2-set2:
>    DMESG-WARN (Intel XE#1214 / Intel XE#282 / Intel XE#910) -> PASS +2
>    other tests pass
>  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:shard-dg2-set2: DMESG-
>    WARN (Intel XE#282) -> PASS
>  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:shard-dg2-set2:
>    DMESG-WARN (Intel XE#1214 / Intel XE#282) -> PASS +2 other tests
>    pass
>  * igt@kms_flip@2x-flip-vs-panning:shard-dg2-set2: DMESG-WARN (Intel
>    XE#1214 / Intel XE#877) -> PASS
>  * igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4:shard-dg2-set2:
>    DMESG-WARN (Intel XE#1214) -> PASS
>  * igt@kms_flip@flip-vs-suspend:shard-dg2-set2: INCOMPLETE (Intel
>    XE#1195) -> PASS +1 other test pass
>  * igt@kms_flip@plain-flip-ts-check@a-edp1:{shard-lnl}: FAIL (Intel
>    XE#480 / Intel XE#886) -> PASS +1 other test pass
>  * igt@kms_flip@wf_vblank-ts-check-interruptible:{shard-lnl}: SKIP
>    (Intel XE#1733) -> PASS +2 other tests pass
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-
>    render:{shard-lnl}: SKIP (Intel XE#1134) -> PASS
>  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:shard-dg2-set2:
>    SKIP (Intel XE#1201 / Intel XE#829) -> PASS +1 other test pass
>  * igt@kms_pm_dc@dc5-dpms:{shard-lnl}: FAIL (Intel XE#718) -> PASS
>  * igt@kms_pm_rpm@system-suspend-modeset:shard-dg2-set2: DMESG-WARN ->
>    PASS +1 other test pass{shard-lnl}: DMESG-WARN (Intel XE#1830) ->
>    PASS +2 other tests pass
>  * igt@kms_vblank@query-forked-busy:{shard-lnl}: INCOMPLETE -> PASS
>  * igt@xe_evict@evict-mixed-threads-large:shard-dg2-set2: INCOMPLETE
>    (Intel XE#1473 / Intel XE#392) -> PASS
>  * igt@xe_exec_store@basic-all:{shard-lnl}: SKIP (Intel XE#1699) ->
>    PASS +7 other tests pass
>  * igt@xe_intel_bb@blit-simple:{shard-lnl}: INCOMPLETE (Intel XE#1330)
>    -> PASS
>  * igt@xe_pat@pat-index-all:{shard-lnl}: SKIP (Intel XE#1130 / Intel
>    XE#1699) -> PASS +3 other tests pass
>  * igt@xe_pm@s3-basic-exec:shard-dg2-set2: DMESG-WARN (Intel XE#1162 /
>    Intel XE#1214) -> PASS +4 other tests pass
> Warnings * igt@kms_big_fb@4-tiled-32bpp-rotate-90:shard-dg2-set2: SKIP (I=
ntel
>    XE#1201 / Intel XE#316) -> SKIP (Intel XE#316) +1 other test skip
>  * igt@kms_big_fb@linear-8bpp-rotate-270:shard-dg2-set2: SKIP (Intel
>    XE#316) -> SKIP (Intel XE#1201 / Intel XE#316) +2 other tests skip
>  * igt@kms_big_fb@y-tiled-addfb-size-overflow:shard-dg2-set2: SKIP
>    (Intel XE#610) -> SKIP (Intel XE#1201 / Intel XE#610)
>  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:shard-
>    dg2-set2: SKIP (Intel XE#1124 / Intel XE#1201) -> SKIP (Intel
>    XE#1124) +6 other tests skip
>  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:shard-dg2-set2: SKIP
>    (Intel XE#1201 / Intel XE#610) -> SKIP (Intel XE#610)
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:shard-
>    dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#1124 / Intel
>    XE#1201) +6 other tests skip
>  * igt@kms_big_joiner@invalid-modeset:shard-dg2-set2: SKIP (Intel
>    XE#346) -> SKIP (Intel XE#1201 / Intel XE#346)
>  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:shard-dg2-set2: SKIP
>    (Intel XE#1201 / Intel XE#367) -> SKIP (Intel XE#367) +2 other tests
>    skip
>  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:shard-dg2-set2:
>    SKIP (Intel XE#1201 / Intel XE#455 / Intel XE#787) -> SKIP (Intel
>    XE#455 / Intel XE#787) +15 other tests skip
>  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-
>    4:shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>    XE#1201 / Intel XE#455 / Intel XE#787) +21 other tests skip
>  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-
>    4:shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#787) -> SKIP (Intel
>    XE#787) +55 other tests skip
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:shard-dg2-
>    set2: SKIP (Intel XE#1201 / Intel XE#829) -> SKIP (Intel XE#1201 /
>    Intel XE#455 / Intel XE#787)
>  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-
>    hdmi-a-6:shard-dg2-set2: SKIP (Intel XE#787) -> SKIP (Intel XE#1201
>    / Intel XE#787) +76 other tests skip
>  * igt@kms_cdclk@mode-transition-all-outputs:shard-dg2-set2: SKIP
>    (Intel XE#1201 / Intel XE#314) -> SKIP (Intel XE#314)
>  * igt@kms_chamelium_color@ctm-red-to-blue:shard-dg2-set2: SKIP (Intel
>    XE#1201 / Intel XE#306) -> SKIP (Intel XE#306)
>  * igt@kms_chamelium_color@gamma:shard-dg2-set2: SKIP (Intel XE#306) ->
>    SKIP (Intel XE#1201 / Intel XE#306)
>  * igt@kms_chamelium_frames@vga-frame-dump:shard-dg2-set2: SKIP (Intel
>    XE#1201 / Intel XE#373) -> SKIP (Intel XE#373) +6 other tests skip
>  * igt@kms_chamelium_hpd@hdmi-hpd:shard-dg2-set2: SKIP (Intel XE#373) -
>    > SKIP (Intel XE#1201 / Intel XE#373) +6 other tests skip
>  * igt@kms_cursor_crc@cursor-onscreen-512x512:shard-dg2-set2: SKIP
>    (Intel XE#308) -> SKIP (Intel XE#1201 / Intel XE#308) +1 other test
>    skip
>  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:shard-
>    dg2-set2: DMESG-WARN (Intel XE#282) -> DMESG-WARN (Intel XE#1214 /
>    Intel XE#282) +3 other tests dmesg-warn
>  * igt@kms_cursor_edge_walk@256x256-top-edge:shard-dg2-set2: DMESG-WARN
>    (Intel XE#1214 / Intel XE#282) -> DMESG-WARN (Intel XE#282) +5 other
>    tests dmesg-warn
>  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:shard-
>    dg2-set2: SKIP (Intel XE#323) -> SKIP (Intel XE#1201 / Intel XE#323)
>  * igt@kms_cursor_legacy@single-move:shard-dg2-set2: DMESG-WARN (Intel
>    XE#1214 / Intel XE#282 / Intel XE#877) -> SKIP (Intel XE#1201)
>  * igt@kms_feature_discovery@display-3x:shard-dg2-set2: SKIP (Intel
>    XE#703) -> SKIP (Intel XE#1201 / Intel XE#703)
>  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-
>    wc:shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#1201 /
>    Intel XE#651) +17 other tests skip
>  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-
>    blt:shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>    (Intel XE#1201 / Intel XE#651)
>  * igt@kms_frontbuffer_tracking@drrs-suspend:shard-dg2-set2: SKIP
>    (Intel XE#1201 / Intel XE#651) -> SKIP (Intel XE#651) +18 other
>    tests skip
>  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-
>    blt:shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#651) -> SKIP
>    (Intel XE#1201)
>  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:shard-dg2-set2: SKIP
>    (Intel XE#658) -> SKIP (Intel XE#1201 / Intel XE#658)
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-
>    render:shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#653) -> SKIP
>    (Intel XE#653) +16 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>    blt:shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#1201 /
>    Intel XE#653) +21 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-
>    blt:shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>    (Intel XE#1201 / Intel XE#653)
>  * igt@kms_getfb@getfb-reject-ccs:shard-dg2-set2: SKIP (Intel XE#1201 /
>    Intel XE#605) -> SKIP (Intel XE#605)
>  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:shard-dg2-set2:
>    SKIP (Intel XE#356) -> SKIP (Intel XE#1201 / Intel XE#356)
>  * igt@kms_plane_multiple@tiling-y:shard-dg2-set2: SKIP (Intel XE#455)
>    -> SKIP (Intel XE#1201 / Intel XE#455) +7 other tests skip
>  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-
>    format:shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#904 /
>    Intel XE#909) -> TIMEOUT (Intel XE#380 / Intel XE#904 / Intel
>    XE#909)
>  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-
>    format@pipe-a-hdmi-a-6:shard-dg2-set2: INCOMPLETE (Intel XE#1195 /
>    Intel XE#904 / Intel XE#909) -> TIMEOUT (Intel XE#904 / Intel
>    XE#909)
>  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-
>    formats:shard-dg2-set2: INCOMPLETE (Intel XE#909) -> INCOMPLETE
>    (Intel XE#1195 / Intel XE#909)
>  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-
>    formats@pipe-a-hdmi-a-6:shard-dg2-set2: INCOMPLETE (Intel XE#904 /
>    Intel XE#909) -> INCOMPLETE (Intel XE#1195 / Intel XE#904 / Intel
>    XE#909)
>  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-
>    25:shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#305 / Intel
>    XE#455) -> SKIP (Intel XE#305 / Intel XE#455)
>  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-
>    25@pipe-c-hdmi-a-6:shard-dg2-set2: SKIP (Intel XE#1201 / Intel
>    XE#305) -> SKIP (Intel XE#305) +2 other tests skip
>  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-
>    25@pipe-d-hdmi-a-6:shard-dg2-set2: SKIP (Intel XE#1201 / Intel
>    XE#455) -> SKIP (Intel XE#455) +7 other tests skip
>  * igt@kms_psr2_su@page_flip-nv12:shard-dg2-set2: SKIP (Intel XE#1122 /
>    Intel XE#1201) -> SKIP (Intel XE#1122)
>  * igt@kms_psr2_su@page_flip-p010:shard-dg2-set2: SKIP (Intel XE#1122)
>    -> SKIP (Intel XE#1122 / Intel XE#1201)
>  * igt@kms_psr@fbc-pr-cursor-plane-move:shard-dg2-set2: SKIP (Intel
>    XE#929) -> SKIP (Intel XE#1201 / Intel XE#929) +11 other tests skip
>  * igt@kms_psr@fbc-psr-basic:shard-dg2-set2: SKIP (Intel XE#1201 /
>    Intel XE#929) -> SKIP (Intel XE#1201)
>  * igt@kms_psr@fbc-psr2-primary-blt:shard-dg2-set2: SKIP (Intel XE#1201
>    / Intel XE#929) -> SKIP (Intel XE#929) +10 other tests skip
>  * igt@kms_psr@fbc-psr2-primary-page-flip:shard-dg2-set2: SKIP (Intel
>    XE#1201 / Intel XE#1226) -> SKIP (Intel XE#1201 / Intel XE#929) +1
>    other test skip
>  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:shard-dg2-
>    set2: SKIP (Intel XE#1149 / Intel XE#1201) -> SKIP (Intel XE#1149)
>  * igt@kms_rotation_crc@bad-pixel-format:shard-dg2-set2: SKIP (Intel
>    XE#1201 / Intel XE#327) -> SKIP (Intel XE#327)
>  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:shard-dg2-set2:
>    SKIP (Intel XE#327) -> SKIP (Intel XE#1201 / Intel XE#327) +1 other
>    test skip
>  * igt@kms_writeback@writeback-check-output-xrgb2101010:shard-dg2-set2:
>    SKIP (Intel XE#1201 / Intel XE#756) -> SKIP (Intel XE#756)
>  * igt@sriov_basic@enable-vfs-bind-unbind-each:shard-dg2-set2: SKIP
>    (Intel XE#1091) -> SKIP (Intel XE#1091 / Intel XE#1201)
>  * igt@xe_evict@evict-beng-large-multi-vm-cm:shard-dg2-set2: FAIL
>    (Intel XE#1600) -> FAIL (Intel XE#1041)
>  * igt@xe_evict@evict-mixed-many-threads-large:shard-dg2-set2: TIMEOUT
>    (Intel XE#1041 / Intel XE#1473 / Intel XE#392) -> INCOMPLETE (Intel
>    XE#1195 / Intel XE#1473 / Intel XE#392)
>  * igt@xe_exec_fault_mode@once-rebind-prefetch:shard-dg2-set2: SKIP
>    (Intel XE#288) -> SKIP (Intel XE#1201 / Intel XE#288) +16 other
>    tests skip
>  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:shard-dg2-set2: SKIP
>    (Intel XE#1201 / Intel XE#288) -> SKIP (Intel XE#288) +16 other
>    tests skip
>  * igt@xe_exec_reset@gt-reset-stress:shard-dg2-set2: INCOMPLETE (Intel
>    XE#1195) -> DMESG-WARN (Intel XE#1638)
>  * igt@xe_media_fill@media-fill:shard-dg2-set2: SKIP (Intel XE#560) ->
>    SKIP (Intel XE#1201 / Intel XE#560)
>  * igt@xe_pat@display-vs-wb-transient:shard-dg2-set2: SKIP (Intel
>    XE#1201 / Intel XE#1337) -> SKIP (Intel XE#1337)
>  * igt@xe_pm@d3cold-basic:shard-dg2-set2: SKIP (Intel XE#1201 / Intel
>    XE#366) -> SKIP (Intel XE#366)
>  * igt@xe_pm@s3-vm-bind-userptr:shard-dg2-set2: DMESG-WARN (Intel
>    XE#1162 / Intel XE#1214) -> DMESG-WARN (Intel XE#1162)
>  * igt@xe_pm@s4-d3cold-basic-exec:shard-dg2-set2: SKIP (Intel XE#366) -
>    > SKIP (Intel XE#1201 / Intel XE#366)
>  * igt@xe_query@multigpu-query-config:shard-dg2-set2: SKIP (Intel
>    XE#944) -> SKIP (Intel XE#1201 / Intel XE#944) +1 other test skip
>  * igt@xe_query@multigpu-query-mem-usage:shard-dg2-set2: SKIP (Intel
>    XE#1201 / Intel XE#944) -> SKIP (Intel XE#944)
> {name}: This element is suppressed. This means it is ignored when
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes * IGT: IGT_7864 -> IGTPW_11160
> IGTPW_11160: 11160
> IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1310-1ba62f8cea9c797427d45108df1d453f4b343240:
> 1ba62f8cea9c797427d45108df1d453f4b343240


--=-ZWXPVO/RIjBtPuwAaKaO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body><div>These failures are not related to this patchseries, since the ne=
w code doesn't even run in these tests.</div><div><br></div><div>--</div><d=
iv>Cheers,</div><div>Luca.</div><div><br></div><div>On Mon, 2024-05-20 at 1=
6:51 +0000, Patchwork wrote:</div><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><b>Patch =
Details</b></div><div><table><tbody><tr><td><b>Series:</b></td><td>lib/igt_=
kms: add retry loop in igt_enable_connectors() (rev3)</td></tr><tr><td><b>U=
RL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/series/133597/=
">https://patchwork.freedesktop.org/series/133597/</a></td></tr><tr><td><b>=
State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td><td><a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/index.html">http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/index.html</a></td></tr><=
/tbody></table> </div><h1>CI Bug Log - changes from XEIGT_7864_full -&gt; X=
EIGTPW_11160_full</h1><h2>Summary</h2><p><strong>WARNING</strong></p><p>Min=
or unknown changes coming with XEIGTPW_11160_full need to be verified<br> m=
anually.</p><p>If you think the reported changes have nothing to do with th=
e changes<br> introduced in XEIGTPW_11160_full, please notify your bug team=
 (I915-ci-infra@lists.freedesktop.org) to allow them<br> to document this n=
ew failure mode, which will reduce false positives in CI.</p><h2>Participat=
ing hosts (3 -&gt; 2)</h2><p>Missing (1): shard-adlp </p><h2>Possible new i=
ssues</h2><p>Here are the unknown changes that may have been introduced in =
XEIGTPW_11160_full:</p><h3>IGT changes</h3><h4>Warnings</h4><ul><li><p>igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p><ul><li>shard-dg2-se=
t2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2=
-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1850">In=
tel XE#1850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11160/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-=
mc-ccs.html">INCOMPLETE</a></li></ul></li><li><p>igt@kms_ccs@crc-sprite-pla=
nes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p><ul><li>shard-dg2-set2: <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/i=
gt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1713">Intel XE#1713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-=
tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a></li></ul></li></ul><h=
4>Suppressed</h4><p>The following results come from untrusted machines, tes=
ts, or statuses.<br> They do not affect the overall result.</p><ul><li><p>i=
gt@kms_properties@connector-properties-legacy:</p><ul><li>{shard-lnl}: <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@k=
ms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-lnl-3/igt@kms_pr=
operties@connector-properties-legacy.html">INCOMPLETE</a></li></ul></li><li=
><p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p><ul><li>{shard-lnl}: <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_psr@=
fbc-psr2-no-drrs@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11160/shard-lnl-2/igt@kms_psr@fbc-psr2-no-drrs@=
edp-1.html">FAIL</a> +3 other tests fail</li></ul></li><li><p>igt@xe_exec_t=
hreads@threads-hang-rebind-err:</p><ul><li>{shard-lnl}: <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@xe_exec_threads@=
threads-hang-rebind-err.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11160/shard-lnl-7/igt@xe_exec_threads@threads-=
hang-rebind-err.html">ABORT</a></li></ul></li><li><p>igt@xe_gt_freq@freq_re=
set_multiple:</p><ul><li>{shard-lnl}: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-lnl-3/igt@xe_gt_freq@freq_re=
set_multiple.html">DMESG-WARN</a></li></ul></li></ul><h2>Known issues</h2><=
p>Here are the changes found in XEIGTPW_11160_full that come from known iss=
ues:</p><h3>IGT changes</h3><h4>Issues hit</h4><ul><li><p>igt@core_hotunplu=
g@hotrebind:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@core_hotunplug=
@hotrebind.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li></ul></li><li><p>igt@kms_=
big_fb@linear-64bpp-rotate-270:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432=
/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li></ul=
></li><li><p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p><ul><li>shard-dg2-=
set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11160/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">In=
tel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1201">Intel XE#1201</a>)</li></ul></li><li><p>igt@kms_bw@linear-tilin=
g-2-displays-2560x1440p:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-434/igt@km=
s_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#36=
7</a>)</li></ul></li><li><p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mt=
l-rc-ccs:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-466/igt@kms_ccs@crc-prima=
ry-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) +2 other tests skip</li></ul></li><li><p>igt@kms_ccs@crc-sprit=
e-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p><ul><li>shard-dg2-=
set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11160/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-c=
cs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other te=
sts skip</li></ul></li><li><p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:<=
/p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_11160/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-xe2-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li></ul></li><li><=
p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p><ul><li>shard-dg2=
-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_11160/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li></ul></li>=
<li><p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p><ul><li>=
shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_78=
64/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11160/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transiti=
ons.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +7 other tests dmesg-war=
n</li></ul></li><li><p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</=
p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_11160/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-=
flip-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li></ul><=
/li><li><p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p><u=
l><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_7864/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_11160/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-atomi=
c-transitions.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/282">Intel XE#282</a>)</li></ul></li><li><p>igt@kms=
_feature_discovery@psr1:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-463/igt@km=
s_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li></u=
l></li><li><p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:=
</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_7864/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@=
ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-int=
erruptible@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test =
dmesg-warn</li></ul></li><li><p>igt@kms_flip@2x-modeset-vs-vblank-race-inte=
rruptible@bd-hdmi-a6-dp4:</p><ul><li>shard-dg2-set2: <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_flip@2x-modes=
et-vs-vblank-race-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-433/igt=
@kms_flip@2x-modeset-vs-vblank-race-interruptible@bd-hdmi-a6-dp4.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1195">Intel XE#1195</a>) +1 other test incomplete</li></ul></li><li><p>igt@=
kms_frontbuffer_tracking@drrs-slowdraw:</p><ul><li>shard-dg2-set2: NOTRUN -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard=
-dg2-463/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">=
Intel XE#651</a>) +4 other tests skip</li></ul></li><li><p>igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p><ul><li>shard-dg2-set2:=
 NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11=
160/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/651">Intel XE#651</a>)</li></ul></li><li><p>igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p><ul><li>shard-dg2-set2: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/=
shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/653">Intel XE#653</a>) +1 other test skip</li></ul></li><li><p>igt@k=
ms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p><ul><li>shard-=
dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11160/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shr=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</=
li></ul></li><li><p>igt@kms_hdmi_inject@inject-audio:</p><ul><li>shard-dg2-=
set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-d=
g2-463/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-463/igt@kms_hd=
mi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li></ul></=
li><li><p>igt@kms_hdr@invalid-hdr:</p><ul><li>shard-dg2-set2: <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_11160/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>)</li></ul></li><li><p>igt@kms_hdr@static-toggle-s=
uspend@pipe-a-hdmi-a-6:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-466/igt@kms=
_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li><=
/ul></li><li><p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-h=
dmi-a-6:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-466/igt@kms_plane_scaling@=
planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel X=
E#305</a>) +2 other tests skip</li></ul></li><li><p>igt@kms_plane_scaling@p=
lanes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p><ul><li>shard-dg2-set2: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/=
shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdm=
i-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test sk=
ip</li></ul></li><li><p>igt@kms_pm_backlight@fade-with-dpms:</p><ul><li>sha=
rd-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_11160/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">=
Intel XE#870</a>)</li></ul></li><li><p>igt@kms_properties@get_properties-sa=
nity-atomic:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_properties@get_properties-=
sanity-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_11160/shard-dg2-466/igt@kms_properties@get_properties-sa=
nity-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li></ul></li><=
li><p>igt@kms_psr@fbc-psr2-suspend:</p><ul><li>shard-dg2-set2: NOTRUN -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2=
-436/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) =
+2 other tests skip</li></ul></li><li><p>igt@kms_universal_plane@cursor-fb-=
leak:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGT_7864/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11160/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/899">Intel XE#899</a>)</li></ul></li><li><p>igt@kms_universal_plane@curs=
or-fb-leak@pipe-d-hdmi-a-6:</p><ul><li>shard-dg2-set2: <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_universal_p=
lane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_univer=
sal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 othe=
r test fail</li></ul></li><li><p>igt@xe_evict@evict-beng-mixed-threads-larg=
e:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_7864/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_11160/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/392">Intel XE#392</a>)</li></ul></li><li><p>igt@xe_exec_faul=
t_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p><ul><li>shard-d=
g2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_11160/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqu=
eue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other te=
sts skip</li></ul></li><li><p>igt@xe_exec_fault_mode@twice-bindexecqueue-us=
erptr-invalidate-prefetch:</p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt=
@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
">Intel XE#288</a>)</li></ul></li><li><p>igt@xe_exec_threads@threads-hang-f=
d-userptr:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-=
userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11160/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userpt=
r.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/358">Intel XE#358</a>)</li></ul></li><li><p>igt@xe_pm@s3-vm-bin=
d-prefetch:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
11160/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#=
1162</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
551">Intel XE#1551</a>)</li></ul></li><li><p>igt@xe_pm@s3-vm-bind-unbind-al=
l:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_7864/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/s=
hard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"=
>Intel XE#1214</a>) +2 other tests dmesg-warn</li></ul></li><li><p>igt@xe_p=
m@s4-basic:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGT_7864/shard-dg2-463/igt@xe_pm@s4-basic.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard=
-dg2-434/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Int=
el XE#1551</a>)</li></ul></li><li><p>igt@xe_query@multigpu-query-engines:</=
p><ul><li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_11160/shard-dg2-434/igt@xe_query@multigpu-query-engi=
nes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>)</li></ul></li></ul><h4>Possibl=
e fixes</h4><ul><li><p>igt@core_setmaster@master-drop-set-user:</p><ul><li>=
shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_78=
64/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">In=
tel XE#1162</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11160/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">PA=
SS</a> +2 other tests pass</li></ul></li><li><p>igt@kms_addfb_basic@bo-too-=
small:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_7864/shard-dg2-433/igt@kms_addfb_basic@bo-too-small.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6077">i915#6077</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_11160/shard-dg2-434/igt@kms_addfb_basic@bo-too-sm=
all.html">PASS</a></li></ul></li><li><p>igt@kms_atomic@atomic-invalid-param=
s:</p><ul><li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_7864/shard-lnl-5/igt@kms_atomic@atomic-invalid-params.html">FAIL</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/s=
hard-lnl-6/igt@kms_atomic@atomic-invalid-params.html">PASS</a></li></ul></l=
i><li><p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p><ul><li>shard-dg2-se=
t2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2=
-433/igt@kms_cursor_crc@cursor-offscreen-64x64.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Inte=
l XE#1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_11160/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-64x64.html">PA=
SS</a></li></ul></li><li><p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:=
</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_7864/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-463/igt=
@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> +2 other tests p=
ass</li></ul></li><li><p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p><u=
l><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_7864/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/282">Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_11160/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-ato=
mic.html">PASS</a></li></ul></li><li><p>igt@kms_cursor_legacy@flip-vs-curso=
r-varying-size:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGT_7864/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-c=
ursor-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-433=
/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> +2 other =
tests pass</li></ul></li><li><p>igt@kms_flip@2x-flip-vs-panning:</p><ul><li=
>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7=
864/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#=
1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
77">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_11160/shard-dg2-434/igt@kms_flip@2x-flip-vs-panning.html">PASS<=
/a></li></ul></li><li><p>igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4:</p=
><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_7864/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1214">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_11160/shard-dg2-434/igt@kms_flip@2x-flip-vs-panning@=
ac-hdmi-a6-dp4.html">PASS</a></li></ul></li><li><p>igt@kms_flip@flip-vs-sus=
pend:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGT_7864/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
95">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11160/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">PASS</a=
> +1 other test pass</li></ul></li><li><p>igt@kms_flip@plain-flip-ts-check@=
a-edp1:</p><ul><li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7864/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
480">Intel XE#480</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_11160/shard-lnl-1/igt@kms_flip@plain-flip-ts-check=
@a-edp1.html">PASS</a> +1 other test pass</li></ul></li><li><p>igt@kms_flip=
@wf_vblank-ts-check-interruptible:</p><ul><li>{shard-lnl}: <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_flip@wf_v=
blank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1733">Intel XE#1733</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-lnl-2/igt@kms_f=
lip@wf_vblank-ts-check-interruptible.html">PASS</a> +2 other tests pass</li=
></ul></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb=
-draw-render:</p><ul><li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-lnl-1/igt@k=
ms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">PASS=
</a></li></ul></li><li><p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv=
12:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGT_7864/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitych=
eck-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-464/igt@kms_pipe_cr=
c_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +1 other test pass</li>=
</ul></li><li><p>igt@kms_pm_dc@dc5-dpms:</p><ul><li>{shard-lnl}: <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-5/igt@kms_pm_=
dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11160/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html"=
>PASS</a></li></ul></li><li><p>igt@kms_pm_rpm@system-suspend-modeset:</p><u=
l><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_7864/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WA=
RN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_111=
60/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +1 ot=
her test pass</li><li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_7864/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1830">Intel XE#1830</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_11160/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modes=
et.html">PASS</a> +2 other tests pass</li></ul></li><li><p>igt@kms_vblank@q=
uery-forked-busy:</p><ul><li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_7864/shard-lnl-4/igt@kms_vblank@query-forked-busy.h=
tml">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_11160/shard-lnl-7/igt@kms_vblank@query-forked-busy.html">PASS</a>=
</li></ul></li><li><p>igt@xe_evict@evict-mixed-threads-large:</p><ul><li>sh=
ard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864=
/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel=
 XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/392">Intel XE#392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_11160/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.=
html">PASS</a></li></ul></li><li><p>igt@xe_exec_store@basic-all:</p><ul><li=
>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864=
/shard-lnl-5/igt@xe_exec_store@basic-all.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1699">Intel XE#1699</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-lnl=
-4/igt@xe_exec_store@basic-all.html">PASS</a> +7 other tests pass</li></ul>=
</li><li><p>igt@xe_intel_bb@blit-simple:</p><ul><li>{shard-lnl}: <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-lnl-8/igt@xe_inte=
l_bb@blit-simple.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-lnl-4/igt@xe_intel_bb=
@blit-simple.html">PASS</a></li></ul></li><li><p>igt@xe_pat@pat-index-all:<=
/p><ul><li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7864/shard-lnl-5/igt@xe_pat@pat-index-all.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699">Int=
el XE#1699</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_11160/shard-lnl-2/igt@xe_pat@pat-index-all.html">PASS</a> +3 other te=
sts pass</li></ul></li><li><p>igt@xe_pm@s3-basic-exec:</p><ul><li>shard-dg2=
-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-=
dg2-433/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1116=
0/shard-dg2-464/igt@xe_pm@s3-basic-exec.html">PASS</a> +4 other tests pass<=
/li></ul></li></ul><h4>Warnings</h4><ul><li><p>igt@kms_big_fb@4-tiled-32bpp=
-rotate-90:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_big_fb@4-til=
ed-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li></ul><=
/li><li><p>igt@kms_big_fb@linear-8bpp-rotate-270:</p><ul><li>shard-dg2-set2=
: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-4=
32/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-4=
64/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#31=
6</a>) +2 other tests skip</li></ul></li><li><p>igt@kms_big_fb@y-tiled-addf=
b-size-overflow:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-463/igt@kms_big_fb@y-tiled-ad=
dfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li></ul></li><l=
i><p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p><ul><l=
i>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
7864/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_big_fb@y-t=
iled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 o=
ther tests skip</li></ul></li><li><p>igt@kms_big_fb@yf-tiled-addfb-size-ove=
rflow:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_7864/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overf=
low.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_big_fb@yf-ti=
led-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li></ul></li><li><p>igt=
@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p><ul><li>shard-d=
g2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shar=
d-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
24">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11160/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bp=
p-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests =
skip</li></ul></li><li><p>igt@kms_big_joiner@invalid-modeset:</p><ul><li>sh=
ard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864=
/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/=
shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Int=
el XE#346</a>)</li></ul></li><li><p>igt@kms_bw@linear-tiling-4-displays-216=
0x1440p:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-21=
60x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_bw@line=
ar-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests s=
kip</li></ul></li><li><p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:<=
/p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_7864/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +15 other tests skip</li></ul></li><li><p>igt@kms_ccs@ccs-on-another-bo=
-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p><ul><li>shard-dg2-set2: <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_c=
cs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_11160/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-=
rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+21 other tests skip</li></ul></li><li><p>igt@kms_ccs@crc-primary-basic-y-t=
iled-gen12-rc-ccs-cc@pipe-a-dp-4:</p><ul><li>shard-dg2-set2: <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-435/igt@kms_ccs@c=
rc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_11160/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc=
-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li></u=
l></li><li><p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p=
><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_7864/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-434/igt@kms_ccs@crc=
-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>)</li></ul></li><li><p>igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p><ul><li>shard-dg2-set2: <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@km=
s_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_11160/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ge=
n12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 oth=
er tests skip</li></ul></li><li><p>igt@kms_cdclk@mode-transition-all-output=
s:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_7864/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/314">Intel XE#314</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_cdclk@mode-transit=
ion-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/314">Intel XE#314</a>)</li></ul></li><li><p>igt@kms_cha=
melium_color@ctm-red-to-blue:</p><ul><li>shard-dg2-set2: <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@kms_chamelium=
_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/i=
gt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li></ul>=
</li><li><p>igt@kms_chamelium_color@gamma:</p><ul><li>shard-dg2-set2: <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@=
kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-433/igt@kms_cham=
elium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li></ul></li><l=
i><p>igt@kms_chamelium_frames@vga-frame-dump:</p><ul><li>shard-dg2-set2: <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-434/i=
gt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160=
/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#37=
3</a>) +6 other tests skip</li></ul></li><li><p>igt@kms_chamelium_hpd@hdmi-=
hpd:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_7864/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">In=
tel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_11160/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
373">Intel XE#373</a>) +6 other tests skip</li></ul></li><li><p>igt@kms_cur=
sor_crc@cursor-onscreen-512x512:</p><ul><li>shard-dg2-set2: <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_cursor=
_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-433/igt@kms_c=
ursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) =
+1 other test skip</li></ul></li><li><p>igt@kms_cursor_edge_walk@256x256-le=
ft-edge@pipe-a-hdmi-a-6:</p><ul><li>shard-dg2-set2: <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_cursor_edge_wa=
lk@256x256-left-edge@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2=
-435/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li></ul></li=
><li><p>igt@kms_cursor_edge_walk@256x256-top-edge:</p><ul><li>shard-dg2-set=
2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-=
466/igt@kms_cursor_edge_walk@256x256-top-edge.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">=
Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_11160/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-edge.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li></ul></li><li><p>=
igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p><ul><li>shar=
d-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/s=
hard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_11160/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-bef=
ore-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li></ul></li><l=
i><p>igt@kms_cursor_legacy@single-move:</p><ul><li>shard-dg2-set2: <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@km=
s_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel =
XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_11160/shard-dg2-466/igt@kms_cursor_legacy@single-move.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a>)</li></ul></li><li><p>igt@kms_feature_discovery@display-3x:</p><ul=
><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_7864/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel X=
E#703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11160/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/703">Intel XE#703</a>)</li></ul></li><li><p>igt@kms_frontbuffer_tracking@d=
rrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p><ul><li>shard-dg2-set2: <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@km=
s_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_11160/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests=
 skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-sh=
rfb-msflip-blt:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shar=
d-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>)</li></ul></li><li><p>igt@kms_frontbu=
ffer_tracking@drrs-suspend:</p><ul><li>shard-dg2-set2: <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-463/igt@kms_frontbuffer=
_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/i=
gt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 oth=
er tests skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-=
scndscrn-shrfb-pgflip-blt:</p><ul><li>shard-dg2-set2: <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-436/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_11160/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a>)</li></ul></li><li><p>igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y:</p><ul><li>shard-dg2-set2: <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-464/igt=
@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#=
658</a>)</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primsc=
rn-pri-indfb-draw-render:</p><ul><li>shard-dg2-set2: <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_11160/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li></u=
l></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-dra=
w-blt:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_7864/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-p=
rimscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-464/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
53">Intel XE#653</a>) +21 other tests skip</li></ul></li><li><p>igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p><ul><li>shard-d=
g2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shar=
d-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-433/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>)</li></ul></li><li><p>igt@kms_getfb@getfb-reject-ccs:</p><ul><l=
i>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
7864/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">=
Intel XE#605</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_11160/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel X=
E#605</a>)</li></ul></li><li><p>igt@kms_multipipe_modeset@basic-max-pipe-cr=
c-check:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_7864/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pi=
pe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-434/igt@kms_multipipe_modeset=
@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li></ul=
></li><li><p>igt@kms_plane_multiple@tiling-y:</p><ul><li>shard-dg2-set2: <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/i=
gt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-464/igt@kms=
_plane_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other =
tests skip</li></ul></li><li><p>igt@kms_plane_scaling@plane-downscale-facto=
r-0-5-with-pixel-format:</p><ul><li>shard-dg2-set2: <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_plane_scaling@=
plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">=
Intel XE#904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/909">Intel XE#909</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11160/shard-dg2-464/igt@kms_plane_scaling@plane-downsca=
le-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel X=
E#909</a>)</li></ul></li><li><p>igt@kms_plane_scaling@plane-downscale-facto=
r-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p><ul><li>shard-dg2-set2: <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@km=
s_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-=
6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-464/igt=
@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi=
-a-6.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/904">Intel XE#904</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/909">Intel XE#909</a>)</li></ul></li><li><p>igt@kms=
_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p><ul><l=
i>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
7864/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clampin=
g-pixel-formats.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-435/igt@kms_plane_sc=
aling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Int=
el XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/909">Intel XE#909</a>)</li></ul></li><li><p>igt@kms_plane_scaling@plan=
e-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:</p><ul><li>s=
hard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_786=
4/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-p=
ixel-formats@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard=
-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-fo=
rmats@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909=
</a>)</li></ul></li><li><p>igt@kms_plane_scaling@planes-upscale-20x20-downs=
cale-factor-0-25:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_plane_scaling@planes-=
upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">In=
tel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_11160/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/305">Intel XE#305</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li></ul></li><li><p=
>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hd=
mi-a-6:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#3=
05</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11=
160/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>=
</ul></li><li><p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-facto=
r-0-25@pipe-d-hdmi-a-6:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_plane_scaling@p=
lanes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_11160/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x2=
0-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other=
 tests skip</li></ul></li><li><p>igt@kms_psr2_su@page_flip-nv12:</p><ul><li=
>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7=
864/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11160/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel X=
E#1122</a>)</li></ul></li><li><p>igt@kms_psr2_su@page_flip-p010:</p><ul><li=
>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7=
864/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/s=
hard-dg2-464/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a>)</li></ul></li><li><p>igt@kms_psr@fbc-pr-cursor-plane-move:</p><=
ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_7864/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel=
 XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11160/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/929">Intel XE#929</a>) +11 other tests skip</li></ul></li><li><p>igt@kms=
_psr@fbc-psr-basic:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@kms_psr@fbc-psr-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-466/igt@kms_psr@fbc-psr-basic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a>)</li></ul></li><li><p>igt@kms_psr@fbc-psr2-pri=
mary-blt:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_psr@fbc-psr2-primary=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/929">Intel XE#929</a>) +10 other tests skip</li></ul></li><li><p>i=
gt@kms_psr@fbc-psr2-primary-page-flip:</p><ul><li>shard-dg2-set2: <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@km=
s_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/sha=
rd-dg2-435/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">=
Intel XE#929</a>) +1 other test skip</li></ul></li><li><p>igt@kms_psr_stres=
s_test@invalidate-primary-flip-overlay:</p><ul><li>shard-dg2-set2: <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/igt@km=
s_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_11160/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-fl=
ip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1149">Intel XE#1149</a>)</li></ul></li><li><p>igt@kms_rotati=
on_crc@bad-pixel-format:</p><ul><li>shard-dg2-set2: <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-433/igt@kms_rotation_crc@b=
ad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_=
rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li></ul></li><li>=
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p><ul><li>shard-dg=
2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard=
-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel=
 XE#327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11160/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li></ul></li><=
li><p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p><ul><li>shar=
d-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/s=
hard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@kms_writeback@writeback-check=
-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/756">Intel XE#756</a>)</li></ul></li><li><p>igt@sri=
ov_basic@enable-vfs-bind-unbind-each:</p><ul><li>shard-dg2-set2: <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@sriov=
_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-464/i=
gt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a>)</li></ul></li><li><p>igt@xe_evict@evict-beng-large-multi-vm-cm:<=
/p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_7864/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
600">Intel XE#1600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_11160/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1041">Intel XE#1041</a>)</li></ul></li><li><p>igt@xe_evict@evict-mixed=
-many-threads-large:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_evict@evict-mixed-m=
any-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/sha=
rd-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Inte=
l XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/392">Intel XE#392</a>)</li></ul></li><li><p>igt@xe_exec_f=
ault_mode@once-rebind-prefetch:</p><ul><li>shard-dg2-set2: <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-432/igt@xe_exec_fau=
lt_mode@once-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-466/igt@xe_ex=
ec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)=
 +16 other tests skip</li></ul></li><li><p>igt@xe_exec_fault_mode@twice-use=
rptr-rebind-imm:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_7864/shard-dg2-464/igt@xe_exec_fault_mode@twice-u=
serptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@xe=
_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 ot=
her tests skip</li></ul></li><li><p>igt@xe_exec_reset@gt-reset-stress:</p><=
ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_7864/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">I=
ntel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_11160/shard-dg2-432/igt@xe_exec_reset@gt-reset-stress.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/163=
8">Intel XE#1638</a>)</li></ul></li><li><p>igt@xe_media_fill@media-fill:</p=
><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_7864/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#56=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_111=
60/shard-dg2-433/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel =
XE#560</a>)</li></ul></li><li><p>igt@xe_pat@display-vs-wb-transient:</p><ul=
><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_7864/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1337">Intel XE#1337</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_11160/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
337">Intel XE#1337</a>)</li></ul></li><li><p>igt@xe_pm@d3cold-basic:</p><ul=
><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_7864/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel X=
E#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11160/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>=
</ul></li><li><p>igt@xe_pm@s3-vm-bind-userptr:</p><ul><li>shard-dg2-set2: <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-dg2-466/=
igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/s=
hard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>=
)</li></ul></li><li><p>igt@xe_pm@s4-d3cold-basic-exec:</p><ul><li>shard-dg2=
-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-=
dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-433=
/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</l=
i></ul></li><li><p>igt@xe_query@multigpu-query-config:</p><ul><li>shard-dg2=
-set2: <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7864/shard-=
dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2=
-463/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944=
</a>) +1 other test skip</li></ul></li><li><p>igt@xe_query@multigpu-query-m=
em-usage:</p><ul><li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_7864/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_11160/shard-dg2-432/igt@xe_query@multigpu-q=
uery-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li></ul></li></ul><p>{name}: Thi=
s element is suppressed. This means it is ignored when computing<br> the st=
atus of the difference (SUCCESS, WARNING, or FAILURE).</p><h2>Build changes=
</h2><ul><li>IGT: IGT_7864 -&gt; IGTPW_11160</li></ul><p>IGTPW_11160: 11160=
<br> IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br> xe-1310-1ba62f8cea9c797427d45108df1=
d453f4b343240: 1ba62f8cea9c797427d45108df1d453f4b343240</p></blockquote><di=
v><br></div><div><span></span></div></body></html>

--=-ZWXPVO/RIjBtPuwAaKaO--
