Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC6ACAC5A0
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 15:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC0310E1F8;
	Thu, 18 Sep 2025 15:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CD7FSE00";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A8C10E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758210118; x=1789746118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/JWBJxF6eCQ27/1WQQJhqu39Ug6c4qYCrxsY9yFE708=;
 b=CD7FSE00xhxpY0mkW2kKQocCkLIvsbYKLqcGMle46h+yY02GbDnRPfKN
 v5u2tfckc+NkOjAxa/azoDe1RejJnYgDp/x16A+1AjRflkEvb/7EvIGCY
 BiLY+tEWWBeIlNEuAFG2rXp8RNBpS8syx/c/rgKuQ572RPBoWY6J5FOcr
 IaiYa06j8ObqvUIOisV4kJPihfXDWlrbF5NkDNfMxWBy++CLKbDvERpAh
 MTr96siWJeHgr3XpS847KbfyKAqN105UgP/cpkTsVYofT1YWTwXuy4HS7
 KBk7EOJkquw1jpRyBRkfd7kO3P0GDihVdo3CEspJ5FXN/OKOHev5Pd9wq w==;
X-CSE-ConnectionGUID: lc9cocilTkmoTdAbySqLRQ==
X-CSE-MsgGUID: nx+OfBLpSayBC2IjiK20cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="70796493"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="70796493"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 08:41:57 -0700
X-CSE-ConnectionGUID: HvNtOPlGTAuxNwb/mJs16A==
X-CSE-MsgGUID: pdnXRg8NSH6lLRo9YF4vwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="179861731"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 08:41:56 -0700
Date: Thu, 18 Sep 2025 17:41:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Message-ID: <20250918154153.cop2oiparqg2tbph@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com
References: <20250917144308.1355953-1-jeevan.b@intel.com>
 <20250917144308.1355953-3-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917144308.1355953-3-jeevan.b@intel.com>
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

Hi Jeevan,
On 2025-09-17 at 20:13:08 +0530, Jeevan B wrote:
> If an eDP connector is present, prefer selecting its default mode for
> cloning. Some eDP panels support only high refresh rate (HRR) modes,
> which may not be compatible with external displays. To avoid invalid
> clone configurations and test failures, we choose the default mode
> from the eDP connector when available.
> 
> v2: Fix logic for eDP fallback.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_setmode.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 49fc45043..43d1fc914 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -256,6 +256,25 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  		}
>  	}
>  
> +	/* If an eDP connector is present, prefer selecting its default mode
> +	 * for cloning, since internal panels typically dictate the clone mode
> +	 * and may have HRR support, making them incompatible with modes
> +	 * supported by external displays.

Could you also write that you choose mode with lowest clock?
It also returns on first found eDP.

Without a goto it looks better but I am not an KMS dev so I will
leave this to Swati.

Regards,
Kamil

> +	 */
> +	for (i = 0; i < crtc->connector_count; i++) {
> +		drmModeConnector *conn = crtc->cconfs[i].connector;
> +
> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +			mode = &conn->modes[0];
> +			for (int j = 1; j < conn->count_modes; j++) {
> +				if (conn->modes[j].clock < mode->clock)
> +					mode = &conn->modes[j];
> +			}
> +			*mode_ret = *mode;
> +			return;
> +		}
> +	}
> +
>  	/*
>  	 * If none is found then just pick the default mode from all connectors
>  	 * with the smallest clock, hope the other connectors can support it by
> -- 
> 2.43.0
> 
