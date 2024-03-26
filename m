Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F86C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 08:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D1210EC5B;
	Tue, 26 Mar 2024 08:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSbsy8PK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C0C10EC5B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711442221; x=1742978221;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NY29tI7ZInYc67xOKBus22MqJzFMVtv71kmH65ErpVA=;
 b=aSbsy8PKY/mgHAaZMccuXzc8Zkb6m0YoQXcWBGHQtikW/GqgRTNPpuJS
 L2aUHAMsG943u0Nnorc+EUtARrCFslOyHmP4gvsNd1ywJlgT7Fa4G4fiY
 Q6QHE5HqbdOkdM/+Q23olRLeAcN8/2Wy4BiD/kvIjsF6BuOSaBv1CV4+Y
 BQBM6FP2Zg14Kls7wzsgoeep0EpXIaU0SKXnGy+HzoXHxT39K4rhAFpMC
 2Z3KHXae4BncjqPsZCT754eUGGuMgQ4iU/JeEB5dYbjqbkAq+8/U399+h
 tnuCAxMn557wL4oIQDet9l/qZsfC2vPaGKNYqr1lydVwoBTd6GIYFxdoM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6312780"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6312780"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 01:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="16555207"
Received: from unknown (HELO [10.245.245.97]) ([10.245.245.97])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 01:36:50 -0700
Message-ID: <100fba34-b4d3-4b0f-9413-4f14345a8272@intel.com>
Date: Tue, 26 Mar 2024 08:36:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/3] tests/xe_ccs: Check if platform supports
 compression
Content-Language: en-GB
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
References: <cover.1711444735.git.akshata.jahagirdar@intel.com>
 <1d66863d0c0ba1e70c8a668ed88a1ed69321e29f.1711444735.git.akshata.jahagirdar@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <1d66863d0c0ba1e70c8a668ed88a1ed69321e29f.1711444735.git.akshata.jahagirdar@intel.com>
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

On 26/03/2024 09:54, Akshata Jahagirdar wrote:
> Add check before running the test to ensure the platform supports
> compression and has flat ccs enabled.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   tests/intel/xe_ccs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 8fe1f62eb..b424a1d6d 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -718,6 +718,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>   	igt_fixture {
>   		xe = drm_open_driver(DRIVER_XE);
>   		igt_require(blt_has_block_copy(xe));
> +		igt_require(blt_platform_supports_compression(xe));

At least on Xe2 I think we still need some kind validation here, since 
this is a valid user config. IIRC HW claims that we shouldn't really 
care that flat-ccs is for example disabled by BIOS on LNL. Everything 
should "just work", given that the CCS state is always zero. IMO test 
should be updated to account for xe2 && compression_disabled to verify 
that CCS state is indeed always zero on such a config.

>   		if (AT_LEAST_GEN(xe, 20))
>   			igt_require(HAS_FLATCCS(xe));
>   
