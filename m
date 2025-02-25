Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98038C021B8
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 09:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5432810E5D7;
	Tue, 25 Feb 2025 09:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jd85hgm5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2631310E5D7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740475083; x=1772011083;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sjgIMDfdWoCpLIFRdqmELr4ZufCvcsicnS0ZsGTA1PE=;
 b=Jd85hgm5y72rn5MZ2mwUlQz7rpekf3NV31SRf/LdvxuhSNbw/FIqsuJc
 lAesC0UX34NRkXzYIBRpw869l6+jtN6m0crXGlnpzHK6/RyfA1vKUPero
 h0A4A74/cFi5MO5HaHuM1/saXE5kl2LZjd/k72OfMrFCs04liucJ5f2F0
 Ti8dfH8YvnslvX4+UANnA+MMkiS/FcyRPRzLql0j1igddK6B00ePWrrho
 bleNtezvRmZbMFLt7/oLBoODtEHZdwRPMIBqwXUVvYlY2/oFQ/8TJGEHl
 /YxQA7nbvm8WNm5Zi96J/W8lZZwVYrIXjD6UTZq67duwvrU3TgKW9YCOY A==;
X-CSE-ConnectionGUID: tCHK/Hk+Q761mYBqnrU5kg==
X-CSE-MsgGUID: arJtkxZnSNOqASG4grDxqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45179973"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="45179973"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:18:03 -0800
X-CSE-ConnectionGUID: 4T+SaF86Tf2E6yIGMZHnlQ==
X-CSE-MsgGUID: 62Q6ox+0RHSHYhJ7GyYc0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="121310810"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.99.49])
 ([10.66.99.49])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:18:00 -0800
Message-ID: <dac7c445-6850-422e-a87d-417fe051ff6c@intel.com>
Date: Tue, 25 Feb 2025 14:47:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v1,
 5/5] lib/i915/fbc: fbc psr combo support update for xe3
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, swati2.sharma@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
References: <20250220122131.221907-6-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250220122131.221907-6-vinod.govindapillai@intel.com>
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
> Because of the FBC dirty rect support in xe3, the FBC and PSR
> are not recommended to be enabled together. So if PSR2 selective
> fetch is enabled, FBC will not be activated in xe3.
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/i915/intel_fbc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index 90fe5943c..3971e4920 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -167,7 +167,10 @@ bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t height)
>    */
>   bool intel_fbc_psr_combo_supported(int device)
>   {
> -	if (intel_display_ver(intel_get_drm_devid(device)) >= 20)
> +	int ver = intel_display_ver(intel_get_drm_devid(device));
> +
> +	/* In Xe3 FBC PSR combo not supported because of FBC dirty rect */
> +	if (ver >= 20 && ver < 30)
>   		return true;
>   
>   	return false;
