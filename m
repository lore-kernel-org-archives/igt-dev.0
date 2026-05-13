Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B04CD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 08:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2477B10E2D7;
	Wed, 13 May 2026 08:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mp6xedTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DB310E2D7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778661529; x=1810197529;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=t29uuWhdeV2bc5F2WbpRSFhzGE1yk3BPXc7ptFTJb4M=;
 b=Mp6xedTjHrRdP6yjntDdpDxZqbBR+SOKN0at9kQxOvA2ySc0QlvPxUHW
 nG7NI1xGzDhaoCQiXgYiB/Sa1Zq/R2UO5ufy+06m+67tnHUNX92F/SaTL
 fPh22pBWJeHKDRBvcc3ZJDzE+j2G8nrD2xPawEqWY/sANxK8LQd3THAdq
 IbuvzUIY2HEHpJ07fBBIcK165NEGUj0zppARz54ZzzH9Dgyeg/wFqVpeG
 VjxzdAgZ4oox9GXZKcqJwvLV0PnH34PXyJoXQw4YIwP4B0ZhSisy5IWuT
 /pQUyUqscYQqi89jGF/EzSuaVL6CkV9itXT0YuGsB1tfMOz3N5GgJq9wQ w==;
X-CSE-ConnectionGUID: c4Czj0DARpq9IKLOBXNWiQ==
X-CSE-MsgGUID: sLTLOj4bSqmRT5r+QXvTqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79761119"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79761119"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:38:48 -0700
X-CSE-ConnectionGUID: A2Jy4TfmSgKPwh/tvg8zjg==
X-CSE-MsgGUID: la2pnGMeROiv6yvwiqwvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="242034223"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:38:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 stuart.summers@intel.com
Subject: Re: [PATCH i-g-t] lib/xe: Retry xe_vm_bind on transient -EBUSY
In-Reply-To: <20260512153919.3676059-1-nishit.sharma@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260512153919.3676059-1-nishit.sharma@intel.com>
Date: Wed, 13 May 2026 11:38:43 +0300
Message-ID: <73e598c5cbaf13248e4b9d6a334ac3934d4dc002@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 12 May 2026, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
>
> __xe_vm_bind_assert() can intermittently fail with -EBUSY when the
> kernel rejects the bind because it detects in-flight work that has
> not yet completed. This is transient condition the call is expected
> to succeed once the competing work settles.
>
> Add a retry loop (up to 5 attempts) that re-issues __xe_vm_bind()
> whenever -EBUSY is returned, before asserting success. All other
> error codes are treated as fatal and propagate immediately to
> igt_assert_eq() as before.
>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index e13195e16..3a307f95f 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -242,9 +242,24 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
>  			  uint32_t num_syncs, uint32_t prefetch_region, uint64_t ext)
>  {
> -	igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
> -				   op, flags, sync, num_syncs, prefetch_region,
> -				   DEFAULT_PAT_INDEX, ext), 0);
> +	int ret, retries = 0;
> +
> +retry:
> +	ret = __xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
> +			   op, flags, sync, num_syncs, prefetch_region,
> +			   DEFAULT_PAT_INDEX, ext);
> +
> +	if (ret && retries < 5) {
> +		/*
> +		 * Retry on transient -EBUSY, which can occur when the
> +		 * kernel is contended by in-flight background work
> +		 */
> +		retries++;
> +		goto retry;
> +	}

Please use a loop for looping.

BR,
Jani.



> +
> +	igt_assert_eq(ret, 0);
> +	return;
>  }
>  
>  void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t offset,

-- 
Jani Nikula, Intel
