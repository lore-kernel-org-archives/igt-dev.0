Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742B4C5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 11:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1698510E205;
	Thu, 29 May 2025 11:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwdrdRGh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8327A10E205
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748519746; x=1780055746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aXJ08fgXGHZf3bZzwYOpnhBNPx/ulxsvf6e06E6hSDw=;
 b=CwdrdRGhfohBkatHQOjwqGHHjOp3/IAcloQDCDm4TKG0OCMaa7Fflhje
 NRxoOhICeBKCdSthk0TJ5wydYPYtr2vnA8xpdppoHjv76ZDbKu3eTxX2b
 Rqet1dbbZ7zLl91isNuSg4ruIWWkqWImaB4ZOtHpyuzfH0cH4Lnx++2W4
 3BugXgtlaEimn1ZHfxUmOSD0IXDcgJzX/BL76hDX2qt6l+8+MC1Zvc9g/
 hqdoh0sX7YssJIEOIQvMMMNfsUeRurkLkWNEM1tBMdm6dzOpjzMTsofFU
 pkCauyMYCh+dePRiQBEd6mw7fJg5vPIePipqBlJpABcQM2dhYVq/w48DZ w==;
X-CSE-ConnectionGUID: jVCJzjOITh2wB5sddERlMw==
X-CSE-MsgGUID: AyOoW/8RQTy6cX7zwDiYdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50630801"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50630801"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 04:55:46 -0700
X-CSE-ConnectionGUID: 43UnKfAPQc+ANAbNaP0szQ==
X-CSE-MsgGUID: AohQSLJwSoiZOYk0xo1RCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="144008997"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:55:45 -0700
Date: Thu, 29 May 2025 13:55:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel-ci: Update xe blocklist
Message-ID: <20250529115532.f6q76oyy76abl357@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250529112811.1433740-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250529112811.1433740-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2025-05-29 at 16:58:11 +0530, Swati Sharma wrote:
> Update xe CI blocklist with KMS tests which are either missing
> driver support or are i915 specific.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 3cb10296d..52866795f 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -76,10 +76,15 @@ igt@kms_pm_lpsp@screens-disabled
>  igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
>  igt@kms_pm_rpm@.*pc8-residency.*
>  igt@kms_pm_rpm@cursor.*
> +igt@kms_cursor_legacy@basic-busy-flip-before-cursor-(atomic|legacy|varying-size)

Please keep it sorted.

>  ##################################################################
>  # KMS: Yet to add/missing XE support
>  ##################################################################
>  igt@kms_prime@.*
> +igt@kms_writeback@writeback.*
> +igt@kms_scaling_modes@scaling-mode-none
> +igt@kms_atomic@plane-primary-overlay-mutable-zpos
> +igt@kms_plane_scaling@.*downscale-factor-0-25.*

Same here, sort it alphabetically.

With this fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  ##################################################################
>  # KMS: Test was written with the idea that edid read shouldn't take an
>  # unreasonable amount of time. The timeout is an arbitrary value
> -- 
> 2.25.1
> 
