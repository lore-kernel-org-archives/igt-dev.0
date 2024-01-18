Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2432C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 08:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947BF10E179;
	Thu, 18 Jan 2024 08:45:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D34010E179
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705567518; x=1737103518;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AgNHiTNspT8jvGjY7TpznXLycBfj+UyEQlTWAsgxB4M=;
 b=LWBfm+QbF+BfIIaTnIl29MFmBjXiqBsL/Dg4bQL4UlpEnyYJrDoWfkyn
 EsdjFK7NRaVuW+VNLMoFsQHLrN33UMrHDDCkzkXCXrhsbqYdFVvZ/hQtl
 0vxdOULk3KSiH3BbJTPrhVY2WQxMLNpcd0hG7K5qD2rr4bx7+v+nMwQuM
 fKOHcQEHKPgrN1SRyHkSPROaOWzOaiI0hRC/qvBKKmqJh8a+vq5N0AEDf
 bN+F8hwOZnC/MKm0AGgiKLURRQb0m0zhA7JeAJ+EmBXJ1IX6nWeYyHEY9
 5VS3OVBKfekRPiugQVoKRsntYuzf/STwB/tgB2hPB9TRpUvVGSE9mXQcq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="21872944"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="21872944"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 00:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734212545"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734212545"
Received: from kguerrap-mobl.ger.corp.intel.com (HELO [10.252.15.104])
 ([10.252.15.104])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 00:45:14 -0800
Message-ID: <4cd6b93f-56cd-42ee-bb07-162917f87a6e@intel.com>
Date: Thu, 18 Jan 2024 08:45:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix CAT error by adjusting prefetch size for Xe2
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
References: <440d8d632ad08907dd8fc7ac1b8322176c2b48df.1705523804.git.jagmeet.randhawa@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <440d8d632ad08907dd8fc7ac1b8322176c2b48df.1705523804.git.jagmeet.randhawa@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On 17/01/2024 20:46, Jagmeet Randhawa wrote:
> Due to batch pre-fetch being quite aggressive on Xe2, we need
> an extra 4K page at the end of the batch to ensure HW doesn't
> pre-fetch beyond the boundaries of the batch itself, hitting
> an invalid ppGTT page, resulting in CAT errors. Fix this by
> accounting for the xe_cs_prefetch_size() when calculating
> the size of the batch.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Commit title needs to have some kind of prefix like: 
"tests/intel/xe_exec_store".

If the entire thing is too long then shorten to something like: 
"tests/intel/xe_exec_store: account for prefetch".

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_exec_store.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 2e4f57b47..bed118688 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -201,7 +201,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>   	uint32_t *batch_map;
>   	size_t bo_size = 4096;
>   
> -	bo_size = ALIGN(bo_size, xe_get_default_alignment(fd));
> +	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
>   	vm = xe_vm_create(fd, 0, 0);
>   	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
>   	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
