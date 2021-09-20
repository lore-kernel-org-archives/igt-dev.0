Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436EC89ECB
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 09:22:32 +0000 (UTC)
References: <20210916180301.6791-1-matthew.brost@intel.com>
 <20210916180301.6791-4-matthew.brost@intel.com>
 <900219d9-5e70-faa1-bb25-7f01c2d14738@intel.com>
 <eb7fe459-226d-6426-e6f8-99e09637866a@linux.intel.com>
 <20210917161405.GA1054@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <a8d459f8-bee9-358d-a018-fe4dc54bcca9@linux.intel.com>
Date: Mon, 20 Sep 2021 10:22:28 +0100
MIME-Version: 1.0
In-Reply-To: <20210917161405.GA1054@jons-linux-dev-box>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] i915/sysfs_preempt_timeout: Update
 test to work with GuC submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>, igt-dev@lists.freedesktop.org, daniele.ceraolospurio@intel.com
List-ID: <igt-dev@lists.freedesktop.org>


On 17/09/2021 17:14, Matthew Brost wrote:
> On Fri, Sep 17, 2021 at 08:36:19AM +0100, Tvrtko Ursulin wrote:
>>
>> On 16/09/2021 21:49, John Harrison wrote:
>>> On 9/16/2021 11:03, Matthew Brost wrote:
>>>> Increase reset timeout as resets can take a bit longer with GuC
>>>> submission because an error capture is done and with a large GuC log (16
>>>> MB) these take a while.
>>>>
>>>> Don't run 'off' section as with GuC submission we don't handle
>>>> dynamically changing the preemption timeout from 'off' to 'on' on a
>>>> currently running context. This is not bug in GuC submission rather an
>>>> architectural decision to not implement this as there is no user aside
>>>> from IGTs. We don't run this section on any gen12+ platforms as we
>>>> assume GuC submission on these platforms.
>>
>> Tigerlake as well or not care about removing the coverage from it?
>>
> 
> Tigerlake is skipped as well. I don't think we care about removing
> coverage as this section isn't really a real world use case.
> 
> e.g. I don't a UMD will ever:
> 
> Turn off preemption
> Create and submit a contet
> Turn on preemption and expect an existing context to have the new preemption value

I am pedantic against both commit text and code with comment, emphasis mine:

1)
"..._any gen12+_ platforms as we assume _GuC_ submission on these 
platforms."

2)
   /* Not a supported behavior for _GuC enabled platforms_ */
   igt_require(intel_gen(intel_get_drm_devid(i915)) _< 12_);

Regards,

Tvrtko

> Matt
> 
>> Regards,
>>
>> Tvrtko
>>
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>> ---
>>>>    tests/i915/sysfs_preempt_timeout.c | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/i915/sysfs_preempt_timeout.c
>>>> b/tests/i915/sysfs_preempt_timeout.c
>>>> index d176ae72e..fe6b30236 100644
>>>> --- a/tests/i915/sysfs_preempt_timeout.c
>>>> +++ b/tests/i915/sysfs_preempt_timeout.c
>>>> @@ -29,6 +29,7 @@
>>>>    #include <sys/types.h>
>>>>    #include <unistd.h>
>>>> +#include "igt.h"
>>>>    #include "igt_params.h"
>>>>    #include "drmtest.h"
>>>>    #include "i915/gem.h"
>>>> @@ -41,7 +42,7 @@
>>>>    #include "sw_sync.h"
>>>>    #define ATTR "preempt_timeout_ms"
>>>> -#define RESET_TIMEOUT 50 /* milliseconds, at least one jiffie for
>>>> kworker */
>>>> +#define RESET_TIMEOUT 1000 /* milliseconds, at long enough for an
>>>> error capture */
>>>>    static bool __enable_hangcheck(int dir, bool state)
>>>>    {
>>>> @@ -254,6 +255,9 @@ static void test_off(int i915, int engine)
>>>>        gem_quiescent_gpu(i915);
>>>>        igt_require(enable_hangcheck(i915, false));
>>>> +    /* Not a supported behavior for GuC enabled platforms */
>>>> +    igt_require(intel_gen(intel_get_drm_devid(i915)) < 12);
>>>> +
>>>>        igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
>>>>        igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
>>>
