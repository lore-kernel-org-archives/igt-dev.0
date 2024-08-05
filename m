Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38658C52D70
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 10:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A532110E17C;
	Mon,  5 Aug 2024 10:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+4tC32t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F9B10E17C
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722852512; x=1754388512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ipBvmRTXfxm4uLToaY9IiBVM8enkmCvz/fHCxZM5ZUo=;
 b=R+4tC32tK7TJWzAlhUt/OwL0o+qRe2q3bbpSz0VG80ZAhcxq49QBKlsT
 d7ZqhIAvIuGGeeXmNyAmkGH1ilgqAC0CyhDs42LF9Amt61FKPcL5k5azU
 OZe9YmJ1yYalKLgYKlnO28YB2y9pwjMG5gL8J2gJqIUEhRDcUmHSm0XUh
 wXn3SdyyncOuoJA6pBTSF3dCF3hneixanYVHpz3Jbx3+5GH7Ifk0AnwN0
 tmE+iLcFgTwmhk+TZt27Hxi6k/GKdgIctLFdZd+Cl3FHpa2hZw+9K4ZUS
 8NyLL99HtO7Ed9uP4uprehA9DrAgrI02+AAAWOFS9W6aemYEpyyFjZZee A==;
X-CSE-ConnectionGUID: cxuT29G4QAmr4zBDhEZFDQ==
X-CSE-MsgGUID: KTY+SgP6Rv+xAGHi1w4hLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="24572851"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24572851"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 03:08:31 -0700
X-CSE-ConnectionGUID: bEcoHoctQpWGfMVazejsCg==
X-CSE-MsgGUID: S5Bbi68ZR7Wg0iwYNPP5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="60252740"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 03:08:23 -0700
Date: Mon, 5 Aug 2024 12:08:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu: move bad mem compute test to amd
 deadlock
Message-ID: <20240805100817.o7uselcczlrxbec6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240805065218.2399530-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240805065218.2399530-1-jesse.zhang@amd.com>
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

Hi Jesse,
On 2024-08-05 at 14:52:18 +0800, Jesse Zhang wrote:
> 1. remove duplicate test case.
> 2. Since the bad memory test only has page faults
> and does not trigger job timeouts on mi300.
> So temporarily moved this test to amd deadlock.
> 
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_deadlock.c    |  9 +++++++++
>  tests/amdgpu/amd_queue_reset.c | 11 +----------

amd_queue_reset was reverted, please prepare new version with
your changes, also see note about subtests naming convetion
below.

>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 01185bfd3..6996855cb 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -94,6 +94,15 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
> +	igt_subtest_with_dynamic("amdgpu-compute-illegal-mem-access") {

Why dynamic here? Dynamic tests are used for not-known number/names
for its dynamic sub-subtests, not whe you do have static number of
them.

> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-illegal-mem-access")

Do not do such if(...) dynamic-name,
imho better skip:
	igt_subtest("amdgpu-compute-illegal-mem-access") {
		igt_skip_on_f(!arr_cap[AMD_IP_COMPUTE], "message why skipping\n");

		bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
					AMDGPU_HW_IP_COMPUTE);
	}

> +			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> +					AMDGPU_HW_IP_COMPUTE);
> +		}
> +	}
> +
>  	igt_describe("Test-GPU-reset-by-flooding-compute-ring-with-jobs");
>  	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
>  		if (arr_cap[AMD_IP_COMPUTE]) {
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index fb05aee35..df96c9f76 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -893,7 +893,6 @@ igt_main
>  	unsigned int arr_err[] = {
>  			CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
>  			CMD_STREAM_EXEC_INVALID_OPCODE,
> -			CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
>  			//CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,TODO  not job timeout, debug why for n31
>  			//CMD_STREAM_TRANS_BAD_REG_ADDRESS, TODO  amdgpu: device lost from bus! for n31
>  			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
> @@ -975,14 +974,6 @@ igt_main
>  		}
>  	}
>  
> -	igt_describe("Stressful-and-multiple-cs-of-bad and good mem-operations-using-multiple-processes");
> -	igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS") {
> -		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> -			igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS")

You cannot just repeat a name in a dynamic subtest, each name
should be uniqe, I would suggest to rename it to something like:
			char name[32];

			fill_in_name(name, sizeof(name) - 1, ring_id_good, ring_id_bad);
			igt_dynamic_f(name);

So dynamic subtests should have dynamic names, not a static ones.

Regards,
Kamil

> -				set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> -						ip_background, ip_test, ring_id_good, ring_id_bad);
> -		}
> -	}
>  	/* TODO  not job timeout, debug why for nv32
>  	 *igt_describe("Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes");
>  	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC") {
> @@ -997,7 +988,7 @@ igt_main
>  	 *igt_describe("Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes");
>  	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_REG_ADDRESS") {
>  	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> -	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC")
> +	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS")
>  	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
>  	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
>  	 *	}
> -- 
> 2.25.1
> 
