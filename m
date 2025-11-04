Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE39FCCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 11:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB9610E25B;
	Tue,  4 Nov 2025 11:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aItl125K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D85710E25B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762255188; x=1793791188;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zbst7AlmJ7nFPUVJCceSw/EDR9FR15XZ2MezF0hBrlc=;
 b=aItl125KBQGG+B9UKaUIUA/pVGpxIBOGJ/gy6/HI6cuulgzGXqyklfsL
 904s1BYq4i7wZJWbtQaQq2Tx8WbZQY/Fezd6FBLu9XscUNjiajWkzZerK
 deBwdSDeNHVqPAhnwDd7pg5fn4Doo9QQD0TIh7R+Lr8E/sDg9tGFu/oMd
 HcnTQzJDmJ5mYccH7hKojf2yYP208Igw3kmxZ6aiKV8K6lkSiLxNSq+cQ
 xZZ05313wmersmOg0uAbBQ/o6OnntgCP4yOh5iGYz7W1lId484SEdi2ds
 mP2KqLPm0EeahFoPLuh8iDsS3FJMU0tyBBqBItDvojkBgllm2fOYIxGc/ Q==;
X-CSE-ConnectionGUID: iznPGoWRRWC9q6VYaZC21w==
X-CSE-MsgGUID: WD2bktKdT/SVgLM5ceSI1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75025985"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75025985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:19:48 -0800
X-CSE-ConnectionGUID: 0q3RPIPcRbOhHc2He84k+w==
X-CSE-MsgGUID: SgDy7JnTQ8SFpgETb40bqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187082574"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.197])
 ([172.28.180.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:19:46 -0800
Message-ID: <49ee16fe-3936-4756-9501-092d0ca4303f@intel.com>
Date: Tue, 4 Nov 2025 12:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/7] lib/xe/xe_eudebug: fortify
 xe_eudebug_for_each_event
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com, maciej.patelczyk@intel.com,
 jan.maslak@intel.com, zbigniew.kempczynski@intel.com
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
 <20251014093848.2394531-2-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251014093848.2394531-2-mika.kuoppala@linux.intel.com>
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

Hi Mika,

On 14.10.2025 11:38, Mika Kuoppala wrote:
> Add rigorous checking for xe_eudebug_for_each_event so
> that we catch errors early if unitialized data is fed
> into the macro.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph

> ---
>   lib/xe/xe_eudebug.c |  1 -
>   lib/xe/xe_eudebug.h | 45 ++++++++++++++++++++++++++++++++++++++++-----
>   2 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 407940e122..4bf697a45e 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1061,7 +1061,6 @@ static void debugger_run_triggers(struct xe_eudebug_debugger *d,
>   	}
>   }
>   
> -#define MAX_EVENT_SIZE (32 * 1024)
>   static int
>   xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
>   {
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index d2f64fe4c4..db79726c00 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -8,6 +8,7 @@
>   #include <xe_drm.h>
>   #include <xe_drm_eudebug.h>
>   
> +#include "igt_core.h"
>   #include "igt_list.h"
>   
>   struct xe_eudebug_event_log {
> @@ -90,11 +91,45 @@ typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
>   		if (hwe__->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
>   		    hwe__->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
>   
> -#define xe_eudebug_for_each_event(_e, _log) \
> -	for ((_e) = (_e) ? (void *)(uint8_t *)(_e) + (_e)->len : \
> -		    (void *)(_log)->log; \
> -	    (uint8_t *)(_e) < (_log)->log + (_log)->head; \
> -	    (_e) = (void *)(uint8_t *)(_e) + (_e)->len)
> +#define MAX_EVENT_SIZE (32 * 1024)
> +
> +static inline struct drm_xe_eudebug_event *
> +next_event(struct drm_xe_eudebug_event *e, struct xe_eudebug_event_log *l)
> +{
> +	uint8_t *start;
> +	uint8_t *end;
> +
> +	igt_assert(l);
> +	igt_assert(l->log);
> +	igt_assert(l->head <= l->max_size);
> +
> +	if (!e)
> +		return (struct drm_xe_eudebug_event *)l->log;
> +
> +	start = (uint8_t *)e;
> +
> +	if (start == l->log + l->head)
> +		return NULL;
> +
> +	igt_assert(start >= l->log);
> +	igt_assert(start < l->log + l->head);
> +	igt_assert(e->len);
> +	igt_assert(e->len <= MAX_EVENT_SIZE);
> +
> +	end = (uint8_t *)e + e->len;
> +
> +	if (end == l->log + l->head)
> +		return NULL;
> +
> +	igt_assert(end < l->log + l->head);
> +
> +	return (struct drm_xe_eudebug_event *)end;
> +}
> +
> +#define xe_eudebug_for_each_event(_e, _log)	\
> +    for ((_e) = next_event((_e), (_log)); \
> +         (_e); \
> +         (_e) = next_event((_e), (_log)))
>   
>   #define xe_eudebug_assert(d, c)						\
>   	do {								\

