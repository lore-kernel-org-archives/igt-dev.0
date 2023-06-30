Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C9410E1EF
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 07:20:28 +0000 (UTC)
Message-ID: <d085ea43-0f4d-24f7-11dd-0278d68587d7@intel.com>
Date: Fri, 30 Jun 2023 09:20:13 +0200
Content-Language: en-US
To: <juhapekka.heikkila@gmail.com>
References: <20230627172210.4599-1-juhapekka.heikkila@gmail.com>
 <20230627172210.4599-3-juhapekka.heikkila@gmail.com>
 <41adde8f-53ce-856e-e355-8939f13988f2@intel.com>
 <744da5cd-3b56-1504-da6b-193e26e4c605@gmail.com>
 <8af0e399-4a30-c919-32c9-472539318b99@intel.com>
 <ed84e5dd-e80e-b65a-1f12-3123029b41c5@gmail.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <ed84e5dd-e80e-b65a-1f12-3123029b41c5@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_fb: include lib/intel_blt
 functions to blitter path
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 29.06.2023 18:04, Juha-Pekka Heikkila wrote:
<big snip>

>>>>> +            blt_set_copy_object(&blt.src, src);
>>>>> +            blt_set_copy_object(&blt.dst, dst);
>>>>> +
>>>>> +            if (HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))) {
>>>>
>>>> This check might not be correct on some platforms. To check if we 
>>>> need to fill in ext part, you could do a similar check as in commit 
>>>> 45da871dd268 ("tests/gem_ccs: Check for extended block-copy and 
>>>> compression support").
>>>>
>>>> +Zbigniew, what is the status of HAS_FLATCCS? How is it useful in 
>>>> the context of blitter copy? I believe we want to switch to using 
>>>> command flags, like BLT_CMD_EXTENDED? Or am I misremembering something?
>>>>
>>>
>>> This is bit double edged situation. Even if for MTL there would be 
>>> added support for compression into intel_blt, all the related 
>>> handling for aux ccs would still not be here on igt_fb.c. For flat 
>>> ccs everything that is needed is now in place and for time being it 
>>> seems correct, everything matches. Do note this in not only 
>>> controlled by HAS_FLATCCS() but also by modifiers which actually 
>>> arrive onto this part of code.
>>
>> Hmm, I see, let's leave it for now and we can revisit it in the future.
>>
>> Thanks for answering my questions. Like I said, there are two nits 
>> that would be good to tidy up, but everything else looks good to me:
>>
>> Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
> 
> Thanks Karolina. In the mean time this patch was separated into two 
> parts, one where there were couple of more Xe related changes and other 
> where these blitting related changes. May I use this R-b here
> 
> https://patchwork.freedesktop.org/patch/544642/?series=119886&rev=4

Yes, please do

> ?
> 
> Those few alignment fixes and small adjustments I'll apply before 
> pushing if I will not need another ci round.

I think you're good to go, the reported regressions seem unrelated to 
your patches.

Many thanks,
Karolina

> 
> /Juha-Pekka
