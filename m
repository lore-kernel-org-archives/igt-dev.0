Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B461C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 04:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC25210F60D;
	Wed, 24 Jan 2024 04:48:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B2310F610
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 04:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706071730; x=1737607730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XmCiIK43IA/HSg16XphSWJ52Ne0r9wwlarf5QKChMs8=;
 b=PzsmoOijSxLNLekowjG46RAD1MQnihoDwhJD1UICgo2RN8BnDu4QS1bt
 1eEK9ZOTpxHwODpUVmd63+WDGf4E+dktxj4myTu1znYvWaZbHe3sC5PUc
 uahb9IISK385xeiquUEB37aWRa6NM04Z0VhcChEzoYTiym8neK0strw2y
 KlON9e+7aTE9RovAVD9D1tL5twU37vFb0aMeZK/1ENVzsfkHAoLNhKpB2
 kazwCiyQski7sPrsfCP2ym2zfc/dr6uhP540w3zPYEyuldjh1ppamngnA
 pbzPFbz77pfhZ+x8L13VDs5v/KKO1n/edcVC7GDT2QFw5ruLI+pYG6dWE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8853990"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8853990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1889794"
Received: from unknown (HELO localhost) ([10.246.3.92])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:48:49 -0800
Date: Wed, 24 Jan 2024 05:48:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_copy_basic: account for prefetch
Message-ID: <20240124044845.sm6tumjvtuorszj4@zkempczy-mobl2>
References: <20240123183323.173424-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123183323.173424-1-matthew.auld@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 06:33:22PM +0000, Matthew Auld wrote:
> Xe2 expects an extra page after the batch to avoid prefetch hitting an
> invalid page. Not doing so can result in CAT errors.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_copy_basic.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 1bde876cd..3ae5a7291 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -44,7 +44,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
>  {
>  	struct blt_mem_data mem = {};
> -	uint64_t bb_size = xe_get_default_alignment(fd);
> +	uint64_t bb_size;
>  	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
>  						  INTEL_ALLOCATOR_SIMPLE,
>  						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> @@ -53,6 +53,8 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	uint32_t bb;
>  	int result;
>  
> +	bb_size = ALIGN(SZ_4K + xe_cs_prefetch_size(fd),
> +			xe_get_default_alignment(fd));
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
>  	blt_mem_init(fd, &mem);
> @@ -97,7 +99,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	uint32_t width, uint32_t height, uint8_t fill_data, uint32_t region)
>  {
>  	struct blt_mem_data mem = {};
> -	uint64_t bb_size = xe_get_default_alignment(fd);
> +	uint64_t bb_size;
>  	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
>  						  INTEL_ALLOCATOR_SIMPLE,
>  						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> @@ -105,6 +107,8 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	uint32_t bb;
>  	uint8_t *result;
>  
> +	bb_size = ALIGN(SZ_4K + xe_cs_prefetch_size(fd),
> +			xe_get_default_alignment(fd));
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  	blt_mem_init(fd, &mem);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height, region,
> -- 
> 2.43.0
> 

Maybe we should create helper like:

uint64_t xe_bb_size(int fd, uint64_t reqsize)
{
	return ALIGN(reqsize + xe_cs_prefetch_size(fd),
	             xe_get_default_alignment(fd));
}

as adding prefetch size will likely stay with us forever.

Anyway, green light from me for the above change:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew
