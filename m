Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D39110E478
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 18:57:26 +0000 (UTC)
Message-ID: <ba28bfaa-3163-b458-2230-a38159c75425@intel.com>
Date: Sat, 31 Dec 2022 00:27:21 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Coelho, Luciano" <luciano.coelho@intel.com>
References: <20221223102739.2900-1-swati2.sharma@intel.com>
 <23be17762e6c65a5ceebaa4a27d00b566dd9e5a2.camel@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <23be17762e6c65a5ceebaa4a27d00b566dd9e5a2.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Add test to
 validate max source size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks Luca for the review comments.
Will make changes accordingly and float new rev.

On 30-Dec-22 3:56 PM, Coelho, Luciano wrote:
> On Fri, 2022-12-23 at 15:57 +0530, Swati Sharma wrote:
>>> From: Swati2 Sharma <swati2.sharma@intel.com>
>>>
>>> Test is added for i915 devices to validate max source size.
>>> This test is expected to pass for platforms having
>>> 11 <= display ver < 14 since for these platforms max source
>>> size supported is 5120.
> 
> This is not entirely true, as we discussed.  For display_ver <= 11, the
> maximum source and destination sizes are 4K for both width and height.
> 
> 
>>>   For remaining platforms this test is
>>> expected to fail since max source size supported is 4096.
> 
> Maybe it's better to specify the actual values for each platform here
> (and in a comment in the code).  For the record, these are the values
> as we discussed:
> 
> Before Display Version 11:	Max Source Width:  4K
> 				Max Source Height: 4K
> 				Max Dest. Width:   4K
> 				Max Dest. Height:  4K
> 
> Display Version 11:		Max Source Width:  5K
> 				Max Source Height: 4K
> 
> 				Max Dest. Width:   5K
> 				Max Dest. Height:  4K
> 
> 
> Display Versions 12-13:		Max Source Width:  5K
> 				Max Source Height: 8K
> 
> 				Max Dest. Width:   8K
> 				Max Dest. Height:  8K
> 
> Display Version 14+:		Max Source Width:  4K
> 				Max Source Height: 8K
> 				Max Dest. Width:   8K
> 				Max Dest. Height:  8K
> 
> 
>>> In this test, we are creating 4k fb and trying to upscale it to
>>> 5k on a 5k monitor. Platforms having max source size of 5120
>>> will be able to do it, and for remaining platforms its expected
>>> to get -EINVAL.
>>>
>>> Signed-off-by: Swati2 Sharma <swati2.sharma@intel.com>
>>> ---
>>>   tests/kms_plane_scaling.c | 64 +++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 64 insertions(+)
>>>
>>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>>> index 4c621cce..170e8c28 100644
>>> --- a/tests/kms_plane_scaling.c
>>> +++ b/tests/kms_plane_scaling.c
> 
> [...]
> 
> 
>>> @@ -970,6 +1015,25 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>>   			}
>>>   		}
>>>   
>>> +		igt_fixture
>>> +			igt_require_f(data.devid, "This test is valid only for i915 devices\n");
>>> +
>>> +		igt_describe("Test for max source size.");
>>> +		igt_subtest_with_dynamic("max-source-size") {
>>> +			for_each_pipe_with_valid_output(&data.display, pipe, output) {
>>> +					drmModeModeInfo *mode;
>>> +
>>> +					mode = igt_output_get_mode(output);
>>> +
>>> +					if (mode->hdisplay < HDISPLAY_5K)
>>> +						continue;
> 
> For the record, I discussed this with you (Swati) and there was a
> misinterpretation of the HAS.  It says "4kto5k->5kto8k not supported"
> and it was interpreted as if 4k source to 5k destination is not
> possible, but in fact it means "from anything between 4K to 5K
> (source) to anything between 5K and 8K (destination) is not supported".
> 
> Swati said she's going to update the tests accordingly and send a new
> version of this patch.
> 
> --
> Cheers,
> Luca.

-- 
~Swati Sharma
