Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7BD10E37E
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 13:28:33 +0000 (UTC)
Message-ID: <4c9166bd-cd26-afa4-1ce1-5688da5ff289@intel.com>
Date: Wed, 4 Oct 2023 18:58:11 +0530
Content-Language: en-US
To: <juhapekka.heikkila@gmail.com>, Kunal Joshi <kunal1.joshi@intel.com>,
 <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20231001103006.431894-1-kunal1.joshi@intel.com>
 <17bd5bee-d5ff-9351-ed9b-e917b780d491@intel.com>
 <1f8f7bfc-21cb-e986-401a-591892adefeb@intel.com>
 <8bba0a41-769f-4921-89b5-0f5d2d315459@gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <8bba0a41-769f-4921-89b5-0f5d2d315459@gmail.com>
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


On Wed-04-10-2023 01:45 pm, Juha-Pekka Heikkila wrote:
> On 4.10.2023 8.48, Modem, Bhanuprakash wrote:
>> Forgot to add Kamil to the TO/CC list.
>>
>> On Tue-03-10-2023 02:42 pm, Modem, Bhanuprakash wrote:
>>> Hi Kunal,
>>>
>>> On Sun-01-10-2023 04:00 pm, Kunal Joshi wrote:
>>>> Test to validate hotplug in simulation environment we
>>>> have scratch pad register 0x4f080 from which we can
>>>> trigger uevents such as HPD, VBLANK..etc, Idea is to
>>>> have port mapping placed in igtrcthrough which test
>>>> can write to 0x4f080 and check if we get hotplug
>>>
>>> In first glance, do we really need to upstream this test? I am pretty 
>>> sure, no one (including Intel) is going to use this test from 
>>> upstream repo (We don't have any simulation environment in public CI).
>>>
>>> So, we can't merge this.
>>>
>>> + Kamil, thoughts?
>>>
> 
> Not sure why this wouldn't fit in upstream? It is valid igt test, will 
> be of interest only for Intel guys hence in in intel directory and when 
> in upstream it will not be causing issues during backports. We anyway 
> already have more generic tests taking into account if they're being run 
> in simulated environments.

Right, as we are going to keep these tests inside tests/intel directory, 
it's ok to merge.

- Bhanu

> 
> /Juha-Pekka
> 
