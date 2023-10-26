Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C049210E76C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 07:31:26 +0000 (UTC)
Message-ID: <e5fe59c4-baed-d686-73e7-8964532385d2@intel.com>
Date: Thu, 26 Oct 2023 13:01:04 +0530
Content-Language: en-US
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20231001103006.431894-1-kunal1.joshi@intel.com>
 <17bd5bee-d5ff-9351-ed9b-e917b780d491@intel.com>
 <1f8f7bfc-21cb-e986-401a-591892adefeb@intel.com>
 <8bba0a41-769f-4921-89b5-0f5d2d315459@gmail.com>
 <20231004103641.wj5dukxexd73r62e@kamilkon-desk.igk.intel.com>
 <672e13c3-3d92-63c3-07d2-6dd5491d3c8e@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <672e13c3-3d92-63c3-07d2-6dd5491d3c8e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add test for hotplug validation in
 simulation
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

Hi Kunal,

On Thu-26-10-2023 12:08 pm, Joshi, Kunal1 wrote:
> Hello Kamil,
> 
> On 10/4/2023 4:06 PM, Kamil Konieczny wrote:
>> Hi Juha-Pekka,
>>
>> On 2023-10-04 at 11:15:25 +0300, Juha-Pekka Heikkila wrote:
>>> On 4.10.2023 8.48, Modem, Bhanuprakash wrote:
>>>> Forgot to add Kamil to the TO/CC list.
>>>>
>>>> On Tue-03-10-2023 02:42 pm, Modem, Bhanuprakash wrote:
>>>>> Hi Kunal,
>>>>>
>>>>> On Sun-01-10-2023 04:00 pm, Kunal Joshi wrote:
>>>>>> Test to validate hotplug in simulation environment we
>>>>>> have scratch pad register 0x4f080 from which we can
>>>>>> trigger uevents such as HPD, VBLANK..etc, Idea is to
>>>>>> have port mapping placed in igtrcthrough which test
>>>>>> can write to 0x4f080 and check if we get hotplug
>>>>> In first glance, do we really need to upstream this test? I am
>>>>> pretty sure, no one (including Intel) is going to use this test from
>>>>> upstream repo (We don't have any simulation environment in public
>>>>> CI).
>>>>>
>>>>> So, we can't merge this.
>>>>>
>>>>> + Kamil, thoughts?
>>>>>
>>> Not sure why this wouldn't fit in upstream? It is valid igt test, 
>>> will be of
>>> interest only for Intel guys hence in in intel directory and when in
>>> upstream it will not be causing issues during backports. We anyway 
>>> already
>>> have more generic tests taking into account if they're being run in
>>> simulated environments.
>>>
>>> /Juha-Pekka
>>>
>> imho this should not be upstreamed as any user outside Intel
>> will not be able to run it. Why it cannot be a subtest with
>> some generic test like kms_hotplug.c with only timeout increased
>> for simulation? Such test may be in upstream if it will work
>> with existing hardware in CI.
>>
>> Regards,
>> Kamil
> 
> This test will only work in presi environment, for testing hotplug in 
> hardware we have kms_chamelium_hpd,
> But we can have it in upstream as someday we may require to run upstream 
> igt's on presi.
> 
> Any thoughts bhanu and JP?

As mentioned in previous replies, I am fine to upstream these changes as 
we are keeping these tests inside the "tests/intel" directory, and 
non-intel users are not going to use these tests.

- Bhanu

> 
> Thanks and Regards
> Kunal Joshi
> 
> 
