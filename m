Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20211013224317.943625-1-John.C.Harrison@Intel.com>
 <87ily0ilkd.wl-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <2981474c-7bbc-c76f-6035-f8643f2be547@intel.com>
Date: Wed, 13 Oct 2021 18:07:05 -0700
In-Reply-To: <87ily0ilkd.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t] tests/i915: Skip gem_exec_fair on GuC
 based platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/13/2021 15:53, Dixit, Ashutosh wrote:
> On Wed, 13 Oct 2021 15:43:17 -0700, <John.C.Harrison@Intel.com> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The gem_exec_fair test is specifically testing scheduler algorithm
>> performance. However, GuC does not implement the same algorithm as
>> execlist mode and this test is not applicable. So, until sw arch
>> approves a new algorithm and it is implemented in GuC, stop running
>> the test.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   tests/i915/gem_exec_fair.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
>> index ef5a450f6..ca9c73c6e 100644
>> --- a/tests/i915/gem_exec_fair.c
>> +++ b/tests/i915/gem_exec_fair.c
>> @@ -1314,6 +1314,12 @@ igt_main
>> 		igt_require(gem_scheduler_enabled(i915));
>> 		igt_require(gem_scheduler_has_ctx_priority(i915));
>>
>> +		/*
>> +		 * These tests are for a specific scheduling model which is
>> +		 * not currently implemented by GuC. So skip on GuC platforms.
>> +		 */
>> +		igt_require(intel_gen(intel_get_drm_devid(i915)) < 12);
> Probably a feature check rather than a version check is better? Can we use
> say gem_has_guc_submission() instead?
>
> Though appears gem_has_guc_submission() only checks if guc submission is
> available, not if it is actually in use (unless guc will used when
> available automatically)? Is it possible to add the check if guc submission
> is actually in use? Or a check for guc scheduler?
I believe this has come up a few times before. My understanding is that 
no, there is no current official/safe way for userland to check if GuC 
submission is enabled (you can read some of the debugfs files and make 
an educated guess but that isn't exactly an official interface). And the 
answer was that it isn't worth adding a UAPI specifically for it. Not 
least because it would be a UAPI solely for use by IGT which is not allowed.

John.


>
>> +
>> 		cfg = intel_ctx_cfg_all_physical(i915);
>>
>> 		igt_info("CS timestamp frequency: %d\n",
>> --
>> 2.25.1
>>
