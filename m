Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9BEC021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 09:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C93210E5D4;
	Tue, 25 Feb 2025 09:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAPDrDtu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D063810E5D4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740474855; x=1772010855;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tkX2Ayy6yLCnQ6WhA4XTU8nDjgItUu3zAfCGPgqDEEA=;
 b=fAPDrDtuorZd0sQv+IxelbonqP2bnlqmolhU7OuzlOSe5NqQ7xjb2JGl
 aggnTcJaW5bffelpt+F3pLhAyV2Y57fb67jn/CifIjxRA8hOI60UXUyh2
 tlfwM7wsV7i+yl9SwfbNlL8OuQY02dVBCtAQGauuCMDaNOOTRZwXDMk3G
 MWzqK5m4K7fNEX5ZDakCdhd5HWM1gQ6MOYDkbZMvugH/HfB2Yfj0gofCA
 h+hZFom6Tcv5LQGjwwEC7aRXy7xhDSnKEJFWo5MQZTGL225LDUaf3yDkB
 L02UezO7aXmiUTVNJ8dDh0oQWHYLRWzEu2mP1yM6/gXTwnQ8f9vK0o2xb Q==;
X-CSE-ConnectionGUID: PfJrAGZQTyKcpq5Mxc/mwQ==
X-CSE-MsgGUID: Cv3VFhQeSpm8VaDjRKOSKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58810746"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="58810746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:14:14 -0800
X-CSE-ConnectionGUID: 65MebXRDQdCZ9+4a4YVSVw==
X-CSE-MsgGUID: qCfTCHpnR6SEJhd+JbPWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="121277678"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.99.49])
 ([10.66.99.49])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:14:13 -0800
Message-ID: <80e14d54-2256-443b-8968-ef51f32e981f@intel.com>
Date: Tue, 25 Feb 2025 14:44:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v1,2/5] tests/intel/kms_psr: update to FBC support check
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, swati2.sharma@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
References: <20250220122131.221907-3-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250220122131.221907-3-vinod.govindapillai@intel.com>
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
> is supported in a platform and re-roder the condition check.
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_psr.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index ad49c18f0..124d7be18 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -823,10 +823,9 @@ igt_main
>   		data.bops = buf_ops_create(data.drm_fd);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
> -		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20) &&
> -		    (intel_fbc_supported_on_chipset(data.drm_fd, pipe))) {
> +		if (intel_fbc_supported_on_chipset(data.drm_fd, pipe) &&
> +		    intel_fbc_psr_combo_supported(data.drm_fd))
>   			data.fbc_flag = true;
> -		}
>   	}
>   
>   	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
