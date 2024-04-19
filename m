Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580A5C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 07:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF68510F0E8;
	Fri, 19 Apr 2024 07:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="wgi6rZJc";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5BB10F0E8
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 07:50:02 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4196c62bb41so1106335e9.0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 00:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713513001; x=1714117801;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BUqHMe5F6GTamKUFi1bUmSjimfZEl6TCg9QnaylDtlU=;
 b=wgi6rZJc3zTLKmGkkyo6/p+5WIjMDNVfUq//iJH6dnBypgDBjhPX7D0xo5Uv64MGKB
 fRdoayW/ez3d68zbJD62BH2UcKuR5wklIQSif+b/7NF6TkpuVC+0jqzOugS0YrhH8m+o
 fuwgcBCUB6kUprRKY2KYzoLKlIKsTjBQRfQoljRe9ztjgtlQaWCYwMU3ju117jxyF/Sp
 DmKt3WK2qCQjZ4ke8IREOS8dRZsqcx7zl1OgRqV7TFAT6auX9Qv1PoWvBSg7GEePvnfp
 c3+NXaBCvL+d6Ta67wVs15Vit05VgLbm+TL4/Z3AVLFQKQjv47bCi4QQPL2U858YN9+U
 BjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713513001; x=1714117801;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUqHMe5F6GTamKUFi1bUmSjimfZEl6TCg9QnaylDtlU=;
 b=kcxlb300e8P3okGqd0OqpHyvsNMbf5hzrzxDlm1g6nglSelGftSyqAkCAF2ZmDNB1Q
 2USiOA9SX+wOSqyWs2ugK0o/Z4ZRa55ci5E/WmSS6e0qqFRogS+ShqH7XCRHbsuPjTL/
 3bAbKhzjQS8DrAGkXbK6B/R+r93FE2dsbjGSDZMzpXlgPj28C9VMXfoZ7eEz5VB5Sfm8
 RQlwZEbqwhAYZLbUYQXIziLoX3oKe2lxhJCzS348IQXip36MQfrB/16LJqb3Vj7BV579
 kNN5BhlGKhmIhkrGl28XinFlV9fEVBooiVwr35ocjf1U78jezrt/lYe/pGbmQ84ZTjIC
 SJ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+/uYc8izZdqFL6D8sChq2sQKLYBPSqRdZqCWwZ+S9NZLHaQc/lhzE0Wy/NDuV4fQd6VZdp60UokgZ6SG5cD1ciz56K7n77DHI0hIylQ==
X-Gm-Message-State: AOJu0Yx2VhkuBP0FKp08tK2R7cBnc4VENwS3jowQktyIq+8YYAMSDmSo
 vW7DCOWovYk09pdfss5lAyZnrLD11xnCRBAb/jDuEn9kCDGGRZxT4ysuug/WveGh7M/WhjUBpqc
 6
X-Google-Smtp-Source: AGHT+IH41qsUErOCd59wB7pHqEyWvahBGzfdx2veupl3pxVGopCWF5DlJPzxxhtWQdLvs12gsmD3fg==
X-Received: by 2002:a05:600c:470f:b0:418:c1a3:8521 with SMTP id
 v15-20020a05600c470f00b00418c1a38521mr841798wmo.26.1713513000702; 
 Fri, 19 Apr 2024 00:50:00 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a05600c354d00b00418f1650c99sm3973207wmq.20.2024.04.19.00.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 00:50:00 -0700 (PDT)
Message-ID: <4ad6f22f-8808-4fd5-a431-35d97a2aed27@ursulin.net>
Date: Fri, 19 Apr 2024 08:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 03/12] lib/igt_drm_fdinfo: Fix wrong name len assert
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-4-lucas.demarchi@intel.com>
 <940ebe8a-3f16-4e1f-8215-29ef54b94a2b@ursulin.net>
In-Reply-To: <940ebe8a-3f16-4e1f-8215-29ef54b94a2b@ursulin.net>
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


On 19/04/2024 08:48, Tvrtko Ursulin wrote:
> 
> On 05/04/2024 07:00, Lucas De Marchi wrote:
>> When parsing engine name, at this point we have something like:
>>
>>     "drm-engine-render:    232409619162 ns"
>>                 ^      ^
>>                 |      |
>>               name     p
>>
>> We are copying the engine name to the final destination, but
>> strlen(name) will actually contain the entire string. Since we already
>> know the name length, calculated previously, just use it for copying the
>> string.
>>
>> Since each name is 256-bytes long, the assert doesn't trigger easily,
>> but it's better to be correct. And more efficient.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   lib/igt_drm_fdinfo.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>> index 7a9ae94f0..9b1776775 100644
>> --- a/lib/igt_drm_fdinfo.c
>> +++ b/lib/igt_drm_fdinfo.c
>> @@ -96,8 +96,9 @@ static int parse_engine(const char *name, struct 
>> drm_client_fdinfo *info,
>>           if (found < 0) {
>>               assert((info->num_engines + 1) < ARRAY_SIZE(info->names));
>> -            assert((strlen(name) + 1) < sizeof(info->names[0]));
>> -            strncpy(info->names[info->num_engines], name, name_len);
>> +            assert(name_len  < sizeof(info->names[0]));
>> +            memcpy(info->names[info->num_engines], name, name_len);
>> +            info->names[info->num_engines][name_len] = '\0';
>>               found = info->num_engines;
>>           }
>>       }
> 
> Ah a good fix.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Oooh the muscle memory.. I knew this would happen sooner or later! :))

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> 
> Also, ideally fixes such as this and next few would be before 
> refactoring in the series, but okay, not asking you to re-order.
> 
> Regards,
> 
> Tvrtko
> 
> P.S. One extra space in the assert fwiw.
