Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87680C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 09:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A6710E5D6;
	Tue, 25 Feb 2025 09:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwA37NRE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC27110E5D9
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740474773; x=1772010773;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2w/BxIq4H/i50/mag+3dzK721t4/apG4SbzdIBSsYvQ=;
 b=kwA37NRE9KV6tO4AXSkKqR+v/sqs+FXzJnl7YalZ8iHXCY5FFW5k4+JD
 76PRFjw0XhPQmKTkPI1kv4uZy90BdYn5B8bUETPHTHUhzzXRFzKsCPl8T
 +66mp9GwIB+LHdfbaiGTqcJH62ei+JgZiRJJ3lEPCMRhu0dr2hpU+IidX
 Sboy3YJa2ZG81jl5859aaoeXHT9GfOyJPnwDlMgtcapLSTJNByUtfAMw6
 LuTppf65Irt33er4paZ5rjxWDP9bo/Ycy3WUdEI/wKloV+hZmTgwiqVfM
 5cEsoB57VKUShIbC8z49vMRwXGu5eglgtIi3lM2iENh9d65vMf0aNz6Kn Q==;
X-CSE-ConnectionGUID: TzY546fnRy2/Uk+AuHFrbA==
X-CSE-MsgGUID: 8mwY7XswS6ea27vXB8vNMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58810639"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="58810639"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:12:52 -0800
X-CSE-ConnectionGUID: plGICK/nQ+eZZa+pYdVZ9A==
X-CSE-MsgGUID: Hx8s+HJBTxeZC2FrARgjCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="121277329"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.99.49])
 ([10.66.99.49])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:12:50 -0800
Message-ID: <2bd8e544-142b-4c34-ac3b-8ac1e3b2648e@intel.com>
Date: Tue, 25 Feb 2025 14:42:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v1,1/5] lib/i915/fbc: fbc psr combo support check helper
 function
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, swati2.sharma@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
References: <20250220122131.221907-2-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250220122131.221907-2-vinod.govindapillai@intel.com>
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

Hello Vinod,

Just a suggestion if we can have some kind of identifier to refer below 
criteria added as a comment.
Without that also LGTM.
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

Thanks and Regards
Kunal Joshi

On 20-02-2025 17:51, Vinod Govindapillai wrote:
> Introduce a function which can check if the PSR and FBC combo
> is supported in a display version.
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   lib/i915/intel_fbc.c | 18 ++++++++++++++++++
>   lib/i915/intel_fbc.h |  1 +
>   2 files changed, 19 insertions(+)
>
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index 2096bd996..90fe5943c 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -154,3 +154,21 @@ bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t height)
>   
>   	return width <= max_w && height <= max_h;
>   }
> +
> +/**
> + * intel_fbc_psr_combo_supported
> + *
> + * @fd: fd of the device
> + *
> + * FBC PSR combination support depends on the display version.
> + *
> + * Returns:
> + * true if FBC and PSR can be enabled together in a platform
> + */
> +bool intel_fbc_psr_combo_supported(int device)
> +{
> +	if (intel_display_ver(intel_get_drm_devid(device)) >= 20)
> +		return true;
> +
> +	return false;
> +}
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index 5cca5dfd9..0abd18478 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -16,5 +16,6 @@ bool intel_fbc_wait_until_enabled(int device, enum pipe pipe);
>   bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
>   void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
>   bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
> +bool intel_fbc_psr_combo_supported(int device);
>   
>   #endif
