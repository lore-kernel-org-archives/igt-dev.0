Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF794606A327
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HftPyCQw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97ED610E0CF;
	Tue, 20 Oct 2026 12:13:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADF210E6F2
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792498385; x=1824034385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z/1NxjfV3lFEGBAV1nAe25A6eaAczlbstimUmeTh0Tw=;
 b=HftPyCQwEbFKJE+G7ssBKXXtYC5TeELzweVwjxxrhAf1pu/XOFAg0JPp
 OawwA9U7+4TYLCdC7ZlykKXKkWUEYWRDGQG8p8kq/qITT6bDOnDle7k5J
 lbMORGajkAxcKmWtiEl9V+Rh+ViwuP2xIxkwH6r0KD/7xT9ZihaHQrwTs
 rI6/LWxa5dod8n/s4z+vxWfJFTuvT5xJz0S8Ev/jRIQ9x1QWGd+/DhCaG
 4dZJ+4Pv9EgNUvKvFFwEzuEkexAVVcRkGoo4+2ZzaQjhEsdCUeUdX56Qb
 HPRRlQK/mBRekUPQ9eB07e51zyOUfqrYZnv/NIxqViT7WCIvH294WHeEt g==;
X-CSE-ConnectionGUID: LmSA2fD2QcSY7ldUhYvPfw==
X-CSE-MsgGUID: 1+yLf1dRSEqrq0iy57ibKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1087036"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1087036"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:13:04 -0700
X-CSE-ConnectionGUID: GTTddDt/SY+cS8f3qORksA==
X-CSE-MsgGUID: 51SxXrCDQEaYnjke2imfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3143750"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:13:01 -0700
Date: Tue, 20 Oct 2026 14:12:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH i-g-t] tests/unigraf_lt: Optimize DP lane count validations
Message-ID: <20261020121255.tllrb3utrcaj2ch6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Imre Deak <imre.deak@intel.com>
References: <20260813175955.2450321-1-markyacoub@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813175955.2450321-1-markyacoub@google.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mark,
On 2026-08-13 at 13:59:55 -0400, Mark Yacoub wrote:
> Some drivers dynamically optimize power by downshifting lane utilization
> if the current video mode (e.g., 1080p) has low bandwidth requirements,
> regardless of the physical ceiling.
> 
> To avoid pointlessly testing artificially high lane mock ceilings
> that would result in false-negative failures, we introduce a pre-check
> in the lane count subtest. We safely pre-calculate the kernel's natural
> max lane utilization for the current mode through an unconstrained HPD
> sequence, allowing us to skip unachievable configurations.
> 

+cc Imre Deak <imre.deak@intel.com>

> Signed-off-by: Mark Yacoub <markyacoub@google.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/unigraf/unigraf_lt.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
> index 81e6ecd3f..7b9a2fc27 100644
> --- a/tests/unigraf/unigraf_lt.c
> +++ b/tests/unigraf/unigraf_lt.c
> @@ -103,12 +103,43 @@ int igt_main()
>  
>  	igt_subtest_with_dynamic("unigraf-dp-lane-count") {
>  		int lane_counts[3] = {1, 2, 4};
> +		int max_natural_lanes = 0;
>  		int current_lanes;
>  
> +		/*
> +		 * Some drivers dynamically optimize power by downshifting lane
> +		 * utilization if the current video mode (e.g., 1080p) has low
> +		 * bandwidth requirements, regardless of the physical ceiling.
> +		 *
> +		 * To avoid pointlessly testing artificially high lane mock
> +		 * ceilings (e.g. testing 4 lanes when we know the driver adamantly
> +		 * refuses to use more than 1 or 2 for this mode), we first
> +		 * perform an unconstrained HPD sequence. We initialize the output
> +		 * and observe precisely how many lanes the kernel naturally demands.
> +		 */
> +		unigraf_reset();
> +		unigraf_set_max_lane_count(4);
> +		unigraf_hpd_pulse(500000);
> +
> +		igt_display_require_output(&display);
> +		output = igt_output_from_connector(&display, connector);
> +		igt_assert(output);
> +		igt_dp_force_link_retrain(drm_fd, output, 2);
> +		init_output_and_display_pattern(&display, output);
> +
> +		max_natural_lanes = igt_dp_get_current_lane_count(drm_fd, output);
> +		igt_info("Pre-check: Kernel naturally trains a maximum of %d lanes for the current mode.\n",
> +			 max_natural_lanes);
> +
>  		for (i = 0; i < ARRAY_SIZE(lane_counts); i++) {
> -			igt_dynamic_f("unigraf-dp-lane-count-%d", lane_counts[i]) {
> +			int lane_count = lane_counts[i];
> +
> +			if (lane_count > max_natural_lanes)
> +				continue;
> +
> +			igt_dynamic_f("unigraf-dp-lane-count-%d", lane_count) {
>  				unigraf_reset();
> -				unigraf_set_max_lane_count(lane_counts[i]);
> +				unigraf_set_max_lane_count(lane_count);
>  				unigraf_hpd_pulse(500000);
>  
>  				igt_display_require_output(&display);
> @@ -118,7 +149,7 @@ int igt_main()
>  				init_output_and_display_pattern(&display, output);
>  
>  				current_lanes = igt_dp_get_current_lane_count(drm_fd, output);
> -				igt_assert_eq(current_lanes, lane_counts[i]);
> +				igt_assert_eq(current_lanes, lane_count);
>  			}
>  		}
>  	}
> -- 
> 2.55.0.691.gc56d675ccc-goog
> 
