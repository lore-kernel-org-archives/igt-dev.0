Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48EFC83011
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 08:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C1310E44A;
	Thu, 29 Aug 2024 08:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bShCZ022";
	dkim-atps=neutral
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1779F10E44A
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 08:58:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1C3EC0004;
 Thu, 29 Aug 2024 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724921912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrBzQmstMb60KGKvvuXpQefENymSUK6D/BFp1M/AKig=;
 b=bShCZ022EUkzZYuzuC2z6ZtLu3TdbtxgQ/QNgQq5/K8lGvfP9Z533nnK4dElsiyiNErlpt
 9N0OHjPKIQzCmJgg5YSW8348p+w8UhU9nKm2Wt9bV1iFz81W8ZpxdjLjoVYjw9oE6GtM9p
 l5+UK1pf7a0DBy32bxThJZAFRgM+vsX8k1cnYFcyLl39N7o66uPIfPTyL2M+sJy7FTHLPw
 3gO7+/OmE1yo65HkAttSqCbcsOILjVeVLIQy0FjgxF9spO3roLfoKsuULUyeRt/dUhFWhA
 oWvz6H6hp/H0nE1ydBBA/94JK3Sul5sc0PZhgGOJu9B3pdR0sMkOTvHg/OIzRQ==
Date: Thu, 29 Aug 2024 10:58:30 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 lib/igt_kms: Helpers for connector managment
Message-ID: <ZtA4Ntw79kGH05XG@louis-chauvet-laptop>
References: <20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com>
 <172489747197.829689.10706366801100189583@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172489747197.829689.10706366801100189583@2413ebb6fbb6>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Hi all,

Could someone please explain to me how to interpret these results?

If I understand correctly, the section 'IGT Changes' shows which tests 
that were previously passing are now failing. If that's the case, I don't 
see how my series, which only adds functions, could be breaking existing 
tests.

If you think this is related to my series, do you think it's possible to 
bisect the issue? I have no idea where it might be coming from.

Thanks,
Louis Chauvet

Le 29/08/24 - 02:11, Patchwork a écrit :
> == Series Details ==
> 
> Series: lib/igt_kms: Helpers for connector managment
> URL   : https://patchwork.freedesktop.org/series/137915/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7993_full -> XEIGTPW_11654_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11654_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11654_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11654_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3:
>     - {shard-bmg}:        [PASS][3] -> [INCOMPLETE][4] +2 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-2/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-bmg-3/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11654_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#1659])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#2191])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1399]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#373]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#373])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1424])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#323])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [i915#3804])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#776])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#701])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@bo-too-big-interruptible@a-edp1:
>     - shard-lnl:          [PASS][22] -> [TIMEOUT][23] ([Intel XE#1504]) +1 other test timeout
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-5/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-3/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-edp1:
>     - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#886]) +1 other test fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#651])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2340])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [PASS][31] -> [DMESG-FAIL][32] ([Intel XE#324]) +1 other test dmesg-fail
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-1/igt@kms_plane@plane-position-covered.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-3/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>     - shard-lnl:          [PASS][33] -> [DMESG-WARN][34] ([Intel XE#324]) +2 other tests dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1195]) +3 other tests incomplete
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#1430])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#1489])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@pr-primary-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#929])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_psr@pr-primary-blt.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#771] / [Intel XE#899])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#899]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][48] -> [FAIL][49] ([Intel XE#899])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#756])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1050])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#944]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-6/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:
>     - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#2623])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-4/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-4/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#1000])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1392])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#2360])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [PASS][61] -> [ABORT][62] ([Intel XE#1794])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#958])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#944])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][66] ([Intel XE#1760])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][67] ([Intel XE#1426]) -> [PASS][68] +1 other test pass
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][69] ([Intel XE#1426]) -> [PASS][70] +1 other test pass
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [FAIL][71] ([Intel XE#1659]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][73] ([Intel XE#2576]) -> [PASS][74] +15 other tests pass
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][75] -> [PASS][76] +1 other test pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-6.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64:
>     - shard-dg2-set2:     [INCOMPLETE][77] ([Intel XE#1195]) -> [PASS][78] +1 other test pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-64x64.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:
>     - {shard-bmg}:        [INCOMPLETE][79] ([Intel XE#2635]) -> [PASS][80] +2 other tests pass
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [FAIL][81] ([Intel XE#886]) -> [PASS][82] +3 other tests pass
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - {shard-bmg}:        [INCOMPLETE][83] ([Intel XE#2597]) -> [PASS][84] +2 other tests pass
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
>     - shard-lnl:          [DMESG-WARN][85] ([Intel XE#324]) -> [PASS][86] +2 other tests pass
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-1:
>     - shard-lnl:          [DMESG-FAIL][87] ([Intel XE#324]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [FAIL][89] ([Intel XE#718]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-dpms:
>     - shard-lnl:          [FAIL][91] ([Intel XE#1649]) -> [PASS][92] +1 other test pass
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-1/igt@kms_psr@fbc-psr2-dpms.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - {shard-bmg}:        [FAIL][93] ([Intel XE#899]) -> [PASS][94] +1 other test pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-lnl:          [FAIL][95] ([Intel XE#2443]) -> [PASS][96] +1 other test pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-4/igt@kms_vrr@flip-basic-fastset.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-2/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle:
>     - shard-lnl:          [FAIL][97] -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-3/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-7/igt@xe_drm_fdinfo@drm-busy-exec-queue-destroy-idle.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - {shard-bmg}:        [TIMEOUT][99] ([Intel XE#1473]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][101] ([Intel XE#1473]) -> [PASS][102] +1 other test pass
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][103] ([Intel XE#2105]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
>     - {shard-bmg}:        [DMESG-WARN][105] ([Intel XE#877]) -> [PASS][106] +5 other tests pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-bmg-7/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-lnl:          [SKIP][107] ([Intel XE#2229]) -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-8/igt@xe_live_ktest@xe_bo.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-2/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - {shard-bmg}:        [FAIL][109] ([Intel XE#2249]) -> [PASS][110] +1 other test pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-bmg-3/igt@xe_oa@mmio-triggered-reports.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
>     - shard-lnl:          [FAIL][111] ([Intel XE#2249]) -> [PASS][112] +1 other test pass
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [ABORT][113] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-lnl-2/igt@xe_pm@s4-basic.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-lnl-8/igt@xe_pm@s4-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#623]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#623])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#316]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][120] ([Intel XE#316]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#610]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#610])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][124] ([Intel XE#1124]) +3 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#1124]) -> [SKIP][126] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][128] ([Intel XE#607])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][130] ([Intel XE#2191])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#367]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][134] ([Intel XE#367]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#787]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#1252]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#1252]) +3 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][140] ([Intel XE#1252])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#787]) +62 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][144] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][148] ([Intel XE#306]) +1 other test skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#306]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#373]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][154] ([Intel XE#373]) +5 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#308]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][158] ([Intel XE#308])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x512.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#323]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#323])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#307]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#307])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#703]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#703])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][166] ([Intel XE#1138])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][168] ([Intel XE#455]) +5 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#651]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#651]) +25 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][172] ([Intel XE#651]) +20 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#653]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][176] ([Intel XE#653]) +19 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#455]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#870]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#870])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][182] ([Intel XE#1129])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][184] ([Intel XE#908])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1489]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][188] ([Intel XE#1489]) +2 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1122]) -> [SKIP][190] ([Intel XE#1122] / [Intel XE#1201])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr-sprite-render:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#929]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-render.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][194] ([Intel XE#929]) +6 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@kms_psr@psr-dpms.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1149]) -> [SKIP][196] ([Intel XE#1149] / [Intel XE#1201]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][198] ([Intel XE#327]) +1 other test skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1127]) -> [SKIP][200] ([Intel XE#1127] / [Intel XE#1201])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#327]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#327])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#362])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][206] ([Intel XE#756])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#1123]) -> [SKIP][210] ([Intel XE#1123] / [Intel XE#1201])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1126]) -> [SKIP][212] ([Intel XE#1126] / [Intel XE#1201])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][214] ([Intel XE#1126])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#288]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#288]) +20 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][218] ([Intel XE#288]) +15 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#2360]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#2360])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][222] ([Intel XE#2229])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][224] ([Intel XE#512])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@xe_mmap@small-bar.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][226] ([Intel XE#378])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@xe_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@mi-rpc:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#2541]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_oa@mi-rpc.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-433/igt@xe_oa@mi-rpc.html
> 
>   * igt@xe_oa@privileged-forked-access-vaddr:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][230] ([Intel XE#2541]) +2 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-436/igt@xe_oa@privileged-forked-access-vaddr.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1337]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#1337])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#979]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#979])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][236] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][238] ([Intel XE#944]) +2 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#944]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7993/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>   [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2576
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2623
>   [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7993 -> IGTPW_11654
>   * Linux: xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b -> xe-1846-cc2365ebeb3e24e591de171d3788a6512a122989
> 
>   IGTPW_11654: 622e3af0c046df5a6b126215991cbe8fe34f75aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1832-0f7dbe16a23882ef9c928d9650ea0613925e710b: 0f7dbe16a23882ef9c928d9650ea0613925e710b
>   xe-1846-cc2365ebeb3e24e591de171d3788a6512a122989: cc2365ebeb3e24e591de171d3788a6512a122989
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11654/index.html
