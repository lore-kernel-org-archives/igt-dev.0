Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20210201115756.876351-1-tvrtko.ursulin@linux.intel.com>
 <161218123064.27906.1183308463378840226@build.alporthouse.com>
 <c947cfbc-bb9d-02c4-5b97-ca76d252e778@linux.intel.com>
 <161235004418.6538.3517367090743505584@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <c3f9a058-307b-3fee-526b-a17a871f8fb3@linux.intel.com>
Date: Wed, 3 Feb 2021 13:12:05 +0000
MIME-Version: 1.0
In-Reply-To: <161235004418.6538.3517367090743505584@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] intel_gpu_top: Wrap
 interactive header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 03/02/2021 11:00, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-02-03 10:31:04)
>>
>> On 01/02/2021 12:07, Chris Wilson wrote:
>>> Quoting Tvrtko Ursulin (2021-02-01 11:57:56)
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Slight improvement with regards to wrapping header components to fit
>>>> console width. If a single element is wider than max it can still
>>>> overflow but it should now work better for practical console widths.
>>>
>>> <----
>>> intel-gpu-top: Intel Kabylake (Gen9) @ /dev/dri/card0
>>>    900/ 949 MHz;   0% RC6;  6.97/18.42 W;        2 irqs/s
>>>         IMC reads:        6 MiB/s
>>>        IMC writes:        0 MiB/s
>>>
>>> ---->
>>> intel-gpu-top: Intel Kabylake (Gen9) @ /dev/dri/card0 -  903/ 954 MHz;   0% RC6
>>>       7.16/18.40 W;       14 irqs/s
>>>
>>>         IMC reads:       80 MiB/s
>>>        IMC writes:        0 MiB/s
>>>
>>> I thought it looked reasonably tidy, without adding any lines to the
>>> header.
>>
>> Or on a wider terminal:
>> <----
>> intel-gpu-top: Intel Skylake (Gen9) @ /dev/dri/card0
>>      0/   0 MHz; 100% RC6;  0.00/ 1.29 W;        0 irqs/s
>>         IMC reads:      138 MiB/s
>>        IMC writes:        6 MiB/s
>> --->
>> intel-gpu-top: Intel Skylake (Gen9) @ /dev/dri/card0 -    0/   0 MHz; 100% RC6;  0.00/ 0.00 W;        0 irqs/s
>>
>>         IMC reads:       77 MiB/s
>>        IMC writes:        4 MiB/s
>>
>>
>> So a "fight" between 80 chars vs 120 (or so). :) It may be a bit of an over-engineered solution but I don't like the wrap on a wide terminal, plus I like an extra blank line.
> 
> But the memory counters are visually similar to the
> frequency/rc6/power/interrupts...

But I broke my layout by accident when rebasing client stats... ;D

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
