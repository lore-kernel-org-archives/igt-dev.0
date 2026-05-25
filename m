Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A65ECD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E48B10E3B3;
	Mon, 25 May 2026 16:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LCH7nD79";
	dkim-atps=neutral
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FAB10E3B3
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:36:52 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-3025d725a05so22634687eec.1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727011; x=1780331811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CM5z+E54ceQtmT76oB3rIkqko4DPegET2AkugEplGQk=;
 b=LCH7nD79un15B6vNbL6dgwWN+m2wvEhridLZbNLn8I6W1eHwlVgCu1N+O9xjktJM4v
 Ed0st+tOcZaYRbnXciLqLR6bRd34C8lwZ7a6XHe8BSb99IZjuzuqZtPHi4sARcfaKalT
 o1t1EhrCo2RruMKKzvzULB6encFnmGyCohFvbbn+O/i2xSEmSiYR1thRUxZCX4w7MqZx
 fzoxjD9KznMIqXFQsU1AhkXrOtKpOLxPuViLvqMJkxw/Qt8c5+v/mafMl8ym8IJSeIJe
 gj5diL4m8/ZeF3dJnt2i0ThZlNq6vVyRAtccs5jZH5ObpxratRuMi52D/hyqniAEsCIi
 ge/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727011; x=1780331811;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CM5z+E54ceQtmT76oB3rIkqko4DPegET2AkugEplGQk=;
 b=DOP9ygq2ih83EmNXCtL7Z9sqUBSB/veRcrJHFFbBOlS2QDO6NUo0pQi9zWtBCwZLCW
 rIT1XPEJjKwOpRmsOBTQfPH4DFhQya1SSpbi8CLNKkMZP/bdodKhaqduYuQe0tYWb4AN
 iC7f6x2mNAYrSpaAxeo4/bPfGEy0d8Qu1e8uKHjuBi5sPQanpExdHUoLMzbq/VxE1yoj
 P8oHb6MrL8eqTjkN45iBYAg5ZGJqlPpLNv85iYDI/W2M9hgQtfL66OuPoqVPPBExaZ2u
 qd4tpwoxRQl+Om4YqBw7vVPZKk9K07etredNHQQo0yeVjqxc8M9l1IJfGlWExYMVYw0W
 cLPg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9yrvfet9ZZ9nJ1/MJ1JZ6syBk1LgZWqbM9E8hGAceW8giCLvPRPu4+BHGPHtL7voiGxp/kCF6g@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRyDMqUWDt7/JvDJy7l9yR/Jo/ocuhLZ+tfb/Lf/5IEuGIMKa5
 oc0EpBS5KXgimI1fuLCigVWovlfT0DXOQ/oBNuLaC7pbzGs7xUz2deOOqD3ykSnC
X-Gm-Gg: Acq92OGu3Cgi+3tpvUpwPAzdwIuSqVT+1dw8SagdcXT5ZrcHjqxLc6riXL800ujp4hn
 U2B2HbLAwLEApHA3ByKP7FEQfpZJbPmPWi4mvE09LzN4W2Py2aczaz29eSZB1dScrABG344Yvn1
 yBpewoWPcjwyT0wiCSB0qWp0I4LJC199L6bjVAHsXS86xye5XFAZcvgrnjZrvMIf3iQ+CgmV2r7
 KL+OqusybeRNMulCrdovS5cAlZyD+fBwpOvSf5gyNEQxQIJ+ANX10dC8YHOPT4uHI8PurZtpy9I
 7JHUK67fYOH9FmNSWRBXUUud78j4cPn1fdqA8G4sr/y2r5aTslAigWFQxYLC515FxBFa941iJJe
 i/6THQtfgt5a0Pd61Li4oNp0O+dPvs6j7EnY9HirzkaWdsGD8QY8Sbx372Emm0FHKuaVNaWzZgc
 +DBbq8tiM6BTolmTzKIskUBZVVQ2yKUjh2PxoMFPo1jGNgReZpNLTixKKuZtXzGHxWtAhivRRLh
 mbm
X-Received: by 2002:a05:7300:7304:b0:2f5:5dd3:1fd8 with SMTP id
 5a478bee46e88-3044905eea7mr7297257eec.8.1779727011335; 
 Mon, 25 May 2026 09:36:51 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304522314a4sm7981376eec.18.2026.05.25.09.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 09:36:50 -0700 (PDT)
Message-ID: <f269f2a2-4573-41aa-8f75-eea87a96256e@gmail.com>
Date: Mon, 25 May 2026 19:36:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/8] lib/intel_batchbuffer: make __intel_bb_create
 gt aware
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-3-juhapekka.heikkila@gmail.com>
 <3ad90035-1f0e-4084-9042-ccbd00cbb644@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <3ad90035-1f0e-4084-9042-ccbd00cbb644@intel.com>
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



On 18/04/2026 07.26, Naladala, Ramanaidu wrote:
> Hi JP,
> 
> On 3/23/2026 9:59 PM, Juha-Pekka Heikkila wrote:
>> add possibility to use gt id in __intel_bb_create
>>
>> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
>> ---
>>   lib/intel_batchbuffer.c | 20 +++++++++++---------
>>   lib/intel_batchbuffer.h |  1 +
>>   2 files changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>> index b09506574..802e771a4 100644
>> --- a/lib/intel_batchbuffer.c
>> +++ b/lib/intel_batchbuffer.c
>> @@ -905,7 +905,8 @@ static struct intel_bb *
>>   __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>>   		  uint32_t size, bool do_relocs,
>>   		  uint64_t start, uint64_t end, uint64_t alignment,
>> -		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
>> +		  uint8_t allocator_type, enum allocator_strategy strategy,
>> +		  uint64_t region, uint16_t gt_id)
> Update the function document with new argument.
>>   {
>>   	struct drm_i915_gem_exec_object2 *object;
>>   	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
>> @@ -915,6 +916,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>>   	ibb->devid = intel_get_drm_devid(fd);
>>   	ibb->gen = intel_gen(ibb->devid);
>>   	ibb->ctx = ctx;
>> +	ibb->gt_id = gt_id;
>>   
>>   	ibb->fd = fd;
>>   	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
>> @@ -1059,7 +1061,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
>>   				      enum allocator_strategy strategy, uint64_t region)
>>   {
>>   	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
>> -				 alignment, allocator_type, strategy, region);
>> +				 alignment, allocator_type, strategy, region, 0);
>>   }
> The code always uses the magic number |0| for |gt_id|. Since |gt_id| is 
> passed explicitly to support multi-tile dGPU configurations, could we 
> read and assign |gt_id| dynamically instead of assuming |GT 0|?

That would require verifying such functionality doesn't break any test 
running for gt, it's not in scope for this set.

>>   
>>   /**
>> @@ -1086,7 +1088,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
>>   {
>>   	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
>>   				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
>> -				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
>> +				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>>   }
>>   
>>   static bool aux_needs_softpin(int fd)
>> @@ -1128,7 +1130,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
>>   				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>>   				 INTEL_ALLOCATOR_SIMPLE,
>>   				 ALLOC_STRATEGY_HIGH_TO_LOW,
>> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
>> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>>   }
>>   
>>   /**
>> @@ -1157,7 +1159,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>>   				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>>   				 INTEL_ALLOCATOR_SIMPLE,
>>   				 ALLOC_STRATEGY_HIGH_TO_LOW,
>> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
>> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>>   }
>>   
>>   /**
>> @@ -1184,7 +1186,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
>>   	return __intel_bb_create(fd, ctx, vm, cfg, size,
>>   				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>>   				 INTEL_ALLOCATOR_SIMPLE,
>> -				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
>> +				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
>>   }
>>   
>>   /**
>> @@ -1205,7 +1207,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
>>   
>>   	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
>>   				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
>> -				 REGION_SMEM);
>> +				 REGION_SMEM, 0);
>>   }
>>   
>>   /**
>> @@ -1231,7 +1233,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
>>   
>>   	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
>>   				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
>> -				 REGION_SMEM);
>> +				 REGION_SMEM, 0);
>>   }
>>   
>>   /**
>> @@ -1256,7 +1258,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
>>   	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
>>   				 INTEL_ALLOCATOR_SIMPLE,
>>   				 ALLOC_STRATEGY_HIGH_TO_LOW,
>> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
>> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>>   }
>>   
>>   static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
>> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
>> index d0a7c8dc7..7049dd2d0 100644
>> --- a/lib/intel_batchbuffer.h
>> +++ b/lib/intel_batchbuffer.h
>> @@ -269,6 +269,7 @@ struct intel_bb {
>>   	struct igt_pxp pxp;
>>   	uint32_t ctx;
>>   	uint32_t vm_id;
>> +	uint16_t gt_id;
>>   
>>   	bool xe_bound;
>>   	uint32_t engine_syncobj;

