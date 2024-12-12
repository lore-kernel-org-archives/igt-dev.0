Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F53E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 16:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFAD10E316;
	Thu, 12 Dec 2024 16:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mo3kC+Tt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A7910E316
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734021652; x=1765557652;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yBZ1sOVqGXKUKbYqgRPZXFsW5Mq6dfAMmNUJwsfbUfc=;
 b=Mo3kC+TtMfFYxHHvD518N7xzbPqCzFSZ1fewYzFDSBJWY0njn6Brkt+0
 Ems4mt0UeepksqYOMzNb6Scl7O4BO3tEMj5U5bqrJwNFGc4Un9MA0oxWn
 nRKjOttk+y/Ns2hy3XrMWt0/GVIMBw1OnelwWUmXvdMy2U1EpeKx657uD
 f9ndIsuQ/Ljk6c4lWvgjNQ/Ytfe+YqSIAsZSIUV59oQ5x1QuYP5EmGOdb
 rz5BN7Sn7WMIb71eW535N1LIcQJqbObm6RaDJB+g1/lXq86PTGIHzhR/I
 FEyUv37vUyOusDgcCi2CnkPkYRBwAkvbkAwUY6x+gXpV7v90vGo9/cKcZ w==;
X-CSE-ConnectionGUID: 7NHw+Pi7Soy2SLfFgbwkZA==
X-CSE-MsgGUID: wsnzc5h/Svm4J/KP7y52bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45059340"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="45059340"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 08:40:51 -0800
X-CSE-ConnectionGUID: TnW94XeTRs2Wg/56gBNLfQ==
X-CSE-MsgGUID: ni3tRP16R3uEh9HkGs3pKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="101305759"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 08:40:50 -0800
Message-ID: <47a20cd2-f0d2-4dcf-ab03-f03f16aa9849@intel.com>
Date: Thu, 12 Dec 2024 17:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] lib/xe_query: Fix switch indentation
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com
References: <20241211114044.210562-1-dominik.grzegorzek@intel.com>
 <20241211114044.210562-4-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241211114044.210562-4-dominik.grzegorzek@intel.com>
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

Hi Dominik,

On 11.12.2024 12:40, Dominik Grzegorzek wrote:
> Correct switch indentation so it follows kernel guidelines.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Acked-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
>   lib/xe/xe_query.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 6a7b08006..b9e6cf045 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -225,19 +225,19 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_reg
>   const char *xe_engine_class_string(uint32_t engine_class)
>   {
>   	switch (engine_class) {
> -		case DRM_XE_ENGINE_CLASS_RENDER:
> -			return "DRM_XE_ENGINE_CLASS_RENDER";
> -		case DRM_XE_ENGINE_CLASS_COPY:
> -			return "DRM_XE_ENGINE_CLASS_COPY";
> -		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> -			return "DRM_XE_ENGINE_CLASS_VIDEO_DECODE";
> -		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -			return "DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE";
> -		case DRM_XE_ENGINE_CLASS_COMPUTE:
> -			return "DRM_XE_ENGINE_CLASS_COMPUTE";
> -		default:
> -			igt_warn("Engine class 0x%x unknown\n", engine_class);
> -			return "unknown engine class";
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "DRM_XE_ENGINE_CLASS_RENDER";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "DRM_XE_ENGINE_CLASS_COPY";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "DRM_XE_ENGINE_CLASS_VIDEO_DECODE";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "DRM_XE_ENGINE_CLASS_COMPUTE";
> +	default:
> +		igt_warn("Engine class 0x%x unknown\n", engine_class);
> +		return "unknown engine class";
>   	}
>   }
>   
