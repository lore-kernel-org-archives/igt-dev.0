Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2CD11AD2A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 07:30:26 +0000 (UTC)
Message-ID: <ed653bad-6527-5935-2eee-772050d148ac@intel.com>
Date: Thu, 19 May 2022 13:00:21 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
References: <20220315065509.398990-1-bhanuprakash.modem@intel.com>
 <YjB7y8eD3eBxELul@platvala-desk.ger.corp.intel.com>
 <1f59b2c7-e201-7ead-4861-942340d06b89@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <1f59b2c7-e201-7ead-4861-942340d06b89@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] i915_module_load: Unload the module
 before exiting the subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanu,

Overall patch LGTM.
Minor changes.
1. Change subject to tests/i915/i915_module_load
2. Please add fixes tag.

With this fixed.
Reviewed-by:
Swati Sharma <swati2.sharma@intel.com>

On 15-Mar-22 5:35 PM, Modem, Bhanuprakash wrote:
> On Tue-15-03-2022 05:13 pm, Petri Latvala wrote:
>> On Tue, Mar 15, 2022 at 12:25:09PM +0530, Bhanuprakash Modem wrote:
>>> On DP-MST setup, after execution of "reload" subtest, i915
>>> became unloadable. And this is effecting the next subtest
>>> "reload-no-display".
>>>
>>> Observing below error, if we run all subtests of i915_module_load
>>> (or) run "reload" & "reload-no-display" in same order using the
>>> igt_runner. But not seen any issue if we run each subtest individually.
>>>
>>> $ ./igt_runner -o -l verbose -s --test-list tests.txt --use-watchdog 
>>> ../tests/ results/
>>> (or)
>>> $ ./build/tests/i915_module_load
>>>    Starting subtest: reload
>>>    ...
>>>    Subtest reload: SUCCESS (3.780s)
>>>
>>>    Starting subtest: reload-no-display
>>>    (i915_module_load:42617) igt_kmod-WARNING: Could not unload i915
>>>    Module                   Used by
>>>    i915                     1
>>>    ...
>>>    Reloading i915 with disable_display=1
>>>    Module i915 already inserted
>>>    Could not load i915
>>>    Subtest reload-no-display: FAIL (1.998s)
>>>
>>> $ ./build/tests/i915_module_load --r reload
>>>    Starting subtest: reload
>>>    ...
>>>    Subtest reload: SUCCESS (5.562s)
>>> $ ./build/tests/i915_module_load --r reload-no-display
>>>    Starting subtest: reload-no-display
>>>    ...
>>>    Subtest reload-no-display: SUCCESS (7.995s)
>>>
>>> This patch will unload the module before exiting the subtest. So
>>> that we can make sure that the module is unloaded.
>>
>> Does it succeed in there? Or does this just make sure that the failure
>> is caught in the right place? What is actually holding the reference
>> to i915.ko?
> 
> Not sure who is holding the ref to i915. lsmod showing it is used by 1 
> but not showing who actually holding it.
> 
> Module                   Used by
> i915                     1
> 
> But with this fix, there is no such failures mentioned in commit msg.
> 
> - Bhanu
> 
>>
>>
> 

-- 
~Swati Sharma
