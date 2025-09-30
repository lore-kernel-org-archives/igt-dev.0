Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB7FCCA468
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 14:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C467610E2C2;
	Tue, 30 Sep 2025 14:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SY6yenC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4F310E2C2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759244098; x=1790780098;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dda9ACecdwSdhyrur7NNTOMxRa5clX4hqA73++5X74U=;
 b=SY6yenC8FHg8p5ijLIafSBGqoK6xxBx77NjmMksAad9RA57W8qd8laLN
 YykHlQx4U+0llU6eqnGnoC4wVUYahSjRJWvTa2HFEx15gomDJhWW7uD3c
 fFWtv4OM5lH69dHiR55yD9faIcBXkuFy+IDpITV42kMQOXUEjrpS3JvIj
 ceYG1mmBCPMJR6J0mcIv/BpC+YKEpz0zF4slLJ5Y+rmjdNso7Uea9F0qk
 M/80HRXTZasrtFih/T+Zwo3j0JDYRjaYasNn7j3VdQAAbp5aTvAS+ajdL
 mWZfwuVgJJ2zNR0kGvyFOO4hJziS1UPMOahEaPBqnF+oSuKq6huskwKyw Q==;
X-CSE-ConnectionGUID: VPNlW8w+QKud6RQyzPZxUQ==
X-CSE-MsgGUID: xmjCdPJ9TP+CRxpv599TFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65360116"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="65360116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:54:58 -0700
X-CSE-ConnectionGUID: T+Olcn7BR3yYboVIdaHT4A==
X-CSE-MsgGUID: dLKWlPHZRL6GGMflBhyD0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178120065"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.161])
 ([10.245.244.161])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:54:56 -0700
Message-ID: <c6c84169-7366-4d18-bfb5-82f52be26ea3@intel.com>
Date: Tue, 30 Sep 2025 15:54:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/xe_util: Add xe fast-copy helper
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>
References: <20250930143130.186193-4-zbigniew.kempczynski@intel.com>
 <20250930143130.186193-5-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250930143130.186193-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 30/09/2025 15:31, Zbigniew Kempczyński wrote:
> In Xe2 and beyond fast-copy between objects with different pat indices
> is quite common operation. Add fast-copy helper which requires only
> src/dst bo handle, region, pat index and size of operation.
> It is however limited to size being multiple of 4KiB and lesser or equal
> 16MiB but this limitation may removed if there will be user of this.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   lib/xe/xe_util.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_util.h |  5 +++
>   2 files changed, 85 insertions(+)
> 
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 96287423ff..6246841e61 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -7,6 +7,8 @@
>   #include "igt_core.h"
>   #include "igt_syncobj.h"
>   #include "igt_sysfs.h"
> +#include "intel_blt.h"
> +#include "intel_mocs.h"
>   #include "intel_pat.h"
>   
>   #include "xe/xe_ioctl.h"
> @@ -280,3 +282,81 @@ uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
>   
>   	return div64_u64_round_up(nsec * refclock, NSEC_PER_SEC);
>   }
> +
> +/**
> + * xe_fast_copy: simplify fast-copy from src to dst bo
> + * @fd: opened device
> + * @src_bo: src bo handle
> + * @src_region: src region
> + * @src_pat_index: src pat index
> + * @dst_bo: dst bo handle
> + * @dst_region: dst region
> + * @dst_pat_index: dst pat index
> + * @size: size in bytes for copy. Currently has limitation that it requires
> + * size aligned to 4KiB and must be <= 16MiB.
> + *
> + * Simplify common fast-copy from one bo to another. See @size regarding
> + * operation limitation.
> + */
> +void xe_fast_copy(int fd,
> +		  uint32_t src_bo, uint32_t src_region, uint8_t src_pat_index,
> +		  uint32_t dst_bo, uint32_t dst_region, uint8_t dst_pat_index,
> +		  uint64_t size)
> +{
> +	struct drm_xe_engine_class_instance inst = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +	};
> +	struct blt_copy_data blt = {};
> +	struct blt_copy_object src = {};
> +	struct blt_copy_object dst = {};
> +	intel_ctx_t *ctx;
> +	uint64_t bb_size, stride, width, height;
> +	uint32_t vm, exec_queue, bb;
> +	uint32_t alignment = xe_get_default_alignment(fd);
> +	uint64_t ahnd;
> +	int cpp = 4;
> +
> +	igt_require(size % SZ_4K == 0);
> +	igt_require(size <= SZ_16M);
> +	igt_require(blt_has_fast_copy(fd));
> +
> +	width = size >= SZ_16K ? SZ_4K : SZ_4K / cpp;
> +	height = size / width / cpp;
> +	stride = width * cpp;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
> +	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
> +	ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
> +					 INTEL_ALLOCATOR_SIMPLE,
> +					 ALLOC_STRATEGY_LOW_TO_HIGH,
> +					 alignment);
> +
> +	blt_copy_init(fd, &blt);
> +	blt.color_depth = CD_32bit;
> +
> +	bb_size = xe_bb_size(fd, SZ_4K);
> +	bb = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
> +
> +	blt_set_object(&src, src_bo, size, src_region, intel_get_uc_mocs_index(fd),
> +		       src_pat_index, T_LINEAR,
> +		       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
> +	blt_set_geom(&src, stride, 0, 0, width, height, 0, 0);
> +
> +	blt_set_object(&dst, dst_bo, size, dst_region, intel_get_uc_mocs_index(fd),
> +		       dst_pat_index, T_LINEAR,
> +		       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
> +	blt_set_geom(&dst, stride, 0, 0, width, height, 0, 0);
> +
> +	blt_set_copy_object(&blt.src, &src);
> +	blt_set_copy_object(&blt.dst, &dst);
> +	blt_set_batch(&blt.bb, bb, bb_size, system_memory(fd));
> +
> +	blt_fast_copy(fd, ctx, NULL, ahnd, &blt);
> +
> +	gem_close(fd, bb);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +	put_ahnd(ahnd);
> +	intel_ctx_destroy(fd, ctx);
> +}
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 06ebd3c2af..a22572f35c 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -49,4 +49,9 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
>   
>   uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t ns);
>   
> +void xe_fast_copy(int fd,
> +		  uint32_t src_bo, uint32_t src_region, uint8_t src_pat_index,
> +		  uint32_t dst_bo, uint32_t dst_region, uint8_t dst_pat_index,
> +		  uint64_t size);
> +
>   #endif /* XE_UTIL_H */

