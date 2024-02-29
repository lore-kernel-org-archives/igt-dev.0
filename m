Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAEEC48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 12:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20A210E05E;
	Thu, 29 Feb 2024 12:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Og5BgHFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2BC10E05E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 12:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709210593; x=1740746593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DirhsqdFQcQXREf5DymiPMveYR9XbRrX8xjYoH8syiM=;
 b=Og5BgHFRVdoSGQykJf4jcpQnMY4meEQiL72rilz4GFCHRrCLMZ/21foS
 fECDwFh03pGD4RBN44nozpe2OaSsjr0DuxpGvuPRha7COL1uFxbYfeOgS
 AlOjyA9eLuHAFr62TSx0IlUTDQlDtQtDido5ESzsd3tznWG9VfBsmJ6k3
 uvEv4nnccu6n5U1YhRyupItC+6WoQvAMPBkk+uJMpyVTE685ilEjPUtmd
 AC+MKt0sAb0NpHDJz29qxLAcW2fSIStq+hW/gdED7NR+EAHV/fQFBro3i
 77hBeBiCPm5bGULSEKWRAYlBLyHFeCWhRqE9heF8mU0SXL6Q33tl9neL1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14313049"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14313049"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:43:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8377668"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:43:11 -0800
Date: Thu, 29 Feb 2024 13:42:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Strawbridge <michael.strawbridge@amd.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH] amdgpu/tests: Fix uvd encoder test failure
Message-ID: <20240229124251.n7qemjfc5mp7itfo@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Strawbridge <michael.strawbridge@amd.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20240228234929.358061-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228234929.358061-1-vitaly.prosyak@amd.com>
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

Hi vitaly.prosyak,
On 2024-02-28 at 18:49:29 -0500, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Combine the following sub-tests: creation, encoding
> session initialization, and destroy as a single sub-test. After
> the following change (1aa0ed3e02945fbbfe54183b60d0add06b1669d9
> Revert runner: Normalize test list entries that don't list subtests),
> and since we are using a custom job list list (job_list_from_test_list),
> and as a result every sub-test is launched as a separate program
> (i.e. 'execute_next_entry' is done 4 times), and even the launch is
> sequential after 'monitor_output', we had a failure due to resource
> sharing(amdgpu_bo_list_create) issues plus it is not expected behavior
> for the test. Before the indicated change all the sub-tests were launched
> as a single program.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Michael Strawbridge <michael.strawbridge@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> 

Don't put newline between Cc and s-o-b.

> Signed-off-by: Michael Strawbridge <michael.strawbridge@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> ---
>  tests/amdgpu/amd_uvd_enc.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_uvd_enc.c b/tests/amdgpu/amd_uvd_enc.c
> index e3e85522f..430a636f4 100644
> --- a/tests/amdgpu/amd_uvd_enc.c
> +++ b/tests/amdgpu/amd_uvd_enc.c
> @@ -292,6 +292,15 @@ amdgpu_uvd_enc_destroy(amdgpu_device_handle device_handle,
>  	free_resource(&context->enc.session);
>  }
>  
> +static void
> +amdgpu_uvd_enc_test(amdgpu_device_handle device, struct uvd_enc_context *context)
> +{
> +	amdgpu_uvd_enc_create(device, context);
> +	amdgpu_uvd_enc_session_init(device, context);
> +	amdgpu_uvd_enc_encode(device, context);
> +	amdgpu_uvd_enc_destroy(device, context);
> +}
> +
>  igt_main
>  {
>  	amdgpu_device_handle device;
> @@ -307,27 +316,16 @@ igt_main
>  		igt_require(err == 0);
>  		igt_info("Initialized amdgpu, driver version %d.%d\n",
>  			 major, minor);
> +		memset(&context, 0, sizeof(context));
>  		err = mmd_context_init(device, &context.uvd);
>  		igt_require(err == 0);
>  
>  		igt_skip_on(!is_uvd_enc_enable(device));
>  	}
>  
> -	igt_describe("Test whether uvd enc is created");
> -	igt_subtest("uvd_enc_create")
> -	amdgpu_uvd_enc_create(device, &context);
> -
> -	igt_describe("Test whether uvd enc session init");
> -	igt_subtest("amdgpu_uvd_enc_session_init")
> -	amdgpu_uvd_enc_session_init(device, &context);
> -
> -	igt_describe("Test whether uvd enc encode");
> -	igt_subtest("amdgpu_uvd_enc_encode")
> -	amdgpu_uvd_enc_encode(device, &context);
> -
> -	igt_describe("Test whether uvd enc is destroyed");
> -	igt_subtest("uvd_enc_destroy")
> -	amdgpu_uvd_enc_destroy(device, &context);
> +	igt_describe("Test uvd session, encode, destroy");
> +	igt_subtest("uvd_encoder")
> +	amdgpu_uvd_enc_test(device, &context);
-- ^
It is better to add tab here:

	igt_subtest("uvd_encoder")
	    amdgpu_uvd_enc_test(device, &context);

With this,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  
>  	igt_fixture {
>  		mmd_context_clean(device, &context.uvd);
> -- 
> 2.25.1
> 
