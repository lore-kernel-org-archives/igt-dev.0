Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752126E09F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 07:43:14 +0000 (UTC)
References: <20211015233845.12272-1-ashutosh.dixit@intel.com>
 <7fee0739-2ef5-f6c7-84fd-e73c9a8085f2@intel.com>
 <877deddfhs.wl-ashutosh.dixit@intel.com>
 <8d13e90a-04e8-47df-c2f5-a3afce04711a@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <784e8917-05cc-c5ed-ef98-dc21edda789b@linux.intel.com>
Date: Mon, 18 Oct 2021 08:43:10 +0100
MIME-Version: 1.0
In-Reply-To: <8d13e90a-04e8-47df-c2f5-a3afce04711a@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Fix gem_has_execlists to
 match description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John Harrison <john.c.harrison@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 16/10/2021 00:57, John Harrison wrote:
> On 10/15/2021 16:39, Dixit, Ashutosh wrote:
>> On Fri, 15 Oct 2021 16:42:12 -0700, John Harrison wrote:
>>> On 10/15/2021 16:38, Ashutosh Dixit wrote:
>>>> Driver is using execlists if it is not using GuC submission.
>>>> GEM_SUBMISSION_EXECLISTS flag indicates if execlist submission is
>>>> available, not if it is being used by the driver.
>>>>
>>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>> ---
>>>>    lib/i915/gem_submission.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
>>>> index 2627b802cfb..4312a73bd85 100644
>>>> --- a/lib/i915/gem_submission.c
>>>> +++ b/lib/i915/gem_submission.c
>>>> @@ -153,7 +153,7 @@ bool gem_has_semaphores(int fd)
>>>>     */
>>>>    bool gem_has_execlists(int fd)
>>>>    {
>>>> -    return gem_submission_method(fd) & GEM_SUBMISSION_EXECLISTS;
>>>> +    return !gem_has_guc_submission(fd);
>>> Don't we use ring submission on older platforms?
>> Hmm, I wasn't aware that there was yet another submission method :/
>>
>> So execlist submission is only available for gen >= 8 as the code 
>> says, in
>> case anyone knows?
> Yes. Execlists was new feature of the hardware not all that long ago 
> (ELSP and all that). Gen8 sounds plausible.

Yes Gen8+.

> Of course, it all depends why the code is asking the question? Does it 
> really need to know what the submission hardware is? Or is it actually 
> asking about the scheduling algorithm (as is the case for 
> gem_exec_fair). Or something else entirely? The scheduler question is 
> going to change again when we move to using the DRM scheduler instead of 
> our own private one in the execlist code. Currently though, I would 
> assume we use the execlist scheduler for ring submission but certainly 
> not for GuC submission (because the scheduler is in the hardware).

Nope, no scheduling with ringbuffer backend.

There is I915_PARAM_HAS_SCHEDULER and respective IGT helpers to query 
what kind of scheduling is supported on the device in question.

It will be on a test per test basis why it is asking the question and 
what would be the appropriate test.

Regards,

Tvrtko

> 
> John.
> 
>>
>>> Isn't the better fix to just not set the EXECLIST flag when GuC
>>> submission is detected?
>> Yes, let me post this patch too. Thanks!
> 
