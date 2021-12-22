Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B08811296C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Dec 2021 09:31:00 +0000 (UTC)
Message-ID: <a45449d0-2b52-11c2-af22-31b16accdcb3@linux.intel.com>
Date: Wed, 22 Dec 2021 09:30:49 +0000
MIME-Version: 1.0
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20211209082053.1412439-1-mastanx.katragadda@intel.com>
 <36f819b9-8001-6087-8379-df57de5b1d73@linux.intel.com>
In-Reply-To: <36f819b9-8001-6087-8379-df57de5b1d73@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
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
To: Mastan Katragadda <mastanx.katragadda@intel.com>, igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Cc: "Bloomfield, Jon" <jon.bloomfield@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>


I see this has been merged despite my complaint that the commit message 
is not transparent enough and without public arch level acks.

On 10/12/2021 10:02, Tvrtko Ursulin wrote:
> 
> Old commit message:
> 
> """
> This a known failure when running 
> igt@gem_exec_balancer@bonded-(dual|pair|sync)
> tests with GuC submission.The hang is expected with GuC submission since 
> the
> test was written to expect execlist scheduling hence added skip if Guc
> submission enabled.
> """
> 
> New commit message:
> 
> On 09/12/2021 08:20, Mastan Katragadda wrote:
>> This test makes assumptions about the backend scheduling algorithm that
>> a real world UMD would never assume. This test is not testing a UMD-KMD
>> contract, rather a specific backend.It is an invalid test case thus we
>> are skipping.
>>
>> Changes Since v1:
>>               -Updated commit message
> 
> Well that hasn't been really improved at all an is still totally opaque. 
> No mention whether it is all or some subtests, no mention of what 
> assumptions, what exact usage of the ABI is discouraged, not much more 
> than pure rewording.
> 
> No desire to split into passing and non passing tests and only skip 
> latter group?
> 
> Or to add a twist, what about making the specific subtests which hang 
> with GuC, expect to hang and therefore pass?
> 
> That would a) document the failing corner case of the ABI and more 
> importantly b) keep exercising the i915 code paths which sit between the 
> uAPI and the GuC firmware?
> 
> If that is not acceptable, and I do acknowledge to the cost to CI time, 
> then architects should ack and in my mind the ack should mean one of the 
> two things. Either:
> 
>   1) We know there is coverage for the same i915 code paths elsewhere in 
> IGT. Or:
> 
>   2) We are willingly dropping coverage for these i915 code paths on GuC 
> platforms with the risk that the code might unknowingly bit rot and 
> cause more serious security issues down the line.

And no acks to the effect of either 1) or 2) were given. So git history 
will not show what is this allegedly backend specific behavior, neither 
it will clarify which parts of the uapi are stopped being tested in GuC 
mode.

Regards,

Tvrtko
