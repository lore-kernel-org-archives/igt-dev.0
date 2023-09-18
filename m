Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5485410E209
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 08:12:55 +0000 (UTC)
Message-ID: <e9aa16da-8d32-38f9-d0e3-e3c3b1d5a909@intel.com>
Date: Mon, 18 Sep 2023 10:12:44 +0200
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
 <20230904110458.24177-3-sai.gowtham.ch@intel.com>
 <20230904123934.stxmaelmzxg3366l@zkempczy-mobl2>
 <60144754-af81-692d-a20e-84d4fbd2fcc0@intel.com>
 <20230913073922.4j6lleyaajxbaks6@zkempczy-mobl2>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230913073922.4j6lleyaajxbaks6@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/intel_blt: check if blt
 commands are supported by the platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 13.09.2023 09:39, Zbigniew Kempczyński wrote:
> On Mon, Sep 11, 2023 at 01:09:31PM +0200, Karolina Stolarek wrote:
>> On 4.09.2023 14:39, Zbigniew Kempczyński wrote:
>>> On Mon, Sep 04, 2023 at 04:34:56PM +0530, sai.gowtham.ch@intel.com wrote:
>>>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>>>
>>>> Check if mem-copy/mem-set commands are supported by fd device.
>>>>
>>>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>>> ---
>>>>    lib/intel_blt.c | 32 ++++++++++++++++++++++++++++++++
>>>>    lib/intel_blt.h |  2 ++
>>>>    2 files changed, 34 insertions(+)
>>>>
>>>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>>>> index 429511920..b55fa9b52 100644
>>>> --- a/lib/intel_blt.c
>>>> +++ b/lib/intel_blt.c
>>>> @@ -289,6 +289,38 @@ bool blt_has_block_copy(int fd)
>>>>    	return blt_supports_command(cmds_info, XY_BLOCK_COPY);
>>>>    }
>>>> +/**
>>>> + * blt_has_mem_copy
>>>> + * @fd: drm fd
>>>> + *
>>>> + * Check if mem copy is supported by @fd device
>>>> + *
>>>> + * Returns:
>>>> + * true if it does, false otherwise.
>>>> + */
>>>> +bool blt_has_mem_copy(int fd)
>>>> +{
>>>> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>>>> +
>>>> +	return blt_supports_command(cmds_info, MEM_COPY);
>>>> +}
>>>> +
>>>> +/**
>>>> + * blt_has_mem_set
>>>> + * @fd: drm fd
>>>> + *
>>>> + * Check if mem set is supported by @fd device
>>>> + *
>>>> + * Returns:
>>>> + * true if it does, false otherwise.
>>>> + */
>>>> +bool blt_has_mem_set(int fd)
>>>> +{
>>>> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>>>> +
>>>> +	return blt_supports_command(cmds_info, MEM_SET);
>>>> +}
>>>> +
>>>
>>> It is not true if you'll use those functions in i915 igts.
>>> mem-set and mem-copy commands you've introduced in 1/4 patch
>>> should be part of intel_blt.[ch] library.
>>
>> Following this logic, we'd need to provide XY_SRC_COPY_BLT in intel_blt
>> library as well. We don't -- mostly because intel_blt lacks support for
>> relocations.
> 
> Yes, I hoped we will add this implementation. Adding relocations isn't
> problem here but I would stick to softpinning/vm_bind at the moment.

I was asked about adding support for relocations to intel_blt at least 
once, and I experienced it as a problem myself when working on 
gem_blits. So, it would be good to see them introduced there.

The tests that use blit commands are expected to work across 
generations. The blit library won't be widely adopted unless we provide 
support for relocations.

> Perfect would be if we claim that some command is supported we provide
> an implementation of such blit command for i915/xe.

OK, that's new to me, especially given the fact that we allow folks to 
query about supported commands even if they build them on their own. 
This library can exist on its own and doesn't have to be tied to 
intel_blt. I mean, it is now due to the review comments I got during the 
review.

But I agree, the ultimate goal would be to get everyone to use 
intel_blt, but it's not ready for it, yet.

All the best,
Karolina

> 
>>
>> blt_has_<command> are lightweight checks that only say if you can issue a
>> specific command to a platform, and they don't depend on a driver. They
>> don't guarantee that a specific blitter function is implemented in
>> intel_blt.
>>
>> This confusion shows that we should've keep intel_cmds_info and intel_blt
>> libraries separated from the beginning. Yes, they are closely related, but
>> it's intel_blt quering intel_cmds_info about hardware capabilities, not
>> implemented features.
> 
> Converging intel_blt to have implementation of supported hw blits should
> be our target - that's why I'm asking for mem_set/copy. Adding
> xy-src-copy and test it inside gem|xe_exercise_blt will close this gap.
> 
> --
> Zbigniew
> 
>>
>> Many thanks,
>> Karolina
>>
>>>
>>> BTW first patch 1/4 won't compile in step-by-step mode because
>>> it uses code from following patches.
>>>
>>> --
>>> Zbigniew
>>>
>>>
>>>>    /**
>>>>     * blt_has_fast_copy
>>>>     * @fd: drm fd
>>>> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
>>>> index b8b3d724d..d9c8883c7 100644
>>>> --- a/lib/intel_blt.h
>>>> +++ b/lib/intel_blt.h
>>>> @@ -175,6 +175,8 @@ bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
>>>>    			  uint32_t prop);
>>>>    bool blt_has_block_copy(int fd);
>>>> +bool blt_has_mem_copy(int fd);
>>>> +bool blt_has_mem_set(int fd);
>>>>    bool blt_has_fast_copy(int fd);
>>>>    bool blt_has_xy_src_copy(int fd);
>>>>    bool blt_has_xy_color(int fd);
>>>> -- 
>>>> 2.39.1
>>>>
