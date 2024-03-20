Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD01C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 10:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7532710F4E5;
	Wed, 20 Mar 2024 10:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZSVodSlh";
	dkim-atps=neutral
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF9D10F4E5
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 10:07:52 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d485886545so108409381fa.2
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 03:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710929270; x=1711534070; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gDAANXqWAliysGcNrYuaIlYbvhXfptl2jxBTYSHy/kQ=;
 b=ZSVodSlhFKHYwpyDITuedsubXqrPQe2EvM3aGFzDVt8mAHQaTFYUzHWWx3SiyFfNB5
 Hc4yyhudkfM4of8HDza49E2dAiE7E3R4WsLjhZWbSong8sOZKO2d1D/Qcka1IWuUDMef
 ahvAb8OlAEg43fWtwhMNEmCMfXxG9NC5NDCrOhKDvGHku7VFEp6E7SIqSpIONZAZJIM4
 2xh/WRfVfLbqESM1tNFN4ggcgv4Q0uTG9MHXNVuqHJgxbqjMIQFQf02JfkOHFMpFoJmM
 IUZ8aspUsvDa8MCAmiROWJbAa/W2IQwXg9GHeZPtm97w3fv4Ye0q7KpwuobSXegpSrtk
 QZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710929270; x=1711534070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gDAANXqWAliysGcNrYuaIlYbvhXfptl2jxBTYSHy/kQ=;
 b=PDjWYHNKGeNgnz2kre0ZNN/coGAPO84zAZ6fQyiKo/7pKll2wDgeapcYWajHQJXwta
 WnSwJp2aryipXeSpOiBBW98LJ0t2eZlKfgT5sld5n3CM/gB9Dlpvr3wJpr8/FPtfT37K
 I+AJ84pvfXA2EqoZPiicz1jyOYkS4U8A18LUiPSOhxPBlAyu+A3FEr2Tq6Njnd7aBc6/
 x6xRqOZAxTFXnWL6SMzsSLAWCodwi1Wx/FlMiP16UJiMUbxjUi1UkcY6mMyvBAmUc3hB
 f3lO8AYgoHbZ77UikT/t6WTb3Yw6wQGGPbUq7FeWaIdwezu5OvccpsETncLFeNjAT04n
 qVZQ==
X-Gm-Message-State: AOJu0YzZbCqAK/RNjqKD4MhaNTDHG4zaSHL2VefiNIvwBC7zUH/Lhx8b
 tM9l5lePfEyG+5HFE2k9Pr6aOyQfVyxzJLdePDouBlskgVgim7yj
X-Google-Smtp-Source: AGHT+IFhxmkwRQXoxFujbYhEVphQ8q7mKKd5Jb45C/hWz2J/Kr4/BJBowM0Kn5js5jgV1aHfe9RoXw==
X-Received: by 2002:a2e:9c18:0:b0:2d4:676b:f591 with SMTP id
 s24-20020a2e9c18000000b002d4676bf591mr9106816lji.45.1710929269950; 
 Wed, 20 Mar 2024 03:07:49 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.85])
 by smtp.googlemail.com with ESMTPSA id
 y25-20020a05600c365900b00413fda042ddsm1278659wmq.0.2024.03.20.03.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 03:07:49 -0700 (PDT)
Message-ID: <3bda2e06-b7b9-4e8a-a959-2cf8ed5d0d05@gmail.com>
Date: Wed, 20 Mar 2024 12:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_ccs: add access to control surface
 on xe2
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240318114758.108006-1-juhapekka.heikkila@gmail.com>
 <20240320084652.gyd4w5sc6fufqf2u@zkempczy-mobl2>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240320084652.gyd4w5sc6fufqf2u@zkempczy-mobl2>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Zbigniew,

On 20.3.2024 10.46, Zbigniew Kempczyński wrote:
> On Mon, Mar 18, 2024 at 01:47:58PM +0200, Juha-Pekka Heikkila wrote:
>> On random ccs test randomize also control surface content
>> and on crc tests add check ccs image is compressed.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> Hi JP.
> 
> I got two comments, one is minor nit, but second likely needs to be
> addressed. See below.
> 
>> ---
>>   tests/intel/kms_ccs.c | 77 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>
>> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
>> index 4f8e30791..96beb2de1 100644
>> --- a/tests/intel/kms_ccs.c
>> +++ b/tests/intel/kms_ccs.c
>> @@ -365,6 +365,77 @@ static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *cc_color
>>   	}
>>   }
>>   
>> +static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
>> +{
>> +	uint64_t bb_size, ccssize = fb->size / CCS_RATIO(fb->fd);
>> +	uint64_t ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fb->fd));
>> +	struct blt_ctrl_surf_copy_data surf = {};
>> +	uint32_t sysmem = system_memory(fb->fd);
>> +	uint32_t bb1, ccs, *ccsmap;
>> +	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
>> +	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
>> +	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &
>> +						xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
>> +
>> +	struct drm_xe_engine_class_instance inst = {
>> +		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>> +	};
>> +
>> +	uint64_t surf_ahnd;
>> +	uint32_t vm, exec_queue;
>> +	intel_ctx_t *surf_ctx;
>> +
>> +	vm = xe_vm_create(fb->fd, 0, 0);
>> +	exec_queue = xe_exec_queue_create(fb->fd, vm, &inst, 0);
>> +	surf_ctx = intel_ctx_xe(fb->fd, vm, exec_queue, 0, 0, 0);
>> +	surf_ahnd = intel_allocator_open(fb->fd, surf_ctx->vm,
>> +						INTEL_ALLOCATOR_RELOC);
>> +
>> +	ccs = xe_bo_create_caching(fb->fd, 0, ccs_bo_size, sysmem, 0, cpu_caching);
>> +
>> +	blt_ctrl_surf_copy_init(fb->fd, &surf);
>> +	blt_set_ctrl_surf_object(&surf.src, fb->gem_handle, region, fb->size,
>> +				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
>> +	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
>> +				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
>> +
>> +	bb_size = xe_bb_size(fb->fd, SZ_4K);
>> +	bb1 = xe_bo_create(fb->fd, 0, bb_size, sysmem, 0);
>> +	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
>> +	blt_ctrl_surf_copy(fb->fd, surf_ctx, NULL, surf_ahnd, &surf);
>> +	intel_ctx_xe_sync(surf_ctx, true);
>> +
>> +	ccsmap = xe_bo_map(fb->fd, ccs, surf.dst.size);
>> +
>> +	if (verify_compression) {
>> +		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++) {
>> +			if (ccsmap[i] != 0)
>> +				goto ccs_vefiried;
> 
> That's minor nit, s/vefiried/verified/g.
> 
> Second doesn't reside in this code, it is in the test itself:
> 
> static void fill_fb_random(int drm_fd, igt_fb_t *fb)
> {
> ...
> 	for (i = 0; i < fb->size; i++)
> 		p[i] = rand();
> ...
> 
> Randomized data might lead your surface won't be surprised at all (data
> are noise). I experimented with this some time ago when I played with
> ctrl-surf-copy. Noise wasn't compressible so I think you should less
> random data in case you want to check the ccs data.

Idea of this test is exatcly as you described above. Throw completely 
random data at control surface (same way as is done in aux ccs version 
of this test) and see nothing breaks, ie. no hw hangs, no unexpected 
display behaviors etc. Plan with this test is not to behave correctly 
towards hw but just see hw survived unexpected situation.

/Juha-Pekka

>> +		}
>> +		igt_assert_f(false, "framebuffer was not compressed!\n");
>> +	} else {
>> +		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
>> +			ccsmap[i] = rand();
>> +	}
>> +
>> +	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
>> +				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
>> +	blt_set_ctrl_surf_object(&surf.dst, fb->gem_handle, region, fb->size,
>> +				 uc_mocs, comp_pat_index, INDIRECT_ACCESS);
>> +	blt_ctrl_surf_copy(fb->fd, surf_ctx, NULL, surf_ahnd, &surf);
>> +	intel_ctx_xe_sync(surf_ctx, true);
>> +
>> +ccs_vefiried:
>> +	munmap(ccsmap, ccssize);
>> +	gem_close(fb->fd, ccs);
>> +	gem_close(fb->fd, bb1);
>> +	xe_exec_queue_destroy(fb->fd, exec_queue);
>> +	xe_vm_destroy(fb->fd, vm);
>> +	free(surf_ctx);
>> +	put_ahnd(surf_ahnd);
>> +}
>> +
>>   static void fill_fb_random(int drm_fd, igt_fb_t *fb)
>>   {
>>   	void *map;
>> @@ -382,6 +453,10 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
>>   		p[i] = rand();
>>   
>>   	igt_assert(gem_munmap(map, fb->size) == 0);
>> +
>> +	/* randomize also ccs surface on Xe2 */
>> +	if (AT_LEAST_GEN(intel_get_drm_devid(drm_fd), 20))
>> +		access_flat_ccs_surface(fb, false);
>>   }
>>   
>>   static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plane,
>> @@ -640,6 +715,8 @@ static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb
>>   	xe_exec_queue_destroy(dst_fb->fd, exec_queue);
>>   	xe_vm_destroy(dst_fb->fd, vm);
>>   	free(xe_ctx);
>> +
>> +	access_flat_ccs_surface(fb, true);
>>   }
>>   
>>   static void generate_fb(data_t *data, struct igt_fb *fb,
>> -- 
>> 2.25.1
>>

