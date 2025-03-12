Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2734DC28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 10:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D317E10E75E;
	Wed, 12 Mar 2025 10:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8VW4tlf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796F110E75E
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741775201; x=1773311201;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5PtaQ47IfKIqEtMABGgr4EKRJWP6rYzpMvVBhPqxInk=;
 b=Z8VW4tlfJC7bchneymA35etaXIog3IYMcL1KBbNclIy19o59PW4T4+HN
 IfqJHZ/eUeNQcDSsektT3tK0iwk0jXjyFfXvyx0Jr2Pe1WBn2IcwsFaNQ
 WhPdbf+3RlK+jFbI0hYzWDhqKivpwmC9VLv7e6A3UDY+/JIEJAvXwOqtN
 nvOXSI+Kk3BWN5giSYa3FHzk+Or4VxJTYPiGqMpKrIAKgGQUky3ztJm4d
 0vHecP/eRnjizU0feyyTn5SE14hoXoUR3THUSChoUe297OWN3zutpYVkw
 oN3Hm8lx/I5blYDPtJGrqAcg+kIlT6S5X6IcxrhGRlhNoS/K704b9SvZP g==;
X-CSE-ConnectionGUID: pxKBj3NORpCHeJwS2cBp4w==
X-CSE-MsgGUID: 4JRCJXy+TCSO72y02o0YDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53469877"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="53469877"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:26:41 -0700
X-CSE-ConnectionGUID: 1M7Yp2qpSAa3KdYN/rvnog==
X-CSE-MsgGUID: Vr1uRv9fTHWj2PO3zPo1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="121499624"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 03:26:40 -0700
Date: Wed, 12 Mar 2025 11:26:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v2 i-g-t 1/2] tests/intel/xe_drm_fdinfo: Check
 prerequisites for utilization subtests
Message-ID: <20250312102624.hjkjmcnazk46yriz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250306200118.1771514-1-marcin.bernatowicz@linux.intel.com>
 <20250306200118.1771514-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306200118.1771514-2-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-03-06 at 21:01:17 +0100, Marcin Bernatowicz wrote:
> Introduce require_engine_utilization_data() to verify utilization
> data availability in each utilization subtest.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  tests/intel/xe_drm_fdinfo.c | 54 +++++++++++++++++++++++++++++--------
>  1 file changed, 43 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index f17245bea..f166b73d6 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -358,6 +358,16 @@ static void basic_memory(int xe)
>  	}
>  }
>  
> +static void require_engine_utilization_data(int xe)
> +{
> +	struct drm_client_fdinfo info = {};
> +
> +	igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
> +					 ARRAY_SIZE(engine_map), NULL, 0));
> +	igt_require(info.num_engines);
> +	igt_require(info.utilization_mask & DRM_FDINFO_UTILIZATION_CYCLES);
> +}
> +
>  static void basic_engine_utilization(int xe)
>  {
>  	struct drm_client_fdinfo info = { };
> @@ -736,8 +746,10 @@ igt_main
>  		basic_memory(xe);
>  
>  	igt_describe("Check if basic fdinfo content is present for engine utilization");
> -	igt_subtest("basic-utilization")
> +	igt_subtest("basic-utilization") {
> +		require_engine_utilization_data(xe);
>  		basic_engine_utilization(xe);
> +	}
>  
>  	igt_describe("Create and compare total and resident memory consumption by client");
>  	igt_subtest("mem-total-resident")
> @@ -751,50 +763,69 @@ igt_main
>  	igt_subtest("mem-active")
>  		mem_active(xe, xe_engine(xe, 0));
>  
> -	igt_subtest("utilization-single-idle")
> +	igt_subtest("utilization-single-idle") {
> +		require_engine_utilization_data(xe);
>  		xe_for_each_engine(xe, hwe)
>  			utilization_single(xe, hwe, 0);
> +	}
>  
> -	igt_subtest("utilization-single-full-load")
> +	igt_subtest("utilization-single-full-load") {
> +		require_engine_utilization_data(xe);
>  		xe_for_each_engine(xe, hwe)
>  			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
> +	}
>  
> -	igt_subtest("utilization-single-full-load-isolation")
> +	igt_subtest("utilization-single-full-load-isolation") {
> +		require_engine_utilization_data(xe);
>  		xe_for_each_engine(xe, hwe)
>  			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
> +	}
>  
> -	igt_subtest("utilization-single-full-load-destroy-queue")
> +	igt_subtest("utilization-single-full-load-destroy-queue") {
> +		require_engine_utilization_data(xe);
>  		xe_for_each_engine(xe, hwe)
>  			utilization_single_destroy_queue(xe, hwe);
> +	}
>  
> -	igt_subtest("utilization-others-idle")
> +	igt_subtest("utilization-others-idle") {
> +		require_engine_utilization_data(xe);
>  		xe_for_each_engine(xe, hwe)
>  			utilization_others_idle(xe, hwe);
> +	}
>  
> -	igt_subtest("utilization-others-full-load")
> +	igt_subtest("utilization-others-full-load") {
> +		require_engine_utilization_data(xe);
>  		xe_for_each_engine(xe, hwe)
>  			utilization_others_full_load(xe, hwe);
> +	}
>  
> -	igt_subtest("utilization-all-full-load")
> +	igt_subtest("utilization-all-full-load") {
> +		require_engine_utilization_data(xe);
>  		utilization_all_full_load(xe);
> +	}
>  
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -		igt_subtest_f("%s-utilization-single-idle", s->name)
> +		igt_subtest_f("%s-utilization-single-idle", s->name) {
> +			require_engine_utilization_data(xe);
>  			xe_for_each_gt(xe, gt)
>  				xe_for_each_engine_class(class)
>  					utilization_multi(xe, gt, class, s->flags);
> +		}
>  
> -		igt_subtest_f("%s-utilization-single-full-load", s->name)
> +		igt_subtest_f("%s-utilization-single-full-load", s->name) {
> +			require_engine_utilization_data(xe);
>  			xe_for_each_gt(xe, gt)
>  				xe_for_each_engine_class(class)
>  					utilization_multi(xe, gt, class,
>  							  s->flags |
>  							  TEST_BUSY |
>  							  TEST_TRAILING_IDLE);
> +		}
>  
>  		igt_subtest_f("%s-utilization-single-full-load-isolation",
> -			      s->name)
> +			      s->name) {
> +			require_engine_utilization_data(xe);
>  			xe_for_each_gt(xe, gt)
>  				xe_for_each_engine_class(class)
>  					utilization_multi(xe, gt, class,
> @@ -802,6 +833,7 @@ igt_main
>  							  TEST_BUSY |
>  							  TEST_TRAILING_IDLE |
>  							  TEST_ISOLATION);
> +		}
>  	}
>  
>  	igt_fixture {
> -- 
> 2.31.1
> 
