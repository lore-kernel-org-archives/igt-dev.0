Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC35C83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 14:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153510E292;
	Fri, 11 Jul 2025 14:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HHmh/Css";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253D410E292
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OFMQ1CKUOr/lTes/OFm3lomO7lQX9jGX+zWSaHvVuV8=; b=HHmh/CssB0nXRwhbGF4AEc45Hw
 sYdEwTmaA8+3COgyW/uYoY1JnK/uRrU/X9uUcnKsjjYaFFrjIAcTjfTjUuweQr3c/AZOc6UnpC2Em
 fR+2xM0et4ncvQYUroA9g+zE4GxPa5MOEZhDjoinnhxw5MzfemtneO6Iz8YdPWNYFWpWNQL7Q17Ej
 CMXVkqtqh9XUfx/MbSb/8ta5M0Ffez7UcT2nnPTJq5vq9gjUooHwPr+L3Ed7Cx1FajUPzdnhgDX++
 ZK6uQixOgq9KpYkXq7xMAe7JnU2FQ95CctBGzGv0GuVqJHu/TSaCpuFqUvRaiO9LfhnsC+iru5Y1r
 jYFFWVIw==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uaF0G-00FPhD-9M; Fri, 11 Jul 2025 16:45:32 +0200
Message-ID: <db8e01cb-058c-40e7-a272-a76ec924fef3@igalia.com>
Date: Fri, 11 Jul 2025 11:45:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/3] lib/igt_vc4: Fix musl libc compilation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, zlice555@gmail.com,
 Melissa Wen <mwen@igalia.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
 <20250710190017.167735-5-kamil.konieczny@linux.intel.com>
 <20250711113239.uxhsil4lkvbgnnm3@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250711113239.uxhsil4lkvbgnnm3@kamilkon-DESK.igk.intel.com>
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

Hi Kamil,

On 11/07/25 08:32, Kamil Konieczny wrote:
> Hi ,
> On 2025-07-10 at 21:00:14 +0200, Kamil Konieczny wrote:
>> Fix gcc compilation on Void Linux with musl C libs, where
>> PAGE_SIZE is already defined.
>>
> 
> Sorry, I forgot adding vc4 developers to Cc:
> 
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: Vignesh Raman <vignesh.raman@collabora.com>
> 
> Also +cc Andrzej Hajda <andrzej.hajda@intel.com>
> 
>> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   lib/igt_vc4.h | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
>> index fe7173c50..165872ba2 100644
>> --- a/lib/igt_vc4.h
>> +++ b/lib/igt_vc4.h
>> @@ -31,7 +31,13 @@
>>   #include "igt_fb.h"
>>   #include "vc4_drm.h"
>>   
>> -#define PAGE_SIZE 4096
>> +#ifndef PAGE_SIZE
>> +# define PAGE_SIZE 4096
>> +#else
>> +# if PAGE_SIZE != 4096
>> +#  error "Unexpected PAGE_SIZE"
>> +# endif
>> +#endif
> 
> I am not sure if vc4 needs exactly 4KB as bo, or is it good
> to have whatever comes from compilation environment?

The GPU uses 4KB pages, so, that's the reason we define PAGE_SIZE to
4096. It would be ideal to keep using the size of 4096 in vc4 tests.
Hence, I'd suggest you to just rename PAGE_SIZE to something like
GPU_PAGE_SIZE or VC4_PAGE_SIZE.

Thanks for CCing me!

Best Regards,
- Maíra

> Other proposed change was smaller:
> 
> #ifndef PAGE_SIZE
> #define PAGE_SIZE 4096
> #endif
> 
> Regards,
> Kamil
> 
>>   
>>   uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
>>   int igt_vc4_create_bo(int fd, size_t size);
>> -- 
>> 2.50.1
>>

