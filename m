Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <aa68b66c-ea91-23dd-57ce-71ebd61ed43e@intel.com>
Date: Tue, 14 Dec 2021 07:38:34 -0800
Content-Language: en-GB
References: <20211213232914.2523139-1-John.C.Harrison@Intel.com>
 <20211213232914.2523139-2-John.C.Harrison@Intel.com>
 <YbhoRiHwnkZV3awF@platvala-desk.ger.corp.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <YbhoRiHwnkZV3awF@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 01/11] tests/i915/i915_hangman: Add
 descriptions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: IGT-Dev@lists.freedesktop.org, Intel-GFX@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 12/14/2021 01:47, Petri Latvala wrote:
> On Mon, Dec 13, 2021 at 03:29:04PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Added descriptions of the various sub-tests and the test as a whole.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   tests/i915/i915_hangman.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
>> index 4c18c22db..025bb8713 100644
>> --- a/tests/i915/i915_hangman.c
>> +++ b/tests/i915/i915_hangman.c
>> @@ -46,6 +46,8 @@
>>   static int device = -1;
>>   static int sysfs = -1;
>>   
>> +IGT_TEST_DESCRIPTION("Tests for hang detection and recovery");
>> +
>>   static bool has_error_state(int dir)
>>   {
>>   	bool result;
>> @@ -315,9 +317,9 @@ static void hangcheck_unterminated(void)
>>   
>>   	gem_execbuf(device, &execbuf);
>>   	if (gem_wait(device, handle, &timeout_ns) != 0) {
>> -		/* need to manually trigger an hang to clean before failing */
>> +		/* need to manually trigger a hang to clean before failing */
>>   		igt_force_gpu_reset(device);
>> -		igt_assert_f(0, "unterminated batch did not trigger an hang!");
>> +		igt_assert_f(0, "unterminated batch did not trigger a hang!");
> Ouch, this is a bug that could use a drive-by fix in this same commit:
> Add a newline after that text.
>
> With that,
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Well spotted. Will add that in.

Thanks,
John.

>
>>   	}
>>   }
>>   
>> @@ -341,9 +343,11 @@ igt_main
>>   		igt_require(has_error_state(sysfs));
>>   	}
>>   
>> +	igt_describe("Basic error capture");
>>   	igt_subtest("error-state-basic")
>>   		test_error_state_basic();
>>   
>> +	igt_describe("Per engine error capture");
>>   	igt_subtest_with_dynamic("error-state-capture") {
>>   		for_each_ctx_engine(device, ctx, e) {
>>   			igt_dynamic_f("%s", e->name)
>> @@ -351,6 +355,7 @@ igt_main
>>   		}
>>   	}
>>   
>> +	igt_describe("Per engine hang recovery (spin)");
>>   	igt_subtest_with_dynamic("engine-hang") {
>>                   int has_gpu_reset = 0;
>>   		struct drm_i915_getparam gp = {
>> @@ -369,6 +374,7 @@ igt_main
>>   		}
>>   	}
>>   
>> +	igt_describe("Per engine hang recovery (invalid CS)");
>>   	igt_subtest_with_dynamic("engine-error") {
>>   		int has_gpu_reset = 0;
>>   		struct drm_i915_getparam gp = {
>> @@ -386,6 +392,7 @@ igt_main
>>   		}
>>   	}
>>   
>> +	igt_describe("Check that executing unintialised memory causes a hang");
>>   	igt_subtest("hangcheck-unterminated")
>>   		hangcheck_unterminated();
>>   
>> -- 
>> 2.25.1
>>
