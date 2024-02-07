Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C28AC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 10:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DD510EE8C;
	Wed,  7 Feb 2024 10:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKmKXJvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48A310EE8C
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707302285; x=1738838285;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=89EqAQonmv5HMoo5DJbCh7U+Rhio7BxuL/EaGekH6Hg=;
 b=cKmKXJvBg26MnGf+EtnHm0UYnEef4LguaUg+qpZHpBfheHAg6qtxzZp/
 7kjOBVjel6kql0b2i3llJm8pjNGXev5My91y5r5o4nRUYDPBYYCfHNIiB
 pfyTHgoZ3DREqP9mJFZS5hugavDkmNwnAKidbCR3nx0V+DFU5pmy/prEf
 jhDm/fKf2fRgU/6vzwSx00vvxWBlL96UnPixuwvbvBUrxikewAWDTiwe3
 xs4VBWTPBNRAS6P6/ivel34tI5smYBb7hFfjrSeDFKcc8u44J8WSsO34q
 +y8j0YDhWQlFDqPJ+vTk/gVUoKFHFw6GGAyCa2FHP5+lsuiBorgTobvKe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="870171"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="870171"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:38:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5899129"
Received: from ahamill-mobl2.ger.corp.intel.com (HELO [10.213.228.167])
 ([10.213.228.167])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:38:04 -0800
Message-ID: <1817b4df-3ac9-44ab-a9b4-a5a728c1a600@linux.intel.com>
Date: Wed, 7 Feb 2024 10:38:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_drm_fdinfo: Mandatory drm-fields first
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
 <20240201004744.352041-3-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240201004744.352041-3-lucas.demarchi@intel.com>
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


On 01/02/2024 00:46, Lucas De Marchi wrote:
> drm-driver and drm-client-id are 2 keys that should be on any driver's
> implementation of fdinfo. Move them earlier so it's clear what the
> "good" tracking is doing.

This change is a bit meh since I could argue the order went from more 
global to less global e.g. driver->device->client->keys which is now not 
for IMO no strong reason.

And if you add the "/* optional */" comment then why would only one of 
the optional keys "deserve" it.

I see you stormed it in already but as it doesn't harm much meh.

Regards,

Tvrtko

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/igt_drm_fdinfo.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 5c0ccf624..17cac4009 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -233,12 +233,13 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
>   			strncpy(info->driver, v, sizeof(info->driver) - 1);
>   			good++;
> -		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
> -			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>   		}  else if ((v = find_kv(l, "drm-client-id",
>   					 strlen("drm-client-id")))) {
>   			info->id = atol(v);
>   			good++;
> +		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
> +			/* optional */
> +			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>   		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>   			idx = parse_engine(l, info,
>   					   strlen("drm-engine-capacity-"),
