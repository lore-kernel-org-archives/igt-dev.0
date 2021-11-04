Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-2-John.C.Harrison@Intel.com>
 <426daa00-746e-31d5-d90b-9cf161738b9d@linux.intel.com>
 <45336ecd-4d94-b8eb-c9f3-889b1411c937@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <f18d1f2e-296a-c82d-f5ca-6d6cbf1dfafe@linux.intel.com>
Date: Thu, 4 Nov 2021 09:14:56 +0000
MIME-Version: 1.0
In-Reply-To: <45336ecd-4d94-b8eb-c9f3-889b1411c937@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/8]
 tests/i915/gem_exec_capture: Remove pointless assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John Harrison <john.c.harrison@intel.com>, IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>


On 03/11/2021 18:44, John Harrison wrote:
> On 11/3/2021 06:50, Tvrtko Ursulin wrote:
>> On 22/10/2021 00:40, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> The 'many' test ended with an 'assert(count)', presumably meaning to
>>> ensure that some objects were actually captured. However, 'count' is
>>> the number of objects created not how many were captured. Plus, there
>>> is already a 'require(count > 1)' at the start and count is invarient
>>> so the final assert is basically pointless.
>>>
>>> General concensus appears to be that the test should not fail
>>> irrespective of how many blobs are captured as low memory situations
>>> could cause the capture to be abbreviated. So just remove the
>>> pointless assert completely.
>>
>> Hm the test appears to be using intel_get_avail_ram_mb() to size the 
>> working set. Suggesting problems with low memory situations should not 
>> apply unless bugs. In which case would a better fix be improving the 
>> sizing logic and changing the assert to igt_assert(blobs)?
> After fixing the sysfs read code to cope with large files, I don't ever 
> see abbreviated captures any more. However, other reviewers objected to 
> asserting anything at all about the final count (whether full size, zero 
> or whatever) on the grounds that low memory issues *might* still occur. 
> And some in quite blunt language as I recall. If you think different, 
> feel free to start your own patch set.

Do you have a link so I can understand the discussion? Because from the 
top of my head I can't imagine what were the objections, I mean what is 
the point of keeping the test but not asserting at the end at least 
something was captured?

Regards,

Tvrtko
