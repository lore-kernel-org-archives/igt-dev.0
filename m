Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9254CCF9EB
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 11:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9490F10E7AD;
	Wed, 29 Oct 2025 11:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXIztU6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A84710E7AD
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761739167; x=1793275167;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=r52ey6rk3a0f1LoZca2duJfkXSPHgME40P4pMxAjmpM=;
 b=YXIztU6rJND6zAwBlUxHOSplTF6MtvB28p5atnM24JxSccoehghrZ0v4
 I3i3FefpD5wTN3USjPlHq5JKm1+oQWah0YG+x7qZ4uYkfgoHwexMNJn3Q
 gTbfTfYFOpggbOBHQPwN+RJnJ4PJVJxwO7jawT2ypXHJW3MQQ/26yMiw/
 nXK599X4kTCRgTwdC1C7OJKYHHVDS0BV3e+L0q6z9BB74G51OcDWsJpPO
 ZGsTk/V6QB2kyqnfUDPhOgpRrXZPmKc6gCZKxoV5XroGFxyEpJ1n9eQwz
 M0LJfOVqVvScfUB5c/tZVwhn5kl/4rotcx6W912vUbaGQ0hmdk3bk9HOb Q==;
X-CSE-ConnectionGUID: yoRjQR2XThSAWNXznBUDpA==
X-CSE-MsgGUID: PvXgFcacS6eMWmYyZb4A0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63765166"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="63765166"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:59:27 -0700
X-CSE-ConnectionGUID: LxZMxWcoTCqgbDP/7STY1A==
X-CSE-MsgGUID: A3FOj7h+Soa0qjJrJjwj5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185525031"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.48])
 ([10.245.245.48])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:59:26 -0700
Message-ID: <7756ad00-8000-4640-a337-35012a04edee@intel.com>
Date: Wed, 29 Oct 2025 11:59:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include/drm-uapi-experimental: Drop stale macros from
 intel_drm_local.h
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, igt-dev@lists.freedesktop.org
References: <20251029115130.2206789-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251029115130.2206789-2-sanjay.kumar.yadav@intel.com>
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

On 29/10/2025 11:51, Sanjay Yadav wrote:
> Remove temporary macros (DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT, and
> DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY) that are now part of
> upstream drm-next and are therefore in include/drm-uapi/xe_drm.h.
> These were originally added for early development
> and are no longer needed.
> 
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>

Assuming it still builds,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   include/drm-uapi-experimental/intel_drm_local.h | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
> index 3aaf1eeb9..b48c9e219 100644
> --- a/include/drm-uapi-experimental/intel_drm_local.h
> +++ b/include/drm-uapi-experimental/intel_drm_local.h
> @@ -20,11 +20,6 @@ extern "C" {
>    * clean these up when kernel uapi headers are sync'd.
>    */
>   
> -#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER	(1 << 0)
> -
> -#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT      (1 << 0)
> -#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY        (1 << 1)
> -
>   #if defined(__cplusplus)
>   }
>   #endif

