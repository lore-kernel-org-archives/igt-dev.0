Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB62106F311
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 09:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19C610EA74;
	Thu, 26 Mar 2026 09:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XmCuGnuc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2075510EA74
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774517274; x=1806053274;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4OwV+WD9t39Vj3Au8z/udlwAloNTk1fIzY03tYtkGeA=;
 b=XmCuGnucPhpV7UZfZmrMTMcV6PkW8XLdRwaPHUn/+Cbfy0O/nbBN8/pA
 7JD9PQtr6h3qXqXUmPys4hV+WKzwGESDI6eW3kY6U4l/WTN6qBOIr9PFy
 L7+bRlvnhDH6Iv0vyMMCHejV7Cf7OrC63v5NNkxJ4eCoQBDBRraQ574UT
 X5CO5XYGZ2wZaN7RJl6AJMAZ4CAlHc5h0lhsC6FGbHdtSqk2GRcFW9p8a
 noChQFewzsN4v0idhyTnN17Y07H6C9Rf0+gMVR2J6qZAG7/RIbQ0lKdQs
 xvNxnwMwAmeIPByIhlHYmpKW2x9DAuLNmqH6FD9IsTasWHUFkBANZ2FNW w==;
X-CSE-ConnectionGUID: iAeKzmsFT6G7MPyT1QsOHQ==
X-CSE-MsgGUID: 2FAmEAIGSLCPUXItAYsdCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78165613"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="78165613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:27:53 -0700
X-CSE-ConnectionGUID: Y6T9DUmKSLmlx9FMcWFeHg==
X-CSE-MsgGUID: 6wmiBjTpRSyp7QwVSYAZqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="229719467"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.169])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:27:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t 1/4] tests/intel/kms_frontbuffer_tracking: update
 the outdated fbc status checks
In-Reply-To: <20260326072555.160329-2-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
 <20260326072555.160329-2-vinod.govindapillai@intel.com>
Date: Thu, 26 Mar 2026 11:27:47 +0200
Message-ID: <e2800fef737c676e44f15a7be8441ce89cae66f3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 26 Mar 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> Replace the fbc status check for "mode too large for compression" wchich
> is no longer being set by the driver with "plane size too big" and
> "surface size too big" fbc status checks.
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index c16f63199..e764c9ce1 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1664,15 +1664,23 @@ static bool fbc_stride_not_supported(void)
>  	char buf[128];
>  
>  	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
> +	return strstr(buf, "FBC disabled: stride not supported\n");
>  }
>  
> -static bool fbc_mode_too_large(void)
> +static bool fbc_plane_size_too_big(void)
>  {
>  	char buf[128];
>  
>  	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: mode too large for compression\n");
> +	return strstr(buf, "FBC disabled: plane size too big\n");
> +}
> +
> +static bool fbc_surface_size_too_big(void)
> +{
> +	char buf[128];
> +
> +	debugfs_read_crtc("i915_fbc_status", buf);
> +	return strstr(buf, "FBC disabled: surface size too big\n");
>  }
>  
>  static bool fbc_psr_not_possible(void)
> @@ -2356,7 +2364,8 @@ static void do_status_assertions(int flags)
>  	if (flags & ASSERT_FBC_ENABLED) {
>  		igt_require(!fbc_not_enough_stolen());
>  		igt_require(!fbc_stride_not_supported());
> -		igt_require(!fbc_mode_too_large());
> +		igt_require(!fbc_plane_size_too_big());
> +		igt_require(!fbc_surface_size_too_big());

I think the problem with the current implementation and this series is
that it still keeps all those i915_fbc_status reads in place, instead of
reading it *once* and then figuring it out.

You could e.g. have a function that reads i915_fbc_status, parses it
into, I don't know, an enum on the igt side, with some handling of
unknown "FBC disabled: xxx" messages, and returns that.

And then you get that status once, and check that, instead of reading
the file N times.

BR,
Jani.

>  		igt_require(!fbc_psr_not_possible());
>  		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
>  			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),

-- 
Jani Nikula, Intel
