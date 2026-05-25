Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827CDCD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3C410E3B3;
	Mon, 25 May 2026 16:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ld9kH1Ji";
	dkim-atps=neutral
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6658010E3B3
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:37:22 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2f7020a928eso14149275eec.1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727042; x=1780331842; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ONh80/7uR9wJS2osgdwS54Wpant0wnl3klFUcgK4esQ=;
 b=ld9kH1JiaxRMkogkkE85e3TtwRUvztAh7ujunFWN2dbPEvIoC95Ho2yHuA0e9VzXm8
 cBnt8ANepb5bHysBhTnywEfaVTXnjni547EqjTtHBuiMidbhKADgjBptqjxney8J97UH
 Wp39b2DsFnr0+S2hY/9uWeIo5L3LDuWCG7Aah184XD/DPHdUT1W+2awLhq9oL25rZ+ht
 xHQ0imRR4R/fINuEkzxAy3NiTuD0/qI7aPywqrMVmT4w0ZzVPbjnZ7uqQ4bB1eC9wlzZ
 x2k5/pmLgVygyvC9CD43vNUr5Eks+uEeW0/+XSPX9K7VtsjqZI4eqyRETBax6Tfd1+tl
 YW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727042; x=1780331842;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ONh80/7uR9wJS2osgdwS54Wpant0wnl3klFUcgK4esQ=;
 b=T5lg6chZWEzKNBp13IpL59q6E+Kr7EtRWF7OMpf/FLrxb3tsRAze4/p8hZRuj33Jd9
 DFbxy3vrYzZFyPY1llT3gAr5FrgRnH/581OcqitEpWvP6HnPBlkOXMuIG3S9/eKbuXJu
 uEfxbl8f4mUlxKUL+rFXc35wlQ8ry6liakjHv8n0I4C+Bljp2uMm+EFCljE7+3iba3a5
 4vk6CC4uc6rnfde3bhg11lKk5fPYVLG4pQWmBfYll9RCDbCml9/n879FE9YLjM2ukG9s
 txzi6MfRPByYErfi3kxbG4up0r/eKn8xoOP/tJusfQcLBcksFu+h7lhRM3d7RAZ9OeqN
 G99A==
X-Forwarded-Encrypted: i=1;
 AFNElJ84v3V5iPI/P93gTBAB6LCKGwr8tNPwdf4AFYK1oD5Q5Nozh5tcbnX00jV0+YJ6Qby0fYm5W43F@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjE5LhZo5SKRs0GNsTg41JFVuMtmU511UB9lDbflFmx1TDIZu8
 kji+jYMhcS7UUtiGK89KhnJtB9+gZ9mIIzJUpw+TW6J4q+TzMvARpHO/KKbac0/Y
X-Gm-Gg: Acq92OGjzOI/2B/wNvjKiDqXTxNelwJoHg3W7ZR6Iawoqr2ghKp/RLKr3sHPye9uArc
 /aa30eRdrOsOn7kbnr/p8QKDnnJKnecX4EiDgxoeY5xcLmhdoLpnBmjRBE5qj14MVGqgHk82Axk
 uWBX0RY4WRF8F+3r/F3vyDInjbDnK0cIPLM17gEnCGEmgMjG+AokSBP6CtmBjXgXGwzrcz9FjpU
 iffReoH8FicbfiMjwRpBBOjW9v9c+vacIDZsD18fLkEv0ozjA1r5WRGkhhSyPsS4dAFpIJFm8lQ
 dZUD6rqE3TZEOhi4cCrsUjn5iw22bdGoDWo+jUnxQTqCPV6h0XGFOcCvxQZ8hSz3SDohhSDUAXC
 ZmTvYMZRWStwISfLBhnVc4xZ+8FwVBOHjAcbwPXwiAUlqRJr5/hnxeVd+TOC+nHxN3WoaY9dIV1
 36SvcyUU7GE3EWdpMfRdKID0YGiwtviakLF6XuGrc4p6zcsuwJPylKrdYPgBsjREhkuOyT6dB68
 MLpLqXZUd3Hfqw=
X-Received: by 2002:a05:7301:37ca:b0:2ed:e14:7f5b with SMTP id
 5a478bee46e88-3044922a4d1mr6965822eec.31.1779727041556; 
 Mon, 25 May 2026 09:37:21 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451f1fd1csm8145521eec.8.2026.05.25.09.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 09:37:20 -0700 (PDT)
Message-ID: <7336989b-367c-47a5-83d0-0c2d59a5554d@gmail.com>
Date: Mon, 25 May 2026 19:37:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/8] lib/xe: add xe_exec_queue_create_class_gt
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-4-juhapekka.heikkila@gmail.com>
 <64f6adac-6ea2-4b28-b528-e116a95f721a@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <64f6adac-6ea2-4b28-b528-e116a95f721a@intel.com>
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



On 19/04/2026 17.52, Naladala, Ramanaidu wrote:
> Hi JP,
> 
> On 3/23/2026 9:59 PM, Juha-Pekka Heikkila wrote:
>> add function to create exec queue with class and gt id
>>
>> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
>> ---
>>   lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
>>   lib/xe/xe_ioctl.h |  2 ++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
>> index ea3f2fcaa..d56c58053 100644
>> --- a/lib/xe/xe_ioctl.c
>> +++ b/lib/xe/xe_ioctl.c
>> @@ -503,6 +503,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
>>   	return create.exec_queue_id;
>>   }
>>   
>> +uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
>> +				       uint16_t gt_id)
>> +{
> 
> Imho, Invalid class values needs to be handle with valid reason message.
> 
> DRM_XE_ENGINE_CLASS_VM_BIND is kernel only class. It does not represent 
> an actual hardware engine and is reserved for kernel-internal VM bind 
> queue management.

We're in the lib/ code, I want to pass any value which tests want to try 
out against kernel.

> 
>> +	struct drm_xe_engine_class_instance instance = {
>> +		.engine_class = class,
>> +		.engine_instance = 0,
>> +		.gt_id = gt_id,
>> +	};
>> +	struct drm_xe_exec_queue_create create = {
>> +		.vm_id = vm,
>> +		.width = 1,
>> +		.num_placements = 1,
>> +		.instances = to_user_pointer(&instance),
>> +	};
>> +
>> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
>> +
>> +	return create.exec_queue_id;
>> +}
>> +
>>   int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
>>   				 uint64_t value)
>>   {
>> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
>> index b62d259fd..f2164e640 100644
>> --- a/lib/xe/xe_ioctl.h
>> +++ b/lib/xe/xe_ioctl.h
>> @@ -83,6 +83,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
>>   			  uint64_t ext);
>>   uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
>>   uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
>> +uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
>> +				       uint16_t gt_id);
>>   int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
>>   				 uint64_t value);
>>   void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,

