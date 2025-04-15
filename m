Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F96EC369BD
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 17:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9E710E808;
	Tue, 15 Apr 2025 17:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqynE6jD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0624110E808
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 17:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744737264; x=1776273264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QlPkmnbhPAqvU0aMm6AHBI5shQRPY5IwV/39lYT+xw0=;
 b=fqynE6jDwVV65uocTNlvSzmt1XvQcatJA+8KNaeAYM8iJ8RwK92DVv0Z
 azUTv7FqonB/sJln2mVGECCz9xrIiHeaylTAxc91hF3l6qCQtOcIgjRD3
 aPfjiDZAvweZfWWAKHk9rV6z7SdBIF3Jlgp+R+VGhhamqNdMI4ue9+nUg
 37RQXkObtSHJj4keqsZkzgbRw6K8cpBucF6+o/q5cEl90sIIF0q0Aiyyc
 sIrxRKjqQXSRUyzHp9HINqOz89dWjG3Xk1w7qKL5dWr+7UNaQvj2xQFMi
 +GO2bdXhywkvZrQZrQPhPwcVrV8OA5d6UR+pVurAUxLaMfchu+1UX5Udt A==;
X-CSE-ConnectionGUID: Kq5OKkomTG+HhPm/yFkVCg==
X-CSE-MsgGUID: Dh0QcTVKSJiiGityjJw7YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46393756"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46393756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:14:24 -0700
X-CSE-ConnectionGUID: FKikjiyFRlGzeZzGT7sJuA==
X-CSE-MsgGUID: oJK+vCFfQK+KtrqsZeWcpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="161143040"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 10:14:23 -0700
Date: Tue, 15 Apr 2025 19:14:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 2/2] tests/intel/prime_mmap: use proper size for dma_buf_fd
Message-ID: <20250415171419.hr2x33ldlr6w245y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20250415133106.764148-1-pravalika.gurram@intel.com>
 <20250415133106.764148-3-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415133106.764148-3-pravalika.gurram@intel.com>
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
On 2025-04-15 at 19:01:06 +0530, Pravalika Gurram wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>

imho in subject: Fix second buffer size

so it will be:

[PATCH 2/2] tests/intel/prime_mmap: Fix second buffer size

> 
> correct the size for dma_buf_fd.

Same here:

Correct the buffer size for dma_buf_fd2.

This can be done at merge time, no need for resend,
with above corrected:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/prime_mmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
> index e3a3a021b..ae0c74dfe 100644
> --- a/tests/intel/prime_mmap.c
> +++ b/tests/intel/prime_mmap.c
> @@ -502,7 +502,7 @@ test_aperture_limit(uint32_t region, uint64_t size)
>  	fill_bo_cpu(ptr1, size);
>  	igt_assert(memcmp(ptr1, pattern, sizeof(pattern)) == 0);
>  
> -	handle2 = gem_create(fd, size1);
> +	handle2 = gem_create(fd, size2);
>  	dma_buf_fd2 = prime_handle_to_fd_for_mmap(fd, handle2);
>  	igt_assert(errno == 0);
>  	ptr2 = mmap(NULL, size2, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd2, 0);
> -- 
> 2.34.1
> 
