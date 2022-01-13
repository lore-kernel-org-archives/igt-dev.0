Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <52c02112-af44-f295-98a6-0c28a00ff057@intel.com>
Date: Thu, 13 Jan 2022 13:19:22 -0800
Content-Language: en-GB
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
 <20220113195947.1536897-12-John.C.Harrison@Intel.com>
 <20220113210108.GA24680@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220113210108.GA24680@jons-linux-dev-box>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 i-g-t 11/15] tests/i915/i915_hangman: Don't
 let background contexts cause a ban
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On 1/13/2022 13:01, Matthew Brost wrote:
> On Thu, Jan 13, 2022 at 11:59:43AM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The global context used by all the subtests for causing hangs is
>> marked as unbannable. However, some of the subtests set background
>> spinners running on all engines using a freshly created context. If
>> there is a test failure for any reason, all of those spinners can be
>> killed off as hanging contexts. On systems with lots of engines, that
>> can result in the test being banned from creating any new contexts.
>>
>> So make the spinner contexts unbannable as well. That way if one
>> subtest fails it won't necessarily bring down all subsequent subtests.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   tests/i915/i915_hangman.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
>> index 9f7f8062c..567eb71ee 100644
>> --- a/tests/i915/i915_hangman.c
>> +++ b/tests/i915/i915_hangman.c
>> @@ -284,6 +284,21 @@ static void test_error_state_capture(const intel_ctx_t *ctx,
>>   	check_alive();
>>   }
>>   
>> +static void context_unban(int fd, unsigned ctx)
>> +{
>> +	struct drm_i915_gem_context_param param = {
>> +		.ctx_id = ctx,
>> +		.param = I915_CONTEXT_PARAM_BANNABLE,
> Looking at the kernel I don't see how I915_CONTEXT_PARAM_BANNABLE can
> return -EINVAL unless it is protected context.
>
>> +		.value = 0,
>> +	};
>> +
>> +	if(__gem_context_set_param(fd, &param) == -EINVAL) {
>> +		igt_assert_eq(param.value, 0);
>> +		param.param = I915_CONTEXT_PARAM_BAN_PERIOD;
> Also this always returns -EINVAL.
>
> Probably can just go with:
>
> gem_context_set_param on original parameters.
>
> Matt
The code was just copied from 'context_set_ban' in igt_gt.c. Can't 
recall offhand why I didn't just call that function instead. There was 
some reason why it seemed better to clone it than to export the helper.

Just did a quick check of other tests that disable banning (sysfs_*, 
gem_exec_balancer, gem_exec_isolation) and they all just do a simple 
set_param(BANNABLE) and leave it at that. So I guess I'll just update 
this one to match as well.

John.


>
>> +		gem_context_set_param(fd, &param);
>> +	}
>> +}
>> +
>>   static void
>>   test_engine_hang(const intel_ctx_t *ctx,
>>   		 const struct intel_execution_engine2 *e, unsigned int flags)
>> @@ -307,6 +322,7 @@ test_engine_hang(const intel_ctx_t *ctx,
>>   	num_ctx = 0;
>>   	for_each_ctx_engine(device, ctx, other) {
>>   		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
>> +		context_unban(device, local_ctx[num_ctx]->id);
>>   		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
>>   		spin = __igt_spin_new(device,
>>   				      .ahnd = ahndN,
>> -- 
>> 2.25.1
>>
