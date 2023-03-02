Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD4210E06D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Mar 2023 13:50:40 +0000 (UTC)
Message-ID: <b5d9cb0e-9a5d-52e5-db97-21e9ca2d0601@linux.intel.com>
Date: Thu, 2 Mar 2023 13:50:36 +0000
MIME-Version: 1.0
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230110194720.190515-1-ashutosh.dixit@intel.com>
 <20230110194720.190515-2-ashutosh.dixit@intel.com>
 <28df83ea-b443-3135-ccbf-f3fdc233e2ab@linux.intel.com>
 <87r0urtw29.wl-ashutosh.dixit@intel.com>
 <40ca1545-6d12-ca17-b7fc-028626fcd156@linux.intel.com>
In-Reply-To: <40ca1545-6d12-ca17-b7fc-028626fcd156@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/perf_pmu: Compare against
 requested freq in frequency subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 02/03/2023 13:37, Tvrtko Ursulin wrote:
> 
> On 15/02/2023 04:02, Dixit, Ashutosh wrote:
>> On Wed, 11 Jan 2023 01:54:59 -0800, Tvrtko Ursulin wrote:
>>>
>>
>> Hi Tvrtko,
>>
>> Sorry I completely missed your reply and only just saw it again. People
>> needing a recap of the previous discussion can see it here:
>>
>> https://patchwork.freedesktop.org/patch/512274/?series=110574&rev=3#comment_933447
>>
>>> On 10/01/2023 19:47, Ashutosh Dixit wrote:
>>>> After the i915 commit 95ccf312a1e4f ("drm/i915/guc/slpc: Allow SLPC 
>>>> to use
>>>> efficient frequency"), FW uses the requested freq as the efficient freq
>>>> which can exceed the max freq set. Therefore, in the "min freq" part 
>>>> of the
>>>> igt@perf_pmu@frequency subtest, compare the requested freq reported 
>>>> by PMU
>>>> not against the set freq but against the requested freq reported in 
>>>> sysfs.
>>>>
>>>> v2: Remove previously added delays. GuC FW is now updated to set 
>>>> min/max
>>>>       freq in top half so delays are not needed
>>>> v3: Increase tolerance between measured and requested freq to 10% to
>>>>       account for sporadic failures due to dynamically changing 
>>>> efficient
>>>>       freq. Also document the changes in code.
>>>>
>>>> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
>>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>> ---
>>>>    tests/i915/perf_pmu.c | 12 ++++++++++--
>>>>    1 file changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
>>>> index f363db2ba13..f9ef89fb0b3 100644
>>>> --- a/tests/i915/perf_pmu.c
>>>> +++ b/tests/i915/perf_pmu.c
>>>> @@ -1546,7 +1546,7 @@ test_interrupts_sync(int gem_fd)
>>>>    static void
>>>>    test_frequency(int gem_fd)
>>>>    {
>>>> -    uint32_t min_freq, max_freq, boost_freq;
>>>> +    uint32_t min_freq, max_freq, boost_freq, min_req;
>>>>     uint64_t val[2], start[2], slept;
>>>>     double min[2], max[2];
>>>>     igt_spin_t *spin;
>>>> @@ -1587,6 +1587,7 @@ test_frequency(int gem_fd)
>>>>         min[0] = 1e9*(val[0] - start[0]) / slept;
>>>>     min[1] = 1e9*(val[1] - start[1]) / slept;
>>>> +    min_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");
>>>
>>> So remove all of the above three igt_sysfs_set_u32 and test still passes
>>> right? What it is testing then?
>>
>> Yes, so since enabling efficient freq (RPe) has broken the kernel ABI was
>> cannot test that the PMU measured freq is min_freq. All we can do, 
>> fwiw, is
>> test that the PMU measured freq matches the freq exposed via the sysfs
>> interface (min_req) at this "min point".
>>
>> I believe what I was saying when we last discussed this was that we can
>> have two sets of tests:
>>
>> 1. Current tests with RPe enabled
>> 2. Expose a sysfs from i915 to disable RPe and then use that to go to the
>>     previous versions of the tests here
>>
>> So these patches are for case 1.
>>
>> Now about 2., considering that we are moving to the xe driver soon, I am
>> wondering if there is much ROI in exposing the RPe disabling sysfs from
>> i915. We might as well do something like that in xe? Or should this still
>> be done in i915?
>>
>> In any case, there is interest in closing out these two bugs if possible:
>>
>> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
>> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6786
>>
>> If we are not going to merge these patches (and assuming we won't change
>> i915), how about just saying that due to change in the kernel ABI these
>> tests are no longer valid and therefore blocklisting these tests and
>> closing the bugs as 'will not fix'?
> 
> How about we drop any notion of min/max from the test and just check 
> that the PMU sees what sysfs sees? Once with idle, once with busy 
> (frequency-idle, frequency-busy; via TEST_BUSY/!TEST_BUSY). Would that 
> work and be acceptable?

To clarify, my angle here is that perf_pmu is testing PMU and not the 
sysfs frequency control. In a sense any ABI breakage gets swept under 
the carpet which sucks but I see zero willingness to unbreak it. 
Certainly adding more sysfs knobs to work around it shouldn't be the way.

So either remove the test, with a clear admittance of why, or blacklist 
it on GuC platforms in the same way.

Regards,

Tvrtko
