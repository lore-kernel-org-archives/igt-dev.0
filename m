Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC3D10E720
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 17:35:15 +0000 (UTC)
Message-ID: <729f7f3d-1e7b-4072-8d5b-fb15d0629722@intel.com>
Date: Wed, 17 Jan 2024 18:35:02 +0100
Subject: Re: [PATCH i-g-t v4 2/3] lib/xe/xe_query: Fix compilation -Wshadow
 warning
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>
References: <20240117133050.19605-1-nirmoy.das@intel.com>
 <20240117133050.19605-2-nirmoy.das@intel.com>
 <20240117171142.p45uj3p6dsad24dr@kamilkon-desk.igk.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240117171142.p45uj3p6dsad24dr@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 1/17/2024 6:11 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
> On 2024-01-17 at 14:30:48 +0100, Nirmoy Das wrote:
>> Fix -Wshadow warning when xe_for_each_engine() and
>> xe_for_each_mem_region are used together.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>> ---
>>   lib/xe/xe_query.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> index 1e3a7bdb9..032db1308 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -67,8 +67,8 @@ struct xe_device {
>>   	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
>>   
>>   #define xe_for_each_mem_region(__fd, __memreg, __r) \
>> -	for (uint64_t __i = 0; __i < igt_fls(__memreg); __i++) \
>> -		for_if(__r = (__memreg & (1ull << __i)))
>> +	for (uint64_t __j = 0; __j < igt_fls(__memreg); __j++) \
>> +		for_if(__r = (__memreg & (1ull << __j)))
> You can also use
>      igt_unique(__j)
>
> here, it will prevent collision with user __j var, or maybe use
>      igt_uniq(__j_mem)

Neat, I will resend with the 1st option.

Thanks,

Nirmoy

>
> Regards,
> Kamil
>
>>   
>>   #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
>>   #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
>> -- 
>> 2.42.0
>>
