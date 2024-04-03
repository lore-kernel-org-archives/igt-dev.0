Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F9CCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 17:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323D51127F7;
	Wed,  3 Apr 2024 17:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIJ4TvG4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652F7112DE0
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712165110; x=1743701110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ns1UaScaPStxMMf7fO4SdDiCX1zhqpVOrmwfGU3raU8=;
 b=iIJ4TvG40zk/WxFpsu3BQR4OAb1OcLLTJ7Mfl7v0OO/BmaDIrt3WYyQb
 NyyDJzimHCiqdt2XZZlv8LySc5T1NY/4UCuVTwAeLG0FO/YMC2NU7kUWI
 Xrzp+FAwV6quKmBf7U6woyUOl3RRwuJvxKHR6W+0kDYb1QmesLaFM1bSq
 yej5r9475SxyDWLezrmS6E7T3EjruU/M40TCE2xH54lPU/qzLARcHHz0g
 usCjbaNAbJPElgojSFxzv/V1cW7vRZn9RKR06/x6OgX43MQjh02ECwXVj
 pkvWUnv7+7eUE8zFQeXd+9Jy3az2B3+Y8lXkdKOza/Qpl1cLvhd9iCzRx w==;
X-CSE-ConnectionGUID: 0RJpLQtsS+yDlvDrA7dfZA==
X-CSE-MsgGUID: id01IEtLTlqZfGYL25uCJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7337423"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7337423"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:25:09 -0700
X-CSE-ConnectionGUID: pBPOaw9jRBqcVFDO2QrDSg==
X-CSE-MsgGUID: UgXpIpv8TZ65m2RYRZ8QbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="23194643"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:25:08 -0700
Date: Wed, 3 Apr 2024 19:25:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 2/8] lib/igt_drm_clients: Fix sizeof calculation
Message-ID: <20240403172505.sr7nbwtwxosw4frm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-3-lucas.demarchi@intel.com>
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
On 2024-04-02 at 15:17:10 -0700, Lucas De Marchi wrote:
> val and last are arrays of certain types. For the latter, it's
> underallocated on 32-bits since it should be sizeof(u64) not the size of
> a pointer. When running on 64-bits, no real bug.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_drm_clients.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
> index 90ca6d61c..c8dc21d6a 100644
> --- a/lib/igt_drm_clients.c
> +++ b/lib/igt_drm_clients.c
> @@ -182,8 +182,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
>  		c->engines->num_engines++;
>  		c->engines->max_engine_id = i;
>  	}

While you are at this add newline here.

With or without it:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> -	c->val = calloc(c->engines->max_engine_id + 1, sizeof(c->val));
> -	c->last = calloc(c->engines->max_engine_id + 1, sizeof(c->last));
> +	c->val = calloc(c->engines->max_engine_id + 1, sizeof(*c->val));
> +	c->last = calloc(c->engines->max_engine_id + 1, sizeof(*c->last));
>  	assert(c->val && c->last);
>  
>  	/* Memory regions */
> -- 
> 2.43.0
> 
