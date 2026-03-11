Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79A11125859
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 17:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C53210E133;
	Wed, 11 Mar 2026 17:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGuXue5w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4B310E133
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 17:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773250708; x=1804786708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nfA/pkoMk3Dli/fec7fYEdEq6KlzTzRz6s8koDudU28=;
 b=gGuXue5w3pCsc1VV3WQjkSfEmE8JTs/GC/KUZ1xflK3ln9DXsLCi+Qo8
 kUrB9TFBviVSLJTUcVw5lu1yOm25/m/h2XSbu5ObfnHY2xhbviopltaVI
 HfX428k4BJTFoFKVBckN9gFhyzAzEraszevgI624in7msA7VpOCf7U2jX
 ciYeYEkn5UEuPfrVmd7mjwtLJHlWw1WtQ5QvwiTlltRrH1lkiMFdGIIIZ
 RZDyUwt86fa8LMvie/w2DDdRPenjyg1MaCqCm2dzgLZcjTnsXt4z0ijRw
 yzM+MgqikDfuxzr+RUVrwBZfIYjIAVtRKqoj472Jnfz7QY8fzp82vKd0i w==;
X-CSE-ConnectionGUID: liePFrIzSPu6hIRdHyF1sA==
X-CSE-MsgGUID: QOvkw15CTg+rbDj4bbXlJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77935321"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="77935321"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 10:38:26 -0700
X-CSE-ConnectionGUID: 6ISKOcgDQbOXzBlzsh102w==
X-CSE-MsgGUID: qdj6DejOTtuTuOn4TGkHoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="215734875"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 10:38:23 -0700
Date: Wed, 11 Mar 2026 18:38:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com, vinay.belgaumkar@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH i-g-t v8 3/5] tools/gputop.src/xe_gputop: Refactor
 xe_populate_engines to close card_fd and use direct ioctl calls
Message-ID: <20260311173820.yer7lqqafgiiqgjx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com, vinay.belgaumkar@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
References: <20260219094804.835429-1-soham.purkait@intel.com>
 <20260219094804.835429-4-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219094804.835429-4-soham.purkait@intel.com>
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

Hi Soham,
On 2026-02-19 at 15:18:02 +0530, Soham Purkait wrote:
> During GPUTOP engine initialization, the opened card fd is required to
> query engines and obtain configurations for PMU busyness calculation, but
> leaving it open causes the process to appear as a DRM client, which
> conflicts with KMS test requirements. To avoid this, card_fd is closed
> immediately after engine discovery, and engine queries are refactored to
> remove the lib/xe/* dependency in favor of direct ioctl calls, simplifying
> the implementation and reducing igt test library dependencies.

Overall looks good, I only skimmed by it. One nit, please
make subject short, now it is too long,

[PATCH i-g-t v8 3/5] tools/gputop.src/xe_gputop: Refactor xe_populate_engines to close card_fd and use direct ioctl calls

imho better:

[PATCH i-g-t v8 3/5] tools/gputop.src/xe_gputop: Use direct ioctl calls

Or conside splitting this into card close, then refactor.

Please also rebase on current top and resend.

Regards,
Kamil 

> 
> v1:
>  - Initialize pmu_device_obj to null.
> v2:
>  - Remove dependency on lib/xe/* libraries. (Kamil)
> v3:
>  - Refactor ioctl failure check. (Vinay)
>  - Check q.size only once. (Vinay)
>  - Add num_bytes for asprintf return value. (Vinay)
> 
> Fixes: c8106465683f ("tools/gputop/xe_gputop: Add gputop support for xe specific devices")
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/gputop.src/xe_gputop.c | 108 ++++++++++++++++++++++++++---------
>  tools/gputop.src/xe_gputop.h |   3 +-
>  2 files changed, 83 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/gputop.src/xe_gputop.c b/tools/gputop.src/xe_gputop.c
> index bb2caa6ea..d8892c587 100644
> --- a/tools/gputop.src/xe_gputop.c
> +++ b/tools/gputop.src/xe_gputop.c
> @@ -1,8 +1,10 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright © 2025 Intel Corporation
> + * Copyright © 2025-2026 Intel Corporation
>   */
>  
> +#include <sys/ioctl.h>
> +
>  #include "xe_gputop.h"
>  
>  #define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
> @@ -92,6 +94,7 @@ void xe_gputop_init(void *ptr, int index,
>  
>  	obj = ((struct xe_gputop *)ptr) + index;
>  	obj->card = card;
> +	obj->pmu_device_obj = NULL;
>  }
>  
>  static int pmu_format_shift(int xe, const char *name)
> @@ -121,20 +124,50 @@ static int engine_cmp(const void *__a, const void *__b)
>  		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
>  }
>  
> +static int engine_query(int fd, struct drm_xe_query_engines **engine_q)
> +{
> +	struct drm_xe_device_query q;
> +	int ret = 0, num_eng;
> +
> +	memset(&q, 0, sizeof(q));
> +	q.query = DRM_XE_DEVICE_QUERY_ENGINES;
> +
> +	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
> +	if (ret != 0 || q.size == 0)
> +		return 0;
> +
> +	num_eng = (int)((q.size - sizeof(struct drm_xe_query_engines)) /
> +			sizeof(struct drm_xe_engine_class_instance));
> +
> +	*engine_q = (struct drm_xe_query_engines *)calloc(1, q.size);
> +	if (!*engine_q)
> +		return -1;
> +
> +	q.data = (uintptr_t)(*engine_q);
> +
> +	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
> +	if (ret != 0) {
> +		free(*engine_q);
> +		return -1;
> +	}
> +
> +	return num_eng;
> +}
> +
>  void *xe_populate_engines(const void *obj, int index)
>  {
>  	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
>  	struct igt_device_card *card = ptr->card;
>  	uint64_t engine_active_config, engine_total_config;
>  	uint64_t engine_class, engine_instance, gt_shift;
> -	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_query_engines *engine_q;
>  	struct xe_pmu_device *engines;
>  	char device[30];
> -	int ret = 0;
> -	int card_fd;
> +	int ret = 0, num_eng;
> +	int card_fd = -1;
>  
>  	if (!card || !strlen(card->card) || !strlen(card->render))
> -		return NULL;
> +		goto err;
>  
>  	if (strlen(card->card)) {
>  		card_fd = igt_open_card(card);
> @@ -142,39 +175,52 @@ void *xe_populate_engines(const void *obj, int index)
>  		card_fd = igt_open_render(card);
>  	} else {
>  		fprintf(stderr, "Failed to detect device!\n");
> -		return NULL;
> +		goto err;
>  	}
> -	xe_device_get(card_fd);
> +
> +	num_eng = engine_query(card_fd, &engine_q);
> +	if (num_eng <= 0) {
> +		fprintf(stderr, "Engine query failed!\n");
> +		goto err;
> +	}
> +
>  	engines = malloc(sizeof(struct xe_pmu_device) +
> -			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +			 num_eng * sizeof(struct xe_engine));
>  	if (!engines)
> -		return NULL;
> +		goto err;
>  
>  	memset(engines, 0, sizeof(struct xe_pmu_device) +
> -	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	       num_eng * sizeof(struct xe_engine));
>  
>  	engines->num_engines = 0;
>  	gt_shift = pmu_format_shift(card_fd, "gt");
>  	engine_class = pmu_format_shift(card_fd, "engine_class");
>  	engine_instance = pmu_format_shift(card_fd, "engine_instance");
>  	xe_perf_device(card_fd, device, sizeof(device));
> +	close(card_fd);
> +	card_fd = -1;
> +
>  	engines->device = strdup(device);
>  	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
>  	if (ret < 0)
> -		return NULL;
> +		goto err;
>  
>  	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
>  	if (ret < 0)
> -		return NULL;
> +		goto err;
>  
> -	xe_for_each_engine(card_fd, hwe) {
> +	while (engines->num_engines < engine_q->num_engines) {
> +		int num_bytes = 0;
>  		uint64_t  param_config;
>  		struct xe_engine *engine;
> +		struct drm_xe_engine_class_instance hwe;
> +
> +		hwe = engine_q->engines[engines->num_engines].instance;
>  
>  		engine = engine_ptr(engines, engines->num_engines);
> -		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> -			| hwe->engine_instance << engine_instance;
> -		engine->drm_xe_engine = *hwe;
> +		param_config = (uint64_t)hwe.gt_id << gt_shift | hwe.engine_class << engine_class
> +			| hwe.engine_instance << engine_instance;
> +		engine->drm_xe_engine = hwe;
>  		engine->engine_active_ticks.config = engine_active_config | param_config;
>  		engine->engine_total_ticks.config = engine_total_config | param_config;
>  
> @@ -184,12 +230,12 @@ void *xe_populate_engines(const void *obj, int index)
>  			break;
>  		}
>  
> -		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
> -			       hwe->gt_id,
> -			       class_display_name(engine->drm_xe_engine.engine_class),
> -			       engine->drm_xe_engine.engine_instance);
> +		num_bytes = asprintf(&engine->display_name, "GT:%u %s/%u",
> +				     hwe.gt_id,
> +				     class_display_name(engine->drm_xe_engine.engine_class),
> +				     engine->drm_xe_engine.engine_instance);
>  
> -		if (ret <= 0) {
> +		if (num_bytes <= 0) {
>  			ret = errno;
>  			break;
>  		}
> @@ -197,9 +243,11 @@ void *xe_populate_engines(const void *obj, int index)
>  		engines->num_engines++;
>  	}
>  
> -	if (!ret) {
> +	free(engine_q);
> +
> +	if (ret) {
>  		errno = ret;
> -		return NULL;
> +		goto err;
>  	}
>  
>  	qsort(engine_ptr(engines, 0), engines->num_engines,
> @@ -208,6 +256,15 @@ void *xe_populate_engines(const void *obj, int index)
>  	ptr->pmu_device_obj = engines;
>  
>  	return engines;
> +
> +err:
> +	if (card_fd >= 0)
> +		close(card_fd);
> +	if (engines)
> +		free(engines);
> +	if (engine_q)
> +		free(engine_q);
> +	return NULL;
>  }
>  
>  static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> @@ -263,11 +320,11 @@ int xe_pmu_init(const void *obj, int index)
>  		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
>  			       &engines->fd);
>  		if (fd < 0)
> -			return -1;
> +			return fd;
>  		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
>  			       &engines->fd);
>  		if (fd < 0)
> -			return -1;
> +			return fd;
>  	}
>  	return 0;
>  }
> @@ -359,4 +416,3 @@ int xe_print_engines(const void *obj, int index, int lines, int w, int h)
>  
>  	return lines;
>  }
> -
> diff --git a/tools/gputop.src/xe_gputop.h b/tools/gputop.src/xe_gputop.h
> index 1e3856071..dcd82de7d 100644
> --- a/tools/gputop.src/xe_gputop.h
> +++ b/tools/gputop.src/xe_gputop.h
> @@ -7,11 +7,10 @@
>  #define __XE_GPUTOP_H__
>  
>  #include <dirent.h>
> +#include <xe_drm.h>
>  
> -#include "igt_device_scan.h"
>  #include "igt_perf.h"
>  #include "utils.h"
> -#include "xe/xe_query.h"
>  
>  struct xe_pmu_pair {
>  	uint64_t cur;
> -- 
> 2.34.1
> 
