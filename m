Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C310C52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 14:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A610E36A;
	Tue, 13 Aug 2024 14:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FY9yV0bL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C6D10E36B
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723558356; x=1755094356;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=W3s+Ty3zSid3DjKVWs/D6WY+adhwReYtwyAtWUhjtx0=;
 b=FY9yV0bLFI3UyklEDiRox3jIQsMwPAe0UpjkgDKX4ND871sbEzPpeEK1
 nSWT3ppsxroxNFkXlBODC2QcUB5MHHjR5UsJYTgNNVFtMpaqXwrKPQO2m
 sRQElQdvtkFzrkgNkxhUfiAYH7fpF3ChyA3KFuwobLbzn7/IM6B34gWio
 0jCkSYvjhLpsLHnl+wciIe2OtptQc38VS6q8SQ5sgKpC1F7FcQNPfCvL6
 ECUijj11vNTIxdI/z5SyMXclTftf71c0o4AFCt+ZzIrMIZGwN42uRwyfA
 OdDJHwHv9eEX7XyJjmbmWIVm96OCPUo8lJin4/B0Z8teO7/94dQPGIZZS A==;
X-CSE-ConnectionGUID: THWir2KeTk6YiZVCZa0TaA==
X-CSE-MsgGUID: mwTZ/d19TViS+Jn9AzrzZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21884103"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="21884103"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 07:12:36 -0700
X-CSE-ConnectionGUID: Qg2yn1kHQc+wMrh/Yhf9wA==
X-CSE-MsgGUID: ekxFdhV6St+ZC65HiPJLfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58370361"
Received: from ljcornel-mobl.ger.corp.intel.com (HELO [10.251.219.78])
 ([10.251.219.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 07:12:35 -0700
Message-ID: <e53f5016-c1ea-4401-91e2-efd025bde585@linux.intel.com>
Date: Tue, 13 Aug 2024 16:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib|tests: Don't dereference engine outside
 for_each_ctx_engine macro
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
References: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
 <e4d675ba-944b-4aa2-9803-edadb2b2f403@linux.intel.com>
 <20240813135652.2jhw2edamqjpvk3d@zkempczy-mobl2>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20240813135652.2jhw2edamqjpvk3d@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 13.08.2024 15:56, Zbigniew Kempczyński wrote:
> On Tue, Aug 13, 2024 at 03:36:50PM +0200, Peter Senna Tschudin wrote:
>> Please do not apply this patch. I am working on a proper fix.
> 
> Applying fix stops you from working on a your fix?

Please do not fix a pothole just before I replace the road.

Nacked-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> 
> --
> Zbigniew
> 
>>
>> On 13.08.2024 14:45, Zbigniew Kempczyński wrote:
>>> Engine used inside for_each_ctx_engine() macro is valid only inside its
>>> block as it is accessing local stack memory. Using outside the block works
>>> by an accident if luckily nothing will overwrite this stack before use.
>>> Fix found risky usages by using engine only inside the block or do its
>>> copy.
>>>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> ---
>>>  lib/igt_fb.c                    |  8 ++++----
>>>  tests/intel/gem_lmem_swapping.c | 14 ++++++++++----
>>>  2 files changed, 14 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>>> index ab162a5b74..addff2cfba 100644
>>> --- a/lib/igt_fb.c
>>> +++ b/lib/igt_fb.c
>>> @@ -3050,13 +3050,13 @@ static void blitcopy(const struct igt_fb *dst_fb,
>>>  						   dst_fb->size);
>>>  		} else if (ahnd && block_copy_ok(src_fb) && block_copy_ok(dst_fb)) {
>>>  			for_each_ctx_engine(src_fb->fd, ictx, e) {
>>> -				if (gem_engine_can_block_copy(src_fb->fd, e))
>>> +				if (gem_engine_can_block_copy(src_fb->fd, e)) {
>>> +					do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
>>> +						      bb, bb_size, ictx, e);
>>>  					break;
>>> +				}
>>>  			}
>>>  			igt_assert_f(e, "No block copy capable engine found!\n");
>>> -
>>> -			do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
>>> -				      bb, bb_size, ictx, e);
>>>  		} else {
>>>  			igt_blitter_src_copy(dst_fb->fd,
>>>  					     ahnd, ctx, NULL,
>>> diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
>>> index b8f24742b8..b125261519 100644
>>> --- a/tests/intel/gem_lmem_swapping.c
>>> +++ b/tests/intel/gem_lmem_swapping.c
>>> @@ -189,6 +189,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
>>>  {
>>>  	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
>>>  	const struct intel_execution_engine2 *e;
>>> +	struct intel_execution_engine2 ec;
>>>  	struct blt_copy_data blt = {};
>>>  	struct blt_copy_batch *cmd;
>>>  	uint64_t size = 4096;
>>> @@ -196,8 +197,10 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
>>>  
>>>  	obj->seed = seed;
>>>  	for_each_ctx_engine(i915, ctx, e) {
>>> -		if (gem_engine_can_block_copy(i915, e))
>>> +		if (gem_engine_can_block_copy(i915, e)) {
>>> +			ec = *e;
>>>  			break;
>>> +		}
>>>  	}
>>>  	igt_assert_f(e, "Ctx don't have blt engine\n");
>>>  
>>> @@ -224,7 +227,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
>>>  	blt_set_object_ext(&ext.dst, 0, obj->blt_obj->x2, obj->blt_obj->y2,
>>>  			   SURFACE_TYPE_2D);
>>>  
>>> -	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>>> +	blt_block_copy(i915, ctx, &ec, ahnd, &blt, pext);
>>>  	free(cmd);
>>>  }
>>>  
>>> @@ -255,14 +258,17 @@ verify_object_ccs(int i915, const struct object *obj,
>>>  {
>>>  	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
>>>  	const struct intel_execution_engine2 *e;
>>> +	struct intel_execution_engine2 ec;
>>>  	struct blt_copy_data blt = {};
>>>  	struct blt_copy_batch *cmd;
>>>  	uint64_t size = 4096;
>>>  	unsigned long j, val, *buf;
>>>  
>>>  	for_each_ctx_engine(i915, ctx, e) {
>>> -		if (gem_engine_can_block_copy(i915, e))
>>> +		if (gem_engine_can_block_copy(i915, e)) {
>>> +			ec = *e;
>>>  			break;
>>> +		}
>>>  	}
>>>  	igt_assert_f(e, "Ctx don't have blt engine\n");
>>>  
>>> @@ -284,7 +290,7 @@ verify_object_ccs(int i915, const struct object *obj,
>>>  	blt_set_object_ext(&ext.src, 0, obj->blt_obj->x2, obj->blt_obj->y2,
>>>  			   SURFACE_TYPE_2D);
>>>  	blt_set_object_ext(&ext.dst, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
>>> -	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>>> +	blt_block_copy(i915, ctx, &ec, ahnd, &blt, pext);
>>>  
>>>  	buf = gem_mmap__device_coherent(i915, tmp->handle, 0,
>>>  					obj->size, PROT_READ);
