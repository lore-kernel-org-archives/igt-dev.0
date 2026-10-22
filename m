Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8164606A31D
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P0oUM1zl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F5C10E3C7;
	Thu, 22 Oct 2026 12:41:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CA810E3C7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672831; x=1824208831;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kRHx8G6IvgcBpvJAPBpc50zraBK4mx+bGx4gyLQfm58=;
 b=P0oUM1zlgC/z6UeIT3slicYLhuI4me3f5eSBmGCWhJdASX2Fb6HCJfaw
 rkrQnx4J4UnVHVgeNx6yHuGG2Jn9T1Y12qz7hPCYzNCP10NZ8cdSKO/ae
 xdO7m35we/T9iqP+yKnHNcJ6BaC+1yH47z4U6L6EeqQn+gQwQa3tMgvJd
 BDicCnQOwII3W38NyDlEpVxQZ56pGWNoGuenBN37w/ZSXSKYsAd4EXN+F
 FQupkOhQPuIyk7b5Rm6Tmuy01bXtbholCu1TDCX+/K5/BrhGJTfwTX3HK
 uix0ELX7kyxTnwf0vltHM2LrVuFFqqaeI807gN85Pduu1GB6w03w4mgAc w==;
X-CSE-ConnectionGUID: aEAggPQIRmSjAtX7f6N1qg==
X-CSE-MsgGUID: uVChAgN6SNmhM35KQQpIpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1294365"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1294365"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:40:31 -0700
X-CSE-ConnectionGUID: OHqgOGDUTBCGwQe1INQFww==
X-CSE-MsgGUID: ebrMqGSXQYaDiPOzDLniug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3284992"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:40:29 -0700
Date: Thu, 22 Oct 2026 14:40:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 karthik.poosa@intel.com, pranay.samala@intel.com
Subject: Re: [PATCH v2] lib/igt_sysfs: fix uninitialized ret in vram d3cold
 threshold helper
Message-ID: <20261022124011.ekfg2umc73guvlsc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com, karthik.poosa@intel.com,
 pranay.samala@intel.com
References: <20261022074841.6711-1-shivtej.eknath.patil@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022074841.6711-1-shivtej.eknath.patil@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shivtej,
On 2026-10-22 at 07:48:41 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 

In subject s/ret/var/

> In igt_sysfs_set_vram_d3cold_threshold(), ret is assigned only
> when faccessat() succeeds. If the vram_d3cold_threshold sysfs
> attribute is missing or not writable, the function emits a warning
> but later evaluates ret in igt_assert_lt() without initializing it.
> 
> This can result in undefined behaviour and misleading assertion
> failures depending on the stack contents.
> 
> Initialize ret and handle the error path properly before using it.
> 

Add Fixes: tag here.

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  lib/igt_sysfs.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 9952c1c0d..601e898ec 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1054,11 +1054,10 @@ void igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
>  
>  	sprintf(path, "device/vram_d3cold_threshold");
>  
> -	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
> -		ret = igt_sysfs_printf(sysfs, path, "%" PRIu64, threshold);
> -	else
> -		igt_warn("vram_d3cold_threshold is not present\n");
> +	igt_require_f(!faccessat(sysfs, path, R_OK | W_OK, 0),
> +		      "vram_d3cold_threshold is not present\n");
>  
> +	ret = igt_sysfs_printf(sysfs, path, "%" PRIu64, threshold);
>  	igt_assert_lt(0, ret);
>  }
>  
> -- 
> 2.43.0
> 
