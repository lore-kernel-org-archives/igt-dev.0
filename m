Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E59E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 16:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DA210E316;
	Thu, 12 Dec 2024 16:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLDAGLbM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ECD10E316
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734021541; x=1765557541;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ImWgMtnYCbZNYJOgkxtBEslT9G2iWn0EmIa6/5xDcb0=;
 b=MLDAGLbMUr91ywJ+AncAr6+7Dj9pKU9569tYiyNz3FqyJoYW7Bq8hyeQ
 Ss2e6OIM4FSJln0lrqCATL09Jylv18OrP4IemFaE1xP00P4uX/2hgbNH3
 I6Upz/B9WREtA+Ye5ulHlYpXc4fgEI996pi7FjM3eZg2kXisVVHENBlwF
 l+l3Yh1NwNDz98SAKGXZgQ5D+nyb8kxUcToIQzDmH2UZsN4KOWRDwuq0d
 Lq0SjIqs+W4inNbbNFsxaYIj/6mr7q1k/alNHZ7iuni33/uQk8XkqEzWc
 wqzoe4uGdVQoxWmvo8JS2s5eXW3YJ3Ej5EUzy9jrMmP3ovWVbCIN0I+pf Q==;
X-CSE-ConnectionGUID: 8qzRpTjZQp2vrMQOZOEbqw==
X-CSE-MsgGUID: OPp/aWQDTbCacj9rM24UMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45059056"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="45059056"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 08:39:00 -0800
X-CSE-ConnectionGUID: OhGS1eeWQNmxhcVjr7IPMw==
X-CSE-MsgGUID: oqIUI6+lSFuGv8X3Sp/E5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="101305354"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 08:38:59 -0800
Message-ID: <37710097-0a2a-4a90-86e7-84d8dda2bcc7@intel.com>
Date: Thu, 12 Dec 2024 17:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] lib/xe_eudebug: Use xe_engine_class_short_string
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com
References: <20241211114044.210562-1-dominik.grzegorzek@intel.com>
 <20241211114044.210562-3-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241211114044.210562-3-dominik.grzegorzek@intel.com>
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
> Replace local function returning class short name by library function
> defined in xe_query.h.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
>   lib/xe/xe_eudebug.c | 15 ++-------------
>   1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index f2483028f..24062e399 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -16,6 +16,7 @@
>   #include "intel_pat.h"
>   #include "xe_eudebug.h"
>   #include "xe_ioctl.h"
> +#include "xe/xe_query.h"
>   
>   struct event_trigger {
>   	xe_eudebug_trigger_fn fn;
> @@ -124,18 +125,6 @@ static const char *flags_to_str(unsigned int flags)
>   	return "flags unknown";
>   }
>   
> -static const char *eu_engine_class_to_str(uint16_t engine_class)
> -{
> -	switch (engine_class) {
> -	case DRM_XE_ENGINE_CLASS_COMPUTE:
> -		return "ccs";
> -	case DRM_XE_ENGINE_CLASS_RENDER:
> -		return "rcs";
> -	default:
> -		return "unsupported class";
> -	}
> -}
> -
>   static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *buf)
>   {
>   	switch (e->type) {
> @@ -176,7 +165,7 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
>   
>   		for (i = 0; i < ee->num_placements; i++)
>   			l += sprintf(buf + l, "%s%d pad%d, ",
> -				     eu_engine_class_to_str(instances[i].engine_class),
> +				     xe_engine_class_short_string(instances[i].engine_class),
>   				     instances[i].engine_instance, instances[i].pad);
>   		buf[l - 2] = ']';
>   
