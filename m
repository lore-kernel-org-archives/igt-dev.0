Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A83CCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 17:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7A7112DE3;
	Wed,  3 Apr 2024 17:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFkEp8u5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABAF112DE3
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 17:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712165214; x=1743701214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RygeQAH4hsFwBC3gCIpYIbBYHSr5+l16hKl+u/JaYX8=;
 b=NFkEp8u5TAeviRD9Q/3wXgWhQkHVIlEqqgu3mwtESsHjdCrZ1yDYrsnX
 4asVcv9ndph/Txu1Z4nT/31aeGAA4NEPbZkpiBPiJN8fLQnReP08oCFK3
 tJvLfxx8zLDWlo40vUz43YHgYrAF0vYblZyvH7jLIWPilXqaAJ85YmNfQ
 bH4fs5Ha+rf4PwuoeGqzeItaZOiUVeRdyr3YR//pVzhBpK5CCt7VrCmYT
 /bL7+EytgsINWuPGBL+gwJVznsdHm9feawu6nigUfvdqfsEwOyIC1iCSk
 wwItiTSB6Ev0WG7Qo6ToiX6x6G2QIr1xWfmLHBgpMnoO5LYingV5Fa9hT w==;
X-CSE-ConnectionGUID: w3ndRA0XQOSoXYnkodablA==
X-CSE-MsgGUID: TiJQv1w8Tg2a0SRKIGJZYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7992441"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7992441"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:26:53 -0700
X-CSE-ConnectionGUID: funi9fyCRP6BNILQQSqWKw==
X-CSE-MsgGUID: unf+FFoNStS30VG6DHgNrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18953745"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:26:52 -0700
Date: Wed, 3 Apr 2024 19:26:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 3/8] lib/igt_drm_clients: Fix leaks
Message-ID: <20240403172648.gwkqq2qv5rztu43w@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-4-lucas.demarchi@intel.com>
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
On 2024-04-02 at 15:17:11 -0700, Lucas De Marchi wrote:
> Stop leaking memory-related fields.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_drm_clients.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
> index c8dc21d6a..c174c96ab 100644
> --- a/lib/igt_drm_clients.c
> +++ b/lib/igt_drm_clients.c
> @@ -221,9 +221,19 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
>  		free(c->engines->names);
>  	}
>  	free(c->engines);
> +
>  	free(c->val);
>  	free(c->last);
>  
> +	if (c->regions) {
> +		for (i = 0; i <= c->regions->max_region_id; i++)
> +			free(c->regions->names[i]);
> +		free(c->regions->names);
> +	}
> +	free(c->regions);
> +
> +	free(c->memory);
> +
>  	if (clear)
>  		memset(c, 0, sizeof(*c));
>  }
> -- 
> 2.43.0
> 
