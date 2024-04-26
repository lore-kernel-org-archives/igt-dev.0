Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3C4C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 10:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DD010FD91;
	Fri, 26 Apr 2024 10:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IBRcOMxD";
	dkim-atps=neutral
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A9810FD91
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 10:14:38 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-518f8a69f82so2238706e87.2
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 03:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714126476; x=1714731276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rP4sPdfetu4Juc2OS5WREngFWzBeyGM8DqqOLgGk8o4=;
 b=IBRcOMxDwNF2Gpxd0xl9iDuqfqf3KExdEYPno5jYGPzCLDOtKSP9o8EPIf3nGfDNAH
 4KcloMy9TnlzOmaOU7BDWL6TK/AUusxfRBuWez10zo1bW2LdTHNQuKchprkVL0BuCfbn
 yhkqdvJitrY1z06O2DzNVXfs2XS4cd6U8kXCI9jLnn1eVIVvKeD9T8Rpof+Jwge1Qp20
 iDn7xABfnYr3GKcO0KSu8GgIMsIhg4d9zcm3jHZi3w7KHNBFnQ24cG8leR0ThizQeCRO
 X97L4AKsHFfBStQmXqYMcOHkzAlaD0x9r1Zylygx/zUYh9J8w69cqde2Lb9PnKN0XBup
 V/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714126476; x=1714731276;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rP4sPdfetu4Juc2OS5WREngFWzBeyGM8DqqOLgGk8o4=;
 b=LSxFj8+E2NmdSbHPQkb4J8nEG1SfxJQMhfP82qpHDveTM4Cy+27fbPMWX/aibWQeBf
 OxuMdEXf9tKLN6wXXdogvuRyiyV+tuMtlIVMwZ8SN23g+T2Vx9wVKVOq+9vQHW7a0oZj
 mau6e7qYRcuLGy/6Azqd150YzLjXJVrTCElfBoqMJRo0DAEBf/VCjGa0T/HwlcpFYlDl
 c1/XJg+XCrd3WTj+Tg1F0MjWHb359htk+9sDpdRGylTjbNuRq8qZkg0dQoTydbtFSOyU
 7COsm+L8YaP2Oh71uO9cY+wlJ/c4CgnDzUta/7qQ9b1wbNxqTPv6OrL7om/Lcnku8IlX
 Nybg==
X-Gm-Message-State: AOJu0YwmrC2ItjiNAqfhY1lv9gbfFG/bc9H1BNW/aN8zoYjfRNEqtTjy
 LUHHs/OS6kFcHLoxcPPpDPn1je+RW3cSeZY0NGUCjqPS8xOvyj6D
X-Google-Smtp-Source: AGHT+IEycCy5NZynHyeHaCXL+LhdTnfSoRxErhDGwG7Deu7c7TIzvn2xnsBLCbw3NAH0sX4CIOaNFQ==
X-Received: by 2002:a05:6512:ba7:b0:51a:c21b:7401 with SMTP id
 b39-20020a0565120ba700b0051ac21b7401mr1786384lfv.32.1714126475218; 
 Fri, 26 Apr 2024 03:14:35 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.71])
 by smtp.googlemail.com with ESMTPSA id
 g30-20020adfa49e000000b00343f662327bsm22316540wrb.77.2024.04.26.03.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 03:14:34 -0700 (PDT)
Message-ID: <7503f603-b901-457a-b963-aa00e2933ca5@gmail.com>
Date: Fri, 26 Apr 2024 13:14:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/7] lib/intel_bufops: Drop tilings restrictions
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
 <20240425104721.52376-5-zbigniew.kempczynski@intel.com>
 <64cd3b16-55b8-42e5-8aa7-f417ecb4d5ec@gmail.com>
 <20240425155259.yyuqzhlldbmtj7sx@zkempczy-mobl2>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240425155259.yyuqzhlldbmtj7sx@zkempczy-mobl2>
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

On 25.4.2024 18.52, Zbigniew Kempczyński wrote:
> On Thu, Apr 25, 2024 at 04:08:23PM +0300, Juha-Pekka Heikkila wrote:
>> On 25.4.2024 13.47, Zbigniew Kempczyński wrote:
>>> Different platforms supports different tilings so instead of asserting
>>> on buffer creation path move responsibility of passing valid data
>>> to the test. It can use intel_cmds_info to iterate over supported
>>> tilings so this is better extendible and requires fewer changes.
>>>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> ---
>>>    lib/intel_bufops.c | 3 ---
>>>    1 file changed, 3 deletions(-)
>>>
>>> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
>>> index 007ccdb953..b96275e485 100644
>>> --- a/lib/intel_bufops.c
>>> +++ b/lib/intel_bufops.c
>>> @@ -898,9 +898,6 @@ static void __intel_buf_init(struct buf_ops *bops,
>>>    	if (compression) {
>>>    		igt_require(bops->intel_gen >= 9);
>>> -		igt_assert(req_tiling == I915_TILING_Y ||
>>> -			   req_tiling == I915_TILING_Yf ||
>>> -			   req_tiling == I915_TILING_4);
>>
>> I'm wondering if it would make sense to flip this assert around instead of
>> removing it? I mean would check here will not arrive linear and x-tile? I
>> didn't check but I assume this compression flag will not be enabled for xe2?
> 
> I'm using this path to create compressed on xe2 and render-copy works
> fine on linear/x/4/64 there.

But do you hit this assert with xe2? I was thinking you wouldn't hit 
that assert because compression is handled through pat index and from 
that would follow with xe2 you'd never have compression flag set. Then 
for dg2 you'd come here with also with tile64 so you could just check no 
x-tile and linear are coming here.

Then again, looking at what's inside that if(){..} maybe you could just 
change that "if (compression)" to something like "if 
(!HAS_FLATCCS(intel_get_drm_devid(bops->fd))" and remove the inner if 
doing the same thing?

/Juha-Pekka
