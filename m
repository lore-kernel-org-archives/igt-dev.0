Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE6DC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 08:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E90010E094;
	Tue, 15 Apr 2025 08:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsGaUyvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89C810E094
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744706918; x=1776242918;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A8klyiiv7yL+Wcf26Vtdx595LOkn6dhVMHzA9zyvHD8=;
 b=gsGaUyvipZR723mK+bHLJxABMNx8kTv05tKqRvDDzdJzJ6tpG65yJ1A5
 NFB+kBHUJMStSePPLTi7BmLCQl8UltKJRKRaFwJFt4fIEhERQv3zBiPwm
 1l7F3mWRVVQh2x/yi4Fe7LssSs916+Rn5pl1Sa+hZ5Mv18tXAJj2b4dAK
 RGGcC13Ck4lEqk3p8wm/6W5YgX4C4r/S19ARzE3ODjF13rb3ykEpXg+ps
 c9C20TUXdwKjSfscdKCTkMT88Jk191/bztSoA9bUAI5NvT2Rhq4BKhicT
 RR8vTYHE+R258o183DAyIlTo8FGsAHVJlXM8hsjKVugwcDJsY9Q2tU+7/ Q==;
X-CSE-ConnectionGUID: FfO36AXrS+2vb52bwhHXQA==
X-CSE-MsgGUID: qwkdipuhQOyC7870wQfwKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46120219"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46120219"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:48:37 -0700
X-CSE-ConnectionGUID: 5cl8Wh0ESey2X+bEkV6CQA==
X-CSE-MsgGUID: cgSTtHV8RAyptK1ianba7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="167225625"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:48:36 -0700
Date: Tue, 15 Apr 2025 10:48:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] prime_mmap: Limit aperture testing to machines with an
 aperture
Message-ID: <20250415084833.s5bjbwx6bbmoualx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20250414102640.755085-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250414102640.755085-1-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2025-04-14 at 15:56:40 +0530, Pravalika Gurram wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> The test_aperture_limit looks at the handling of internal GGTT mmaps for
> the dmabuf and checking what happens if we try to mmap more than we can
> fit inside the aperture. Thus if we have no aperture, there is no corner
> case regarding the mmapable aperture that requires validation.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/prime_mmap.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
> index 6de54b840..ae0c74dfe 100644
> --- a/tests/intel/prime_mmap.c
> +++ b/tests/intel/prime_mmap.c
> @@ -490,6 +490,10 @@ test_aperture_limit(uint32_t region, uint64_t size)
>  	uint64_t size1 = (gem_mappable_aperture_size(fd) * 7) / 8;
>  	uint64_t size2 = (gem_mappable_aperture_size(fd) * 3) / 8;
>  
> +	igt_require(gem_has_mappable_ggtt(fd));
> +	igt_require(size1 >= size2);
> +	igt_require(size2 >= size);
> +

Looks good.

>  	handle1 = gem_create(fd, size1);
>  	dma_buf_fd1 = prime_handle_to_fd_for_mmap(fd, handle1);
>  	igt_assert(errno == 0);
> @@ -498,7 +502,7 @@ test_aperture_limit(uint32_t region, uint64_t size)
>  	fill_bo_cpu(ptr1, size);
>  	igt_assert(memcmp(ptr1, pattern, sizeof(pattern)) == 0);
>  
> -	handle2 = gem_create(fd, size1);
> +	handle2 = gem_create(fd, size2);

After a second read this looks like a separate fix, especially
that it is not described in commit.

Please split this into a separate patch.

Regards,
Kamil

>  	dma_buf_fd2 = prime_handle_to_fd_for_mmap(fd, handle2);
>  	igt_assert(errno == 0);
>  	ptr2 = mmap(NULL, size2, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd2, 0);
> -- 
> 2.34.1
> 
