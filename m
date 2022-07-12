Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7732B8EB8C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 13:49:19 +0000 (UTC)
Message-ID: <603160e5-3bd1-0c95-f17c-19b8dbee6438@linux.intel.com>
Date: Tue, 12 Jul 2022 15:49:15 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20220711120750.657-1-nirmoy.das () intel ! com>
 <06ceae96-fe53-7684-f88a-d00654ed7e58@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <06ceae96-fe53-7684-f88a-d00654ed7e58@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_query: fix cache type
 iteration
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


On 7/12/2022 2:27 PM, Andrzej Hajda wrote:
>
>
> On 11.07.2022 14:07, Nirmoy Das wrote:
>> Iterate over each cache types otherwise this will get
>> stuck in infinite loop if the value starts with 0 1st bit.
>>
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6249
>> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/i915/i915_query.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
>> index b33ffecff..ca500d2be 100644
>> --- a/tests/i915/i915_query.c
>> +++ b/tests/i915/i915_query.c
>> @@ -1348,8 +1348,7 @@ static void 
>> query_parse_and_validate_hwconfig_table(int i915)
>>               if (!value)
>>                   igt_info("-\n");
>>   -            j = 0;
>> -            while (value) {
>> +            for (j = 0; value; j++) {
>>                   if (value & BIT(j)) {
>>                       value &= ~BIT(j);
>>                       igt_assert(j < __INTEL_HWCONFIG_CACHE_TYPE_LIMIT);
>
> Personally I would put "j < __INTEL_HWCONFIG_CACHE_TYPE_LIMIT" to 
> 'for' condition check, then add igt_assert(!value) after loop


Sounds good, I will resend.


>
> Anyway:
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


I will carry this to the next rev.


Thanks,

Nirmoy

>
> Regards
> Andrzej
