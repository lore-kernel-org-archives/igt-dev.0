Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61C16EB48
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 10:00:15 +0000 (UTC)
Message-ID: <eca505ba-6efd-5b4f-ce86-b16d2e035a2e@intel.com>
Date: Tue, 5 Oct 2021 15:30:01 +0530
Content-Language: en-US
References: <20211004085629.2796-1-karthik.b.s@intel.com>
 <YVrHBWTxHBHQEMZ0@intel.com> <YVshFrxOVFlyFmNy@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <YVshFrxOVFlyFmNy@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Add retry mechanism
 for async flip subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 10/4/2021 9:13 PM, Ville Syrjälä wrote:
> On Mon, Oct 04, 2021 at 12:19:01PM +0300, Ville Syrjälä wrote:
>> On Mon, Oct 04, 2021 at 02:26:29PM +0530, Karthik B S wrote:
>>> Async flip subtests fail sporadically with CRC failure on CI.
>>> This is expected as these tests are not run on highest priority by the
>>> scheduler, but this creates noise on CI. Add retry mechanism to rerun
>>> the test once if failure is seen.
>>>
>>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>>> ---
>>>   tests/i915/kms_big_fb.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
>>> index 308227c9..8c09f59e 100644
>>> --- a/tests/i915/kms_big_fb.c
>>> +++ b/tests/i915/kms_big_fb.c
>>> @@ -481,6 +481,7 @@ max_hw_stride_async_flip_test(data_t *data)
>>>   		       h = data->output->config.default_mode.vdisplay;
>>>   	igt_plane_t *primary;
>>>   	igt_crc_t compare_crc, async_crc;
>>> +	bool retried = false;
>>>   
>>>   	igt_require(data->display.is_atomic);
>>>   	igt_output_set_pipe(data->output, data->pipe);
>>> @@ -513,6 +514,7 @@ max_hw_stride_async_flip_test(data_t *data)
>>>   					  INTEL_PIPE_CRC_SOURCE_AUTO);
>>>   	igt_pipe_crc_start(data->pipe_crc);
>>>   
>>> +retry:
>>>   	igt_set_timeout(5, "Async pageflipping loop got stuck!\n");
>>>   	for (int i = 0; i < 2; i++) {
>>>   		igt_plane_set_fb(primary, &data->big_fb);
>>> @@ -548,6 +550,13 @@ max_hw_stride_async_flip_test(data_t *data)
>>>   		igt_assert_f(kmstest_get_vblank(data->drm_fd, data->pipe, 0) -
>>>   			     startframe == 1, "lost frames\n");
>>>   
>>> +		/* Test is not running at real time priority, so allow one failure*/
>>> +		if (!(igt_check_crc_equal(&compare_crc, &async_crc)^(i^1)) && !retried) {
>>> +			retried = true;
>>> +			igt_reset_timeout();
>>> +			goto retry;
>>> +		}
>>> +
>> This test seems to entirely fit kms_big_fb in general. I don't
>                       ^
> 		     not
>
> is what I meant to write. Somewhat important small word.
>
>> think kms_big_fb should be testing any timing sensitive stuff.
>>
>> So I think we should change this to a form that follows the rest
>> of kms_big_fb to validate that each page flip just presents the
>> correct data on screen. The timing sensitive stuff is best left
>> for kms_async_flip.
>>
>> So this should maybe be something like: flip to a correctly sized
>> temp fb with the wrong contents and change the plane src coordinates,
>> and then async flip back to the correct fb and validate the
>> correct data is now on screen.

Thank you for the feedback.

Is this because we can handle any timing related failures in the same 
test (may be using some common mechanism)? So add a subtest for 
max-hw-stride in kms_async_flips and rewrite this subtest as mentioned 
above?

>>
>> Oh and the async flip test should not be limited to the
>> max-hw-stride part. We should test that async flips do the
>> right thing with gtt remapping as well.

Sure. Will work on adding this coverage.

Thanks,

Karthik.B.S

>>
>> -- 
>> Ville Syrjälä
>> Intel

