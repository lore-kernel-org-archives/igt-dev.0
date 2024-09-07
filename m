Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2E1E6FE53
	for <igt-dev@archiver.kernel.org>; Sat,  7 Sep 2024 08:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FDC10E203;
	Sat,  7 Sep 2024 08:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AMJLaB/2";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A469810E203
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Sep 2024 08:27:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374b5f27cf2so1701484f8f.1
 for <igt-dev@lists.freedesktop.org>; Sat, 07 Sep 2024 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725697621; x=1726302421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MPvns3Vx579NkdE/UkOakPOu0Si2jefMQqWMxAKl4vE=;
 b=AMJLaB/2u528dYglggkF0NYgbfxPhzj2v3z+in+jh3XYxVYpoc/KWBXYYljNDAhNsN
 qSiLK3DT1QdzVy/1+fgmNuvfT6+BRFqGQKltuoS8zi4ZZj+nS/gPUjslcNi4YXyYyfxS
 NzKqr6Uld9V0rse0UsZ4gS09n8eIGNAwzp5Cox71joF/ZfJpq16LOg7FHeecQOmD+/vA
 3a9a4b1X62y2M0/uPSccpD+Xd4RzeeXPibHYSrgKImpVWVmuRvdhDTC0Awpa73m4mczR
 taea05REMSBL2ranHcPqlXLwyZdc76u8Of9YD3Ktd1IAFi3MYqiuedSwjt6e2eD699X7
 wwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725697621; x=1726302421;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MPvns3Vx579NkdE/UkOakPOu0Si2jefMQqWMxAKl4vE=;
 b=vtugmdeOB21FWIC4yiKaQKNF2YskUuKwWgnZAzxaRfVZK5f03dot//dkg+kYlNFPz7
 JNYnNYNMNhgn/603N1tF4S08uSZ+gGavhz/WfYbp6fmZI89rJpKStuZQMxA/6ovhBe+Y
 h6MPldPvH89CbORJQcSKBhTq4U5BFfhcZCoucU/RHQ25sh/ZwObgjMfpe2Dd32ymYwxc
 kYXUBuPT9NzdAL3J6KB6lVqAmubVbBGWTj3t0y4Yy9Yaa8UwHMB7C1DTNX4FiNMNp27N
 RyvjtXDldeKBpuLnSuEBZnY5sLxAcHPXTDwIeeONyWPC5B8rrQXcWcYzTvH0lyw9v56U
 NGvQ==
X-Gm-Message-State: AOJu0YzwqQtcXxNevQCSHXotX+nXC24ZJ6QKWUzJwMQyWwWKmnZE1gnE
 blmrslNffWjewJLXZ4brB5y2hrUL13FnPpYJVLz8SagdPOVMKlEj
X-Google-Smtp-Source: AGHT+IH+FuzCnhRcW/iRSbaWRV2R/YsTrkyus9wrva7pGE0Yrn3N5XfdmrPaH3pBZ2+76poVTNXXBw==
X-Received: by 2002:adf:8b97:0:b0:374:d259:647f with SMTP id
 ffacd0b85a97d-3789269fe85mr1099641f8f.34.1725697620481; 
 Sat, 07 Sep 2024 01:27:00 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.78])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-378956653c6sm843413f8f.32.2024.09.07.01.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Sep 2024 01:26:59 -0700 (PDT)
Message-ID: <033d025a-a6bb-441b-a0f2-b32854932344@gmail.com>
Date: Sat, 7 Sep 2024 11:26:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 05/23] lib/rendercopy: Always setup clear color for
 TGL
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
 <20240902143758.21036-6-ville.syrjala@linux.intel.com>
 <d08eeda6-a8e9-4ab9-8dc2-4860e97a2307@gmail.com> <ZtsHYjwtGwrNDU-E@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <ZtsHYjwtGwrNDU-E@intel.com>
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

On 6.9.2024 16.45, Ville Syrjälä wrote:
> On Fri, Sep 06, 2024 at 04:09:19PM +0300, Juha-Pekka Heikkila wrote:
>> On 2.9.2024 17.37, Ville Syrjala wrote:
>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>
>>> TGL apparently automagically converts regular output to fast
>>> clears when the output matches the configured clear color.
>>> And if we don't enable the clear color packet at all then we
>>> just get some rainbow gibberish on all black parts of the
>>> output.
>>>
>>> To avoid always set up the clear color packet when using
>>> using a non-clear color modifier. We'll just stick a bunch
>>> of NaNs into the clear value so it'll never match any
>>> legitimate output, and thus automagic fast clear should not
>>> happen.
>>>
>>> TODO: Hide this better inside rendercopy_gen9.c without
>>>         requring extra allocation in the FB BO
>>> TODO: Figure out if other platforms need this sort stuff
>>>
>>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> ---
>>>    lib/igt_fb.c          | 24 ++++++++++++++++++++++++
>>>    lib/intel_bufops.h    |  1 +
>>>    lib/rendercopy_gen9.c | 14 +++++++++++---
>>>    3 files changed, 36 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>>> index 21c56a454c5a..0eb3897d0f8b 100644
>>> --- a/lib/igt_fb.c
>>> +++ b/lib/igt_fb.c
>>> @@ -965,6 +965,16 @@ void igt_calc_fb_size(struct igt_fb *fb)
>>>    		size += calc_plane_size(fb, plane);
>>>    	}
>>>    
>>> +	/*
>>> +	 * We always need a clear color on TGL, make some extra
>>> +	 * room for one it if it's not explicit in the modifier.
>>> +	 *
>>> +	 * TODO: probably better to allocate this as part of the
>>> +	 * batch instead so the fb size doesn't need to change...
>>> +	 */
>>> +	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS)
>>> +		size = ALIGN(size + 64, 64);
>>> +
>>>    	if (is_xe_device(fb->fd)) {
>>>    		size = ALIGN(size, xe_get_default_alignment(fb->fd));
>>>    		if (fb->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS)
>>> @@ -2670,6 +2680,20 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>>>    	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
>>>    		buf->cc.offset = fb->offsets[1];
>>>    
>>> +	/*
>>> +	 * TGL appears to do automagic fast clear when rendering
>>> +	 * black and the clear color isn't specified, or when the
>>> +	 * output matches the specified clear color. Force a
>>> +	 * non-sensical clear color to prevent it from doing this
>>> +	 * when using a non-clear color modifier.
>>> +	 *
>>> +	 * TODO: figure out if other platforms are affected...
>>> +	 */
>>> +	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS) {
>>
>> What about adlp on this? I believe it will now get same treatment as tgl
>> and ci doesn't seem to have adlp on shards so there's no good results(?)
> 
> I *think* adl wasn't affected, but I'll need to double check that...
> 
> Although apart from allocating a bit of extra memory this should
> be completely harmeless on unaffected platforms.

ah yes, true. At the worst this will reveal something that was not 
handled for adlp.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> 
>>
>> /Juha-Pekka
>>
>>> +		buf->cc.disable = true;
>>> +		buf->cc.offset = fb->size - 64;
>>> +	}
>>> +
>>>    	return buf;
>>>    }
>>>    
>>> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
>>> index 84e71d41a2c2..06e72ba4ba93 100644
>>> --- a/lib/intel_bufops.h
>>> +++ b/lib/intel_bufops.h
>>> @@ -38,6 +38,7 @@ struct intel_buf {
>>>    	} ccs[2];
>>>    	struct {
>>>    		uint32_t offset;
>>> +		bool disable;
>>>    	} cc;
>>>    	struct {
>>>    		uint64_t offset;
>>> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
>>> index 5ee4c89f5cdb..f0757a8e6b78 100644
>>> --- a/lib/rendercopy_gen9.c
>>> +++ b/lib/rendercopy_gen9.c
>>> @@ -1133,15 +1133,23 @@ void _gen9_render_op(struct intel_bb *ibb,
>>>    
>>>    	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
>>>    
>>> -	if (fast_clear) {
>>> +	if (fast_clear || dst->cc.disable) {
>>>    		for (int i = 0; i < 4; i++) {
>>>    			intel_bb_out(ibb, MI_STORE_DWORD_IMM_GEN4);
>>>    			intel_bb_emit_reloc(ibb, dst->handle,
>>>    					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
>>>                                                dst->cc.offset + i*sizeof(float),
>>>    					    dst->addr.offset);
>>> -			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
>>> -               }
>>> +			if (fast_clear) {
>>> +				intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
>>> +			} else {
>>> +				/*
>>> +				 * Emit NaN so it'll match nothing and thus prevent
>>> +				 * TGL from doing its automagic fast clear tricks.
>>> +				 */
>>> +				intel_bb_out(ibb, 0xffffffff);
>>> +			}
>>> +		}
>>>           }
>>>    
>>>    
> 

