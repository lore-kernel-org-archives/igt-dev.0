Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17C4CD1292
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 08:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A5110EF65;
	Thu, 11 Apr 2024 08:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGq+su5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E493C10EF65
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712823932; x=1744359932;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=X/Xbpmt3NCGsEeObFmTc4RkfS0s70GnEVslfA4lyV7Y=;
 b=PGq+su5k+3ISknlQlskYG/SJnkQhosaljfiL1EMhmubaFGuAG73+cPjG
 HGhU7/9vYErzKq/BiO2T1w8FRWxDHZ0CGtZOpm24BA6fXj3+FRfAY1PHk
 +9FYPXiE2UlwunxOSC8MwMnmpYTiIu8vM/86hq3Cb7vMTB9d/N458nmK4
 mww38KzAN1H9EKJi1UVyjdG271FiSzNwY+52m79wULXrs3/Ghj6/bwfCS
 XT2bmm7jSqmh79Xf1nibIuDsyO30MA4g/IL5Z4xLVusFK7ODkqlEZ4B4i
 qGSmJsy6xPVgh0SR/y8Xk9GUiBE+QutLJQxPvJw+z3rp7U/c/NSLeQCUa w==;
X-CSE-ConnectionGUID: mZewgt1+T5yaZwYf3foOxQ==
X-CSE-MsgGUID: 2pr08lIVRPuyAl2+baKyug==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8328499"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8328499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 01:25:31 -0700
X-CSE-ConnectionGUID: SSubD+rKSOWSInJ8xR0Xew==
X-CSE-MsgGUID: iZcZHuEXQLq0X/oELaH7TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="25478013"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:25:30 -0700
Date: Thu, 11 Apr 2024 10:25:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/kms: Simplify force_connectors[] error
 handling
Message-ID: <20240411082511.sovecvuopmcuhcnr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
References: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
 <20240410150229.28922-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410150229.28922-2-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-04-10 at 18:02:28 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The failure to allocate a forced_connector entry is entirely
> our own fault. If we hit this then we've screwd up and made
> the array too small. Skip the error handling and just assert
> that we must have enough room in the array.
> 
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f7dd1db91827..19bb4ac66ece 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1518,8 +1518,7 @@ static struct igt_forced_connector *forced_connector_alloc(void)
>  	for (i = 0; forced_connectors[i].connector_type; i++)
>  		;
>  
> -	if (i >= ARRAY_SIZE(forced_connectors))
> -		return NULL;
> +	igt_assert_lt(i, ARRAY_SIZE(forced_connectors));

Asserts in libs are ugly, could we just realloc it once?
Btw (i == ARRAY_SIZE(forced_connectors) should be ok? Or do
we treat this as a end-of-array guard?

If you insist on keeping assert please at least give a message
for ease of debug.

Regards,
Kamil

>  
>  	return &forced_connectors[i];
>  }
> @@ -1558,11 +1557,6 @@ static bool force_connector(int drm_fd,
>  	}
>  
>  	c = forced_connector_alloc();
> -	if (!c) {
> -		igt_warn("Connector limit reached, %s will not be reset\n", name);
> -		close(dir);
> -		return true;
> -	}
>  
>  	c->idx = idx;
>  	c->connector_type = connector->connector_type;
> -- 
> 2.43.2
> 
