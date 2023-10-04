Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759AD10E093
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 05:48:55 +0000 (UTC)
Message-ID: <1f8f7bfc-21cb-e986-401a-591892adefeb@intel.com>
Date: Wed, 4 Oct 2023 11:18:31 +0530
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20231001103006.431894-1-kunal1.joshi@intel.com>
 <17bd5bee-d5ff-9351-ed9b-e917b780d491@intel.com>
In-Reply-To: <17bd5bee-d5ff-9351-ed9b-e917b780d491@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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

Forgot to add Kamil to the TO/CC list.

On Tue-03-10-2023 02:42 pm, Modem, Bhanuprakash wrote:
> Hi Kunal,
> 
> On Sun-01-10-2023 04:00 pm, Kunal Joshi wrote:
>> Test to validate hotplug in simulation environment we
>> have scratch pad register 0x4f080 from which we can
>> trigger uevents such as HPD, VBLANK..etc, Idea is to
>> have port mapping placed in igtrcthrough which test
>> can write to 0x4f080 and check if we get hotplug
> 
> In first glance, do we really need to upstream this test? I am pretty 
> sure, no one (including Intel) is going to use this test from upstream 
> repo (We don't have any simulation environment in public CI).
> 
> So, we can't merge this.
> 
> + Kamil, thoughts?
> 
> - Bhanu
> 
>>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>
>> Kunal Joshi (2):
>>    tests/kms_simulation_hpd: New test for hotplug validation
>>    tests/meson: added test to meson.build
>>
>>   tests/intel/kms_simulation_hpd.c | 534 +++++++++++++++++++++++++++++++
>>   tests/meson.build                |   1 +
>>   2 files changed, 535 insertions(+)
>>   create mode 100644 tests/intel/kms_simulation_hpd.c
>>
