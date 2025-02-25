Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290CC021B8
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 09:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9636C10E5D6;
	Tue, 25 Feb 2025 09:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tl7Czkzk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DDD10E5D6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740474939; x=1772010939;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7LZYwvHQLcmjGGBvFihMQ0KwGEwAPw1xhynX91ajlOs=;
 b=Tl7CzkzkwRdmMQ44J1mz/UdIL5R92zlQYW1LpwI7eaB/HgXUj9E2vuUK
 zjF4wUfx6baQ4vtYPmgyyx35pZvIyaGUlBQ++1mAVgBg8bFRojBs42iaJ
 CjCI+9eD/ygcjudOiGhi0iRT0bJT7zDFp9IzIXUt7MVyOb5V5RNmlPaXN
 ZXxbaCDzKzy6kuUTjjjfsNx+nFiRoZikypbPV+6lOcKGaG3jxj67Tx5th
 gpSMb4VlrWa3agKjLGjFt67r6hpKtOKqfiph5VgzZ7c4SZPrnt/dnxxBF
 MHTBGHnk+1srQ7ClqfpKKDpcFFXk7va2VTbXQSH66pPwv0+yRjsMpcUEU Q==;
X-CSE-ConnectionGUID: CCoi5vC3Rcm2gqUezYpovA==
X-CSE-MsgGUID: II3UK9hxRd23mdwptWbfGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58811030"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="58811030"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:15:39 -0800
X-CSE-ConnectionGUID: xRnSNOZCTsWpAfQu623MeA==
X-CSE-MsgGUID: 49kK3saZSr2820vPDUlKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="120951312"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.99.49])
 ([10.66.99.49])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:15:37 -0800
Message-ID: <7d58d7d5-df82-4589-8355-0500d73b08f7@intel.com>
Date: Tue, 25 Feb 2025 14:45:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v1,3/5] tests/intel/kms_frontbuffer_tracking: update to
 FBC support check
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, swati2.sharma@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
References: <20250220122131.221907-4-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250220122131.221907-4-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 20-02-2025 17:51, Vinod Govindapillai wrote:
> Utilize the library function to check if the FBC PSR combination
> is supported in a platform
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index b93c0d45a..0d124b597 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2860,7 +2860,7 @@ static void plane_fbc_rte_subtest(const struct test_mode *t)
>   {
>   	igt_plane_t *plane;
>   
> -	igt_require_f((drm.display_ver >= 20), "Can't test fbc for each plane\n");
> +	igt_require_f(intel_fbc_psr_combo_supported(drm.fd), "Can't test fbc for each plane\n");
>   
>   	prepare_subtest_data(t, NULL);
>   	unset_all_crtcs();
