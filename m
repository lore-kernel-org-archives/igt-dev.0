Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <8644156f-219a-22c4-913e-84c3092d42db@linux.intel.com>
Date: Fri, 29 Sep 2023 12:11:01 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20230922134437.234888-1-tvrtko.ursulin@linux.intel.com>
 <20230922134437.234888-4-tvrtko.ursulin@linux.intel.com>
 <ZRSM9hSf71QJn8Pw@unerlige-ril>
 <6a9b5529-6b41-a29b-3608-81be00934fbf@linux.intel.com>
 <ZRXwyu8fXevwFvSz@unerlige-ril>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <ZRXwyu8fXevwFvSz@unerlige-ril>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 03/12] tools/intel_gpu_top: Restore user
 friendly error message
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 28/09/2023 22:31, Umesh Nerlige Ramappa wrote:
> On Thu, Sep 28, 2023 at 09:16:23AM +0100, Tvrtko Ursulin wrote:
>>
>> On 27/09/2023 21:13, Umesh Nerlige Ramappa wrote:
>>> On Fri, Sep 22, 2023 at 02:44:28PM +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> We have a nice error message displayed when an user with insufficient
>>>> permissions tries to run the tool, but that got lost while Meteorlake
>>>> support was added. Bring it back in.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> ---
>>>> tools/intel_gpu_top.c | 10 +++++++---
>>>> 1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>>>> index 87e9681e53b4..e01355f90458 100644
>>>> --- a/tools/intel_gpu_top.c
>>>> +++ b/tools/intel_gpu_top.c
>>>> @@ -554,9 +554,11 @@ static int get_num_gts(uint64_t type)
>>>>
>>>>         close(fd);
>>>>     }
>>>> -    assert(!errno || errno == ENOENT);
>>>> -    assert(cnt > 0);
>>>> -    errno = 0;
>>>> +
>>>> +    if (!cnt)
>>>> +        cnt = errno;
>>>> +    else
>>>> +        errno = 0;
>>>
>>> ENOENT is the only way this logic is checking for num_gts.
>>>
>>> In this case error is propagated only if cnt == 0. What if cnt=1 and 
>>> we get an error (other than ENOENT)? Should we ignore that?
>>
>> If cnt >= 1 then at least one tile was found so the errno happened 
>> while probing for further tiles. So on single tile parts it can be 
>> ignored.
> 
> I am actually only referring to single tile parts. The for loop iterates 
> over MAX_GTs (4), so I am expecting an ENOENT from a single tile part 
> when cnt >= 1. Anything else is an error/failure that we should flag.

Yes I think that worked fine in v1. Only thing I did not do is bother to 
pass on the unexpected errno on multi-tile. Anyway, I have sent v2 with 
the below condition.

Regards,

Tvrtko

> 
>> On multi-tile parts it cannot really happen, or even if it happens 
>> situation would simply be "why is only one tile showing". If we want 
>> to cover this impossible/unlikely case then maybe like this:
>>
>>     if (!cnt || (errno && errno != ENOENT))
>>         cnt = -errno;
> 
> If you agree to the above logic, then this condition should do the trick.
> 
> Regards,
> Umesh
>>
>>> I had something like this in mind for the regression (and sorry this 
>>> fell through the cracks)
>>>
>>> https://patchwork.freedesktop.org/patch/541406/?series=118973&rev=1
>>
>> Oh back in June!
>>
>> I think yours work too, in which case it's a matter of a style choice 
>> with which one to go. I don't have a strong preference - above would 
>> be a bit more compact, while I think it still succinctly expresses the 
>> failure condition ("nothing found or unexpected error while probing 
>> for remote tiles").
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Regards,
>>> Umesh
>>>
>>>>
>>>>     return cnt;
>>>> }
>>>> @@ -590,6 +592,8 @@ static int pmu_init(struct engines *engines)
>>>>     engines->fd = -1;
>>>>     engines->num_counters = 0;
>>>>     engines->num_gts = get_num_gts(type);
>>>> +    if (engines->num_gts <= 0)
>>>> +        return -1;
>>>>
>>>>     engines->irq.config = I915_PMU_INTERRUPTS;
>>>>     fd = _open_pmu(type, engines->num_counters, &engines->irq, 
>>>> engines->fd);
>>>> -- 
>>>> 2.39.2
>>>>
