Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F11FC28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 20:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE91210E6B0;
	Wed, 12 Mar 2025 20:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmpPRQdf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB5310E6B0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741812230; x=1773348230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p25uVrfpD3XOcloNkvRouC/4QhbJAQiFvFHiFb6bjOs=;
 b=VmpPRQdfoP4f8FmY2EZswaZGrxzddMOTAwJy0NjYEBaeIWjo3f7CUGyf
 D/lvrxtO4O13PQoawwJSvwU4esrU1jtrEwqa7CixAvnyINAwW+eEy00oD
 XJJ78L5+VIf3aidKz9BcKVlO8hBSdbTpxYpkKVBuXANe4/V98dMbgQFsF
 Jon8TyxOUpzJD+wcJIlFuhxxdBEi2YVia9cqMSqxLzd7YiKsO08/VUwFX
 6GaT8u+UvxF3dUH7tiacD2MPuv5QOiKUfgKXcywN0VuvBVHSchYVK33yL
 iL85uO7j+xqRWicb76eT3slPHfJMCQ8TnXQWoV4UAksVQr5ZISPT7y1ke g==;
X-CSE-ConnectionGUID: 6m0jTm9rQ0K4Mm7NkjxhKA==
X-CSE-MsgGUID: IvaNDCFBTZ2AS0Tl0CI9uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46692471"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46692471"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 13:43:47 -0700
X-CSE-ConnectionGUID: yqbqRDKaTWOo+MWNCFblXw==
X-CSE-MsgGUID: 3Bwt2ILKQnCQqZxG4k9OKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120551270"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 13:43:46 -0700
Date: Wed, 12 Mar 2025 21:43:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, pranay.samala@intel.com
Subject: Re: [PATCH i-g-t] tests/kms_addfb_basic: Split tests into subtest
 groups
Message-ID: <20250312204328.mvo7qdvryx77vp72@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 pranay.samala@intel.com
References: <20250312103008.613087-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250312103008.613087-1-karthik.b.s@intel.com>
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

Hi Karthik,
On 2025-03-12 at 16:00:08 +0530, Karthik B S wrote:
> Multiple subtest groups exist in kms_addfb_basic with individual
> igt_fixutre calls. Split these using igt_subtest_group so that any
> failure in the fixture of one of the individual subtest groups don't
> affect the results of subtests in other groups.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_addfb_basic.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index e5ff9ea32..268e4e0e4 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -989,15 +989,20 @@ igt_main
>  		igt_require(has_addfb2_iface(fd));
>  	}
>  
> -	invalid_tests(fd);
> +	igt_subtest_group
> +		invalid_tests(fd);
>  
> -	pitch_tests(fd);
> +	igt_subtest_group
> +		pitch_tests(fd);
>  
> -	prop_tests(fd);
> +	igt_subtest_group
> +		prop_tests(fd);
>  
> -	master_tests(fd);
> +	igt_subtest_group
> +		master_tests(fd);
>  
> -	tiling_tests(fd);
> +	igt_subtest_group
> +		tiling_tests(fd);

I looked into those tests and imho this needs a major refactor,
for example there should not be any igt_assert() in a fixture.
Generally igt tests works ok for one fixture in begin, last one
at igt_main() end. When used in-between it becomes more
complicated to handle cleanup.

Regards,
Kamil

>  
>  	igt_subtest_group {
>  		igt_fixture
> -- 
> 2.43.0
> 
