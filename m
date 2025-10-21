Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FB0CCD1A7
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 14:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEE510E611;
	Tue, 21 Oct 2025 14:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIfbW8Ta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D429610E611
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761058748; x=1792594748;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TiE0xtxaizQMFhRAIwHxofcZw6nVLP6bWt2tSBQZ8+w=;
 b=LIfbW8TaHf/9qHqlBvZp82SKqeo+j31bOsbzGUZ8eETsX1yVA73jX6Ai
 Q9fsIqCV+j22QI5VafEieZBfoK525eV9OU1203D/hgFQs5XJxyBsje6QG
 ucM9asLI96JW+98kHR+9ttc+bLGvNoyP51W5RlHN3MMXOZbR1VXHQ47Fg
 X9f53bA38D1xXktDMTf+OuyAKr4ba3YKJlvjgNMUPtEzxMnT6m0Bc3Oz1
 GGxKARrRZDBHfSeg1EqR62Rc7KMdwbfX8qBB5dt1eaIQORsu2tywLkEih
 6aieLQvvWCvoda+vxK7gL6ipS0O0trar3BC8M2vfaeWGcSxvEKgGMr8ZR Q==;
X-CSE-ConnectionGUID: Qs56Ka0MSMmNnWW/5rG8tw==
X-CSE-MsgGUID: T+cxynSjR66TFwTQyJt2mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63334533"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63334533"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:59:08 -0700
X-CSE-ConnectionGUID: eaXvW5p5RQSpozJba7oudA==
X-CSE-MsgGUID: yteowGnqTka/cymU8THHYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="187647065"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:59:06 -0700
Date: Tue, 21 Oct 2025 16:59:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/intel/mocs: Add documentation for MOCS helpers
Message-ID: <20251021145904.cxhzvpnkm5zfofau@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 igt-dev@lists.freedesktop.org
References: <20251020134517.38780-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251020134517.38780-1-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,
On 2025-10-20 at 14:45:17 +0100, Tvrtko Ursulin wrote:
> Add some documentation for the MOCS helpers.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thank you for taking care of this,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_mocs.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index 9809e32113eb..778fd848ed47 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -13,6 +13,18 @@ struct drm_intel_mocs_index {
>  	uint8_t defer_to_pat_index;
>  };
>  
> +/**
> + * SECTION:intel_mocs
> + * @short_description: Intel Memory Object Control State (MOCS) helpers
> + * @title: Intel MOCS helpers
> + * @include: igt.h
> + *
> + * Memory Object Control State (MOCS) defines the behaviour of memory accesses
> + * beyond the graphics core, including encryption, graphics data types that
> + * allow selective flushing of data from outer caches, and controlling
> + * cacheability in the outer caches.
> + */
> +
>  static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>  {
>  	uint16_t devid = intel_get_drm_devid(fd);
> @@ -53,6 +65,13 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>  	}
>  }
>  
> +/**
> + * intel_get_wb_mocs_index:
> + * @fd: the DRM file descriptor
> + *
> + * Returns: The MOCS index corresponding to the basic write-back behaviour for
> + * the open Intel DRM device.
> + */
>  uint8_t intel_get_wb_mocs_index(int fd)
>  {
>  	struct drm_intel_mocs_index mocs;
> @@ -62,6 +81,13 @@ uint8_t intel_get_wb_mocs_index(int fd)
>  	return mocs.wb_index;
>  }
>  
> +/**
> + * intel_get_uc_mocs_index:
> + * @fd: the DRM file descriptor
> + *
> + * Returns: The MOCS index corresponding to the uncached behaviour for the open
> + * Intel DRM device.
> + */
>  uint8_t intel_get_uc_mocs_index(int fd)
>  {
>  	struct drm_intel_mocs_index mocs;
> @@ -71,6 +97,14 @@ uint8_t intel_get_uc_mocs_index(int fd)
>  	return mocs.uc_index;
>  }
>  
> +/**
> + * intel_get_displayable_mocs_index:
> + * @fd: the DRM file descriptor
> + *
> + * Returns: The MOCS index corresponding to the uncached displayable behaviour
> + * for the open Intel DRM device. This should be used for buffers which may be
> + * simultaneously displayed and rendered to.
> + */
>  uint8_t intel_get_displayable_mocs_index(int fd)
>  {
>  	struct drm_intel_mocs_index mocs;
> @@ -80,6 +114,13 @@ uint8_t intel_get_displayable_mocs_index(int fd)
>  	return mocs.displayable_index;
>  }
>  
> +/**
> + * intel_get_defer_to_pat_mocs_index:
> + * @fd: the DRM file descriptor
> + *
> + * Returns: The MOCS index corresponding to the "defer to PAT" caching
> + * behaviour, or asserts if the platform does not support this mode.
> + */
>  uint8_t intel_get_defer_to_pat_mocs_index(int fd)
>  {
>  	struct drm_intel_mocs_index mocs;
> -- 
> 2.48.0
> 
