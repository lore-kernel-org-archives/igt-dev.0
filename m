Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CB26EB54
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 08:39:35 +0000 (UTC)
References: <20211016002334.14580-1-ashutosh.dixit@intel.com>
 <15873c81-caec-c822-867f-7f0392606126@intel.com>
 <87czo1995c.wl-ashutosh.dixit@intel.com>
 <87bl3l98kq.wl-ashutosh.dixit@intel.com>
 <15e49c6a-6575-5279-2916-8ab74ada03a9@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <d95867b8-5e18-7fd0-58bf-eb404b375789@linux.intel.com>
Date: Tue, 19 Oct 2021 09:39:20 +0100
MIME-Version: 1.0
In-Reply-To: <15e49c6a-6575-5279-2916-8ab74ada03a9@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Return actual submission
 method from gem_submission_method
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


On 19/10/2021 08:16, John Harrison wrote:
> On 10/18/2021 17:12, Dixit, Ashutosh wrote:
>> On Mon, 18 Oct 2021 16:59:43 -0700, Dixit, Ashutosh wrote:
>>> On Mon, 18 Oct 2021 16:39:40 -0700, John Harrison wrote:
>>>> On 10/15/2021 17:23, Ashutosh Dixit wrote:
>>>>> gem_submission_method() purports to return the currently used 
>>>>> submission
>>>>> method by the driver, as evidenced by its callers. Therefore remove 
>>>>> the
>>>>> GEM_SUBMISSION_EXECLISTS flag when GuC submission is detected.
>>>>>
>>>>> This also fixes gem_has_execlists() to match its description, 
>>>>> previously
>>>>> gem_has_execlists() would return true even if GuC submission was 
>>>>> actually
>>>>> being used in the driver.
>>>>>
>>>>> Reported-by: John Harrison <john.c.harrison@intel.com>
>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>>> ---
>>>>>    lib/i915/gem_submission.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
>>>>> index 2627b802cfb..b037d04cc4a 100644
>>>>> --- a/lib/i915/gem_submission.c
>>>>> +++ b/lib/i915/gem_submission.c
>>>>> @@ -86,7 +86,7 @@ unsigned gem_submission_method(int fd)
>>>>>         return 0;
>>>>>         if (igt_sysfs_get_u32(dir, "enable_guc") & 1) {
>>>>> -        flags |= GEM_SUBMISSION_GUC | GEM_SUBMISSION_EXECLISTS;
>>>>> +        flags |= GEM_SUBMISSION_GUC;
>>>>>         goto out;
>>>>>     }
>>>>>
>>>> Looks good to me, but as per the comments in the other thread, this 
>>>> might
>>>> have unintended side effects. Have you gone through all instances of 
>>>> the
>>>> submission query usages to check how it is used and whether this 
>>>> will break
>>>> something? E.g. if something is explicitly testing for execlist 
>>>> support to
>>>> mean 'something better than ring buffer' then it would now fail.
>>> There are at present just these two instances of gem_has_execlists:
>>>
>>> *** tests/i915/gem_ctx_shared.c:
>>> disjoint_timelines[162]        igt_require(gem_has_execlists(i915));
>>>
>>> *** tests/i915/gem_watchdog.c:
>>> virtual[225]                   igt_require(gem_has_execlists(i915));
>>>
>>> I'll try to see if I can figure out if they will be affected in any
>>> way.
>> Actually, earlier these tests were running for both execlists and guc
>> submission. If they are meant to run even for guc then they will now skip
>> in the guc case after this patch.
>>
>> Therefore I am thinking the exact equivalent of what was going on earlier
>> is this condition:
>>     igt_require(gem_has_execlists() | gem_has_guc_submission());
>>
>> So that's all that is needed now correct? But what I am not sure of 
>> yet is
>> whether they were meant to run for guc too or just execlists.
> Not sure what the ctx_shared one is about. Possibly that should be some 
> kind of 'has_contexts()' test (although I thought ring submission did 
> have context support post Gen6?). The watchdog one I would guess should 
> be 'has_watchdog()' unless this is some more specific subtest? In 
> general, it sounds like the 'has_execlists() || has_guc()' test is 
> really 'has_scheduler()', but it really is test specific I think.

Yes, gem_watchdog should keep running both with execlists and GuC. 
Perhaps most correct would be to make it skip if set_load_balance fails 
with an errno which indicates creating virtual engines is not supported?

Gem_ctx_shared/disjoint-timlines could perhaps use gem_uses_ppgtt() (for 
create vm) and gem_scheduler_enabled() for context re-ordering.

Regards,

Tvrtko


