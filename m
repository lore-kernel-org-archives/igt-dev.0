Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1411CCFC285
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 10:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B5110E563;
	Tue, 15 Oct 2024 10:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhgXvoRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C75A10E08D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 10:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728987431; x=1760523431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pv0hea5o8GbfGlSwoFsgclhpFY6ko7hQGSLOgUH0yts=;
 b=nhgXvoRKKwPfNGWzsL2PvEoRVj4tBBTm4ERSFLNAzOU6kS/JVWMBAv/t
 RnZpUGqUAw9eu738WiORRSrcisRWYge5YyVlF+A4whOy/ru0tDhVY5w1o
 dlVLUzjgAjAFcToF4srYFMpMDkkwRP3DGyUhOgCEnwWHEH319DY0c+2an
 LYTAI9EBoKoVltaIDGeUUVwSaQWsw4dnR+gQAL6322JEKMJcJUs4yURN2
 mC5EfhFaeWo81rAh9AzsIHJx5JJ+GettRa4Me6olwX4XI3zEmpYPipRcN
 06qGctQNd9nL3JzfTHlK8QjkCqGzIw/LUstl0DBSP76BWBCEC7pMN9QvW g==;
X-CSE-ConnectionGUID: PsfoBj0vQq2iyQySYx42vQ==
X-CSE-MsgGUID: Etm71sWfTx+ygig/OGd+tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27853817"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="27853817"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 03:17:11 -0700
X-CSE-ConnectionGUID: Kpe/kzREQAu4SP+YGbrPnQ==
X-CSE-MsgGUID: uTnacfUoRJ2WKPYBUa1P/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="77517275"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.47])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 03:17:09 -0700
Date: Tue, 15 Oct 2024 12:17:07 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com
Subject: Re: [PATCH i-g-t] lib/xe/xe_query: xe_find_engine_by_class helper
Message-ID: <20241015101707.xk2nwsd33w3ikpas@zkempczy-mobl2>
References: <20241015085723.4172190-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015085723.4172190-1-pravalika.gurram@intel.com>
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

On Tue, Oct 15, 2024 at 02:27:23PM +0530, Pravalika Gurram wrote:
> Added "xe_find_engine_by_class" helper function
> to query the required engine class instance id is available or not.
> 
> Also use the compute engine first in LR mode,
> if compute engine is not available use render.

Please describe what's for is this patch. Above paragraphs are verbal
description of the code. For example sth like this:

'''
Spinner which has to run in LR mode should be executed on compute
or render command streamer. Stop assuming engine id is equal to 1
and use helper to find engine by its class.
'''

or similar.

> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  lib/xe/xe_query.c                  | 21 +++++++++++++++++++++
>  lib/xe/xe_query.h                  |  1 +
>  tests/intel/xe_exec_compute_mode.c | 10 +++++++++-
>  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 8694fa3f9..22f3b5329 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -731,6 +731,27 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
>  	return false;
>  }
>  
> +/**
> + * xe_find_engine_by_class
> + * @fd: xe device fd
> + * @engine_class: engine class
> + *
> + * Returns engine @class instance id otherwise -1.
> + */
> +uint32_t xe_find_engine_by_class(int fd, uint16_t engine_class)

This should rather return pointer to engine or NULL instead of index.
See how xe_engine() is implemented and return same pointer type.

> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +	igt_assert(xe_dev);
> +
> +	for (int i = 0; i < xe_dev->engines->num_engines; i++)
> +		if (xe_dev->engines->engines[i].instance.engine_class == engine_class)
> +			return xe_dev->engines->engines[i].instance.engine_class;
> +
> +	return -1;
> +
> +}

>  /**
>   * xe_has_media_gt:
>   * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index fd1155f7f..e96f0d648 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -108,6 +108,7 @@ uint16_t xe_dev_id(int fd);
>  int xe_supports_faults(int fd);
>  const char *xe_engine_class_string(uint32_t engine_class);
>  bool xe_has_engine_class(int fd, uint16_t engine_class);
> +uint32_t xe_find_engine_by_class(int fd, uint16_t engine_class);
>  bool xe_has_media_gt(int fd);
>  bool xe_is_media_gt(int fd, int gt);
>  uint16_t xe_gt_get_tile_id(int fd, int gt);

Do above in separate patch.

> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 82e607848..7160b48d1 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -457,11 +457,19 @@ static void lr_mode_workload(int fd)
>  	uint64_t ahnd;
>  	uint32_t bo;
>  	uint32_t ts_1, ts_2;
> +	uint32_t num_engines, idx;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size = xe_bb_size(fd, sizeof(*spin));
> -	engine = xe_engine(fd, 1);
> +
> +	num_engines = xe_number_engines(fd);
> +	idx = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COMPUTE);
> +	if (idx == -1)
> +		idx = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_RENDER);
> +	igt_skip_on_f((idx == -1), "idx %d num_engines %d\n", idx, num_engines);
> +	engine = xe_engine(fd, idx);

According to changes in the helper calling xe_engine() won't be
necessary here.

--
Zbigniew

> +
>  	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
>  	spin = xe_bo_map(fd, bo, bo_size);
>  
> -- 
> 2.34.1
> 
