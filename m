Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7D510E1C0
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 08:40:02 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5042bfb4fe9so899684e87.1
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Oct 2023 01:40:02 -0700 (PDT)
Message-ID: <e06efa0c-8f9f-dbb6-fbea-1199766d79d8@gmail.com>
Date: Thu, 5 Oct 2023 11:39:54 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231004134722.319334-1-juhapekka.heikkila@gmail.com>
 <73b5370c-a61b-46e7-8041-2809ad8c3f50@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <73b5370c-a61b-46e7-8041-2809ad8c3f50@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: on Xe driver take into
 account adlp with no extended block copy
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
List-ID: <igt-dev@lists.freedesktop.org>

Hei Maarten,

On 4.10.2023 19.41, Maarten Lankhorst wrote:
> Hey,
> 
> Patch looks good, but right below HAS_FLATCCS is used instead.
> 
> Could you fix that too for consistency?

That is not cosmetic change, it will affect mtl behavior. Currently I 
don't have access to machine which would match to what ci has so I 
cannot test what will happen.

/Juha-Pekka

> 
> With that amended,
> 
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Den 2023-10-04 kl. 15:47, skrev Juha-Pekka Heikkila:
>> With Xe add check to not use extended block copy if it is not available.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_fb.c | 20 +++++++++++---------
>>   1 file changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index f0c0681ab..54a66eb6a 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -2920,17 +2920,19 @@ static void blitcopy(const struct igt_fb *dst_fb,
>>               blt_set_copy_object(&blt.src, src);
>>               blt_set_copy_object(&blt.dst, dst);
>> -            blt_set_object_ext(&ext.src,
>> -                       blt_compression_format(&blt, src_fb),
>> -                       src_fb->width, src_fb->height,
>> -                       SURFACE_TYPE_2D);
>> +            if (blt_uses_extended_block_copy(src_fb->fd)) {
>> +                blt_set_object_ext(&ext.src,
>> +                        blt_compression_format(&blt, src_fb),
>> +                        src_fb->width, src_fb->height,
>> +                        SURFACE_TYPE_2D);
>> -            blt_set_object_ext(&ext.dst,
>> -                       blt_compression_format(&blt, dst_fb),
>> -                       dst_fb->width, dst_fb->height,
>> -                       SURFACE_TYPE_2D);
>> +                blt_set_object_ext(&ext.dst,
>> +                        blt_compression_format(&blt, dst_fb),
>> +                        dst_fb->width, dst_fb->height,
>> +                        SURFACE_TYPE_2D);
>> -            pext = &ext;
>> +                pext = &ext;
>> +            }
>>               blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
