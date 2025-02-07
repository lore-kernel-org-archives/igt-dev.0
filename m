Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC9DC02199
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 13:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B553310E264;
	Fri,  7 Feb 2025 13:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ga8syw6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771FD10E25F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738933937; x=1770469937;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7rdWVG+5onxyaez1WUJxZ4Py0OC3BgFJAA9B1XFzpvM=;
 b=Ga8syw6AYHov1/dbHMzw+9u6MlpeIxoVkq9DqaSCLNIljZUE39MCm+sH
 VR9lByQoZw2nhj7haHmVWHF45zHMo+jVyyePJTnbYwGf+8LEcgApp5pbd
 0YZWd8jRfb7fYGvsDchAt69uHEvzIBGwIJJUSfiQgJUax5FcIg5z+poDR
 acG6XsPR9Rg+XM+K8QQfuiWTnS/0JyGcJBBuJ1WaA5H8ZCYVD9iG4LOfv
 HVIFTFO+0pYtDpKcYTKmyR2pnLtP7OvhgI52UimdbEtgrZO55szBypL0i
 T4jGx0mm+IvNRCA8DNAUhgHfArg11OPu8Uxt+8NkeAjaS/TwwKowzGbFy g==;
X-CSE-ConnectionGUID: Py7L1L8ARumLZZraUHdO+w==
X-CSE-MsgGUID: qu8ZLx6pSDux1jTX6ABnkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39599615"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39599615"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:12:17 -0800
X-CSE-ConnectionGUID: 5QIzvI5aSaOG00MDX2D5bw==
X-CSE-MsgGUID: HIZU/RKuR4KJpxGC3b8aQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111372834"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.126])
 ([10.245.246.126])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:12:16 -0800
Message-ID: <d8b592fe-c8c0-469a-9900-f3eb721b5432@intel.com>
Date: Fri, 7 Feb 2025 14:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] xe_eudebug_online: Adjust bitmask calculation
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250206133003.618882-1-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250206133003.618882-1-dominik.grzegorzek@intel.com>
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

On 6.02.2025 14:30, Dominik Grzegorzek wrote:
> Adjust bitmask calculation so it matches kernel changes which send also
> zeros for fused out subslices.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
>   tests/intel/xe_eudebug_online.c | 28 +++++++++++++++++-----------
>   1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 30ecadfe0..2ccbd0a21 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1187,8 +1187,9 @@ static int query_attention_bitmask_size(int fd, int gt)
>   		.size = 0,
>   		.data = 0,
>   	};
> -	int pos = 0, eus;
> -	uint8_t *any_dss;
> +	uint8_t dss_mask, last_dss;
> +	int pos = 0;
> +	int i, last_dss_idx;
>   
>   	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU,
>   						    &thread_count_len);
> @@ -1231,22 +1232,27 @@ static int query_attention_bitmask_size(int fd, int gt)
>   	igt_assert(g_dss && c_dss && eu_per_dss);
>   	igt_assert_eq_u32(c_dss->num_bytes, g_dss->num_bytes);
>   
> -	any_dss = malloc(c_dss->num_bytes);
> -	igt_assert(any_dss);
> +	for (i = 0; i < c_dss->num_bytes; i++) {
> +		dss_mask = c_dss->mask[i] | g_dss->mask[i];
> +		if (dss_mask) {
> +			last_dss = dss_mask;
> +			last_dss_idx = i;
> +		}
> +	}
>   
> -	for (int i = 0; i < c_dss->num_bytes; i++)
> -		any_dss[i] = c_dss->mask[i] | g_dss->mask[i];
> +	last_dss_idx *= BITS_PER_BYTE;
> +	do {
> +		last_dss_idx++;
> +	} while (last_dss >>= 1);
>   
> -	eus = count_set_bits(any_dss, c_dss->num_bytes);
> -	eus *= count_set_bits(eu_per_dss->mask, eu_per_dss->num_bytes);
> +	last_dss_idx *= count_set_bits(eu_per_dss->mask, eu_per_dss->num_bytes);
>   
>   	if (intel_gen_has_lockstep_eus(fd))
> -		eus /= 2;
> +		last_dss_idx /= 2;
>   
> -	free(any_dss);
>   	free(topology);
>   
> -	return eus * DIV_ROUND_UP(threads_per_eu, 8);
> +	return last_dss_idx * DIV_ROUND_UP(threads_per_eu, 8);
>   }
>   
>   static struct drm_xe_eudebug_event_exec_queue *
