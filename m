Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A3DCD13D3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 07:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67D710F22D;
	Thu, 30 Apr 2026 07:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0MN2uIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6E610F22D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 07:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777533760; x=1809069760;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=E7pGH+VfKMOlWp2dqKsygR8Knj8XHhdclS/1h2djgNw=;
 b=M0MN2uIbRLzCWibG6BAgjrg5H1B3LrlKDcqklzuwT925+f10XkQ9y911
 AHZXNzimC1P16pBEsBqnIDocqzGR4AIelEmmrwEPkOPe1LIiQw4BlAHvc
 s7HNTu4MgUA1dRzNc/W2sDphEhhpWILJEVVyiaomCVvN1DT2YEAay1Bcr
 7mBj4w0kY14GnkeYLp+dQ5eIPRtSZsyDLRvP06wLpcd5SYs2dhsMvr6+V
 a5YyzCKe2hNi4MOjKsr9RYaTwapRvdb95/Ew5b/FsLD7cW3e3PPuohIoz
 iEpDOoiRWcQ0V5j2Ct7HqFg1HVKcejpkEkhPI6zDyYH1bzPQJmu2OU1b4 g==;
X-CSE-ConnectionGUID: iKjhUubaSzer8H/YQnwTwg==
X-CSE-MsgGUID: q46US3uHRom2joWK7efLxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81052284"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81052284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:22:39 -0700
X-CSE-ConnectionGUID: xws/XankTiSLpvcymiGrhw==
X-CSE-MsgGUID: B43F2MyGRE+w+GuNOKn8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="234773226"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.68])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:22:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t, v5 1/4] lib/igt_kms: Add igt_get_joined_pipes_name()
In-Reply-To: <20260429195115.2332923-2-swati2.sharma@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260429195115.2332923-1-swati2.sharma@intel.com>
 <20260429195115.2332923-2-swati2.sharma@intel.com>
Date: Thu, 30 Apr 2026 10:22:34 +0300
Message-ID: <91a55230d8c6314a0a2b853434f2814a887f9676@intel.com>
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

On Thu, 30 Apr 2026, Swati Sharma <swati2.sharma@intel.com> wrote:
> Add function to transform the enum into a string.
>
> v2: -Improved func() doc (Jeevan)
> v3: -Return names without '-' dash prefix (Santhosh)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  lib/igt_kms.c | 22 ++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 23 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2efdfb85f..bece27ff6 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1906,6 +1906,28 @@ bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int
>  	return true;
>  }
>  
> +/**
> + * igt_get_joined_pipes_name:
> + * @val: forced value
> + *
> + * Returns: A joined_pipes enum value into a readable string.
> + */
> +const char *igt_get_joined_pipes_name(enum joined_pipes val)
> +{
> +	switch (val) {
> +	case JOINED_PIPES_DEFAULT:
> +		return "";
> +	case JOINED_PIPES_NONE:
> +		return "none";
> +	case JOINED_PIPES_BIG_JOINER:
> +		return "bigjoiner";
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		return "ultrajoiner";
> +	default:
> +		igt_assert(false);
> +	}
> +}

I don't really think this belongs in lib/igt_kms.[ch]. And to be fair,
IMO none of the joiner code belongs here, because it's Intel specific,
and this is supposed to be generic code.

BR,
Jani.


> +
>  /**
>   * kmstest_force_edid:
>   * @drm_fd: drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index fcbb6a5ad..6898cd981 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1280,6 +1280,7 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>  int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>  int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>  uint32_t igt_get_connected_output_count(igt_display_t *display);
> +const char *igt_get_joined_pipes_name(enum joined_pipes val);
>  
>  drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);

-- 
Jani Nikula, Intel
