Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A587C021A4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 07:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5071510EA2D;
	Thu, 13 Feb 2025 07:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwNHPT94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB7210EA2B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739430011; x=1770966011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jpkp6bq0rLaOSDInNFggJFKhKJWvHb8+z7pWyzaLZzE=;
 b=BwNHPT94RXlE0SXYpz/4ne6ANSPlEeDL024c7DfrC96FZh9fOwFzrf90
 TMp42PnQ5JtGJSYL5+UGn6XB8xw1Sc6b8S0hic+zi4T+auwo0LycjKRQV
 ojcCUlNYu/Qw6L/1KPJg/fk3d7GXZQgLzv6TQtHbugNQ7JnutOeNonLZI
 HmLaf/COwtKNuJWh1ohOyOnYrPcVIRVkvUq7p3wGS0jrTyB52rYTXR0FK
 nIFrYDUC+Wa8uud7e1C2HTURoXLcLavOHdOIs02xShJFf/sFW8aMc/f/t
 SKtzbeNK3T/rZZ7SdZ0a7cGFxN7cS1TBtZ4930m1S8cRwH2Sb+YdTjlep w==;
X-CSE-ConnectionGUID: EsqZ6pciTl2aXtrHJiUbdw==
X-CSE-MsgGUID: C+67FYq4R56CQiIdkv9TnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39348616"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="39348616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 23:00:11 -0800
X-CSE-ConnectionGUID: c2My5k4UTd6O5i56rRBZGA==
X-CSE-MsgGUID: 3O/Phei3Seemu4VKfXsM+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113583465"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.228])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 23:00:09 -0800
Date: Thu, 13 Feb 2025 08:00:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/5] lib/intel_compute: Allow the user to provide a
 custom compute kernel
Message-ID: <20250213070006.szwhib7r3bompjfz@zkempczy-mobl2>
References: <20250205101748.1117809-1-francois.dugast@intel.com>
 <20250205101748.1117809-4-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205101748.1117809-4-francois.dugast@intel.com>
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

On Wed, Feb 05, 2025 at 11:17:04AM +0100, Francois Dugast wrote:
> Allow the user to provide a custom compute kernel which will be used
> instead of the default compute square one. This will be helpful to
> try out corner cases which require a specific compute kernel.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 26 ++++++++++++++++++--------
>  lib/intel_compute.h |  2 ++
>  2 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index e0776fb6d..a826d58c0 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1770,6 +1770,8 @@ static bool __run_intel_compute_kernel(int fd,
>  	unsigned int batch;
>  	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
>  	enum intel_driver driver = get_intel_driver(fd);
> +	const unsigned char *kernel;
> +	unsigned int kernel_size;
>  
>  	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
>  		if (ip_ver == intel_compute_batches[batch].ip_ver)
> @@ -1787,16 +1789,24 @@ static bool __run_intel_compute_kernel(int fd,
>  		return false;
>  	}
>  
> -	while (kernels->kernel) {
> -		if (ip_ver == kernels->ip_ver)
> -			break;
> -		kernels++;
> +	/* If the user provides a kernel, use it */
> +	if (user && user->kernel) {
> +		kernel = user->kernel;
> +		kernel_size = user->kernel_size;
> +	} else {
> +		while (kernels->kernel) {
> +			if (ip_ver == kernels->ip_ver)
> +				break;
> +			kernels++;
> +		}
> +		if (!kernels->kernel)
> +			return false;
> +		kernel = kernels->kernel;
> +		kernel_size = kernels->size;

According to how we build pipeline indirect data we're limited to
three arguments - *input, *output, count. Allowing the user to provide
a custom kernel won't work unless type constraint will be met.
I don't like this change, because someone who doesn't know how
this work will start providing its own kernels will be surprised
it doesn't work.

--
Zbigniew

>  	}
> -	if (!kernels->kernel)
> -		return false;
>  
> -	intel_compute_batches[batch].compute_exec(fd, kernels->kernel,
> -						  kernels->size, eci, user);
> +	intel_compute_batches[batch].compute_exec(fd, kernel,
> +						  kernel_size, eci, user);
>  
>  	return true;
>  }
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index c4b4ee5e1..6096bb83a 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -35,6 +35,8 @@ struct intel_compute_kernels {
>  
>  struct user_execenv {
>  	uint32_t vm;
> +	const unsigned char *kernel;
> +	unsigned int kernel_size;
>  };
>  
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
> -- 
> 2.43.0
> 
