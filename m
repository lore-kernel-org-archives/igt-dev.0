Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DDDC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 17:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6B610E809;
	Tue, 15 Apr 2025 17:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cASH7wWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA4A10E809
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744737011; x=1776273011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iQ3Vkz3GcSMh3ltkwYdfkF+6aJypSxJ6I2ltp3nw0Vo=;
 b=cASH7wWHCRFC7QRe7Ep5OBoWsFx+gzgkjdWvKmHpq00qKFWZfA182w/5
 uNROvc3MDFlVb4Wj3u76KeujlxsA3YfHnXl1cKjb0fDIdabzUw+RXseIS
 i95rGfTyGJ0fgfwFK/mbRrecT6qpa3egPbREX7wzas9BvTpBne8XJwBg0
 7XrjbHQYVulgyVm7ibhvBZSXUL7gAgfJYCGN8stn8+w8NDbz7EQFmIXL0
 rQ5+vScXy9mYgkUqYaze0WPtm3rQkq+ynzcsSNV6El6cnTwUDZmn+slNg
 UisJXUX4N2IuuprSwLyMjPQQ6zbxdIJ20H8Cs8KIuiYosKUjxyhHGKpiu A==;
X-CSE-ConnectionGUID: UxcU9Mu7QdaaViy9fbpzOQ==
X-CSE-MsgGUID: lLfxLtulTyGSS6fb8enVfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46273457"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46273457"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:10:11 -0700
X-CSE-ConnectionGUID: Taiuv1oFSNaT82GZVBPenA==
X-CSE-MsgGUID: 2tbvR8uCSnKSli/SBqBXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135349002"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 10:10:09 -0700
Date: Tue, 15 Apr 2025 19:09:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 1/2] test/intel/prime_mmap: Limit aperture testing to
 machines with an aperture
Message-ID: <20250415170954.cbf6sq5ymocwcraf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20250415133106.764148-1-pravalika.gurram@intel.com>
 <20250415133106.764148-2-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415133106.764148-2-pravalika.gurram@intel.com>
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
On 2025-04-15 at 19:01:05 +0530, Pravalika Gurram wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> The test_aperture_limit looks at the handling of internal GGTT mmaps for
> the dmabuf and checking what happens if we try to mmap more than we can
> fit inside the aperture. Thus if we have no aperture, there is no corner
> case regarding the mmapable aperture that requires validation.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/prime_mmap.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
> index 6de54b840..e3a3a021b 100644
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
>  	handle1 = gem_create(fd, size1);
>  	dma_buf_fd1 = prime_handle_to_fd_for_mmap(fd, handle1);
>  	igt_assert(errno == 0);
> -- 
> 2.34.1
> 
