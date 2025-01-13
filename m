Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3286C02180
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 12:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8801C10E662;
	Mon, 13 Jan 2025 12:17:08 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FB110E662
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 12:17:07 +0000 (UTC)
Received: from 91-155-255-183.elisa-laajakaista.fi ([91.155.255.183]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tXJNN-00000003n1y-352k; Mon, 13 Jan 2025 14:17:04 +0200
Message-ID: <fe85f8117d33c617b3319dcb4fc11e9640c4d2f9.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Mon, 13 Jan 2025 14:17:00 +0200
In-Reply-To: <173674717890.3139263.9477051405974825494@b555e5b46a47>
References: <20250110123403.1818011-1-luciano.coelho@intel.com>
 <173674717890.3139263.9477051405974825494@b555e5b46a47>
Content-Type: multipart/alternative; boundary="=-X7EAncl+2ztfQxnZjQyo"
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for
 tests/kms_plane_scaling: get mode only after setting the output pipe
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

--=-X7EAncl+2ztfQxnZjQyo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

None of these new failures are related to this patch.

The first one is a bad file descriptor in the fbc-suspend test, then a
few failures related to EDID mismatches and finally the last one is
about a network failure, with nothing noticeable in the logs.

Please re-report.

--
Cheers,
Luca.


On Mon, 2025-01-13 at 05:46 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:tests/kms_plane_scaling: get mode only after setting the
> output pipe
>=20
> URL:https://patchwork.freedesktop.org/series/143388/
>=20
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/index.html
> CI Bug Log - changes from XEIGT_8186_full -> XEIGTPW_12425_fullSummaryFAI=
LURE
> Serious unknown changes coming with XEIGTPW_12425_full absolutely
> need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12425_full, please notify your bug team (I915-
> ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Participating hosts (4 -> 4)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> XEIGTPW_12425_full:
> IGT changesPossible regressions *=20
>    igt@kms_fbcon_fbt@fbc-suspend:shard-lnl: PASS [370] -> FAIL [369]
>  *=20
>    igt@kms_pm_rpm@i2c:shard-bmg: PASS [366] -> FAIL [365] +1 other test
>    failshard-dg2-set2: PASS [368] -> FAIL [367]
>  *=20
>    igt@kms_vblank@query-forked-busy-hang:shard-bmg: PASS [364] ->
>    INCOMPLETE [363] +1 other test incomplete
>  *=20
>    igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:shard-dg2-set2:
>    NOTRUN -> ABORT [362] +1 other test abort
> Known issuesHere are the changes found in XEIGTPW_12425_full that come fr=
om known
> issues:
> IGT changesIssues hit *=20
>    igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:shard-dg2-set2:
>    NOTRUN -> SKIP [361] (Intel XE#623 [360])
>  *=20
>    igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-
>    linear:shard-lnl: PASS [359] -> FAIL [358] (Intel XE#911 [357]) +3
>    other tests fail
>  *=20
>    igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-
>    6-4-mc-ccs:shard-dg2-set2: NOTRUN -> SKIP [356] (Intel XE#2550
>    [355]) +23 other tests skip
>  *=20
>    igt@kms_async_flips@invalid-async-flip:shard-lnl: NOTRUN -> SKIP
>    [354] (Intel XE#873 [353])
>  *=20
>    igt@kms_atomic@plane-primary-overlay-mutable-zpos:shard-lnl: NOTRUN
>    -> SKIP [352] (Intel XE#3279 [351])
>  *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-270:shard-lnl: NOTRUN -> SKIP
>    [350] (Intel XE#1407 [349]) +3 other tests skip
>  *=20
>    igt@kms_big_fb@x-tiled-8bpp-rotate-270:shard-dg2-set2: NOTRUN ->
>    SKIP [348] (Intel XE#316 [347]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@y-tiled-32bpp-rotate-90:shard-bmg: NOTRUN -> SKIP
>    [346] (Intel XE#1124 [44])
>  *=20
>    igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:shard-dg2-
>    set2: NOTRUN -> SKIP [345] (Intel XE#1124 [44]) +11 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-180:shard-lnl: NOTRUN -> SKIP
>    [344] (Intel XE#1124 [44]) +2 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-addfb:shard-lnl: NOTRUN -> SKIP [343] (Intel
>    XE#1467 [342]) +1 other test skip
>  *=20
>    igt@kms_big_fb@yf-tiled-addfb-size-overflow:shard-dg2-set2: NOTRUN -
>    > SKIP [341] (Intel XE#610 [340])
>  *=20
>    igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:shard-dg2-
>    set2: NOTRUN -> SKIP [339] (Intel XE#367 [335]) +6 other tests skip
>  *=20
>    igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:shard-lnl:
>    NOTRUN -> SKIP [338] (Intel XE#1512 [337])
>  *=20
>    igt@kms_bw@linear-tiling-2-displays-2160x1440p:shard-lnl: NOTRUN ->
>    SKIP [336] (Intel XE#367 [335])
>  *=20
>    igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:shard-bmg: NOTRUN ->
>    SKIP [334] (Intel XE#2887 [330])
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:shard-dg2-set2: NOTRUN -
>    > SKIP [333] (Intel XE#2907 [332]) +2 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:shard-
>    lnl: NOTRUN -> SKIP [331] (Intel XE#2887 [330]) +8 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:shard-
>    lnl: PASS [329] -> INCOMPLETE [328] (Intel XE#3862 [327]) +1 other
>    test incomplete
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-
>    hdmi-a-6:shard-dg2-set2: NOTRUN -> SKIP [326] (Intel XE#787 [324])
>    +174 other tests skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:shard-
>    dg2-set2: NOTRUN -> SKIP [325] (Intel XE#455 [87] / Intel XE#787
>    [324]) +40 other tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-
>    6:shard-dg2-set2: NOTRUN -> INCOMPLETE [323] (Intel XE#1727 [127] /
>    Intel XE#3124 [125]) +1 other test incomplete
>  *=20
>    igt@kms_cdclk@plane-scaling:shard-lnl: NOTRUN -> SKIP [322] (Intel
>    XE#1152 [321]) +3 other tests skip
>  *=20
>    igt@kms_chamelium_color@ctm-negative:shard-dg2-set2: NOTRUN -> SKIP
>    [320] (Intel XE#306 [319]) +1 other test skip
>  *=20
>    igt@kms_chamelium_hpd@dp-hpd-fast:shard-dg2-set2: NOTRUN -> SKIP
>    [318] (Intel XE#373 [316]) +11 other tests skip
>  *=20
>    igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:shard-lnl: NOTRUN ->
>    SKIP [317] (Intel XE#373 [316]) +1 other test skip
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-0:shard-lnl: NOTRUN ->
>    SKIP [315] (Intel XE#307 [314]) +1 other test skip
>  *=20
>    igt@kms_content_protection@legacy:shard-dg2-set2: NOTRUN -> FAIL
>    [313] (Intel XE#1178 [40]) +1 other test fail
>  *=20
>    igt@kms_content_protection@lic-type-0@pipe-a-dp-2:shard-bmg: NOTRUN
>    -> FAIL [312] (Intel XE#1178 [40])
>  *=20
>    igt@kms_content_protection@uevent:shard-dg2-set2: NOTRUN -> FAIL
>    [311] (Intel XE#1188 [310]) +1 other test fail
>  *=20
>    igt@kms_cursor_crc@cursor-offscreen-32x32:shard-lnl: NOTRUN -> SKIP
>    [309] (Intel XE#1424 [308]) +2 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-512x170:shard-lnl: NOTRUN -> SKIP
>    [307] (Intel XE#2321 [306]) +2 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-512x512:shard-dg2-set2: NOTRUN ->
>    SKIP [305] (Intel XE#308 [304]) +1 other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-random-max-size:shard-dg2-set2: NOTRUN ->
>    SKIP [303] (Intel XE#455 [87]) +16 other tests skip
>  *=20
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:shard-
>    dg2-set2: NOTRUN -> SKIP [302] (Intel XE#323 [300])
>  *=20
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-
>    size:shard-lnl: NOTRUN -> SKIP [301] (Intel XE#323 [300])
>  *=20
>    igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:shard-lnl:
>    NOTRUN -> SKIP [299] (Intel XE#309 [298]) +1 other test skip
>  *=20
>    igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-
>    size:shard-bmg: PASS [297] -> SKIP [296] (Intel XE#2291 [120]) +1
>    other test skip
>  *=20
>    igt@kms_cursor_legacy@torture-move@all-pipes:shard-dg2-set2: PASS
>    [295] -> DMESG-WARN [294] (Intel XE#3184 [293]) +1 other test dmesg-
>    warn
>  *=20
>    igt@kms_display_modes@extended-mode-basic:shard-lnl: NOTRUN -> SKIP
>    [292] (Intel XE#3383 [291])
>  *=20
>    igt@kms_feature_discovery@chamelium:shard-lnl: NOTRUN -> SKIP [290]
>    (Intel XE#701 [289])
>  *=20
>    igt@kms_feature_discovery@display-4x:shard-dg2-set2: NOTRUN -> SKIP
>    [288] (Intel XE#1138 [287])
>  *=20
>    igt@kms_feature_discovery@dp-mst:shard-lnl: NOTRUN -> SKIP [286]
>    (Intel XE#1137 [285])
>  *=20
>    igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:shard-bmg: PASS
>    [284] -> FAIL [283] (Intel XE#2882 [38]) +5 other tests fail
>  *=20
>    igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-
>    dp4:shard-dg2-set2: PASS [282] -> FAIL [281] (Intel XE#301 [94]) +2
>    other tests fail
>  *=20
>    igt@kms_flip@2x-flip-vs-modeset-vs-hang:shard-bmg: PASS [280] ->
>    SKIP [279] (Intel XE#2316 [35]) +4 other tests skip
>  *=20
>    igt@kms_flip@2x-flip-vs-rmfb-interruptible:shard-lnl: NOTRUN -> SKIP
>    [278] (Intel XE#1421 [277])
>  *=20
>    igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:shard-
>    lnl: PASS [276] -> FAIL [275] (Intel XE#886 [105]) +2 other tests
>    fail
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank@a-dp4:shard-dg2-set2: PASS [274]
>    -> FAIL [273] (Intel XE#3321 [93])
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank@b-dp4:shard-dg2-set2: PASS [272]
>    -> FAIL [271] (Intel XE#301 [94] / Intel XE#3321 [93])
>  *=20
>    igt@kms_flip@flip-vs-suspend:shard-bmg: NOTRUN -> INCOMPLETE [270]
>    (Intel XE#2597 [268])
>  *=20
>    igt@kms_flip@flip-vs-suspend@d-hdmi-a3:shard-bmg: NOTRUN ->
>    INCOMPLETE [269] (Intel XE#2597 [268] / Intel XE#2635 [267])
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>    downscaling:shard-lnl: NOTRUN -> SKIP [266] (Intel XE#1397 [264] /
>    Intel XE#1745 [262])
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>    downscaling@pipe-a-default-mode:shard-lnl: NOTRUN -> SKIP [265]
>    (Intel XE#1397 [264])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>    upscaling:shard-lnl: NOTRUN -> SKIP [263] (Intel XE#1401 [260] /
>    Intel XE#1745 [262])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>    upscaling@pipe-a-default-mode:shard-lnl: NOTRUN -> SKIP [261] (Intel
>    XE#1401 [260])
>  *=20
>    igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-
>    render:shard-dg2-set2: NOTRUN -> SKIP [259] (Intel XE#651 [255]) +35
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:shard-lnl: NOTRUN ->
>    SKIP [258] (Intel XE#656 [257]) +21 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:shard-lnl:
>    NOTRUN -> SKIP [256] (Intel XE#651 [255]) +6 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-
>    blt:shard-bmg: NOTRUN -> SKIP [254] (Intel XE#2313 [16]) +1 other
>    test skip
>  *=20
>    igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:shard-bmg:
>    NOTRUN -> FAIL [253] (Intel XE#2333 [23])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:shard-
>    dg2-set2: NOTRUN -> SKIP [251] (Intel XE#653 [250]) +34 other tests
>    skipshard-bmg: NOTRUN -> SKIP [252] (Intel XE#2312 [18])
>  *=20
>    igt@kms_histogram@algo-basic:shard-dg2-set2: NOTRUN -> SKIP [249]
>    (Intel XE#3897 [248]) +1 other test skip
>  *=20
>    igt@kms_joiner@basic-force-big-joiner:shard-bmg: PASS [247] -> SKIP
>    [246] (Intel XE#3012 [245])
>  *=20
>    igt@kms_joiner@basic-ultra-joiner:shard-dg2-set2: NOTRUN -> SKIP
>    [244] (Intel XE#2927 [243])
>  *=20
>    igt@kms_joiner@invalid-modeset-force-ultra-joiner:shard-dg2-set2:
>    NOTRUN -> SKIP [242] (Intel XE#2925 [241])
>  *=20
>    igt@kms_plane_cursor@viewport:shard-dg2-set2: PASS [240] -> FAIL
>    [239] (Intel XE#616 [237])
>  *=20
>    igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:shard-dg2-
>    set2: NOTRUN -> FAIL [238] (Intel XE#616 [237])
>  *=20
>    igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:shard-lnl: NOTRUN -> SKIP
>    [236] (Intel XE#599 [235]) +3 other tests skip
>  *=20
>    igt@kms_plane_multiple@tiling-yf:shard-lnl: NOTRUN -> SKIP [234]
>    (Intel XE#2493 [233])
>  *=20
>    igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>    format@pipe-b:shard-dg2-set2: NOTRUN -> SKIP [232] (Intel XE#2763
>    [229]) +11 other tests skip
>  *=20
>    igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-
>    25@pipe-d:shard-dg2-set2: NOTRUN -> SKIP [231] (Intel XE#2763 [229]
>    / Intel XE#455 [87]) +7 other tests skip
>  *=20
>    igt@kms_plane_scaling@planes-downscale-factor-0-5:shard-lnl: NOTRUN
>    -> SKIP [230] (Intel XE#2763 [229]) +3 other tests skip
>  *=20
>    igt@kms_pm_backlight@bad-brightness:shard-dg2-set2: NOTRUN -> SKIP
>    [228] (Intel XE#870 [227])
>  *=20
>    igt@kms_pm_dc@dc5-psr:shard-lnl: PASS [226] -> FAIL [225] (Intel
>    XE#718 [81])
>  *=20
>    igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:shard-lnl: NOTRUN -> SKIP
>    [224] (Intel XE#1439 [223] / Intel XE#836 [222])
>  *=20
>    igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-
>    sf:shard-lnl: NOTRUN -> SKIP [221] (Intel XE#2893 [220])
>  *=20
>    igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:shard-dg2-
>    set2: NOTRUN -> SKIP [219] (Intel XE#1489 [218]) +10 other tests
>    skip
>  *=20
>    igt@kms_psr2_su@page_flip-xrgb8888:shard-dg2-set2: NOTRUN -> SKIP
>    [217] (Intel XE#1122 [216])
>  *=20
>    igt@kms_psr@fbc-pr-cursor-blt:shard-bmg: NOTRUN -> SKIP [215] (Intel
>    XE#2234 [214] / Intel XE#2850 [210]) +2 other tests skip
>  *=20
>    igt@kms_psr@fbc-pr-no-drrs:shard-lnl: NOTRUN -> SKIP [213] (Intel
>    XE#1406 [212]) +2 other tests skip
>  *=20
>    igt@kms_psr@fbc-psr2-cursor-plane-onoff:shard-dg2-set2: NOTRUN ->
>    SKIP [211] (Intel XE#2850 [210] / Intel XE#929 [209]) +18 other
>    tests skip
>  *=20
>    igt@kms_rotation_crc@bad-tiling:shard-lnl: NOTRUN -> SKIP [208]
>    (Intel XE#3414 [202] / Intel XE#3904 [201])
>  *=20
>    igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:shard-dg2-set2:
>    NOTRUN -> SKIP [207] (Intel XE#1127 [204])
>  *=20
>    igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:shard-dg2-set2:
>    NOTRUN -> SKIP [206] (Intel XE#3414 [202]) +3 other tests skip
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:shard-lnl:
>    NOTRUN -> SKIP [205] (Intel XE#1127 [204])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:shard-bmg: NOTRUN
>    -> SKIP [203] (Intel XE#3414 [202] / Intel XE#3904 [201])
>  *=20
>    igt@kms_setmode@clone-exclusive-crtc:shard-bmg: NOTRUN -> SKIP [200]
>    (Intel XE#1435 [198])
>  *=20
>    igt@kms_setmode@invalid-clone-single-crtc:shard-lnl: NOTRUN -> SKIP
>    [199] (Intel XE#1435 [198])
>  *=20
>    igt@kms_vblank@ts-continuation-suspend:shard-dg2-set2: PASS [197] ->
>    ABORT [196] (Intel XE#2625 [90]) +1 other test abort
>  *=20
>    igt@kms_vrr@lobf:shard-dg2-set2: NOTRUN -> SKIP [195] (Intel XE#2168
>    [194])
>  *=20
>    igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:shard-lnl: PASS
>    [193] -> FAIL [192] (Intel XE#2142 [191]) +1 other test fail
>  *=20
>    igt@kms_writeback@writeback-fb-id:shard-dg2-set2: NOTRUN -> SKIP
>    [190] (Intel XE#756 [189]) +1 other test skip
>  *=20
>    igt@sriov_basic@enable-vfs-autoprobe-off:shard-dg2-set2: NOTRUN ->
>    SKIP [188] (Intel XE#1091 [187] / Intel XE#2849 [186])
>  *=20
>    igt@xe_compute_preempt@compute-preempt-many:shard-dg2-set2: NOTRUN -
>    > SKIP [185] (Intel XE#1280 [184] / Intel XE#455 [87]) +1 other test
>    skip
>  *=20
>    igt@xe_copy_basic@mem-set-linear-0xfffe:shard-dg2-set2: NOTRUN ->
>    SKIP [183] (Intel XE#1126 [182])
>  *=20
>    igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:shard-
>    lnl: NOTRUN -> SKIP [181] (Intel XE#2905 [160]) +2 other tests skip
>  *=20
>    igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:shard-
>    bmg: NOTRUN -> SKIP [180] (Intel XE#2905 [160]) +2 other tests skip
>  *=20
>    igt@xe_evict@evict-beng-large-multi-vm-cm:shard-dg2-set2: NOTRUN ->
>    FAIL [179] (Intel XE#1600 [178])
>  *=20
>    igt@xe_evict@evict-beng-mixed-many-threads-small:shard-dg2-set2:
>    PASS [177] -> TIMEOUT [176] (Intel XE#1473 [6] / Intel XE#402 [175])
>  *=20
>    igt@xe_evict@evict-beng-threads-small:shard-lnl: NOTRUN -> SKIP
>    [174] (Intel XE#688 [173]) +5 other tests skip
>  *=20
>    igt@xe_evict@evict-mixed-many-threads-small:shard-dg2-set2: NOTRUN -
>    > TIMEOUT [172] (Intel XE#1473 [6])
>  *=20
>    igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-
>    invalidate:shard-bmg: NOTRUN -> SKIP [171] (Intel XE#2322 [170])
>  *=20
>    igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-
>    invalidate:shard-dg2-set2: NOTRUN -> SKIP [169] (Intel XE#1392 [67])
>  *=20
>    igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-
>    invalidate:shard-dg2-set2: PASS [168] -> SKIP [167] (Intel XE#1392
>    [67]) +3 other tests skip
>  *=20
>    igt@xe_exec_basic@multigpu-once-userptr-invalidate:shard-lnl: NOTRUN
>    -> SKIP [166] (Intel XE#1392 [67]) +4 other tests skip
>  *=20
>    igt@xe_exec_fault_mode@once-bindexecqueue-imm:shard-dg2-set2: NOTRUN
>    -> SKIP [165] (Intel XE#288 [164]) +20 other tests skip
>  *=20
>    igt@xe_exec_mix_modes@exec-simple-batch-store-lr:shard-dg2-set2:
>    NOTRUN -> SKIP [163] (Intel XE#2360 [162]) +1 other test skip
>  *=20
>    igt@xe_exec_sip_eudebug@breakpoint-writesip:shard-dg2-set2: NOTRUN -
>    > SKIP [161] (Intel XE#2905 [160]) +13 other tests skip
>  *=20
>    igt@xe_live_ktest@xe_dma_buf:shard-bmg: PASS [159] -> SKIP [158]
>    (Intel XE#1192 [1])
>  *=20
>    igt@xe_live_ktest@xe_eudebug:shard-lnl: NOTRUN -> SKIP [157] (Intel
>    XE#1192 [1] / Intel XE#3026 [156])
>  *=20
>    igt@xe_media_fill@media-fill:shard-dg2-set2: NOTRUN -> SKIP [155]
>    (Intel XE#560 [154])
>  *=20
>    igt@xe_mmap@small-bar:shard-dg2-set2: NOTRUN -> SKIP [153] (Intel
>    XE#512 [152])
>  *=20
>    igt@xe_oa@oa-regs-whitelisted:shard-dg2-set2: NOTRUN -> SKIP [151]
>    (Intel XE#2541 [150] / Intel XE#3573 [149]) +8 other tests skip
>  *=20
>    igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:shard-dg2-
>    set2: NOTRUN -> FAIL [148] (Intel XE#1173 [147]) +1 other test fail
>  *=20
>    igt@xe_pm@d3cold-mocs:shard-dg2-set2: NOTRUN -> SKIP [146] (Intel
>    XE#2284 [142])
>  *=20
>    igt@xe_pm@s2idle-multiple-execs:shard-dg2-set2: PASS [145] -> ABORT
>    [144] (Intel XE#1358 [56])
>  *=20
>    igt@xe_pm@s3-d3cold-basic-exec:shard-dg2-set2: NOTRUN -> SKIP [143]
>    (Intel XE#2284 [142] / Intel XE#366 [141]) +1 other test skip
>  *=20
>    igt@xe_pm@s3-multiple-execs:shard-dg2-set2: PASS [140] -> ABORT
>    [139] (Intel XE#1358 [56] / Intel XE#1794 [55])
>  *=20
>    igt@xe_pm@s3-vm-bind-prefetch:shard-lnl: NOTRUN -> SKIP [138] (Intel
>    XE#584 [137])
>  *=20
>    igt@xe_pm@s4-vm-bind-unbind-all:shard-lnl: PASS [136] -> ABORT [135]
>    (Intel XE#1358 [56] / Intel XE#1607 [134] / Intel XE#1794 [55]) +1
>    other test abort
>  *=20
>    igt@xe_query@multigpu-query-invalid-cs-cycles:shard-dg2-set2: NOTRUN
>    -> SKIP [133] (Intel XE#944 [131]) +5 other tests skip
>  *=20
>    igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:shard-lnl:
>    NOTRUN -> SKIP [132] (Intel XE#944 [131])
> Possible fixes *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:shard-dg2-set2:
>    INCOMPLETE [130] (Intel XE#1727 [127] / Intel XE#3124 [125]) -> PASS
>    [129]
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-
>    6:shard-dg2-set2: INCOMPLETE [128] (Intel XE#1727 [127] / Intel
>    XE#3113 [126] / Intel XE#3124 [125]) -> PASS [124]
>  *=20
>    igt@kms_cursor_crc@cursor-suspend:shard-dg2-set2: ABORT [123] ->
>    PASS [122] +1 other test pass
>  *=20
>    igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:shard-bmg: SKIP
>    [121] (Intel XE#2291 [120]) -> PASS [119] +3 other tests pass
>  *=20
>    igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-
>    size:shard-bmg: DMESG-WARN [118] (Intel XE#877 [117]) -> PASS [116]
>    +1 other test pass
>  *=20
>    igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-
>    dp4:shard-dg2-set2: FAIL [115] (Intel XE#3321 [93]) -> PASS [114]
>  *=20
>    igt@kms_flip@2x-flip-vs-panning-vs-hang:shard-bmg: SKIP [113] (Intel
>    XE#2316 [35]) -> PASS [112] +3 other tests pass
>  *=20
>    igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a6-dp4:shard-dg2-set2:
>    INCOMPLETE [111] -> PASS [110] +1 other test pass
>  *=20
>    igt@kms_flip@blocking-wf_vblank:shard-lnl: FAIL [109] (Intel XE#3149
>    [108] / Intel XE#886 [105]) -> PASS [107]
>  *=20
>    igt@kms_flip@blocking-wf_vblank@c-edp1:shard-lnl: FAIL [106] (Intel
>    XE#886 [105]) -> PASS [104] +2 other tests pass
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible:shard-bmg: FAIL
>    [103] (Intel XE#2882 [38] / Intel XE#3288 [37]) -> PASS [102]
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:shard-
>    bmg: FAIL [101] (Intel XE#3288 [37] / Intel XE#3321 [93]) -> PASS
>    [100]
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank@b-edp1:shard-lnl: FAIL [99]
>    (Intel XE#301 [94]) -> PASS [98] +1 other test pass
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:shard-bmg: FAIL [97]
>    (Intel XE#3321 [93]) -> PASS [96]
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank@d-dp4:shard-dg2-set2: FAIL [95]
>    (Intel XE#301 [94] / Intel XE#3321 [93]) -> PASS [92]
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-suspend:shard-dg2-set2: ABORT [91]
>    (Intel XE#2625 [90]) -> PASS [89]
>  *=20
>    igt@kms_hdr@invalid-hdr:shard-dg2-set2: SKIP [88] (Intel XE#455
>    [87]) -> PASS [86]
>  *=20
>    igt@kms_plane_scaling@intel-max-src-size:shard-dg2-set2: FAIL [85]
>    (Intel XE#361 [84]) -> PASS [83] +1 other test pass
>  *=20
>    igt@kms_pm_dc@dc5-dpms:shard-lnl: FAIL [82] (Intel XE#718 [81]) ->
>    PASS [80]
>  *=20
>    igt@kms_setmode@basic@pipe-a-hdmi-a-6:shard-dg2-set2: FAIL [79]
>    (Intel XE#2883 [78]) -> PASS [77] +4 other tests pass
>  *=20
>    igt@kms_vrr@negative-basic:shard-bmg: SKIP [76] (Intel XE#1499 [75])
>    -> PASS [74]
>  *=20
>    igt@xe_exec_basic@many-bindexecqueue-rebind:shard-bmg: SKIP [71]
>    (Intel XE#1130 [70]) -> PASS [69]shard-dg2-set2: SKIP [73] (Intel
>    XE#1130 [70]) -> PASS [72]
>  *=20
>    igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-
>    bind:shard-dg2-set2: SKIP [68] (Intel XE#1392 [67]) -> PASS [66] +4
>    other tests pass
>  *=20
>    igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:shard-dg2-set2:
>    FAIL [65] (Intel XE#1999 [64]) -> PASS [63] +2 other tests pass
>  *=20
>    igt@xe_module_load@reload:shard-dg2-set2: FAIL [60] (Intel XE#3546
>    [59]) -> PASS [58]shard-bmg: FAIL [62] (Intel XE#3546 [59]) -> PASS
>    [61]
>  *=20
>    igt@xe_pm@s3-basic:shard-dg2-set2: ABORT [57] (Intel XE#1358 [56] /
>    Intel XE#1794 [55]) -> PASS [54]
>  *=20
>    igt@xe_pm_residency@toggle-gt-c6:shard-lnl: FAIL [53] (Intel XE#958
>    [52]) -> PASS [51]
> Warnings *=20
>    igt@kms_big_fb@y-tiled-32bpp-rotate-180:shard-bmg: SKIP [48] (Intel
>    XE#2136 [47] / Intel XE#2231 [46]) -> SKIP [45] (Intel XE#1124
>    [44])shard-dg2-set2: SKIP [50] (Intel XE#2136 [47]) -> SKIP [49]
>    (Intel XE#1124 [44])
>  *=20
>    igt@kms_content_protection@lic-type-0:shard-bmg: SKIP [43] (Intel
>    XE#2341 [42]) -> FAIL [41] (Intel XE#1178 [40])
>  *=20
>    igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:shard-bmg: FAIL
>    [39] (Intel XE#2882 [38] / Intel XE#3288 [37]) -> SKIP [36] (Intel
>    XE#2316 [35])
>  *=20
>    igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-
>    blt:shard-bmg: SKIP [34] (Intel XE#2311 [30]) -> SKIP [33] (Intel
>    XE#2312 [18]) +14 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-
>    wc:shard-bmg: SKIP [32] (Intel XE#2312 [18]) -> SKIP [31] (Intel
>    XE#2311 [30]) +16 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:shard-
>    bmg: SKIP [29] (Intel XE#2312 [18]) -> FAIL [28] (Intel XE#2333
>    [23]) +1 other test fail
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:shard-
>    bmg: INCOMPLETE [27] (Intel XE#2050 [26]) -> FAIL [25] (Intel
>    XE#2333 [23])
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>    render:shard-bmg: FAIL [24] (Intel XE#2333 [23]) -> SKIP [22] (Intel
>    XE#2312 [18]) +8 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-
>    render:shard-bmg: SKIP [21] (Intel XE#2313 [16]) -> SKIP [20] (Intel
>    XE#2312 [18]) +9 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-
>    blt:shard-bmg: SKIP [19] (Intel XE#2312 [18]) -> SKIP [17] (Intel
>    XE#2313 [16]) +11 other tests skip
>  *=20
>    igt@kms_tiled_display@basic-test-pattern:shard-dg2-set2: SKIP [15]
>    (Intel XE#362 [14]) -> FAIL [13] (Intel XE#1729 [12])
>  *=20
>    igt@xe_evict@evict-beng-threads-large:shard-bmg: FAIL [11] (Intel
>    XE#1000 [10]) -> INCOMPLETE [9] (Intel XE#1473 [6])
>  *=20
>    igt@xe_evict@evict-mixed-many-threads-small:shard-bmg: TIMEOUT [8]
>    (Intel XE#1473 [6]) -> TIMEOUT [7] (Intel XE#1473 [6] / Intel
>    XE#2472 [5])
>  *=20
>    igt@xe_live_ktest@xe_eudebug:shard-bmg: SKIP [4] (Intel XE#2833 [3])
>    -> SKIP [2] (Intel XE#1192 [1])
> Build changes * IGT: IGT_8186 -> IGTPW_12425
>  * Linux: xe-2471-0ca002b6f088ddd9bdde5630662526a50b7ef917 -> xe-2474-
>    00f4619246294b1de4bac42742cfef95c1f37fde
> IGTPW_12425: 3ecd83f130ed2cb4419226fad481364f8a39a5be @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8186: 2c6b2f0ed4075aa1ac3d341d612e41343cff4e4d @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2471-0ca002b6f088ddd9bdde5630662526a50b7ef917:
> 0ca002b6f088ddd9bdde5630662526a50b7ef917
> xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde:
> 00f4619246294b1de4bac42742cfef95c1f37fde


[1] Intel XE#1192
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
[2] SKIP
    https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-2/igt@x=
e_live_ktest@xe_eudebug.html
[3] Intel XE#2833
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
[4] SKIP
    https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-8/igt@xe_l=
ive_ktest@xe_eudebug.html
[5] Intel XE#2472
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
[6] Intel XE#1473
    https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
[7] TIMEOUT
    https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@x=
e_evict@evict-mixed-many-threads-small.html
[8] TIMEOUT
    https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-5/igt@xe_e=
vict@evict-mixed-many-threads-small.html
[9] INCOMPLETE
    https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-2/igt@x=
e_evict@evict-beng-threads-large.html
[10] Intel XE#1000
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
[11] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-4/igt@xe_=
evict@evict-beng-threads-large.html
[12] Intel XE#1729
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
[13] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/ig=
t@kms_tiled_display@basic-test-pattern.html
[14] Intel XE#362
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
[15] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-463/igt@k=
ms_tiled_display@basic-test-pattern.html
[16] Intel XE#2313
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
[17] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
[18] Intel XE#2312
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
[19] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-6/igt@kms=
_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
[20] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
[21] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-1/igt@kms=
_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
[22] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
[23] Intel XE#2333
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
[24] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-4/igt@kms=
_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
[25] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
[26] Intel XE#2050
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
[27] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-4/igt@kms=
_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
[28] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-8/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
[29] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-6/igt@kms=
_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
[30] Intel XE#2311
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
[31] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@=
kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
[32] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-6/igt@kms=
_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
[33] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
[34] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-1/igt@kms=
_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
[35] Intel XE#2316
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
[36] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible.html
[37] Intel XE#3288
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
[38] Intel XE#2882
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
[39] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-5/igt@kms=
_flip@2x-flip-vs-expired-vblank-interruptible.html
[40] Intel XE#1178
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
[41] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@=
kms_content_protection@lic-type-0.html
[42] Intel XE#2341
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
[43] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-6/igt@kms=
_content_protection@lic-type-0.html
[44] Intel XE#1124
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
[45] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt@=
kms_big_fb@y-tiled-32bpp-rotate-180.html
[46] Intel XE#2231
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
[47] Intel XE#2136
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
[48] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-2/igt@kms=
_big_fb@y-tiled-32bpp-rotate-180.html
[49] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/ig=
t@kms_big_fb@y-tiled-32bpp-rotate-180.html
[50] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-463/igt@k=
ms_big_fb@y-tiled-32bpp-rotate-180.html
[51] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt@=
xe_pm_residency@toggle-gt-c6.html
[52] Intel XE#958
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
[53] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-3/igt@xe_=
pm_residency@toggle-gt-c6.html
[54] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/ig=
t@xe_pm@s3-basic.html
[55] Intel XE#1794
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
[56] Intel XE#1358
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
[57] ABORT
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-432/igt@x=
e_pm@s3-basic.html
[58] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/ig=
t@xe_module_load@reload.html
[59] Intel XE#3546
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
[60] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-464/igt@x=
e_module_load@reload.html
[61] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-8/igt@=
xe_module_load@reload.html
[62] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-4/igt@xe_=
module_load@reload.html
[63] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/ig=
t@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
[64] Intel XE#1999
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
[65] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-463/igt@x=
e_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
[66] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/ig=
t@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
[67] Intel XE#1392
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
[68] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-432/igt@x=
e_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
[69] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@=
xe_exec_basic@many-bindexecqueue-rebind.html
[70] Intel XE#1130
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
[71] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-2/igt@xe_=
exec_basic@many-bindexecqueue-rebind.html
[72] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/ig=
t@xe_exec_basic@many-bindexecqueue-rebind.html
[73] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-463/igt@x=
e_exec_basic@many-bindexecqueue-rebind.html
[74] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-2/igt@=
kms_vrr@negative-basic.html
[75] Intel XE#1499
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
[76] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-6/igt@kms=
_vrr@negative-basic.html
[77] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/ig=
t@kms_setmode@basic@pipe-a-hdmi-a-6.html
[78] Intel XE#2883
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
[79] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-464/igt@k=
ms_setmode@basic@pipe-a-hdmi-a-6.html
[80] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt@=
kms_pm_dc@dc5-dpms.html
[81] Intel XE#718
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
[82] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-6/igt@kms=
_pm_dc@dc5-dpms.html
[83] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/ig=
t@kms_plane_scaling@intel-max-src-size.html
[84] Intel XE#361
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
[85] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-464/igt@k=
ms_plane_scaling@intel-max-src-size.html
[86] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/ig=
t@kms_hdr@invalid-hdr.html
[87] Intel XE#455
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
[88] SKIP
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-435/igt@k=
ms_hdr@invalid-hdr.html
[89] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@fbc-suspend.html
[90] Intel XE#2625
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
[91] ABORT
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-432/igt@k=
ms_frontbuffer_tracking@fbc-suspend.html
[92] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/ig=
t@kms_flip@flip-vs-expired-vblank@d-dp4.html
[93] Intel XE#3321
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
[94] Intel XE#301
     https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
[95] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-436/igt@k=
ms_flip@flip-vs-expired-vblank@d-dp4.html
[96] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-8/igt@=
kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
[97] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-8/igt@kms=
_flip@flip-vs-expired-vblank@c-hdmi-a3.html
[98] PASS
     https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt@=
kms_flip@flip-vs-expired-vblank@b-edp1.html
[99] FAIL
     https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-5/igt@kms=
_flip@flip-vs-expired-vblank@b-edp1.html
[100] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt=
@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
[101] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-6/igt@km=
s_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
[102] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt=
@kms_flip@flip-vs-expired-vblank-interruptible.html
[103] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-6/igt@km=
s_flip@flip-vs-expired-vblank-interruptible.html
[104] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt=
@kms_flip@blocking-wf_vblank@c-edp1.html
[105] Intel XE#886
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
[106] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-2/igt@km=
s_flip@blocking-wf_vblank@c-edp1.html
[107] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt=
@kms_flip@blocking-wf_vblank.html
[108] Intel XE#3149
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
[109] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-2/igt@km=
s_flip@blocking-wf_vblank.html
[110] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a6-dp4.html
[111] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-463/igt@=
kms_flip@2x-flip-vs-rmfb@ad-hdmi-a6-dp4.html
[112] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt=
@kms_flip@2x-flip-vs-panning-vs-hang.html
[113] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-6/igt@km=
s_flip@2x-flip-vs-panning-vs-hang.html
[114] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/i=
gt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
[115] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-435/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
[116] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt=
@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
[117] Intel XE#877
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
[118] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-5/igt@km=
s_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
[119] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-8/igt=
@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
[120] Intel XE#2291
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
[121] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-6/igt@km=
s_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
[122] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/i=
gt@kms_cursor_crc@cursor-suspend.html
[123] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-432/igt@=
kms_cursor_crc@cursor-suspend.html
[124] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
[125] Intel XE#3124
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
[126] Intel XE#3113
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
[127] Intel XE#1727
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
[128] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-464/igt@=
kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
[129] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
[130] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-464/igt@=
kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
[131] Intel XE#944
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
[132] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt=
@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
[133] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@xe_query@multigpu-query-invalid-cs-cycles.html
[134] Intel XE#1607
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
[135] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt=
@xe_pm@s4-vm-bind-unbind-all.html
[136] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-7/igt@xe=
_pm@s4-vm-bind-unbind-all.html
[137] Intel XE#584
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
[138] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt=
@xe_pm@s3-vm-bind-prefetch.html
[139] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@xe_pm@s3-multiple-execs.html
[140] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-433/igt@=
xe_pm@s3-multiple-execs.html
[141] Intel XE#366
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
[142] Intel XE#2284
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
[143] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@xe_pm@s3-d3cold-basic-exec.html
[144] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@xe_pm@s2idle-multiple-execs.html
[145] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-463/igt@=
xe_pm@s2idle-multiple-execs.html
[146] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@xe_pm@d3cold-mocs.html
[147] Intel XE#1173
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
[148] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/i=
gt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
[149] Intel XE#3573
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
[150] Intel XE#2541
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
[151] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@xe_oa@oa-regs-whitelisted.html
[152] Intel XE#512
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
[153] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@xe_mmap@small-bar.html
[154] Intel XE#560
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
[155] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@xe_media_fill@media-fill.html
[156] Intel XE#3026
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
[157] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt=
@xe_live_ktest@xe_eudebug.html
[158] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-2/igt=
@xe_live_ktest@xe_dma_buf.html
[159] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-8/igt@xe=
_live_ktest@xe_dma_buf.html
[160] Intel XE#2905
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
[161] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@xe_exec_sip_eudebug@breakpoint-writesip.html
[162] Intel XE#2360
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
[163] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
[164] Intel XE#288
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
[165] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@xe_exec_fault_mode@once-bindexecqueue-imm.html
[166] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt=
@xe_exec_basic@multigpu-once-userptr-invalidate.html
[167] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
[168] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-435/igt@=
xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
[169] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
[170] Intel XE#2322
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
[171] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
[172] TIMEOUT
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@xe_evict@evict-mixed-many-threads-small.html
[173] Intel XE#688
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
[174] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt=
@xe_evict@evict-beng-threads-small.html
[175] Intel XE#402
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
[176] TIMEOUT
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@xe_evict@evict-beng-mixed-many-threads-small.html
[177] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-463/igt@=
xe_evict@evict-beng-mixed-many-threads-small.html
[178] Intel XE#1600
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
[179] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@xe_evict@evict-beng-large-multi-vm-cm.html
[180] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt=
@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
[181] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt=
@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
[182] Intel XE#1126
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
[183] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@xe_copy_basic@mem-set-linear-0xfffe.html
[184] Intel XE#1280
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
[185] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@xe_compute_preempt@compute-preempt-many.html
[186] Intel XE#2849
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
[187] Intel XE#1091
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
[188] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@sriov_basic@enable-vfs-autoprobe-off.html
[189] Intel XE#756
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
[190] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/i=
gt@kms_writeback@writeback-fb-id.html
[191] Intel XE#2142
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
[192] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt=
@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
[193] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-8/igt@km=
s_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
[194] Intel XE#2168
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
[195] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@kms_vrr@lobf.html
[196] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@kms_vblank@ts-continuation-suspend.html
[197] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-435/igt@=
kms_vblank@ts-continuation-suspend.html
[198] Intel XE#1435
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
[199] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt=
@kms_setmode@invalid-clone-single-crtc.html
[200] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt=
@kms_setmode@clone-exclusive-crtc.html
[201] Intel XE#3904
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
[202] Intel XE#3414
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
[203] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
[204] Intel XE#1127
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
[205] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
[206] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
[207] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
[208] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt=
@kms_rotation_crc@bad-tiling.html
[209] Intel XE#929
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
[210] Intel XE#2850
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
[211] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@kms_psr@fbc-psr2-cursor-plane-onoff.html
[212] Intel XE#1406
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
[213] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt=
@kms_psr@fbc-pr-no-drrs.html
[214] Intel XE#2234
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
[215] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-2/igt=
@kms_psr@fbc-pr-cursor-blt.html
[216] Intel XE#1122
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
[217] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@kms_psr2_su@page_flip-xrgb8888.html
[218] Intel XE#1489
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
[219] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/i=
gt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
[220] Intel XE#2893
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
[221] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt=
@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
[222] Intel XE#836
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
[223] Intel XE#1439
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
[224] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt=
@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
[225] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt=
@kms_pm_dc@dc5-psr.html
[226] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-4/igt@km=
s_pm_dc@dc5-psr.html
[227] Intel XE#870
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
[228] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@kms_pm_backlight@bad-brightness.html
[229] Intel XE#2763
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
[230] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt=
@kms_plane_scaling@planes-downscale-factor-0-5.html
[231] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/i=
gt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-=
d.html
[232] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.h=
tml
[233] Intel XE#2493
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
[234] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt=
@kms_plane_multiple@tiling-yf.html
[235] Intel XE#599
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
[236] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-1/igt=
@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
[237] Intel XE#616
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
[238] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html
[239] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@kms_plane_cursor@viewport.html
[240] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-435/igt@=
kms_plane_cursor@viewport.html
[241] Intel XE#2925
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
[242] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@kms_joiner@invalid-modeset-force-ultra-joiner.html
[243] Intel XE#2927
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
[244] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/i=
gt@kms_joiner@basic-ultra-joiner.html
[245] Intel XE#3012
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
[246] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt=
@kms_joiner@basic-force-big-joiner.html
[247] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-1/igt@km=
s_joiner@basic-force-big-joiner.html
[248] Intel XE#3897
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3897
[249] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@kms_histogram@algo-basic.html
[250] Intel XE#653
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
[251] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/i=
gt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
[252] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt=
@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
[253] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt=
@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html
[254] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
[255] Intel XE#651
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
[256] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt=
@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
[257] Intel XE#656
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
[258] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt=
@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html
[259] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
[260] Intel XE#1401
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
[261] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt=
@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe=
-a-default-mode.html
[262] Intel XE#1745
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
[263] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt=
@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
[264] Intel XE#1397
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
[265] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt=
@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-def=
ault-mode.html
[266] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt=
@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
[267] Intel XE#2635
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
[268] Intel XE#2597
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
[269] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt=
@kms_flip@flip-vs-suspend@d-hdmi-a3.html
[270] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt=
@kms_flip@flip-vs-suspend.html
[271] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_flip@flip-vs-expired-vblank@b-dp4.html
[272] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-436/igt@=
kms_flip@flip-vs-expired-vblank@b-dp4.html
[273] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_flip@flip-vs-expired-vblank@a-dp4.html
[274] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-436/igt@=
kms_flip@flip-vs-expired-vblank@a-dp4.html
[275] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt=
@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
[276] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-1/igt@km=
s_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
[277] Intel XE#1421
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
[278] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt=
@kms_flip@2x-flip-vs-rmfb-interruptible.html
[279] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt=
@kms_flip@2x-flip-vs-modeset-vs-hang.html
[280] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-1/igt@km=
s_flip@2x-flip-vs-modeset-vs-hang.html
[281] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/i=
gt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
[282] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-435/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
[283] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt=
@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
[284] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-5/igt@km=
s_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
[285] Intel XE#1137
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
[286] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt=
@kms_feature_discovery@dp-mst.html
[287] Intel XE#1138
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
[288] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_feature_discovery@display-4x.html
[289] Intel XE#701
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
[290] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt=
@kms_feature_discovery@chamelium.html
[291] Intel XE#3383
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383
[292] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-1/igt=
@kms_display_modes@extended-mode-basic.html
[293] Intel XE#3184
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
[294] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@kms_cursor_legacy@torture-move@all-pipes.html
[295] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-433/igt@=
kms_cursor_legacy@torture-move@all-pipes.html
[296] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt=
@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
[297] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-4/igt@km=
s_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
[298] Intel XE#309
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
[299] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt=
@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
[300] Intel XE#323
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
[301] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt=
@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
[302] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
[303] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@kms_cursor_crc@cursor-random-max-size.html
[304] Intel XE#308
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
[305] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@kms_cursor_crc@cursor-onscreen-512x512.html
[306] Intel XE#2321
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
[307] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt=
@kms_cursor_crc@cursor-onscreen-512x170.html
[308] Intel XE#1424
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
[309] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-1/igt=
@kms_cursor_crc@cursor-offscreen-32x32.html
[310] Intel XE#1188
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
[311] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@kms_content_protection@uevent.html
[312] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt=
@kms_content_protection@lic-type-0@pipe-a-dp-2.html
[313] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_content_protection@legacy.html
[314] Intel XE#307
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
[315] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt=
@kms_content_protection@dp-mst-lic-type-0.html
[316] Intel XE#373
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
[317] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt=
@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
[318] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@kms_chamelium_hpd@dp-hpd-fast.html
[319] Intel XE#306
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
[320] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_chamelium_color@ctm-negative.html
[321] Intel XE#1152
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
[322] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt=
@kms_cdclk@plane-scaling.html
[323] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
[324] Intel XE#787
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
[325] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
[326] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.ht=
ml
[327] Intel XE#3862
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
[328] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt=
@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
[329] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-2/igt@km=
s_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
[330] Intel XE#2887
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
[331] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-1/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
[332] Intel XE#2907
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
[333] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
[334] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-8/igt=
@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
[335] Intel XE#367
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
[336] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt=
@kms_bw@linear-tiling-2-displays-2160x1440p.html
[337] Intel XE#1512
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
[338] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt=
@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
[339] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-463/i=
gt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
[340] Intel XE#610
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
[341] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@kms_big_fb@yf-tiled-addfb-size-overflow.html
[342] Intel XE#1467
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
[343] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt=
@kms_big_fb@yf-tiled-addfb.html
[344] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt=
@kms_big_fb@yf-tiled-16bpp-rotate-180.html
[345] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
[346] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt=
@kms_big_fb@y-tiled-32bpp-rotate-90.html
[347] Intel XE#316
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
[348] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@kms_big_fb@x-tiled-8bpp-rotate-270.html
[349] Intel XE#1407
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
[350] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt=
@kms_big_fb@4-tiled-32bpp-rotate-270.html
[351] Intel XE#3279
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
[352] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt=
@kms_atomic@plane-primary-overlay-mutable-zpos.html
[353] Intel XE#873
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
[354] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt=
@kms_async_flips@invalid-async-flip.html
[355] Intel XE#2550
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
[356] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/i=
gt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-cc=
s.html
[357] Intel XE#911
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
[358] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
[359] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-1/igt@km=
s_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
[360] Intel XE#623
      https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
[361] SKIP
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
[362] ABORT
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-432/i=
gt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2.html
[363] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt=
@kms_vblank@query-forked-busy-hang.html
[364] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-8/igt@km=
s_vblank@query-forked-busy-hang.html
[365] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt=
@kms_pm_rpm@i2c.html
[366] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-bmg-2/igt@km=
s_pm_rpm@i2c.html
[367] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/i=
gt@kms_pm_rpm@i2c.html
[368] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-dg2-463/igt@=
kms_pm_rpm@i2c.html
[369] FAIL
      https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt=
@kms_fbcon_fbt@fbc-suspend.html
[370] PASS
      https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8186/shard-lnl-6/igt@km=
s_fbcon_fbt@fbc-suspend.html

--=-X7EAncl+2ztfQxnZjQyo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
<style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
<body><div>Hi,</div><div><br></div><div>None of these new failures are rela=
ted to this patch.</div><div><br></div><div>The first one is a bad file des=
criptor in the fbc-suspend test, then a few failures related to EDID mismat=
ches and finally the last one is about a network failure, with nothing noti=
ceable in the logs.</div><div><br></div><div>Please re-report.</div><div><b=
r></div><div>--</div><div>Cheers,</div><div>Luca.</div><div><br></div><div>=
<br></div><div>On Mon, 2025-01-13 at 05:46 +0000, Patchwork wrote:</div><bl=
ockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf =
solid;padding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: get mode onl=
y after setting the output pipe</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143388/">https://patchwork.freedesktop.org/series/143388/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/index=
.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/index.html</a>=
</td></tr></tbody></table> </div><h1>CI Bug Log - changes from XEIGT_8186_f=
ull -&gt; XEIGTPW_12425_full</h1><h2>Summary</h2><p><strong>FAILURE</strong=
></p><p>Serious unknown changes coming with XEIGTPW_12425_full absolutely n=
eed to be<br> verified manually.</p><p>If you think the reported changes ha=
ve nothing to do with the changes<br> introduced in XEIGTPW_12425_full, ple=
ase notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow the=
m<br> to document this new failure mode, which will reduce false positives =
in CI.</p><h2>Participating hosts (4 -&gt; 4)</h2><p>No changes in particip=
ating hosts</p><h2>Possible new issues</h2><p>Here are the unknown changes =
that may have been introduced in XEIGTPW_12425_full:</p><h3>IGT changes</h3=
><h4>Possible regressions</h4><ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-5=
/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a></li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@i2c:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-2/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@kms_pm=
_rpm@i2c.html">FAIL</a> +1 other test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-463/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@km=
s_pm_rpm@i2c.html">FAIL</a></li>
</ul></li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-8/igt@kms_vblank@query-forked-busy-hang.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/sha=
rd-bmg-5/igt@kms_vblank@query-forked-busy-hang.html">INCOMPLETE</a> +1 othe=
r test incomplete</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-432/igt@kms_vblank@ts-continuation-sus=
pend@pipe-d-dp-2.html">ABORT</a> +1 other test abort</li>
</ul></li>
</ul><h2>Known issues</h2><p>Here are the changes found in XEIGTPW_12425_fu=
ll that come from known issues:</p><h3>IGT changes</h3><h4>Issues hit</h4><=
ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tile=
d-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 oth=
er tests fail</li>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +2=
3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul></li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@kms_big_fb@y-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
67">Intel XE#1467</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul></li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-463/igt@kms_bw@connected-linear-tiling=
-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul></li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled=
-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li=
>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe=
-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12425/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl=
-ccs@pipe-b-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomple=
te</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +174 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a=
>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152=
">Intel XE#1152</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@kms_chamelium_color@ctm-negati=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-fast.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-with-e=
nabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@legacy:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@kms_content_protection@legacy.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@uevent:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-463/igt@kms_content_protection@uevent.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-463/igt@kms_cursor_crc@cursor-random-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-f=
lip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p><ul=
>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other=
 test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@torture-move@all-pipes:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-433/igt@kms_cursor_legacy@torture-move@all-pipes.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12425/shard-dg2-463/igt@kms_cursor_legacy@torture-move@all-pipes.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul></li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-1/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3383">Intel XE#3383</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/701">Intel XE#701</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@kms_feature_discovery@display-=
4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1138">Intel XE#1138</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1137">Intel XE#1137</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12425/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2882">Intel XE#2882</a>) +5 other tests fail</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>=
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12425/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tes=
ts fail</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/s=
hard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptibl=
e@b-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12425/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-int=
erruptible@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
25/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
25/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3321">Intel XE#3321</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2597">Intel XE#2597</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@kms_flip@flip-vs-suspend@d-hdmi-=
a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2597">Intel XE#2597</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>=
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-default-mode:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>=
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +35 other test=
s skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +21 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p><=
ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test s=
kip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte@pipe-b-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +34 other tests skip=
</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul></li>
<li>
<p>igt@kms_histogram@algo-basic:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@kms_histogram@algo-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
897">Intel XE#3897</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/sha=
rd-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)=
</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2927">Intel XE#2927</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-463/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_cursor@viewport:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-435/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2=
-432/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-432/igt@kms_plane_cursor@viewport@pipe=
-a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2493">Intel XE#2493</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-433/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@kms_pm_backlight@bad-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p><ul=
>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-primary=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1122">Intel XE#1122</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt@kms_psr@fbc-pr-no-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +18 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-432/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul></li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1435">Intel XE#1435</a>)</li>
</ul></li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-6/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1435">Intel XE#1435</a>)</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/=
shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#26=
25</a>) +1 other test abort</li>
</ul></li>
<li>
<p>igt@kms_vrr@lobf:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel X=
E#2168</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12425/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-433/igt@kms_writeback@writeback-fb-id.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/756">Intel XE#756</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@sriov_basic@enable-vfs-autopro=
be-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul></li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@xe_compute_preempt@compute-pre=
empt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul></li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt@xe_eudebug_online@writes-caching=
-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip<=
/li>
</ul></li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt@xe_eudebug_online@writes-caching=
-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip<=
/li>
</ul></li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-463/igt@xe_evict@evict-beng-large-mult=
i-vm-cm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1600">Intel XE#1600</a>)</li>
</ul></li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12425/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.ht=
ml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul></li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt@xe_evict@evict-beng-threads-smal=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@xe_evict@evict-mixed-many-thre=
ads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p><ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>=
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p><ul=
>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-invalidate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12425/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bin=
dexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-2/igt@xe_exec_basic@multigpu-once-user=
ptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-432/igt@xe_exec_fault_mode@once-bindex=
ecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint=
-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-2/=
igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul></li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
2">Intel XE#1192</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3026">Intel XE#3026</a>)</li>
</ul></li>
<li>
<p>igt@xe_media_fill@media-fill:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@xe_media_fill@media-fill.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
60">Intel XE#560</a>)</li>
</ul></li>
<li>
<p>igt@xe_mmap@small-bar:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Int=
el XE#512</a>)</li>
</ul></li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@xe_oa@oa-regs-whitelisted.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a>)</li>
</ul></li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-463/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-d=
g2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul></li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-4=
32/igt@xe_pm@s3-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)<=
/li>
</ul></li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-5/igt@xe_pm@s3-vm-bind-prefetch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>)</li>
</ul></li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-lnl=
-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"=
>Intel XE#1794</a>) +1 other test abort</li>
</ul></li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p><ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@xe_query@multigpu-query-invali=
d-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p><ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-lnl-3/igt@xe_query@multigpu-query-invalid-=
uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul></li>
</ul><h4>Possible fixes</h4><ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@kms_ccs@random-=
ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/sha=
rd-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.h=
tml">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shar=
d-dg2-433/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pa=
ss</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12425/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-atomic.html">PASS</a> +3 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@kms_cursor_=
legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +1 o=
ther test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>=
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-433/igt@kms_flip@2x-fl=
ip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12425/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS=
</a> +3 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a6-dp4:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-463/igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a6-dp4.html">=
INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12425/shard-dg2-463/igt@kms_flip@2x-flip-vs-rmfb@ad-hdmi-a6-dp4.html">=
PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3=
149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/88=
6">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12425/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">PASS</a>=
</li>
</ul></li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-edp1:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-2/igt@kms_flip@blocking-wf_vblank@c-edp1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Inte=
l XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12425/shard-lnl-4/igt@kms_flip@blocking-wf_vblank@c-edp1.html">PASS</a>=
 +2 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2882">Intel XE#2882</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3288">Intel XE#3288</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt@kms_flip@flip-vs-expir=
ed-vblank-interruptible.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3288">Intel XE#3288</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-4/igt@kms_flip@fli=
p-vs-expired-vblank-interruptible@a-hdmi-a3.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12425/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">=
PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
21">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12425/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a=
3.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12425/shard-dg2-436/igt@kms_flip@flip-vs-expired-vbl=
ank@d-dp4.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625=
">Intel XE#2625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12425/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-suspend.htm=
l">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/sha=
rd-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">=
Intel XE#361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12425/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">=
PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-=
lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">In=
tel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12425/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS=
</a> +4 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_vrr@negative-basic:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1242=
5/shard-bmg-2/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul></li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12425/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.ht=
ml">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-463/igt@xe_exec_basic@many-bindexecqueue-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12425/shard-dg2-433/igt@xe_exec_basic@many-bindexecqueue-rebin=
d.html">PASS</a></li>
</ul></li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>=
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-dg2-464/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +4 other t=
ests pass</li>
</ul></li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1999">Intel XE#1999</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">PASS</a> +2 other tests pass</li>
</ul></li>
<li>
<p>igt@xe_module_load@reload:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-464/igt@xe_module_load@reload.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1242=
5/shard-dg2-436/igt@xe_module_load@reload.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-4/igt@xe_module_load@reload.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/s=
hard-bmg-8/igt@xe_module_load@reload.html">PASS</a></li>
</ul></li>
<li>
<p>igt@xe_pm@s3-basic:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-432/igt@xe_pm@s3-basic.html">ABORT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel =
XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12425/shard-dg2-436/igt@xe_pm@s3-basic.html">PASS</a></li>
</ul></li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p><ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#9=
58</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
425/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12425/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
24">Intel XE#1124</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12425/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2882">Intel XE#2882</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3288">Intel XE#3288</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@kms_flip@2x-flip-vs=
-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p=
><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-1/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +16 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12425/shard-bmg-8/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-cur-indfb-move.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fa=
il</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-p=
lflip-blt.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-indfb-plflip-blt.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p><=
ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8=
 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-6/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p><=
ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12425/shard-bmg-5/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1=
1 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p><ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12425/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
29">Intel XE#1729</a>)</li>
</ul></li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Inte=
l XE#1000</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12425/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473=
">Intel XE#1473</a>)</li>
</ul></li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473">Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12425/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small=
.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul></li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p><ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8186/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1242=
5/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li=
>
</ul></li>
</ul><h2>Build changes</h2><ul>
<li>IGT: IGT_8186 -&gt; IGTPW_12425</li>
<li>Linux: xe-2471-0ca002b6f088ddd9bdde5630662526a50b7ef917 -&gt; xe-2474-0=
0f4619246294b1de4bac42742cfef95c1f37fde</li>
</ul><p>IGTPW_12425: 3ecd83f130ed2cb4419226fad481364f8a39a5be @ https://git=
lab.freedesktop.org/drm/igt-gpu-tools.git<br> IGT_8186: 2c6b2f0ed4075aa1ac3=
d341d612e41343cff4e4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.gi=
t<br> xe-2471-0ca002b6f088ddd9bdde5630662526a50b7ef917: 0ca002b6f088ddd9bdd=
e5630662526a50b7ef917<br> xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde:=
 00f4619246294b1de4bac42742cfef95c1f37fde</p></blockquote><div><br></div><d=
iv><span></span></div></body></html>

--=-X7EAncl+2ztfQxnZjQyo--
