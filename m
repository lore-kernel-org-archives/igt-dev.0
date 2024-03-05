Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8473EC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 11:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226C710EAAE;
	Tue,  5 Mar 2024 11:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZrEANjA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2840110EAAE
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709639440; x=1741175440;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9jimdBrnDgEhLJhSxjl+cbH8i1/cSnTY2Cr/WYDGFE8=;
 b=nZrEANjAvFSgPsMyw+fe4QI6uLUqWHZp9ATmDpIS46Nggp1mO79zVjVE
 AGDixOZbsGaNr/GWG7p/oi61SHPDoYmhv9HDWa9GM6tnObacktRMQ5Yv6
 l/hP9GYUq5QUNLDbdJUGwRBe10Y7URMjTvbRc55DkXygSTbTjq1jnhxcP
 Cb/onRS4AK9cBg5R+zX1duj9wjp28A6EG1p5vZmoiOs1lV0HOTT82rIKM
 iUE6tp2IptOm4eqggFPKTt3G9F2P+K7/olmgdqFrz83VwZc6yqHoBUhAY
 4s41oyc6XvFTNCSVYc6jiJV/g/V+/LIVGI5fADMZMyr6M2GlUXHfdGF1m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7130219"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7130219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:50:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9764690"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 03:50:30 -0800
Date: Tue, 5 Mar 2024 12:50:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Strawbridge <michael.strawbridge@amd.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH] amdgpu/tests: Fix vce enc test failure
Message-ID: <20240305115007.o5bbwh4pepg5mdzh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Strawbridge <michael.strawbridge@amd.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20240304211632.184249-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240304211632.184249-1-vitaly.prosyak@amd.com>
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

Hi Vitaly,
On 2024-03-04 at 16:16:32 -0500, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 

just spotted:
[PATCH] amdgpu/tests: Fix vce enc test failure
------- ^ -----^:
These two words should be exchanged, "tests/amdgpu:"
imho even better would be to write test name there:

[PATCH] tests/amdgpu/amd_vce_dec: Fix test failure

With that fixed:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Combine the following sub-tests: creation, encoding
> and destroy as a single sub-test for vce encoder.
> It is a similar change as commit 40ed74461d8a44657a0f4799ade86116722d3ea2.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Michael Strawbridge <michael.strawbridge@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Michael Strawbridge <michael.strawbridge@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_vce_dec.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_vce_dec.c b/tests/amdgpu/amd_vce_dec.c
> index 364534955..51902802c 100644
> --- a/tests/amdgpu/amd_vce_dec.c
> +++ b/tests/amdgpu/amd_vce_dec.c
> @@ -552,6 +552,17 @@ amdgpu_cs_vce_destroy(amdgpu_device_handle device_handle, struct mmd_context *co
>  	free_resource(&enc->fb[0]);
>  }
>  
> +static void
> +amdgpu_vce_enc_test(amdgpu_device_handle device, struct mmd_context *context,
> +		struct amdgpu_vce_encode *enc, bool is_mv_supported)
> +{
> +	amdgpu_cs_vce_create(device, enc, context, is_mv_supported);
> +	amdgpu_cs_vce_encode(device, context, enc, is_mv_supported);
> +	if (is_mv_supported)
> +		amdgpu_cs_vce_encode_mv(device, context, enc, is_mv_supported);
> +	amdgpu_cs_vce_destroy(device, &context, &enc);
> +}
> +
>  igt_main
>  {
>  	amdgpu_device_handle device;
> @@ -574,24 +585,9 @@ igt_main
>  		igt_skip_on(!is_vce_tests_enable(device, context.family_id, context.chip_id,
>  				context.chip_rev, &is_mv_supported));
>  	}
> -	igt_describe("Test whether vce enc is created");
> -	igt_subtest("amdgpu_cs_vce_create")
> -	amdgpu_cs_vce_create(device, &enc, &context, is_mv_supported);
> -
> -	igt_describe("Test whether vce enc encodes");
> -	igt_subtest("amdgpu_cs_vce_encode")
> -	amdgpu_cs_vce_encode(device, &context, &enc,  is_mv_supported);
> -
> -	if (is_mv_supported) {
> -		igt_describe("Test whether vce enc encodes mv");
> -		igt_subtest("amdgpu_cs_vce_encode_mv")
> -		amdgpu_cs_vce_encode_mv(device, &context, &enc, is_mv_supported);
> -	}
> -
> -	igt_describe("Test whether vce enc is destroyed");
> -	igt_subtest("amdgpu_cs_vce_destroy")
> -	amdgpu_cs_vce_destroy(device, &context, &enc);
> -
> +	igt_describe("Test vce enc is created, encode, destroy");
> +	igt_subtest("amdgpu_vce_encoder")
> +		amdgpu_vce_enc_test(device, &context, &enc, is_mv_supported);
>  
>  	igt_fixture {
>  		mmd_context_clean(device, &context);
> -- 
> 2.25.1
> 
