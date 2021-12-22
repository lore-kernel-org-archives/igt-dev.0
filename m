Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0977C10E2AF
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Dec 2021 21:02:22 +0000 (UTC)
Message-ID: <7ce26c0e-22f7-3129-3ff5-d5384e9ce620@intel.com>
Date: Wed, 22 Dec 2021 13:02:13 -0800
Content-Language: en-GB
References: <20211209082053.1412439-1-mastanx.katragadda@intel.com>
 <36f819b9-8001-6087-8379-df57de5b1d73@linux.intel.com>
 <a45449d0-2b52-11c2-af22-31b16accdcb3@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <a45449d0-2b52-11c2-af22-31b16accdcb3@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip Guc
 Submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Mastan Katragadda <mastanx.katragadda@intel.com>, igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Cc: "Bloomfield, Jon" <jon.bloomfield@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

On 12/22/2021 01:30, Tvrtko Ursulin wrote:
> I see this has been merged despite my complaint that the commit 
> message is not transparent enough and without public arch level acks.
I would ack a revert if you want to post it...

>
> On 10/12/2021 10:02, Tvrtko Ursulin wrote:
>>
>> Old commit message:
>>
>> """
>> This a known failure when running 
>> igt@gem_exec_balancer@bonded-(dual|pair|sync)
>> tests with GuC submission.The hang is expected with GuC submission 
>> since the
>> test was written to expect execlist scheduling hence added skip if Guc
>> submission enabled.
>> """
>>
>> New commit message:
>>
>> On 09/12/2021 08:20, Mastan Katragadda wrote:
>>> This test makes assumptions about the backend scheduling algorithm that
>>> a real world UMD would never assume. This test is not testing a UMD-KMD
>>> contract, rather a specific backend.It is an invalid test case thus we
>>> are skipping.
>>>
>>> Changes Since v1:
>>>               -Updated commit message
>>
>> Well that hasn't been really improved at all an is still totally 
>> opaque. No mention whether it is all or some subtests, no mention of 
>> what assumptions, what exact usage of the ABI is discouraged, not 
>> much more than pure rewording.
>>
>> No desire to split into passing and non passing tests and only skip 
>> latter group?
It's not clear from the patch itself, but looking at the code this 
change appears to only affect a specific set of subtests. Those being 
'sliced' and 'bonded-(pair|dual|sync)'. It's not actually disabling the 
entire gem_exec_balancer suite. That is really not clear from the 
subject or commit description, though. And I totally agree that it 
should be documenting a) what the test is doing and b) why that 
behaviour is both backend specific and unreasonable for a UMD.

My understanding is that gem_exec_balancer had already been updated to 
support the new parallel extension as well as the old bonding extension. 
So any subtest with 'parallel' as the prefix is supposed to work with 
GuC submission. Having said that, there are odd other subtests that are 
not obviously related to either bonded nor parallel submission (such as 
persistence, noheartbeat, nohangcheck) which I recall do rely on 
execlist backend implementations and therefore have issues when using 
GuC submission.

I totally agree that we should not be blanket disabling an entire test 
suite or even sub-group with such a generic stated reason. The bonded 
tests (and parallel tests) are meant to check for the presence of the 
appropriate API and skip if not available. They should not be skipping 
based on arbitrary assumptions about the platform.


>>
>> Or to add a twist, what about making the specific subtests which hang 
>> with GuC, expect to hang and therefore pass?
Seems unnecessarily complicated. Why require that something is broken? 
If a test is specific to a backend implementation then the behaviour is 
undefined on any other implementation. It may hang, it may pass, it may 
be random each time you run it. If a test is not relevant to a given 
platform, I would say that it should just be skipped.

>> That would a) document the failing corner case of the ABI and more 
>> importantly b) keep exercising the i915 code paths which sit between 
>> the uAPI and the GuC firmware?
You can't exercise code paths which don't exist. Bonding is 
fundamentally an i915 only implementation. Persistence is partially 
implemented inside the execlist backend. So you can't get to the low 
level code of either when GuC submission is enabled no matter what 
hideousness you put in the test.

>>
>> If that is not acceptable, and I do acknowledge to the cost to CI 
>> time, then architects should ack and in my mind the ack should mean 
>> one of the two things. Either:
>>
>>   1) We know there is coverage for the same i915 code paths elsewhere 
>> in IGT. Or:
That exists when running on older platforms that support the feature 
being tested.

>>
>>   2) We are willingly dropping coverage for these i915 code paths on 
>> GuC platforms with the risk that the code might unknowingly bit rot 
>> and cause more serious security issues down the line.
But we don't care if the code rots for platforms it does not support 
because it doesn't support them.

>
> And no acks to the effect of either 1) or 2) were given. So git 
> history will not show what is this allegedly backend specific 
> behavior, neither it will clarify which parts of the uapi are stopped 
> being tested in GuC mode.
I agree entirely with this. And would go further to say that the test 
code itself should be documenting what it is doing, what it is trying to 
test and why it things that is not applicable to a given platform if it 
is going to skip that platform.

John.


>
> Regards,
>
> Tvrtko
