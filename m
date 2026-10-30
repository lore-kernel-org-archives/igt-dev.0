Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A96606A31F
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TnXkgAii
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB43811277C;
	Fri, 30 Oct 2026 11:55:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CFC1127A3
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361259; x=1824897259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YLCNhqWBdz+szI5GAkZud5cc47Ip6fUGeueWuI1JYVM=;
 b=TnXkgAiiLVd62Rz9yjKsNYw4FCto3j1dxc/8ujbQlj9gJ4GdUr3wlZyX
 lh3GOx9cFHDeL1fC85dkvdP5BrKZHMt3zp7g1W4TKtoLIO7vf+LfTW1rs
 lGO2iAOrCurh0blbBC5tGTMxamUDt5SZOmWNiwUErIhkRHEZuKuicQ3Y3
 ZmRUxJwfmUJ8cawjaZYWhN+BRQrr3H0gv9VwzMLOnm9srrDdtMbKDR+UC
 qJ0Y2wZNgKymTzwII5ehh7+T1DyD4fhQrQq/csUlTLugmxqwU6bEhVuaF
 Q8LxEOIMGSVCvq/IdvZ0fE7w+skJ0zg1y9f9HuhNFYDF9aX5XfZXJuvdM g==;
X-CSE-ConnectionGUID: GJuDYgAtRTW+/1cyfGWNsg==
X-CSE-MsgGUID: K2NPWpsbS++7rl0rgndM5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2135723"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2135723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:54:19 -0700
X-CSE-ConnectionGUID: uimG7y/OR22hMudmmUajFg==
X-CSE-MsgGUID: 1RnFUgCJT8W8zkTtbP75tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5442001"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:54:18 -0700
Date: Fri, 30 Oct 2026 12:54:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jitta Vignan <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com
Subject: Re: [PATCH i-g-t 1/2] tests/msm/msm_bo: Add buffer mapping tests
Message-ID: <20261030115415.ymsqqrolk3uvtqsy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jitta Vignan <jvignan@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com
References: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
 <20261029165553.1108121-2-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029165553.1108121-2-jvignan@qti.qualcomm.com>
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

Hi Jitta,
On 2026-10-29 at 22:25:52 +0530, Jitta Vignan wrote:
> Add coverage for MSM buffer object mapping operations.
> 
> Exercise cached and write-combine mappings, repeated mappings,
> unmap/remap behavior, different buffer sizes, CPU preparation,
> mapping alignment, protection flags, large and partial mappings,
> and invalid mapping requests.
> 
> Verify mapped buffer contents where applicable and check that invalid
> mapping operations are rejected as expected.
> 
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/msm/msm_bo.c | 420 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 420 insertions(+)
> 
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 3257697f5..295c7b0d3 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -414,6 +414,426 @@ int igt_main()
>  		igt_msm_bo_free(bo);
>  	}
>  
> +	/* Buffer Mapping Tests - Positive Cases */
> +	igt_describe("Basic mapping with read/write test");
> +	igt_subtest("bo-map-basic") {
[cut]
