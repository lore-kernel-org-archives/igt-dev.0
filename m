Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCCCCD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A3C10E3B6;
	Mon, 25 May 2026 16:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KNGIaTZc";
	dkim-atps=neutral
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEA610E3B4
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:38:02 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-304997cdb21so640838eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727082; x=1780331882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=STQBSbBBKz+GnNdYWc25yfNiTZz9IzqYNa9vFxB/Dw0=;
 b=KNGIaTZcufc4tALkdUBjq9CFebzxAwZbMHR9BxbpVmggQ4B6EX1EGJhVmY7lLjIjYs
 4aVfDMLfs+OwriLxOnIzepMYyosfFf4dyjYO6a5YZWn7yb39lVxCjrTbKHHcr5Qvyo7Y
 FbXs/DayNwQLX4Xy7suV+DNNlk1TWVeLMn7m8atrmj3K1yfLf2T/z5HyEEINIo4ndUnS
 JtO8F9tGShMRO0GSf5duFQwurSpfrJbK50xsOM1ByIRThPXOBgcGPLkSH4ZpqgkcWmlF
 zrOthByAK6d04ymXNRYvLaVDs8wVS/Hm49B+Bj1nsnUDbLcZxSFgey0U5sbo16FHQ0c4
 dX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727082; x=1780331882;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STQBSbBBKz+GnNdYWc25yfNiTZz9IzqYNa9vFxB/Dw0=;
 b=CTQLvxTmj61SQztAsw7u09GGjdRN8KVkEbpXri7cTnKJoaiKQDyvW9/TPPRHttrq8h
 t85KT7vzd57wolv+aTy+N6tXOzVS8jidgndytJ95Ey2KIsp78PcirqzHZSmjN3lQjCPo
 +z6M0ZRov0LYOCg/5wLIRz9SuxXt2edaJpRKTr9/b9EGm+AhRDe0u8u/bM8kGJl9MDnI
 J6wX/OZYiqFkqAusvJLARoqYrOtRjfjRUMzJn4mDCX9L2sGXklq5Pq2+f1/E4lyTT2SV
 yJg8Y8D5Pkimw+o2cZ7j+i/jo/Lu4DSMlDhtQrikKZXlR4uZMUUgOGtfd3QGQJdMaasP
 AfIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ86ryWdtyCw0xMwNN2SmCV+pCeUiCGe5TsyQ6e5VMviLCoa5xdMuLTThb8AMxNF7XQ4u7w34TqY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziTrQn3mxkl4qsfityw16uO94XMyGto5FtrpBKYNGeYMy+K52v
 nJgIaqCDdTCqEWJC2BzPcpGa2Rj+un4rWYz7VDoW38pO+9N4dTjp03Oo
X-Gm-Gg: Acq92OHz/zK6Ey/by0GmDuNtg1hwJl9zt4Ljo8w69C8Uu4JsGPUsPfxOiPqVjpRWggp
 wgW2rcSm4QVQNuOwJl7cCr5VJ5X7qPhi6vfX+BwuEHivrLFbRE686sleF7mt1SPVGidASLtT3dk
 AIOj/q/4RTwrJPzSQqV9Ezlr2Ta+m56chHCywMNHOBAdNtAP7ab+mAIBxn866mlVcliiJOf+eVq
 ZoZDM1tzw8YXB6BNqxe/L/p0xquSNgxp5CzNSGHYhxV/0jv4t23cPYi62LjKy4SefmRIsqsyWri
 LgC0GdD8fFDVZQ9WwPDjqE712tiXbDXvb4p20eoNtK1P6NxfwcdbkwOCh264mvVfX1DYHSbxU3T
 ln+u9HtBstoTChKq/q04UTV6BMVw0SlJeCfQ+F8YBYTQa8WJ6DJGGqcEONeUuvlT3K9kyxLqVs3
 WWs58cHNeeQIxiMQzwHY3mIaoofluoqAx60HZ270iAO0Fe2BvBtfKbhZpFSpknpBo2z4Vk+yGBs
 DCy
X-Received: by 2002:a05:7300:72cd:b0:2fc:9aa8:83da with SMTP id
 5a478bee46e88-304491db909mr7619978eec.29.1779727082065; 
 Mon, 25 May 2026 09:38:02 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451ef4af0sm8076059eec.3.2026.05.25.09.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 09:38:01 -0700 (PDT)
Message-ID: <18ef8c4d-e93d-4295-a83e-b944bc11340f@gmail.com>
Date: Mon, 25 May 2026 19:37:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/8] lib/intel_batchbuffer: move engine class
 selection to helper
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-6-juhapekka.heikkila@gmail.com>
 <e7f4c984-34b8-43ea-98ce-71be6f9dda07@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <e7f4c984-34b8-43ea-98ce-71be6f9dda07@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 19/04/2026 18.58, Naladala, Ramanaidu wrote:
> Hi JP,
> 
> On 3/23/2026 9:59 PM, Juha-Pekka Heikkila wrote:
>> move engine class selection to helper to avoid duplicate code
> Capitalize M in move and end the commit message line with a .
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/intel_batchbuffer.c | 42 +++++++++++++++++++++--------------------
>>   1 file changed, 22 insertions(+), 20 deletions(-)
>>
>> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>> index cfafaecd0..a3fa58b4f 100644
>> --- a/lib/intel_batchbuffer.c
>> +++ b/lib/intel_batchbuffer.c
>> @@ -2468,6 +2468,26 @@ static void update_offsets(struct intel_bb *ibb,
>>       }
>>   }
>> +static unsigned short get_engine_class(int fd, uint64_t flags)
>> +{
>> +    switch (flags & I915_EXEC_RING_MASK) {
>> +    case I915_EXEC_DEFAULT:
>> +    case I915_EXEC_BLT:
>> +        return DRM_XE_ENGINE_CLASS_COPY;
>> +    case I915_EXEC_BSD:
>> +        return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>> +    case I915_EXEC_RENDER:
>> +        if (xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER))
>> +            return DRM_XE_ENGINE_CLASS_RENDER;
>> +        else
>> +            return DRM_XE_ENGINE_CLASS_COMPUTE;
>> +    case I915_EXEC_VEBOX:
>> +        return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>> +    default:
>> +        igt_assert_f(false, "Unknown engine: %x", (uint32_t)flags);
> update assert message something like below
> igt_assert_f(false, "Unknown engine class: 0x%x", (uint32_t)flags);
> 

That's would affect other paths which don't relate to these patches, ie 
ctx path. No idea why this message should now change.

>> +    }
>> +}
>> +
>>   #define LINELEN 76
>>   /*
>> @@ -2510,26 +2530,8 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t 
>> flags, bool sync)
>>           inst.engine_instance =
>>               (flags & I915_EXEC_BSD_MASK) >> I915_EXEC_BSD_SHIFT;
>> -        switch (flags & I915_EXEC_RING_MASK) {
>> -        case I915_EXEC_DEFAULT:
>> -        case I915_EXEC_BLT:
>> -            inst.engine_class = DRM_XE_ENGINE_CLASS_COPY;
>> -            break;
>> -        case I915_EXEC_BSD:
>> -            inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>> -            break;
>> -        case I915_EXEC_RENDER:
>> -            if (xe_has_engine_class(ibb->fd, 
>> DRM_XE_ENGINE_CLASS_RENDER))
>> -                inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
>> -            else
>> -                inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
>> -            break;
>> -        case I915_EXEC_VEBOX:
>> -            inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>> -            break;
>> -        default:
>> -            igt_assert_f(false, "Unknown engine: %x", (uint32_t) flags);
>> -        }
>> +        inst.engine_class = get_engine_class(ibb->fd, flags);
>> +
>>           igt_debug("Run on %s\n", 
>> xe_engine_class_string(inst.engine_class));
>>           if (ibb->engine_id)

