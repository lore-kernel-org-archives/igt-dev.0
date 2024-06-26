Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A7FC30653
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 08:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7595A10E7C5;
	Wed, 26 Jun 2024 08:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mUmexGl3";
	dkim-atps=neutral
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2256B10E7C5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 08:43:13 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so77311451fa.1
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719391391; x=1719996191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YmJL3byu5NbtewGTJ9uVwflI3wB+o/1V16RT0P8+gOs=;
 b=mUmexGl3ErNVGi2DNkDi1XKQs6NJgEnDGdSjgPNR3sKjGmeDtlYgnx3CesqosiGarO
 NbMOmeSJO6u73EbXQTvb7pPsjHzX6nHygXjV34DN1ktciYxHCxHm4lMUY3N4Bwy1tX9L
 O4w6genXmFRKLlsTlKhdQPe/SSaOnWFblMJYP9P0uMg6IpK+t+l/tLB80wYSdtKvpenz
 pXegWKoDaleDHgCA4oBjfgxcRUKX328ZD/jmvwhpG8abjhm+Ok9c+k6pbZDyZFk6Pv+J
 cfswkQbuBJh/UnMu4Iq7CHChBRire2xohjHu0iEOBgD4KRyyXr8o94mmYlHWWXbOEMaZ
 uEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719391391; x=1719996191;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YmJL3byu5NbtewGTJ9uVwflI3wB+o/1V16RT0P8+gOs=;
 b=JxksXUjLxW6gRnJpl7n+PoMvIRM7ho35HvmaxMV4Hu33BKcRTfI4JVDhEk/Gv8fBCa
 vgA9+sRtmrhH9nzIA3NsmMjlDGKVs1ePQzp7pCsWc/Z99ne4ZYQEEjOzrsoL4FUwht5b
 CzMRGwZeefIobOLDT74BQZ5bJJpL7EzWIdawqapgwzKxrPa9GYEN5ZHG08Oi/ZvFH9U9
 Se+Eyhv4OCnOHXgsoGtDlv0GLW8wSCocRoruCt5BPR0co9pzWAK0neGcilpJGKxrVZlf
 hLmI0J2si+HTTAkJkHvJbyWG+9Vz9UiGqcVhumFB1LjP0hhV+4YWnNK/7UGozfdJSmTU
 Nlng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWG7o6EDW6N8hdgft3laF0ih+Y6+LR/z+G//WA4rUCFOp/vID+u5emsfVPyQ+xNmoZ29JUyCn+4EOZ2RbzWbw8pklFEyMQW68bh9vzuA==
X-Gm-Message-State: AOJu0YzfvDgKChQqqOIPJwVjqXdfoUskCZ932mShhBhCbxayMNGAubWn
 +lUr/shMsiwXduUoKlZCMZGeoGJB8Y93mf49SzcG5Mdl55sSfEc0NjtVWL7xxJc=
X-Google-Smtp-Source: AGHT+IHDae1/A9J2h5MuPNcjL8hnPfR61TL27008L5EcARKnG+B4YcSCwMNesuXGUWsbGeI1tq41YA==
X-Received: by 2002:a2e:b179:0:b0:2ec:5685:f068 with SMTP id
 38308e7fff4ca-2ec5b337265mr55783811fa.17.1719391390642; 
 Wed, 26 Jun 2024 01:43:10 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-424c842468dsm17058895e9.36.2024.06.26.01.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 01:43:10 -0700 (PDT)
Message-ID: <1b38d6c4-1adc-4ada-b822-09a3af94c9be@gmail.com>
Date: Wed, 26 Jun 2024 11:43:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_getfb: Skip getfb2-accept-ccs subtest on
 Xe2 platforms
To: Karthik B S <karthik.b.s@intel.com>,
 Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: sameer.lattannavar@intel.com
References: <20240621043248.612664-1-pranay.samala@intel.com>
 <d3770d78-3334-47a3-a439-a6b1e4f684a3@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <d3770d78-3334-47a3-a439-a6b1e4f684a3@intel.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On 26.6.2024 8.43, Karthik B S wrote:
> 
> On 6/21/2024 10:02 AM, Pranay Samala wrote:
>> The getfb2-accept-ccs subtest tests on ccs modifiers.
>> With Xe2 platforms we no more have the ccs modifiers.
>>
>> Adding a check to verify the platform. If it is
>> Xe2 platform then test will skip, otherwise it
>> will execute further.
>>
>> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
>> ---
>>   tests/kms_getfb.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
>> index bb9679bc9..81829ca3b 100644
>> --- a/tests/kms_getfb.c
>> +++ b/tests/kms_getfb.c
>> @@ -161,6 +161,9 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
>>   	igt_require(has_addfb2_iface(fd));
>>   	devid = intel_get_drm_devid(fd);
>>   
>> +	igt_require_f(intel_graphics_ver(devid) < 20,
>> +		      "No ccs modifiers on Xe2\n");
>> +
> 
> Hi Pranay,
> 
> I see that getfb tests are skipping on legacy platforms with this patch.
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11292/index.html?testfilter=kms_getfb
> 
> This should be resolved by replacing 'intel_graphics_ver' with 
> 'intel_display_ver'. Could you please update this.

intel_display_ver will not help here, that would lead to detecting each 
machine individually because xe2 vs older platforms have overlapping 
display versions.

Seems Pranay's patch is almost right. That comparison probably should be 
something like intel_graphics_ver(devid) < IP_VER(20, 0)

/Juha-Pekka
