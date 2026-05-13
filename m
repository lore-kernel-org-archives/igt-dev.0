Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCA3CD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 15:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE3C10EF4F;
	Wed, 13 May 2026 15:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htL++eWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C5210E32E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 15:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778687537; x=1810223537;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ee9bfr3l35nfauuM0qNf3/xRS6FLv0r38WzjpGcpAyY=;
 b=htL++eWJiubRIMH7i7Nc9tbJnRSEOwgxgqA4eJp3NDujbzjFpGRtfnLE
 6R/1N8HzpI0schD/z397PiKeRIhAzMChTA6guEJ1rA2ytwfvuhOPwzFdF
 UvZXuPI5KBtc39RfoIo/u0xGeMbZMoeayPtuHD/1DaMnK+DbvoDObQPKM
 RLtzOs6eKkfJE1eDqPXSWVb13Pf9v5mZcg0Idw0cKuyv698jnd1wxakXW
 kkp8GOTv08B68iV/Q2RlQcYvKtEATwUTUrYCDpJ2LhblW0gH2C/z8+iht
 bk3IEW0Q47AFG8LXSyvBOJRjmiiIoMP5slykP6Rkcf6GuzRz6k5GYlU2s Q==;
X-CSE-ConnectionGUID: ND/zUaraRka+OI796w62kw==
X-CSE-MsgGUID: osn5GF1GRyG7sRFMp4k2JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105078319"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="105078319"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 08:52:17 -0700
X-CSE-ConnectionGUID: mZfzBb7JRje9M1wJyQ2EwQ==
X-CSE-MsgGUID: oK1t2pGLQXyCiF5R8XHaug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="238363747"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 08:52:15 -0700
Date: Wed, 13 May 2026 17:52:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
Message-ID: <20260513155213.roxuxvaoohlbzcuv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260505194419.500600-5-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505194419.500600-5-dev@lankhorst.se>
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

Hi Maarten,
On 2026-05-05 at 21:44:20 +0200, Maarten Lankhorst wrote:

please remove a dot from end of subject, so it will be:

[PATCH i-g-t 1/4] lib/igt_kms: Add support for the BACKGROUND_COLOR property

+cc Karthik, J-P and Swati

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil

> The background color is a 64-bits property that contains the ARGB values
> of the background with 16 bits for each component.
> 
> Add support for the BACKGROUND_COLOR property, and set to pitch black
> as the default.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  lib/igt_kms.c | 4 ++++
>  lib/igt_kms.h | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99fc9fa05c..b70aefe697 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -731,6 +731,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
>  	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
>  	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
>  	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
> +	[IGT_CRTC_BACKGROUND_COLOR] = "BACKGROUND_COLOR",
>  };
>  
>  const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
> @@ -2737,6 +2738,9 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
>  	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
>  		igt_crtc_set_prop_value(crtc, IGT_CRTC_SHARPNESS_STRENGTH, 0);
>  
> +	if (igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR))
> +		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR, 0xffff000000000000ULL);
> +
>  	crtc->out_fence_fd = -1;
>  }
>  
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a58cb5cd34..71f908d4f5 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -165,6 +165,7 @@ enum igt_atomic_crtc_properties {
>         IGT_CRTC_VRR_ENABLED,
>         IGT_CRTC_SCALING_FILTER,
>         IGT_CRTC_SHARPNESS_STRENGTH,
> +       IGT_CRTC_BACKGROUND_COLOR,
>         IGT_NUM_CRTC_PROPS
>  };
>  
> -- 
> 2.53.0
> 
