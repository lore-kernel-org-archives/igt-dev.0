Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8871CD25056
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 09:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E08110E080;
	Mon, 12 Jan 2026 09:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZcfiHIup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9A310E080
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768208681; x=1799744681;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=klLddcIeW+Ru5kPtslebCfjqT6v9wktxHSaaNZrVVKE=;
 b=ZcfiHIupZQ19ruiZ56oPzMBmqXgpXcCNK82aiX6FoUfHjH+Kmv1B8tjt
 eSL5faJ1ocJBuuzHbKG/1BdIufxWKKTzwvWY9VaSBcbUMeivoW4ApcmeK
 wKL1pJdjqIB7nXj7/bOiMR/J8e+enAHBzXqj3k1LLY+TY76lnkTlRP4AX
 blAl8aLxXoo750ZPS0rMttyP0TcmblnGJ0Mwm9cw+0AwqL2WXByCHbfAy
 MYmlnOkMgmXQF/EgDCN10r20wGITK78Cwmxec4CWMvFec5AnAC/Fq6/71
 xVAHNu/E5RucWv6/AFN+l1g+yjwLJEtLaa7DANpSMNcVw6AmrOd5z7BYW g==;
X-CSE-ConnectionGUID: NpSIaFwAR1OHbxUB3O1KLA==
X-CSE-MsgGUID: vq/18fBhTSulE7ufWQ/ISg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69378762"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69378762"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 01:04:40 -0800
X-CSE-ConnectionGUID: Ds9qBNKkRGeWV2cPe0f1pA==
X-CSE-MsgGUID: uYt5rTvhSDePmGQhuZf9QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208525533"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:04:39 -0800
Date: Mon, 12 Jan 2026 10:04:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Add helper to validate modes
Message-ID: <20260112090437.cp7ixizknwso5m35@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com
References: <20260112084455.157949-1-karthik.b.s@intel.com>
 <20260112084455.157949-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112084455.157949-2-karthik.b.s@intel.com>
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

Hi Karthik,
On 2026-01-12 at 14:14:54 +0530, Karthik B S wrote:
> Add a helper function kmstest_mode_is_valid() that checks if
> a given drmModeModeInfo pointer is non-NULL and has positive
> width, height, and pixel clock.
> 
> This allows tests to safely check if an output mode is usable before
> assigning it to a pipe or creating a framebuffer.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/igt_kms.c | 14 ++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a58f41b48..9e5820d43 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5197,6 +5197,20 @@ const char *igt_output_name(igt_output_t *output)
>  	return output->name;
>  }
>  
> +/**
> + * kmstest_mode_is_valid:
> + * @mode: pointer to drmModeModeInfo
> + *
> + * Returns: True if the mode is non-NULL and has valid width, height and RR.

Please do not use shortcuts in description, write full name instead of 'RR'.

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> + */
> +bool kmstest_mode_is_valid(const drmModeModeInfo *mode)
> +{
> +	return mode &&
> +	       mode->hdisplay > 0 &&
> +	       mode->vdisplay > 0 &&
> +	       mode->vrefresh > 0;
> +}
> +
>  /**
>   * igt_output_get_mode:
>   * @output: Target output
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 4a814f0e9..e10441017 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -585,6 +585,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pi
>  }
>  
>  const char *igt_output_name(igt_output_t *output);
> +bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
>  drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
>  drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
>  drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
> -- 
> 2.43.0
> 
