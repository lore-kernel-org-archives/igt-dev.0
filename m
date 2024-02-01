Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF6EC47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 12:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6573C10ED3E;
	Thu,  1 Feb 2024 12:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2FKrnOi";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 12:50:32 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8E210ED3E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706791832; x=1738327832;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=61Mh02WnF3wj+gysvBHZVQ5u7W6rpMFV2kb16R96Zz4=;
 b=M2FKrnOi8ZSCS7XWArOX37FCwew2vadf8v9tzHMh3+LPqofaSgbIVUFP
 NUYD3EHbiffSHt/gHcYUSRcS+XBM1+pc2Dhcg+AEQgnNGn/Xc+9fcaY8x
 GscJ4jUcMtkyBnNUbAuFUPC1ZVzOosyyQ8zNZv2IONW5AziUv+qLt4i2T
 PrLRvmaNc8DeJcQ831P6J+YWAf1h+OuoCMbR0j9g3y88gUr7RwROVOkxQ
 l/b1GKFyGJRU+uQX9yfxWa/WU633MYBP+SINWxEInyUqdWi548UeiPFNA
 tl6Wz+wo3lrxzfdZTUtzMktpIcYAj/gb0X+2tP2sa9Ioe7MD7AfE0nRXb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="83691"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="83691"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 04:43:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822910372"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="822910372"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 04:43:23 -0800
Date: Thu, 1 Feb 2024 13:43:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_drm_fdinfo: Use longest match first
Message-ID: <20240201124321.53t4qbtlswisipoe@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
 <20240201004744.352041-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240201004744.352041-2-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-01-31 at 16:46:24 -0800, Lucas De Marchi wrote:
> Instead of checking twice the match, just use longest match first.

Nice catch, LGTM.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_drm_fdinfo.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 222ccbfb1..5c0ccf624 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -239,8 +239,15 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>  					 strlen("drm-client-id")))) {
>  			info->id = atol(v);
>  			good++;
> -		} else if (!strncmp(l, "drm-engine-", 11) &&
> -			   strncmp(l, "drm-engine-capacity-", 20)) {
> +		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {

One more thing to eventually fix is removing "20" which is exact
len of string, with something like

bool str_begins(char *src, char *pattern)

One source of errors is counting letters in strings or changing
string itself without changing corresponding len. This can be
done in separate patch.

Regards,
Kamil

> +			idx = parse_engine(l, info,
> +					   strlen("drm-engine-capacity-"),
> +					   name_map, map_entries, &val);
> +			if (idx >= 0) {
> +				info->capacity[idx] = val;
> +				num_capacity++;
> +			}
> +		} else if (!strncmp(l, "drm-engine-", 11)) {
>  			idx = parse_engine(l, info, strlen("drm-engine-"),
>  					   name_map, map_entries, &val);
>  			if (idx >= 0) {
> @@ -251,14 +258,6 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>  				if (idx > info->last_engine_index)
>  					info->last_engine_index = idx;
>  			}
> -		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
> -			idx = parse_engine(l, info,
> -					   strlen("drm-engine-capacity-"),
> -					   name_map, map_entries, &val);
> -			if (idx >= 0) {
> -				info->capacity[idx] = val;
> -				num_capacity++;
> -			}
>  		} else if (!strncmp(l, "drm-total-", 10)) {
>  			idx = parse_region(l, info, strlen("drm-total-"),
>  					   region_map, region_entries, &val);
> -- 
> 2.43.0
> 
