Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20210727182057.78409-1-matthew.brost@intel.com>
 <20210727182057.78409-2-matthew.brost@intel.com>
 <be3caf10-93d7-bc72-21bc-00d7e4d57630@intel.com>
 <20210730000010.GA58337@DUT151-ICLU.fm.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <b5cdcc00-122b-d8be-1617-e5f3d676d4a6@intel.com>
Date: Thu, 19 Aug 2021 16:31:13 -0700
In-Reply-To: <20210730000010.GA58337@DUT151-ICLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] i915/gem_scheduler: Ensure
 submission order in manycontexts
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 7/29/2021 17:00, Matthew Brost wrote:
> On Thu, Jul 29, 2021 at 04:54:08PM -0700, John Harrison wrote:
>> On 7/27/2021 11:20, Matthew Brost wrote:
>>> With GuC submission contexts can get reordered (compared to submission
>>> order), if contexts get reordered the sequential nature of the batches
>>> releasing the next batch's semaphore in function timesliceN() get broken
>>> resulting in the test taking much longer than if should. e.g. Every
>>> contexts needs to be timesliced to release the next batch. Corking the
>>> first submission until all the batches have been submitted should ensure
>>> submission order.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    tests/i915/gem_exec_schedule.c | 16 +++++++++++++++-
>>>    1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
>>> index f03842478..41f2591a5 100644
>>> --- a/tests/i915/gem_exec_schedule.c
>>> +++ b/tests/i915/gem_exec_schedule.c
>>> @@ -597,12 +597,13 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
>>>    	struct drm_i915_gem_execbuffer2 execbuf  = {
>>>    		.buffers_ptr = to_user_pointer(&obj),
>>>    		.buffer_count = 1,
>>> -		.flags = engine | I915_EXEC_FENCE_OUT,
>>> +		.flags = engine | I915_EXEC_FENCE_OUT | I915_EXEC_FENCE_SUBMIT,
>>>    	};
>>>    	uint32_t *result =
>>>    		gem_mmap__device_coherent(i915, obj.handle, 0, sz, PROT_READ);
>>>    	const intel_ctx_t *ctx;
>>>    	int fence[count];
>>> +	IGT_CORK_FENCE(cork);
>>>    	/*
>>>    	 * Create a pair of interlocking batches, that ping pong
>>> @@ -614,6 +615,17 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
>>>    	igt_require(gem_scheduler_has_timeslicing(i915));
>>>    	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
>>> +	/*
>>> +	 * With GuC submission contexts can get reordered (compared to
>>> +	 * submission order), if contexts get reordered the sequential
>>> +	 * nature of the batches releasing the next batch's semaphore gets
>>> +	 * broken resulting in the test taking much longer than it should (e.g.
>>> +	 * every context needs to be timesliced to release the next batch).
>>> +	 * Corking the first submission until all batches have been
>>> +	 * submitted should ensure submission order.
>>> +	 */
>>> +	execbuf.rsvd2 = igt_cork_plug(&cork, i915);
>>> +
>>>    	/* No coupling between requests; free to timeslice */
>>>    	for (int i = 0; i < count; i++) {
>>> @@ -624,8 +636,10 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
>>>    		intel_ctx_destroy(i915, ctx);
>>>    		fence[i] = execbuf.rsvd2 >> 32;
>>> +		execbuf.rsvd2 >>= 32;
>> This means you are passing fence_out[A] as fenc_in[B]? I.e. this patch is
>> also changing the behaviour to make each batch dependent upon the previous
> This is a submission fence, it just ensures they get submitted in order.
> Corking the first request + the fence, ensures all the requests get
> submitted basically at the same time compared to execbuf IOCTL time
> without it.
The input side is the submit fence, but the output side is the 
completion fence. You are chaining the out fence of the previous request 
as the submit fence of the next request.

Loop 0:
   execbuf.rsvd2 = cork
   submit()
       execbuf.rsvd2 is now the out fence in the upper 32
   fence[0] = execbuf.rsvd2 >> 32;
   execbuf.rsvd2 >>= 32;
       move new out fence to be the next in fence

Loop 1:
   execbuf.rsvd2 == fence[0]
   submit()
   fence[1] = new out fence

Loop 2:
   execbuf.rsvd2 == fence[1]
   ...


You have changed the parallel requests into a sequential line. Request X 
is now waiting for Request Y to *complete* before it can be submitted. 
Only the first request is waiting on the cork.

John.

>> one. That change is not mentioned in the new comment. It is also the exact
> Yea, I could explain this better. Will fix.
>
> Matt
>
>> opposite of the comment immediately above the loop - 'No coupling between
>> requests'.
>>
>> John.
>>
>>
>>>    	}
>>> +	igt_cork_unplug(&cork);
>>>    	gem_sync(i915, obj.handle);
>>>    	gem_close(i915, obj.handle);
