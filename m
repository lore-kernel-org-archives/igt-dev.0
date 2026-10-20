Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FF606A31B
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N8GSOfxo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D3E10E0CF;
	Tue, 20 Oct 2026 12:15:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB5A10E0CF
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792498479; x=1824034479;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RtHquOElJz37WHuvNKyHCiafjDUmh+4xDQrjGXeoy4k=;
 b=N8GSOfxoaRZ26IJxfpdA9Q1K8mTiDgdTbP66GsI0vFRWPQSKC4SUMqjl
 vdtDbYTL4ysTwGkzJdNm5hD/OhvCsFBBCizNP1/s9Z5zGsSBn6RDl79C1
 UX5thJ5npJSplo3mTCl99U23XUDLQLjwiqWwTEnoqRpOUSDgSp3yekK3q
 G0FfQcxiZ1RMzEou46xB7CePOOLdMxBMhZEZR7zNp8EcBQn9xJKBUsjvv
 uHu50mxwR/1v/n7ZgnSpmwlE/7WcCXrSzK4uLgZiBZd4Wnmnxm5PYgxoK
 FO0gEZl3IFPkS2ThTs7PvH8UD/t9ncsfvzLKVlIB3xjY8X2vM7qLJQaoU A==;
X-CSE-ConnectionGUID: q8qpThE6S8GuHkMMiK9uDg==
X-CSE-MsgGUID: bFHovJkBRE+O6GG0+LpFyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1212448"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1212448"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:14:38 -0700
X-CSE-ConnectionGUID: IRXFj2OhSqKn66VxihweEA==
X-CSE-MsgGUID: s8/A9+KyTqWO+77syS0bTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4585613"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:14:37 -0700
Date: Tue, 20 Oct 2026 14:14:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH] tests/unigraf: Hoist static DP link rate bounds and
 purge eDP rate
Message-ID: <20261020121435.w6mcshh7v3g3nukm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Imre Deak <imre.deak@intel.com>
References: <20260813182924.2508072-1-markyacoub@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813182924.2508072-1-markyacoub@google.com>
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
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mark,
On 2026-08-13 at 14:29:24 -0400, Mark Yacoub wrote:
> Currently, the link rate subtest dynamically iterates across
> UNIGRAF_RATE_6_75_GHZ during its testing sweep. However, 6.75 Gbps is
> structurally an exclusive eDP link rate parameter that physical external
> DP sink testbeds do not natively map to. Iterating over it on external
> chassis outputs reliably wastes execution cycles only to inevitably fail
> a hardware constraint validation.
> 
> Additionally, the existing igt_require(max_supported_rate... validation
> is currently executed at the very end of the loop, specifically after
> the testbed has already triggered an expensive HPD pulse, retrained the
> physical link, and rebuilt the IGT output wrapper.
> 
> This patch cleans out the test execution array, and physically hoists
> the igt_dp_get_max_supported_rate() capability check completely outside
> the active dynamic initialization context to serve strictly as a
> zero-cost pre-flight evaluator. The subtest now cleanly skips
> hardware-unsupported rate ceilings in 0.00s natively, significantly
> shrinking the cumulative latency footprint of an automated CI pipeline.

You forgot your s-o-b here.

+cc Imre Deak

Regards,
Kamil

> ---
>  tests/unigraf/unigraf_lt.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
> index 81e6ecd3f..c82607e14 100644
> --- a/tests/unigraf/unigraf_lt.c
> +++ b/tests/unigraf/unigraf_lt.c
> @@ -127,13 +127,20 @@ int igt_main()
>  		int rates[] = {UNIGRAF_RATE_1_62_GHZ,
>  			       UNIGRAF_RATE_2_7_GHZ,
>  			       UNIGRAF_RATE_5_4_GHZ,
> -			       UNIGRAF_RATE_6_75_GHZ,
>  			       UNIGRAF_RATE_8_10_GHZ};
>  		int current_rate;
> -		int max_supported_rate;
> +		int max_supported_rate = 0;
> +
> +		output = igt_output_from_connector(&display, connector);
> +		if (output)
> +			max_supported_rate = igt_dp_get_max_supported_rate(drm_fd, output);
>  
>  		for (i = 0; i < ARRAY_SIZE(rates); i++) {
>  			igt_dynamic_f("unigraf-dp-link-rate-%d", rates[i]) {
> +				igt_require_f(max_supported_rate >= unigraf_rate_to_kbs(rates[i]),
> +					      "Host port physically caps below test rate bounds (Host: %d, Test: %d)\n",
> +					      max_supported_rate, unigraf_rate_to_kbs(rates[i]));
> +
>  				unigraf_reset();
>  				unigraf_set_max_link_rate(rates[i]);
>  				unigraf_hpd_pulse(1000000);
> @@ -147,8 +154,6 @@ int igt_main()
>  				init_output_and_display_pattern(&display, output);
>  
>  				current_rate = igt_dp_get_max_link_rate(drm_fd, output);
> -				max_supported_rate = igt_dp_get_max_supported_rate(drm_fd, output);
> -				igt_require(max_supported_rate >= unigraf_rate_to_kbs(rates[i]));
>  				igt_assert_eq(current_rate, unigraf_rate_to_kbs(rates[i]));
>  			}
>  		}
> -- 
> 2.55.0.691.gc56d675ccc-goog
> 
