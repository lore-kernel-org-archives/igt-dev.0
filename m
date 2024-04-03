Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BF8CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 17:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EB11127CF;
	Wed,  3 Apr 2024 17:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/sDmQSi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABC71127CF
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712165030; x=1743701030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J2/wHSAbGGV6/LqR2xmIeN27tLQKfCoLeRoVYEEmDwQ=;
 b=Z/sDmQSidMHrr+Rirdzx5oNm/vK84kJVetC04uFq54nUUS3+Tw5+Pciz
 cjAE+7UzO3/FbbOTROwxgEUV0+GMlmKGY4BI/lTb++QBYyGgytK1W4xNd
 0zqHdYnBGXXryMZInCEybeulm6e7OX32OXT+girhFEAgKo5XRKcB21vSY
 6Nf1/YY/PUWpS61DAfLWFT8krEc4we78xilt1iohrk5/Xtba6oPqfWqTT
 pBfyqwrVaqiJl+dREJhJhAA0+jNkDzD9M89Ccs+i4RxNpRBIQ/zc18vQ6
 P5c/9Ys7xs0VJbDd5BtnlShv6oVUYIAg9FXkAHSdtJ3Y96yevhPxVmh1h A==;
X-CSE-ConnectionGUID: eerVdbo3S56phugQLZeb6g==
X-CSE-MsgGUID: dByZFNEbRLmCIBqO1HGl5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11241891"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11241891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:23:50 -0700
X-CSE-ConnectionGUID: zTbXj96+Rb6qtPFIS3fi9Q==
X-CSE-MsgGUID: NCN5OzttRzKDhrDxU5M8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18618224"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:23:48 -0700
Date: Wed, 3 Apr 2024 19:23:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/8] lib/igt_drm_clients: Use calloc
Message-ID: <20240403172345.xh54t354getamv4v@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-2-lucas.demarchi@intel.com>
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
On 2024-04-02 at 15:17:09 -0700, Lucas De Marchi wrote:
> Replace malloc + memset with a single calloc as it's shorter and there's
> no point keeping them separate.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_drm_clients.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
> index 025d60c51..90ca6d61c 100644
> --- a/lib/igt_drm_clients.c
> +++ b/lib/igt_drm_clients.c
> @@ -35,12 +35,10 @@ struct igt_drm_clients *igt_drm_clients_init(void *private_data)
>  {
>  	struct igt_drm_clients *clients;
>  
> -	clients = malloc(sizeof(*clients));
> +	clients = calloc(1, sizeof(*clients));
>  	if (!clients)
>  		return NULL;
>  
> -	memset(clients, 0, sizeof(*clients));
> -
>  	clients->private_data = private_data;
>  
>  	return clients;
> @@ -165,9 +163,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
>  	c->clients = clients;
>  
>  	/* Engines */
> -	c->engines = malloc(sizeof(*c->engines));
> +	c->engines = calloc(1, sizeof(*c->engines));
>  	assert(c->engines);
> -	memset(c->engines, 0, sizeof(*c->engines));
>  	c->engines->capacity = calloc(info->last_engine_index + 1,
>  				      sizeof(*c->engines->capacity));
>  	assert(c->engines->capacity);
> @@ -190,9 +187,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
>  	assert(c->val && c->last);
>  
>  	/* Memory regions */
> -	c->regions = malloc(sizeof(*c->regions));
> +	c->regions = calloc(1, sizeof(*c->regions));
>  	assert(c->regions);
> -	memset(c->regions, 0, sizeof(*c->regions));
>  	c->regions->names = calloc(info->last_region_index + 1,
>  				   sizeof(*c->regions->names));
>  	assert(c->regions->names);
> -- 
> 2.43.0
> 
