Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D830CC5B548
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E00510E557;
	Wed, 28 Aug 2024 14:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4b6YUFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FF710E54D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724856666; x=1756392666;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ktKZMdLPCguBd8jhBVxgKckHnix5m8Yhiuxg2lLw1C4=;
 b=J4b6YUFJR01tYhHJctBT8Q7U67FFVLEpUO8GZthYWn3KYCHIYI1SH1cB
 Lf4+QxP+YH/z9RCOavbWntQeH+RtWj1iuzUVWuyU0HZBLodYQxslm0v4d
 iPZGC6ODq/mwf2asPCMDngRAfCEsYTTExAPdP4lRhU+q/DUm9GRgcRVis
 wvVVSc3GGHZVqy/QH9hzEcGtMdpCUc0YkRB6DL178ifWu/qRST3fZRn8q
 DeVdcrJdQHCzffcQYntdWlZkCcJiglDcj9WuuRytvGN0BmGq9lOge16BL
 vZkADeRZ6Y7kNLSuxKtvZfLkFcY0OVggFfePAA23IczSLp8jZE0bsA08p w==;
X-CSE-ConnectionGUID: Y/Z3sA+xSvG0gjk2Dk7q+Q==
X-CSE-MsgGUID: Q0juzDodQgyLVbWXHMijDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33960792"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="33960792"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:51:06 -0700
X-CSE-ConnectionGUID: AAm6GMb1TRGj4jlbNIwk9Q==
X-CSE-MsgGUID: WaA52h6vTyqrfMllnw+uPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63215645"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:51:03 -0700
Message-ID: <d699a36c-fa56-4867-b7c4-7a16c62753a3@linux.intel.com>
Date: Wed, 28 Aug 2024 16:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 05/10] tests/intel/xe_drm_fdinfo: Be strict on ==
 0 comparison
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
 <20240827165449.1706784-6-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240827165449.1706784-6-lucas.demarchi@intel.com>
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


On 8/27/2024 6:54 PM, Lucas De Marchi wrote:
> Do not compare the percent to 0, just make sure there's not a single
> tick in those cycles.
>
> v2: separate numerator and denominator calculation and check
>      numerator. It's not guaranteed cycles start from 0.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 1b5980752..68c21925c 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -474,14 +474,16 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>   	      int class, unsigned int flags)
>   {
>   	double percent;
> +	u64 den, num;
>   
>   	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>   		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>   	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>   		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>   
> -	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
> -		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
> +	num = s2[class].cycles - s1[class].cycles;
> +	den = s2[class].total_cycles - s1[class].total_cycles;
> +	percent = (num * 100.0) / (den + 1);
>   
>   	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>   
> @@ -489,7 +491,7 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>   		igt_assert_lt_double(95.0, percent);
>   		igt_assert_lt_double(percent, 105.0);
>   	} else {
> -		igt_assert(!percent);
> +		igt_assert_eq(num, 0);
>   	}
>   }
>   
