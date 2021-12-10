Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EEC10E1F7
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 16:22:30 +0000 (UTC)
Message-ID: <9bdd7ca5-b39e-b55e-ec80-2aeee1b6906f@amd.com>
Date: Fri, 10 Dec 2021 11:22:15 -0500
Content-Language: en-US
References: <20211207164331.306201-1-Rodrigo.Siqueira@amd.com>
 <20211207164331.306201-2-Rodrigo.Siqueira@amd.com>
 <9ebea7cb-714b-e61d-10db-f356c5e5df49@amd.com>
 <YbHlgCdBLqSkeWk/@platvala-desk.ger.corp.intel.com>
 <a35c908511fe40119f843e36de1e0680@intel.com>
 <d6358f7b875c42e69384e46c156728bc@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <d6358f7b875c42e69384e46c156728bc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 1/2] lib/kms: Add DSC_SLICE_HEIGHT to CRTC
 property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Navare, Manasi D" <manasi.d.navare@intel.com>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Latvala, Petri" <petri.latvala@intel.com>, Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-12-09 17:41, Navare, Manasi D wrote:
> Hi Rodrigo,
> 
> Is the DSC Slice height added so that the userspace can control it through the CRTC property, and in that case what is the advantage or the need for userspace to control the dsc slice height, IMO it should be seamless to end users.
> If its only for AMD DSC tests, can you accomplish this through a debugfs node?
> 

You're right, this isn't needed. We had this property
as a read-only property in an internal repo but it
never went upstream, and shouldn't be upstream.

Siqueira, please drop this patch and any work that's
trying to use DSC_SLICE_HEIGHT.

Thanks,
Harry

> Regards
> Manasi
> 
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vudum, Lakshminarayana
> Sent: Thursday, December 9, 2021 9:06 AM
> To: Latvala, Petri <petri.latvala@intel.com>; Rodrigo Siqueira Jordao <rjordrigo@amd.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH v4 1/2] lib/kms: Add DSC_SLICE_HEIGHT to CRTC property
> 
> Re-reported. 
> 
> -----Original Message-----
> From: Latvala, Petri <petri.latvala@intel.com>
> Sent: Thursday, December 9, 2021 3:16 AM
> To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
> Cc: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>; igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH v4 1/2] lib/kms: Add DSC_SLICE_HEIGHT to CRTC property
> 
> On Wed, Dec 08, 2021 at 08:48:17PM -0500, Rodrigo Siqueira Jordao wrote:
>>
>>
>> On 2021-12-07 11:43 a.m., Rodrigo Siqueira wrote:
>>> This preparation work introduces a new CRTC property named 
>>> DSC_SLICE_HEIGHT, which will be required for amdgpu DSC tests.
>>>
>>> Cc: Petri Latvala <petri.latvala@intel.com>
>>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> ---
>>>   lib/igt_kms.c | 1 +
>>>   lib/igt_kms.h | 1 +
>>>   2 files changed, 2 insertions(+)
>>>
>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 34a2aa00..fdadb6d6
>>> 100644
>>> --- a/lib/igt_kms.c
>>> +++ b/lib/igt_kms.c
>>> @@ -593,6 +593,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
>>>   	[IGT_CRTC_ACTIVE] = "ACTIVE",
>>>   	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
>>>   	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
>>> +	[IGT_CRTC_DSC_SLICE_HEIGHT] = "DSC_SLICE_HEIGHT",
>>>   };
>>>   const char * const
>>> igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = { diff --git 
>>> a/lib/igt_kms.h b/lib/igt_kms.h index e9ecd21e..5c7d7481 100644
>>> --- a/lib/igt_kms.h
>>> +++ b/lib/igt_kms.h
>>> @@ -125,6 +125,7 @@ enum igt_atomic_crtc_properties {
>>>          IGT_CRTC_ACTIVE,
>>>          IGT_CRTC_OUT_FENCE_PTR,
>>>          IGT_CRTC_VRR_ENABLED,
>>> +       IGT_CRTC_DSC_SLICE_HEIGHT,
>>>          IGT_NUM_CRTC_PROPS
>>>   };
>>>
>>
>> Hi Petri,
>>
>> I followed your advice to search for IGT_NUM_CRTC_PROPS, and only 
>> igt_kms.{h,c} and kms_atomic uses it.
>>
>> In the lib/igt_kms.c, the occurrences of IGT_NUM_CRTC_PROPS appears in 
>> the function igt_fill_pipe_props() as a parameter, in its turn, it 
>> call drmModeObjectGetProperties and drmModeGetProperty. Finally, it 
>> only populates the prop array based on the returned value from the 
>> driver. I suppose we are safe here; I don't see how this patch could 
>> regress something in this function. The other places where this 
>> function appears are in the loop condition, but all of them look correct to me.
> 
> Yeah that looks correct, thanks.
> 
>>
>> Finally, the other place we can see it is in the kms_atomic, but again 
>> the for loop looks correct.
>>
>> However, IGT CI failed:
>>
>> https://patchwork.freedesktop.org/series/97470/#rev2>>>
>> The potential new issue pointed by the CI is:
>>
>>  Possible new issues
>>  Here are the unknown changes that may have been introduced in
>> IGTPW_6475_full:
>>
>>  IGT changes
>>  Possible regressions
>>  igt@sysfs_heartbeat_interval@precise@vecs0:
>>  shard-apl: PASS -> FAIL
>>
>> And the log says:
>>
>> Stack trace:
>>   #0 ../lib/igt_core.c:1745 __igt_fail_assert()
>>   #1 ../tests/i915/sysfs_heartbeat_interval.c:156 __test_timeout()
>>   #2 [<unknown>+0xd0]
>> Dynamic subtest vecs0: FAIL (1.713s)
>>
>> After I resubmitted this patch, I also noticed that I got a different 
>> CI error from the one from the V1. The reported error looks a little 
>> bit inconsistent.
>>
>> Petri, do you think this can be a false-positive, or am I missing something?
>> Maybe re-trigger IGT.CI can help?
> 
> Looks like false positives to me and I believe Lakshmi already addressed those for you.
> 
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
