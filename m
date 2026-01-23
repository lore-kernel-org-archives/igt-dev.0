Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99B1D74EDB
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 14:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB1810EB0A;
	Fri, 23 Jan 2026 14:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iE/jtr5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F06E10EB0A
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769179168; x=1800715168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/IPkIR50o+s7EZE79cZGw03qx83RvTM6eX6YEdF/PmE=;
 b=iE/jtr5O1i7QnA5qk2+065nUH72AvctGmtOn/xanhE7LtxtBAV+3taL7
 gMO1TGjNZiHRnBBHQSXeAIh7ytvBQrMqfoZ1wYr/e6GeO2fPLIXdze+ki
 hPv+J6pKTTnWA1yeb4rWC4k41SR6BHrndpcCcy/cmiraXf3e7fy/FRBll
 Qq/EdAfEAB22oSG8jCsZT9NRreNAPYvCqJjGGAO1/cV14QPrDjuFBYG9P
 BoSqp8AMF5EA3qs9W8Sn9Ka4g+SVA2Hl+6URATHAyAw192Rhg0gIh5oMM
 53fAytIoAGGwalhJULeK9pE3nMC5k5n8n2TOecaEcbv0k8V2eQWnvqlcO Q==;
X-CSE-ConnectionGUID: ItBs83KySfOV7AgQQ2tv6w==
X-CSE-MsgGUID: C4yUjZ8lSg+KN9dZ6eiQAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="73020748"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="73020748"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 06:39:28 -0800
X-CSE-ConnectionGUID: x3lW00xGQyeSg4F9hwJ6vw==
X-CSE-MsgGUID: We82ToyWQbmHCoLBLlExeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="244647134"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 06:39:26 -0800
Date: Fri, 23 Jan 2026 15:39:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH i-g-t v5 3/5] tools/gputop.src/xe_gputop: Close card_fd
 after engine population in xe_populate_engines()
Message-ID: <20260123143923.c56xeb57urhp4ntk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
References: <20260122084526.538837-1-soham.purkait@intel.com>
 <20260122084526.538837-4-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122084526.538837-4-soham.purkait@intel.com>
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
On 2026-01-22 at 14:15:24 +0530, Soham Purkait wrote:

imho subject should be different, like:

Refactor xe engines population

> During the engine initialization for a specific device in GPUTOP,
> IGT helper functions need card_fd to access each engine and
> respective configs. These are required in obtaining the busyness
> of the respective engines through PMU in GPUTOP. But for KMS tests
> no other DRM client should run while it is running. So once the
> required configs and engines are obtained, the card_fd is closed
> as opened card_fd in xe_populate_engines() makes appear itself as
> DRM client.
> 
> v1:
>  - Initialize pmu_device_obj to null.
> v2:
>  - Remove dependency on lib/xe/* libraries. (Kamil)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/gputop.src/xe_gputop.c | 64 +++++++++++++++++++++++++++++-------
>  tools/gputop.src/xe_gputop.h |  3 +-
>  2 files changed, 53 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/gputop.src/xe_gputop.c b/tools/gputop.src/xe_gputop.c
> index bb2caa6ea..55a867130 100644
> --- a/tools/gputop.src/xe_gputop.c
> +++ b/tools/gputop.src/xe_gputop.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2025 Intel Corporation

Please extend this year here: s/2025/2025-2026/

>   */
>  
> +#include <sys/ioctl.h>

Add newline, btw can it be <ioctl.h>?

>  #include "xe_gputop.h"
>  
>  #define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
> @@ -92,6 +93,7 @@ void xe_gputop_init(void *ptr, int index,
>  
>  	obj = ((struct xe_gputop *)ptr) + index;
>  	obj->card = card;
> +	obj->pmu_device_obj = NULL;
>  }
>  
>  static int pmu_format_shift(int xe, const char *name)
> @@ -127,10 +129,11 @@ void *xe_populate_engines(const void *obj, int index)
>  	struct igt_device_card *card = ptr->card;
>  	uint64_t engine_active_config, engine_total_config;
>  	uint64_t engine_class, engine_instance, gt_shift;
> -	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_device_query q;
> +	struct drm_xe_query_engines *engine_q;
>  	struct xe_pmu_device *engines;
>  	char device[30];
> -	int ret = 0;
> +	int ret = 0, num_eng;
>  	int card_fd;
>  
>  	if (!card || !strlen(card->card) || !strlen(card->render))
> @@ -144,14 +147,45 @@ void *xe_populate_engines(const void *obj, int index)
>  		fprintf(stderr, "Failed to detect device!\n");
>  		return NULL;
>  	}
> -	xe_device_get(card_fd);
> +
> +	memset(&q, 0, sizeof(q));
> +	q.query = DRM_XE_DEVICE_QUERY_ENGINES;
> +
> +	ret = ioctl(card_fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
> +	if (ret != 0) {
> +		if (errno != ENOSPC && errno != E2BIG)
> +			return NULL;

You return here without closing card. imho make a wrapper like:

static void *xe_fill_engines(int card_fd, const void *obj, int index) {
	...all of xe_populate except card open and close...
}

and in

void *xe_populate_engines(const void *obj, int index) {
	void *out = NULL;
	/* open card */
	....
	if (card_fd >= 0)
		out = xe_fill_engines(card_fd, obj, index);

	/* close card */
	close(card_fd);

	return out;
}

> +		if (q.size == 0)
> +			return NULL;
> +	}
> +	if (q.size == 0)
> +		return NULL;
> +
> +	num_eng = (int)((q.size - sizeof(struct drm_xe_query_engines)) /
> +			sizeof(struct drm_xe_engine_class_instance));
> +
>  	engines = malloc(sizeof(struct xe_pmu_device) +
> -			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +			 num_eng * sizeof(struct xe_engine));
>  	if (!engines)
>  		return NULL;
>  
> +	engine_q = (struct drm_xe_query_engines *)calloc(1, q.size);
> +	if (!engine_q) {
> +		free(engines);
> +		return NULL;
> +	}
> +
> +	q.data = (uintptr_t)engine_q;
> +
> +	ret = ioctl(card_fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
> +	if (ret != 0) {
> +		free(engines);
> +		free(engine_q);
> +		return NULL;
> +	}
> +
>  	memset(engines, 0, sizeof(struct xe_pmu_device) +
> -	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	       num_eng * sizeof(struct xe_engine));
>  
>  	engines->num_engines = 0;
>  	gt_shift = pmu_format_shift(card_fd, "gt");
> @@ -167,14 +201,17 @@ void *xe_populate_engines(const void *obj, int index)
>  	if (ret < 0)
>  		return NULL;
>  
> -	xe_for_each_engine(card_fd, hwe) {
> +	while (engines->num_engines < engine_q->num_engines) {
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
> @@ -185,7 +222,7 @@ void *xe_populate_engines(const void *obj, int index)
>  		}
>  
>  		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
> -			       hwe->gt_id,
> +			       hwe.gt_id,
>  			       class_display_name(engine->drm_xe_engine.engine_class),
>  			       engine->drm_xe_engine.engine_instance);
>  
> @@ -197,6 +234,9 @@ void *xe_populate_engines(const void *obj, int index)
>  		engines->num_engines++;
>  	}
>  
> +	free(engine_q);
> +	close(card_fd);

imho move this close to separate function, see note above.

Regards,
Kamil

> +
>  	if (!ret) {
>  		errno = ret;
>  		return NULL;
> @@ -263,11 +303,11 @@ int xe_pmu_init(const void *obj, int index)
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
