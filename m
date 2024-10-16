Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4C0D2069E
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 06:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B257210E68E;
	Wed, 16 Oct 2024 06:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQxUIr2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C674610E68E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729059900; x=1760595900;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6Ad7zLpqLtJdGEdpIxfIoVCU4IKxIax7wXc3ZEh9aFI=;
 b=HQxUIr2X47yRtBztTtrlus+SyZuG+CcOBrpS2/6YVbCDj6hz2RtGzuSf
 uEZM9q4wmoyGwkINkwX+e4U3iz/dQEYHL5gBX/doDZVc7K0vxFi5f525C
 9Mn6GpTuUO7e3vMzbiDzJNOCWhvus2uq/V+KEbi0d74FKbvJbxIjRZblo
 KxOtilGjAHNRJMML2jauGE/LMZCMpbOGjtJPVnc0TaYKHHfwrgslj7siG
 jBHJOynI/Xj8ZpF2C5pb72QOSpR3jmStQeiaqSa/QN5HoeAMNKULlzLyM
 MVksTlyE2Gkd+xW8TEs6ge+6az4MlFAAr8oQENJSvFqps4SHY9wIq1tLW A==;
X-CSE-ConnectionGUID: EtnzrgMvQSmULh3+5HMYrw==
X-CSE-MsgGUID: AcSRC1DnS/ueWIRh4Q1k1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27928807"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27928807"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 23:24:59 -0700
X-CSE-ConnectionGUID: etZx3KFvTsaIXgu7+sZGyw==
X-CSE-MsgGUID: 1aeEWv8xSIypzBPJgl5gXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="82906550"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.76])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 23:24:58 -0700
Date: Wed, 16 Oct 2024 08:24:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: LR mode
 should use command or render
Message-ID: <20241016062454.sour3dim4awzbf5f@zkempczy-mobl2>
References: <20241015141826.4186247-1-pravalika.gurram@intel.com>
 <20241015141826.4186247-3-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241015141826.4186247-3-pravalika.gurram@intel.com>
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

On Tue, Oct 15, 2024 at 07:48:26PM +0530, Pravalika Gurram wrote:
> Spinner which has to run in LR mode should be
> executed on compute or render command streamer.
> Stop assuming engine id is equal to 1
> and use 'xe_find_engine_by_class'
> helper to find engine by its class.
> use 'xe_find_engine_by_class' with required engine class
> to get the engine info.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 82e607848..f62859689 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -457,11 +457,18 @@ static void lr_mode_workload(int fd)
>  	uint64_t ahnd;
>  	uint32_t bo;
>  	uint32_t ts_1, ts_2;
> +	uint32_t num_engines;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size = xe_bb_size(fd, sizeof(*spin));
> -	engine = xe_engine(fd, 1);

I've checked this on ADL and for me bcs is fine so I don't think
we should merge this change in this form.

However as engines may be on different indices on different platforms
I would at least pick engine via:


	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COPY);

We'll avoid issue whereindex for bcs will be different than 1 in this case.

--
Zbigniew

> +
> +	num_engines = xe_number_engines(fd);
> +	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COMPUTE);
> +	if (engine == NULL)
> +		engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_RENDER);
> +	igt_skip_on_f((engine == NULL), "num_engines %d\n", num_engines);
> +
>  	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
>  	spin = xe_bo_map(fd, bo, bo_size);
>  
> -- 
> 2.34.1
> 
