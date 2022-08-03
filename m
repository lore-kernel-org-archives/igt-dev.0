Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42A11126D3
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 07:45:49 +0000 (UTC)
Message-ID: <bb93a3cf-17de-67ac-66c9-39d4c24f3e27@intel.com>
Date: Wed, 3 Aug 2022 09:45:49 +0200
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <cover.1658826356.git.karolina.drobnik@intel.com>
 <2468862.4XsnlVU6TS@jkrzyszt-mobl1.ger.corp.intel.com>
 <8384c9cb-e870-6a3a-15cb-c223bf6243eb@intel.com>
 <8978773.CDJkKcVGEf@jkrzyszt-mobl1.ger.corp.intel.com>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <8978773.CDJkKcVGEf@jkrzyszt-mobl1.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/gem_exec_fence: Check
 stored values only for valid workloads
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 03.08.2022 09:21, Janusz Krzysztofik wrote:
> On Tuesday, 2 August 2022 12:20:29 CEST Karolina Drobnik wrote:
>> Hi,
>>
>> On 01.08.2022 16:43, Janusz Krzysztofik wrote:
>>> On Monday, 1 August 2022 15:39:36 CEST Karolina Drobnik wrote:

<big snip>

>>>>>>> The patch introduces two processing paths to test_fence_await(), one
> of them
>>>>>>> for *-hang variants.  In that *-hang processing path, why do we still
> submit
>>>>>>> batches that depend on the fence if we don't examine their execution
> and
>>>>>>> results, only their completion?
>>>>>>
>>>>>> Ah, OK, now I get it. Do you suggest that we should also add a check
> for
>>>>>> HANG flag for igt_store_word block? But we still need to send something
>>>>>> to test this case.
>>>>>
>>>>> Why do we need to send something?  What that something should look like?
> IOW,
>>>>> what are we trying to exercise with this case?  How is it supposed to be
>>>>> different from wait-hang scenario?
>>>>
>>>> test_fence_await tests pipelining work (here, writing something to
>>>> memory in parallel) and cross-checks its status with what's reported by
>>>> the fence,
>>>
>>> True for *await (no HANG) subtests, but in *await-hang variants I still
> can't
>>> recognize checks in place as cross-checks and what value they add compared
> to
>>> wait-hang.
>>
>> wait_hang and await_hang are different in the sense of work they do.
>> test_fence_busy is a test with a simple batch buffer (with no actual
>> writes) that is _iteratively_ executed on different physical engines,
>> whereas test_fence_await spawns work on different engines in _parallel_.
>> It's a different scenario from the fence's perspective, as we have one
>> fence on the spinner and pass it to other engines which (asynchronously)
>> wait on it. The value added here is the check for 1 fence - many engines
>> (wait_hang has 1-1 mapping).
>>
>>> Does a check for invalidated work no longer queued nor running
>>> tell us anything about the fence behavior, i.e., if and how it affected /
>>> interacted with that work?  I think it doesn't, then, I'm not sure if we
> still
>>> need such limited scenarios.
>>
>> I don't think I quite understand -- we check if we've sent a hanging
>> workload, which is expected to result in an error, there's no additional
>> check for the work itself (how one could check it?). As the error is
>> raised from any of the engines (I'm taking about the await case), the
>> fence is expected to signal, and this is what we check. The fence itself
>> can't interact with that work
>>
>>> Please convince me that we do and I'll be happy
>>> to push the series with my S-o-b: added.
>>
>> I have commit rights now, so I can push it myself,
> 
> OK, let's take a different approach then.  Please feel free to push the series
> with R-b:s collected so far yourself, and I'll try to update and restore
> disabled checks in a follow-up patch.

OK, that sounds like a plan, thanks. You can CC the list of people we 
have here for better visibility (and, hopefully, more feedback).

Many thanks,
Karolina

> Thanks,
> Janusz
> 
