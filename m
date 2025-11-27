Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC0CD116E2
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 14:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A1310E09B;
	Thu, 27 Nov 2025 14:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K64BmbIW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A5C10E09B
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764255461; x=1795791461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=755QRXGqZOarqyG7Fq+LMHxosOIQB+WNAC+ajzQ5iIs=;
 b=K64BmbIWvbwPqwVTbVQhO67iWjEfepB1ECFmTg7DBKYXpmwpw3bZqoTb
 neaRtMt2zQF8tH0DkQJcl31VdQJQIOWYcIV6V18Wz6vqupeguJti8thqG
 6Jg5Yrp7Nbu0zaa7PSVB1TzWWbDLerjnh1l3fbgomRpa388FZDANRnSlA
 SoPz+ZaKe0T9BZVXT+4M8cvSbi1m0H9OGaDYiIcFOtdstI4rZdYjuHY57
 xOXsF/JjMo3yTVbLjxtU/rC5TG47mTagkcR1v2QDTOK7ZNc9TvZ8vthL9
 +emXCz9RlW3N9dVPN7j60rbYZwAUZ2oJIIcPh2jxLXUjgKKCELP8W/EEn w==;
X-CSE-ConnectionGUID: 9Favgqc2SZWT3jFkVQ/bmw==
X-CSE-MsgGUID: POl/rBRDQ+GMSW9T9wao7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83696590"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="83696590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 06:57:40 -0800
X-CSE-ConnectionGUID: wu2YYVAoSpqJTNc1X4UoNg==
X-CSE-MsgGUID: Xz0kdAvGT46WHXlR6UZCJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="198357973"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 06:57:38 -0800
Date: Thu, 27 Nov 2025 15:57:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH i-g-t v1 v1 2/3] tests/panthor: Add a test to make sure
 the buffer is zeroed at alloc time
Message-ID: <20251127145735.yau6mradhff4w6ac@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
References: <20251126105558.3607460-1-boris.brezillon@collabora.com>
 <20251126105558.3607460-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126105558.3607460-3-boris.brezillon@collabora.com>
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

Hi Boris,
On 2025-11-26 at 11:55:57 +0100, Boris Brezillon wrote:
> This covering for this bug [1]. Add an IGT test to make sure we don't
> hit that again.
> 
> [1]https://lore.kernel.org/20251107171214.1186299-1-boris.brezillon@collabora.com
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/panthor/panthor_gem.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
> index 57cd97e809fd..1566c713f876 100644
> --- a/tests/panthor/panthor_gem.c
> +++ b/tests/panthor/panthor_gem.c
> @@ -66,6 +66,17 @@ igt_main {
>  		igt_panthor_free_bo(fd, &bo);
>  	}
>  
> +	igt_describe_f("Check zero-ing of buffer at creation time");
> +	igt_subtest("bo_zeroed") {
> +		struct panthor_bo bo;
> +
> +		igt_panthor_bo_create_mapped(fd, &bo, getpagesize(), 0, 0);
> +		igt_assert(bo.map);
> +		igt_assert_eq(*((uint32_t *)bo.map), 0);
> +
> +		igt_panthor_free_bo(fd, &bo);
> +	}
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.51.1
> 
