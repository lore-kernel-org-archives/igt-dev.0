Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38816CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 11:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB15810E11F;
	Thu, 18 Sep 2025 11:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxubI9yd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1931410E11F
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758196063; x=1789732063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kfakbHRV3/Mar131ceWBDiRfmNUoD1R7RTuTalOMjhk=;
 b=nxubI9ydFiGhYy0eCf3m1amphfmMzqS6Wfoyfze2/2KY/JO4Zx2MbZoK
 dbN4DjI+MPI4lGVq82/lTCXhrncdgimXlukdZ9z/Kdu6o4aDTNGIuVIU0
 eUJjpJlYrZNTYs0erX+zxiAWFIIoZbmnegVNonMDS4jziyhTwDotHOMbR
 6xq4apgzRwNuRnqHR/bDhYmh0XIlVR9Brop0GeMhwKtHu8I1iQI2/Ka8+
 UgB5E/TjcmsOfo6uH+T/lX4TAX8L7nQkJtv2qFS1oTpSPIRWE6425OMZT
 wvv54JJv/TnXyPNTJrPb9R0htuErdQASWCOvkcyYx895utfCf/5nx5JBZ w==;
X-CSE-ConnectionGUID: 7evdRDJlQE6J2P1Xff7GjA==
X-CSE-MsgGUID: XjGUTlO8QUqInDqqWajXIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="83120678"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="83120678"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 04:47:42 -0700
X-CSE-ConnectionGUID: Jv1YwsbHTWO6x8esp7XZlQ==
X-CSE-MsgGUID: YnAG4DY0QlyhV9UcIE/v1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175318163"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 04:47:40 -0700
Date: Thu, 18 Sep 2025 13:47:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Update BMG blocklist
Message-ID: <20250918114724.mklyi3qyxkbhg3od@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250917094143.2275560-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917094143.2275560-1-kunal1.joshi@intel.com>
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

Hi Kunal,
On 2025-09-17 at 15:11:43 +0530, Kunal Joshi wrote:

imho in subject you could add 'display', so it will be:

[PATCH i-g-t] intel-ci: Update BMG display blocklist

> update bmg blocklist with unsupported, while at it

Start from uppercase, also add a note of unblocking fbdev,
so description will be:

Update BMG display blocklist: unblock fbdev, add unsupported.
While at it update descriptions.

> update skip message
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

All of this could be done at merge, no need for resend.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Before merge I would like to see ack/r-b from KMS team.

Regards,
Kamil

> ---
>  tests/intel-ci/xe.bmg.display.blocklist.txt | 65 ++++++++++++---------
>  1 file changed, 37 insertions(+), 28 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index f145d6c0d..1686499bd 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -1,8 +1,7 @@
>  #########################################
>  # non-KMS tests
>  #########################################
> -igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
> -
> +igt@(?!.*kms|testdisplay|fbdev|.*display-vs-wb-transient)(.*)
>  #########################################
>  # Valid skip :- Y and Yf-Tiling are not supported
>  #########################################
> @@ -11,6 +10,7 @@ igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
>  igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>  igt@kms_async_flips@invalid-async-flip
>  igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> +igt@kms_pipe_stress@.*ytiled$
>  #########################################
>  # Valid skip :- 90/270 rotation is not supported
>  ##########################################
> @@ -23,7 +23,7 @@ igt@kms_rotation_crc@sprite-rotation-90-pos-100-0
>  ##########################################
>  igt@kms_atomic@plane-primary-overlay-mutable-zpos
>  ##########################################
> -# Valid skip :- Requires TV connector not present on BMG
> +# Valid skip :- Requires TV connector
>  ##########################################
>  igt@kms_tv_load_detect@load-detect
>  ##########################################
> @@ -43,7 +43,6 @@ igt@kms_cursor_crc@.*-(32x10|32x32|512x)
>  # Valid skip :- Downscaling factor is not supported
>  ##########################################
>  igt@kms_plane_scaling@.*downscale-factor-0-25.*
> -igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-(5|75)
>  igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-(5|75)
>  ##########################################
>  # Valid skip :- Downscaling is not supported on second plane MTL+
> @@ -58,21 +57,30 @@ igt@kms_cursor_crc@.*128x42
>  igt@kms_cursor_crc@.*256x85
>  igt@kms_cursor_crc@cursor-(offscreen|onscreen|random|rapid-movement|sliding)-512x(512|170)
>  ##########################################
> -# Valid skip as BMG doesn't have eDP supported
> +# Valid skip :- BMG doesn't have eDP support
>  ##########################################
>  igt@kms_vrr@seamless-rr-switch-vrr
> +igt@kms_vrr@cmrr.*
> +igt@kms_atomic_transition@.*-internal-panels$
> +igt@.*psr.*
> +igt@kms_pm_backlight@.*
> +igt@kms_pm_power_saving@.*
> +igt@kms_scaling_modes@.*
> +igt@kms_panel_fitting@.*
> +igt@.*@.*(?!no-)drrs.*
>  #########################################
> -# no VGA connectors in BMG
> +# Valid skip :- Require VGA connector
>  #########################################
>  igt@.*chamelium.*vga.*
>  ##########################################
> -# Expected skip as GSC not present in BMG
> +# Valid skip :- GSC not present in BMG
>  ##########################################
>  igt@kms_content_protection@content-type-change
>  igt@kms_content_protection@lic-type-1
>  igt@kms_content_protection@type1
> +igt@kms_content_protection@mei-interface
>  #########################################
> -# Expected skip as BMG doesn't have PORT_A/B
> +# Valid skip :- BMG doesn't have PORT_A/B
>  #########################################
>  igt@kms_pm_rpm@modeset-lpsp
>  igt@kms_pm_rpm@modeset-lpsp-stress
> @@ -81,49 +89,46 @@ igt@kms_pm_rpm@dpms-lpsp
>  igt@kms_pm_lpsp@kms-lpsp
>  igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
>  #########################################
> -# Expected Skip : flat ccs has only one buffer
> +# Valid skip :- Flat ccs has only one buffer
>  #########################################
>  igt@kms_getfb@getfb-reject-ccs
>  #########################################
> -# Expected skip for graphics ver >= 20
> +# Valid skip :- Valid for graphics ver >= 20
>  #########################################
>  igt@kms_getfb@getfb2-accept-ccs
> +igt@kms_vrr@lobf
>  ##########################################
> -# Valid skip :- Feature is not enabled on kernel
> -##########################################
> -igt@kms_writeback@.*
> -##########################################
> -# Valid skip :- dc6 is not supported by dgfx
> +# Valid skip :- DC6 is not supported by dgfx
>  #########################################
>  igt@kms_pm_dc@deep-pkgc
>  igt@kms_pm_dc@dc6-dpms
> -
> +#########################################
> +# Valid skip :- BMG has only one cdclk (WA)
> +#########################################
> +igt@kms_cdclk@.*
>  ##########################################
> -# Valid skip :- DG2 & MTL specific
> +# Valid skip :- DG2 & MTL specific & LNL specific
>  ##########################################
>  igt@kms_ccs@.*-dg2-.*
>  igt@kms_ccs@.*-mtl-.*
>  igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +igt@kms_ccs@.*-lnl-.*
>  ##########################################
>  # Valid skip :- Simulation specific
>  ##########################################
>  igt@kms_pm_dc@dc3co-vpb-simulation
>  igt@kms_simulation_hpd@sim-hpd
>  #########################################
> -# Chamelium v1 HDMI receiver doesn't support 4k
>  #########################################
> -igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> -#########################################
> -# Valid skip on non-hybrid configuration
> +# Valid skip :- Require non-hybrid configuration
>  #########################################
>  igt@kms_addfb_basic@invalid-smem-bo-on-discrete
>  #########################################
>  # crc-random cases are resource intensive
>  #########################################
>  igt@.*chamelium.*random.*
> -
>  ##########################################
> -# Valid skip :- cursor moving doesn't take slowpath
> +# Valid skip :- Cursor moving doesn't take slowpath
>  ##########################################
>  igt@kms_cursor_legacy@(short|basic)-busy-flip-before
>  igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-(transitions|transitions-varying-size)
> @@ -139,20 +144,24 @@ igt@kms_setmode@basic-clone-single-crtc
>  ##########################################
>  igt@kms_setmode@invalid-clone-exclusive-crtc
>  ##########################################
> -# Valid skip for display ver < 20
> +# Valid skip :- For display ver < 20
>  ##########################################
>  igt@kms_frontbuffer_tracking@plane-fbc-rte
>  #########################################
> -Unsupported for platform with Wa_16023588340
> +# Valid skip :- Unsupported for platform with Wa_16023588340
>  #########################################
>  igt@kms.*fbc.*
>  #########################################
> -# Use either of linear-tiling or
> -# connected-linear-tiling
> +# Valid skip :- Use either of linear-tiling or
> +#               connected-linear-tiling
>  #########################################
>  igt@kms_bw@linear-tiling-.*-display.*
>  #########################################
> -# Linear + hflip combination is not supported on BMG
> +# Valid skip :- Linear + hflip combination is not supported on BMG
>  #########################################
>  igt@kms_big_fb@linear-max-hw-stride.*hflip
>  #########################################
> +# Valid skip :- For display ver >= 30
> +#########################################
> +igt@kms_pm_dc@dc5-retention-flops
> +#########################################
> -- 
> 2.25.1
> 
