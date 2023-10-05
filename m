Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F2810E3E6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 12:35:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so8625725e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Oct 2023 05:35:30 -0700 (PDT)
Message-ID: <660121ed-7973-6a64-209a-8186639db59e@gmail.com>
Date: Thu, 5 Oct 2023 15:35:23 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231004134722.319334-1-juhapekka.heikkila@gmail.com>
 <20231005111009.3bhbl4qaz4pwlnir@kamilkon-desk.igk.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231005111009.3bhbl4qaz4pwlnir@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Kamil,

On 5.10.2023 14.10, Kamil Konieczny wrote:
> Hi Juha-Pekka,
> On 2023-10-04 at 16:47:22 +0300, Juha-Pekka Heikkila wrote:
> 
> Could you make your patch title a little shorter?
> 
> [PATCH i-g-t] lib/igt_fb: on Xe driver take into account adlp with no extended block copy
> 
> imho better:
> 
> [PATCH i-g-t] lib/igt_fb: fix for platforms with no extended block copy
> 

Alas I had already merged this because there were people asking to get 
it in.

>> With Xe add check to not use extended block copy if it is not available.
> ------ ^^
> Is it limited to Xe only?

This patch is only about Xe.

/Juha-Pekka

> 
> Regards,
> Kamil
> 
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_fb.c | 20 +++++++++++---------
>>   1 file changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index f0c0681ab..54a66eb6a 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -2920,17 +2920,19 @@ static void blitcopy(const struct igt_fb *dst_fb,
>>   			blt_set_copy_object(&blt.src, src);
>>   			blt_set_copy_object(&blt.dst, dst);
>>   
>> -			blt_set_object_ext(&ext.src,
>> -					   blt_compression_format(&blt, src_fb),
>> -					   src_fb->width, src_fb->height,
>> -					   SURFACE_TYPE_2D);
>> +			if (blt_uses_extended_block_copy(src_fb->fd)) {
>> +				blt_set_object_ext(&ext.src,
>> +						blt_compression_format(&blt, src_fb),
>> +						src_fb->width, src_fb->height,
>> +						SURFACE_TYPE_2D);
>>   
>> -			blt_set_object_ext(&ext.dst,
>> -					   blt_compression_format(&blt, dst_fb),
>> -					   dst_fb->width, dst_fb->height,
>> -					   SURFACE_TYPE_2D);
>> +				blt_set_object_ext(&ext.dst,
>> +						blt_compression_format(&blt, dst_fb),
>> +						dst_fb->width, dst_fb->height,
>> +						SURFACE_TYPE_2D);
>>   
>> -			pext = &ext;
>> +				pext = &ext;
>> +			}
>>   
>>   			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
>>   
>> -- 
>> 2.34.1
>>
