Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7653CD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 16:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA13112C41;
	Wed,  3 Apr 2024 16:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="U3D+jsT7";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44364112C37
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 16:09:22 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34391544c46so767238f8f.0
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Apr 2024 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1712160560; x=1712765360;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cJGkPqgLotgtO7ANBHDe2iaPVVmF+jB98l0YWxqW6/k=;
 b=U3D+jsT7PorqJf29BHJIzVAHQ2HpAk9/A2jpaCOc65ZRBIXLiEPc99+SrI9mvRjjXx
 M2QmNecq2lyo2alMeRLfH5jMQy3Z0nzxCbcuTVunCB9r2dTipk0451H/ANKQQffHVYVz
 P/W3YTLJAMd+Oduu58rL8SvJX6usqgG5vYj4hFeQPV5HDMb7auLOkUmjGCGAT1/1+EaF
 RdID00QcRHDyQwqEZXfOWhQ0Jt3LpxR+MfiO7iNgZje2crJXT0xC9FHVoldtZHT5KbHQ
 066LQJ9jCGeV22aiSWUqFgJ/+PF+xsq5ANhIeaXVYuZg15hOhWoFaT6q2UagVJ6nqy8R
 x0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712160560; x=1712765360;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cJGkPqgLotgtO7ANBHDe2iaPVVmF+jB98l0YWxqW6/k=;
 b=ZF2SXSot/oGAKYcEjg9zwvRmJaZLsQsnBo3MP2vtItkuL87GyAKjAuJEenlkDm0r7Z
 9ewNyH+rZaxQUh6I4U4wHL+XiEeLqLtzEDPU3rHOK9QbeZnrpn4AyfEp4ldGkUbP6WGO
 k6iPBZ8SvUdefBlPX6QG9YxY25IpcUexNwrsL7Kypsr8eHhbGQhwLfFse/JzjHLqTA5H
 AU+rL5boDYmvqDjCM5b7hZ+hn2kmL+vC2IKUDmNg9oMI5PSnSEjjYLI/BJOR2i3SgAjb
 vxA63NPyn+YSeqLUd8R6E0cDBs1aiGyhZJCHuqPfPBYu9SLDptU0yJAauzNpN9zZ+2XZ
 ZnVA==
X-Gm-Message-State: AOJu0YyFoC39Gm1dFMlvD5DOmVR5NzYANjjyfRpaPdC3tdHzBhvzCc4H
 bt15BI29VZGDfTa36YeW9t8hSe7XIW1we5P8uPxZQGAIBVyeDP4d7qogk8nRXJ0=
X-Google-Smtp-Source: AGHT+IEKGMoVHJs5Mt1qdCN2U2BOCAGVSZhFAtlJuWe5OVFdcn48StnJaUqx0UYa0bnq37blsZPcYQ==
X-Received: by 2002:adf:e6c6:0:b0:33e:ca28:bb59 with SMTP id
 y6-20020adfe6c6000000b0033eca28bb59mr4937214wrm.57.1712160560298; 
 Wed, 03 Apr 2024 09:09:20 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6212000000b0034181bea3b0sm17660583wru.3.2024.04.03.09.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 09:09:19 -0700 (PDT)
Message-ID: <abd4c1c9-0d4f-44ed-b7ae-73bb647e370b@ursulin.net>
Date: Wed, 3 Apr 2024 17:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/8] lib/igt_drm_clients: Fix leaks
Content-Language: en-GB
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-4-lucas.demarchi@intel.com>
 <Zg14L548QkvFBddf@unerlige-ril>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <Zg14L548QkvFBddf@unerlige-ril>
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


On 03/04/2024 16:39, Umesh Nerlige Ramappa wrote:
> On Tue, Apr 02, 2024 at 03:17:11PM -0700, Lucas De Marchi wrote:
>> Stop leaking memory-related fields.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> lib/igt_drm_clients.c | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>>
>> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>> index c8dc21d6a..c174c96ab 100644
>> --- a/lib/igt_drm_clients.c
>> +++ b/lib/igt_drm_clients.c
>> @@ -221,9 +221,19 @@ void igt_drm_client_free(struct igt_drm_client 
>> *c, bool clear)
>>         free(c->engines->names);
>>     }
>>     free(c->engines);
>> +
>>     free(c->val);
>>     free(c->last);
>>
>> +    if (c->regions) {
>> +        for (i = 0; i <= c->regions->max_region_id; i++)
>> +            free(c->regions->names[i]);
>> +        free(c->regions->names);
>> +    }
>> +    free(c->regions);
>> +
>> +    free(c->memory);
>> +
> 
> Looks correct as I don't see this being freed elsewhere.

I concur - good catch!

Regards,

Tvrtko

> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
>>     if (clear)
>>         memset(c, 0, sizeof(*c));
>> }
>> -- 
>> 2.43.0
>>
