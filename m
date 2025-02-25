Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFC3C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 09:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DEF10E5D7;
	Tue, 25 Feb 2025 09:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dH787YSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3272B10E5D7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740475043; x=1772011043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yrWBBPB4QuvU654IwB1OotV+tm2PlOBC4s6f/aFYrag=;
 b=dH787YSQJ6ruca75ZkqzfNUq8gTo7P6fKCHQMAwlgCeuc0FdkuU/WQfj
 Ykc+L6VgMCXG3e0MSqntzqdJlhrjlngucVSXGY0iomhNYaG4HvpgfPSUN
 aam/eZQ5md+nh/5FSXPomYnokuLdbGboPkM1pqZege8A4N5x5uEgMmSVo
 kCerqd9nyrYfyUeRpGy4tymdZ4IuiN6moBjSrQ65nseXdkquMZ4369tTA
 2o8YbwHlgugz/FaPDQGXMXQYIoAezjC2AEBUKEngYLW4KMJgldN3hHb0N
 tT2CiMKC/Dp9QyY3pv+GyuEtXCA4YLcQq1Fq1z6v1Su2dNZFd7dgmASeg w==;
X-CSE-ConnectionGUID: G7iOXh0UQXapD45P/ujESQ==
X-CSE-MsgGUID: e2ocOOKKQt69W0BAVhyhdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45179893"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="45179893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:17:21 -0800
X-CSE-ConnectionGUID: jACgqtmwQCaQeHG7yKKZtQ==
X-CSE-MsgGUID: u04XlCCTQkijqPMHm5f1wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="121310553"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.99.49])
 ([10.66.99.49])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:17:18 -0800
Message-ID: <9ac693c8-1beb-49fb-951f-e93a4e302cf7@intel.com>
Date: Tue, 25 Feb 2025 14:47:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v1,4/5] tests/intel/kms_psr2_sf: update to FBC support
 check
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, swati2.sharma@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
References: <20250220122131.221907-5-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250220122131.221907-5-vinod.govindapillai@intel.com>
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
>   tests/intel/kms_psr2_sf.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index cd4226070..16acff4cd 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -1225,10 +1225,9 @@ igt_main
>   
>   		display_init(&data);
>   
> -		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20) &&
> -		    (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe))) {
> +		if (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe) &&
> +		    intel_fbc_psr_combo_supported(data.drm_fd))
>   			data.fbc_flag = true;
> -		}
>   
>   		data.damage_area_count = MAX_DAMAGE_AREAS;
>   		data.primary_format = DRM_FORMAT_XRGB8888;
