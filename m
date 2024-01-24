Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7598EC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 08:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2169C10F652;
	Wed, 24 Jan 2024 08:42:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B6C10F652
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706085766; x=1737621766;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q4/MwwlexH/LOpax/OJVafJKuN9LyOs8Y+0cVsTyUz4=;
 b=g1ut+zSwLblBDkoh52Mv7CvDJL30v1SY6zSE23HeFZkgHuh6aReP5evv
 +QDBZpoL6PEAH038DdUDcFhmxrDY5+FAIvsCvVxTL20z1cxPSVYirruND
 wNiwjgOYdDy+miO7HJGk1mgCTNMg+aoXp8rUBNq70ECHGxBmu4FC9kYU+
 v4zgNe+VH4zXg8MnIBoSd/nLFEpgA99+u4ZsbVYGuA+vzZwC9OJS7USMJ
 2cmWiYsOYrlYYGxIjpRgn8dnISSP152zV6EWHSK7nupHGXImWzwPwggGq
 VPElgiKAHc+Yl21B6gc6kwnPdNXfvO4Iozf3Y+e0Cc4Li98XUQIarFRHd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="432934368"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="432934368"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 00:42:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20658334"
Received: from gmcfarla-mobl1.ger.corp.intel.com (HELO [10.252.15.165])
 ([10.252.15.165])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 00:42:46 -0800
Message-ID: <9ea179cc-7a18-4bbb-b1a5-5569ee405809@intel.com>
Date: Wed, 24 Jan 2024 08:42:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_copy_basic: account for prefetch
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240123183323.173424-1-matthew.auld@intel.com>
 <20240124044845.sm6tumjvtuorszj4@zkempczy-mobl2>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240124044845.sm6tumjvtuorszj4@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 24/01/2024 04:48, Zbigniew Kempczyński wrote:
> On Tue, Jan 23, 2024 at 06:33:22PM +0000, Matthew Auld wrote:
>> Xe2 expects an extra page after the batch to avoid prefetch hitting an
>> invalid page. Not doing so can result in CAT errors.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> ---
>>   tests/intel/xe_copy_basic.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
>> index 1bde876cd..3ae5a7291 100644
>> --- a/tests/intel/xe_copy_basic.c
>> +++ b/tests/intel/xe_copy_basic.c
>> @@ -44,7 +44,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>>   	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
>>   {
>>   	struct blt_mem_data mem = {};
>> -	uint64_t bb_size = xe_get_default_alignment(fd);
>> +	uint64_t bb_size;
>>   	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
>>   						  INTEL_ALLOCATOR_SIMPLE,
>>   						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
>> @@ -53,6 +53,8 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>>   	uint32_t bb;
>>   	int result;
>>   
>> +	bb_size = ALIGN(SZ_4K + xe_cs_prefetch_size(fd),
>> +			xe_get_default_alignment(fd));
>>   	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>>   
>>   	blt_mem_init(fd, &mem);
>> @@ -97,7 +99,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>>   	uint32_t width, uint32_t height, uint8_t fill_data, uint32_t region)
>>   {
>>   	struct blt_mem_data mem = {};
>> -	uint64_t bb_size = xe_get_default_alignment(fd);
>> +	uint64_t bb_size;
>>   	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
>>   						  INTEL_ALLOCATOR_SIMPLE,
>>   						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
>> @@ -105,6 +107,8 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>>   	uint32_t bb;
>>   	uint8_t *result;
>>   
>> +	bb_size = ALIGN(SZ_4K + xe_cs_prefetch_size(fd),
>> +			xe_get_default_alignment(fd));
>>   	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>>   	blt_mem_init(fd, &mem);
>>   	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height, region,
>> -- 
>> 2.43.0
>>
> 
> Maybe we should create helper like:
> 
> uint64_t xe_bb_size(int fd, uint64_t reqsize)
> {
> 	return ALIGN(reqsize + xe_cs_prefetch_size(fd),
> 	             xe_get_default_alignment(fd));
> }
> 
> as adding prefetch size will likely stay with us forever.

Yeah, I think adding a helper for this at some point makes a lot of 
sense. Also probably need to do a full audit at the same time as rolling 
that out in case we are still missing it in some places.

> 
> Anyway, green light from me for the above change:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks.

> --
> Zbigniew
