Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E94C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 15:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3827C10E9C9;
	Thu, 18 Jul 2024 15:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WqdniG9k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B265410E9C9;
 Thu, 18 Jul 2024 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721316251; x=1752852251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XuaP2txriaOhfGAEdzrUurlmRK3EwOCookLpqjvBsEM=;
 b=WqdniG9k0NyFJAzT/37KXGl/p4xF+S/SjMLhJmSAt0C0msOmPPbQCz9R
 eB4Dh5WzWx62qoCZy2QamkUU0bJUykiI9eVCvNbEBaofZnyb/zmhUngbn
 p4SRyAESreppm4TPZcXEGSgQrXUgKMUVP0plrPosWYsSn78e48EvbKebp
 bLkrbf+s92v76GrSOojbnU5ULf5CxyojUM1t1LvUpRcd2ripdLyAKYCLe
 Kg689QWAX7YpxBLIH9qHr9ziXfZ5YtfuYFXtAttrNWvbyDKyi+hD3pyIy
 zj/jXOBI3OS9N0PZWefpKXijXb92Hk6Ri+1qibI6MOsz40Sluv1gDAQBs A==;
X-CSE-ConnectionGUID: raRmlT0MSUm8bjLHddW8Gw==
X-CSE-MsgGUID: dhDd3h0wSraefqHZHi3Hhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="29499035"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="29499035"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 08:24:10 -0700
X-CSE-ConnectionGUID: STe9lk3UQ7ancEEcyWEHBA==
X-CSE-MsgGUID: CrbbCJFdQO6TlstKfyZOFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="81831545"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.26.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 08:24:07 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyX?= CI.xeFULL: failure for tests/gem_ctx_exec: Fix
 failing preempt timeout updates
Date: Thu, 18 Jul 2024 17:24:05 +0200
Message-ID: <1971247.PYKUYFuaPT@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172131231784.286320.3379155427520957863@2413ebb6fbb6>
References: <20240718085912.15434-7-janusz.krzysztofik@linux.intel.com>
 <172131231784.286320.3379155427520957863@2413ebb6fbb6>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Thursday, 18 July 2024 16:18:37 GMT+2 Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_ctx_exec: Fix failing preempt timeout updates
> URL   : https://patchwork.freedesktop.org/series/136228/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7929_full -> XEIGTPW_11425_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with XEIGTPW_11425_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11425_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11425_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_plane@plane-position-hole-dpms:
>     - shard-lnl:          [DMESG-WARN][1] ([Intel XE#324]) -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms.html

Hi I915-ci-infra@lists.freedesktop.org,

<3> [294.214512] xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO underrun: port,transcoder,

That definitely doesn't look like related to my IGT changes.  Please update 
your filters.

Thanks,
Janusz

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2}:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2.html
> 
>   * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3}:
>     - shard-lnl:          [DMESG-WARN][5] ([Intel XE#324]) -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11425_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1125])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#660])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#664])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1426]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [FAIL][13] ([Intel XE#1659])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1407]) +4 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +16 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +15 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#367])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1512])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367]) +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +27 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1399]) +16 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#787]) +97 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#306]) +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +12 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#373]) +15 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#307]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-3/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1413]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1424]) +5 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#309]) +7 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#323]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#323])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#702])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#703])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-466/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1421]) +6 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@bo-too-big-interruptible:
>     - shard-lnl:          NOTRUN -> [TIMEOUT][39] ([Intel XE#1504]) +1 other test timeout
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@kms_flip@bo-too-big-interruptible.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#886]) +1 other test fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1397] / [Intel XE#1745])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1397])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1401] / [Intel XE#1745]) +7 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1401]) +7 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#656]) +47 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#651]) +19 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#651]) +34 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#653]) +36 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#417])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1470])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][52] ([Intel XE#1162])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][53] ([Intel XE#2019])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#599]) +12 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#455]) +17 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#361]) +1 other test fail
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#498]) +7 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#305]) +15 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-lnl:          [PASS][61] -> [SKIP][62] ([Intel XE#870])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-4/igt@kms_pm_backlight@basic-brightness.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#870])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          NOTRUN -> [FAIL][64] ([Intel XE#1430])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1129] / [Intel XE#1201])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1439]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#1489]) +4 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1128])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#929]) +24 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@pr-cursor-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1406]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@kms_psr@pr-cursor-plane-move.html
> 
>   * igt@kms_rmfb@close-fd@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][71] ([Intel XE#294]) +1 other test fail
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-6/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1437]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1127] / [Intel XE#1201])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1127])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1435]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#771] / [Intel XE#899])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#899]) +1 other test fail
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#899]) +1 other test fail
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][81] ([Intel XE#2180]) +1 other test fail
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#756])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#756])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-6/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
>     - shard-lnl:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#2052] / [Intel XE#2225]) +1 other test dmesg-warn
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +3 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1126] / [Intel XE#1201])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#688]) +15 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-6/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][89] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][90] -> [TIMEOUT][91] ([Intel XE#1473])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#1600])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][93] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-436/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1392]) +12 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#288]) +30 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][96] ([Intel XE#2271])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [PASS][97] -> [TIMEOUT][98] ([Intel XE#2105])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][99] -> [ABORT][100] ([Intel XE#2271])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#560])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@xe_media_fill@media-fill.html
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#560])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#378])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@xe_module_load@force-load.html
> 
>   * igt@xe_module_load@unload:
>     - shard-dg2-set2:     [PASS][104] -> [DMESG-WARN][105] ([Intel XE#1551] / [Intel XE#2019])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-435/igt@xe_module_load@unload.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@xe_module_load@unload.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#977])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#979])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#366])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-436/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#366]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-8/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#584]) +1 other test skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [PASS][111] -> [ABORT][112] ([Intel XE#1358] / [Intel XE#1607])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-8/igt@xe_pm@s4-exec-after.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#579])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-6/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pm_residency@idle-residency:
>     - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#1442])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-7/igt@xe_pm_residency@idle-residency.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-6/igt@xe_pm_residency@idle-residency.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#958])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#944]) +3 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-8/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-lnl:          [DMESG-WARN][120] -> [PASS][121] +2 other tests pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-6/igt@core_hotunplug@hotunplug-rescan.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-1/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-dg2-set2:     [DMESG-WARN][122] ([Intel XE#1162]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [FAIL][124] ([Intel XE#1659]) -> [PASS][125] +1 other test pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [FAIL][126] ([Intel XE#886]) -> [PASS][127] +1 other test pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][128] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
>     - shard-lnl:          [INCOMPLETE][130] -> [PASS][131] +2 other tests pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [DMESG-FAIL][132] ([Intel XE#324]) -> [PASS][133] +2 other tests pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-5/igt@kms_plane@plane-position-covered.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-3/igt@kms_plane@plane-position-covered.html
> 
>   * {igt@kms_plane@plane-position-covered@pipe-b-plane-4}:
>     - shard-lnl:          [DMESG-WARN][134] ([Intel XE#324]) -> [PASS][135] +2 other tests pass
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [FAIL][136] ([Intel XE#718]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-lnl:          [FAIL][138] ([Intel XE#1649]) -> [PASS][139] +1 other test pass
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-180:
>     - shard-dg2-set2:     [INCOMPLETE][140] ([Intel XE#1195]) -> [PASS][141] +7 other tests pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-180.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
>     - shard-lnl:          [INCOMPLETE][142] ([Intel XE#1330]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
> 
>   * igt@xe_gt_freq@freq_range_exec:
>     - shard-dg2-set2:     [ABORT][144] ([Intel XE#2268]) -> [PASS][145] +1 other test pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-436/igt@xe_gt_freq@freq_range_exec.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-466/igt@xe_gt_freq@freq_range_exec.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [DMESG-WARN][146] ([Intel XE#1620]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][150] -> [PASS][151] +2 other tests pass
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-436/igt@xe_pm@s4-basic-exec.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-435/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [INCOMPLETE][152] ([Intel XE#1358]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-lnl:          [FAIL][154] ([Intel XE#1442]) -> [PASS][155]
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-6/igt@xe_pm_residency@gt-c6-freeze.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-2/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][156] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][157] ([Intel XE#1551])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][159] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_exec_reset@close-fd:
>     - shard-lnl:          [DMESG-WARN][160] ([Intel XE#2271]) -> [ABORT][161] ([Intel XE#2271] / [Intel XE#2309])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-lnl-2/igt@xe_exec_reset@close-fd.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-lnl-5/igt@xe_exec_reset@close-fd.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-dg2-set2:     [INCOMPLETE][162] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][163] ([Intel XE#1551] / [Intel XE#569])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][164] ([Intel XE#1162] / [Intel XE#1941]) -> [INCOMPLETE][165] ([Intel XE#1162] / [Intel XE#1195])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2180]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2180
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2225
>   [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>   [Intel XE#2268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2268
>   [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
>   [Intel XE#2309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7929 -> IGTPW_11425
>   * Linux: xe-1621-edeb340ae6172c699ea801a19d831d37cee9d2b3 -> xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7
> 
>   IGTPW_11425: eac9ea37cf3260872513fc310dde1efb3c2fdd0f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7929: 7929
>   xe-1621-edeb340ae6172c699ea801a19d831d37cee9d2b3: edeb340ae6172c699ea801a19d831d37cee9d2b3
>   xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7: 66d3fbb024886f8fbbc15fe79222f046cccd18c7
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/index.html
> 




