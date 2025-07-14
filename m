Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7621FC83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 10:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EF210E1F2;
	Mon, 14 Jul 2025 10:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qo8iGDRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B472E10E1F2
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 10:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752489695; x=1784025695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V72hY+r+fLdILdCRNTPOSXgCqK8UjxZa+pU3uT2QWcc=;
 b=Qo8iGDRjJt4sBK5DgSKEct6sqIlJkfUMHyqFJcrtbvR7rYET0DMgpmRK
 SD+DLsqE2f98UMJQGciwATnhKpItdxsKcTJlyg99Ol0GIcrl2qfUBVYGT
 Guz9WtDpEZ6961+wLw3g77veccEXltLWQ/jtMr9dVdjfbE/jboOGvMkvm
 nG7B5EIJ8QAGP9soo95hY2TOgac5t+k6Hi/TK5vureAXAh3no568oHOz6
 Mcwut2mluEOWOelDvbnnvMS/7IAbay89aL32kgikRyzXuGlOvNpz4omMZ
 MdKe3bAnEjhlq1ClQiFqdy8XfnD1TYryCLnM9aorZGRZ4pKp7u1wv2p6V Q==;
X-CSE-ConnectionGUID: bu5VzUVFRrOx55pRuP6hrw==
X-CSE-MsgGUID: naNEAl3QThC4sdhyygQfWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54804304"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="54804304"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 03:41:35 -0700
X-CSE-ConnectionGUID: HdQeMdVzSOqvo5OFlKRZCw==
X-CSE-MsgGUID: 2vNJq7hMQU2H8N8QORYQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="156699706"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 03:41:33 -0700
Date: Mon, 14 Jul 2025 12:41:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Message-ID: <20250714104130.jh2ahvmtilyx74sk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250710070527.188720-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710070527.188720-1-jeevan.b@intel.com>
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
On 2025-07-10 at 12:35:27 +0530, Jeevan B wrote:
> If an eDP connector is present, prefer selecting its default mode for
> cloning. Some eDP panels support only high refresh rate (HRR) modes,
> which may not be compatible with external displays. To avoid invalid
> clone configurations and test failures, we choose the default mode
> from the eDP connector when available.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_setmode.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 484c3a95f..462313e5a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -252,12 +252,28 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  			goto found;
>  	}
>  
> +	/* If an eDP connector is present, prefer selecting its default mode
> +	 * for cloning, since internal panels typically dictate the clone mode
> +	 * and may have HRR support, making them incompatible with modes
> +	 * supported by external displays.
> +	 */
> +	mode = &crtc->cconfs[0].default_mode;

Remove above change.

> +	for (i = 1; i < crtc->connector_count; i++) {
> +		drmModeConnector *conn = crtc->cconfs[i].connector;
> +
> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +			if (crtc->cconfs[i].default_mode.clock < mode->clock)
> +				mode = &crtc->cconfs[i].default_mode;
> +		}
> +		goto found;
> +	}

Looks good, let the KMS devs look into this, so
+cc Swati and Karthik
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

> +
>  	/*
>  	 * If none is found then just pick the default mode from all connectors
>  	 * with the smallest clock, hope the other connectors can support it by
>  	 * scaling etc.
>  	 */
> -	mode = &crtc->cconfs[0].default_mode;

Do not remove this as this is documented here.


Regards,
Kamil

> +
>  	for (i = 1; i < crtc->connector_count; i++)
>  		if (crtc->cconfs[i].default_mode.clock < mode->clock)
>  			mode = &crtc->cconfs[i].default_mode;
> -- 
> 2.43.0
> 
