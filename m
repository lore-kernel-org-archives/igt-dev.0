Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6072113E3B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jun 2022 06:13:25 +0000 (UTC)
Message-ID: <4c36f9e7-3103-35b2-3fd8-efcfde22904e@intel.com>
Date: Thu, 23 Jun 2022 11:43:01 +0530
Content-Language: en-US
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Latvala, Petri" <petri.latvala@intel.com>
References: <20220622154837.20582-1-nidhi1.gupta@intel.com>
 <20220622154837.20582-2-nidhi1.gupta@intel.com>
 <5ccc3c41-c403-3e88-e45c-405c8e30af24@intel.com>
 <PH7PR11MB600613CB5A61601B3D50376DC5B59@PH7PR11MB6006.namprd11.prod.outlook.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <PH7PR11MB600613CB5A61601B3D50376DC5B59@PH7PR11MB6006.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_invalid_mode: Convert
 tests to dynamic
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

On Thu-23-06-2022 11:25 am, Gupta, Nidhi1 wrote:
> Hi Bhanu,
> 
> In many tests we are using drm calls, like drmModePageFlip, drmModeSetCrtc, if I will replace it with igt wrapper it will increase the code lines, should I still change it?

It's fine to increase the number of lines of code. The idea is to use 
IGT wrappers wherever it's possible, since IGT helpers were developed 
purposefully and more handy.

Ofcourse, in some tests it is not possible to use these IGT helpers, ex: 
kms_setmode.

@Petri, any thoughts?

- Bhanu

> 
> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Thursday, June 23, 2022 8:11 AM
> To: Gupta, Nidhi1 <nidhi1.gupta@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Latvala, Petri <petri.latvala@intel.com>
> Subject: Re: [PATCH i-g-t 1/2] tests/kms_invalid_mode: Convert tests to dynamic
> 
> On Wed-22-06-2022 09:18 pm, Nidhi Gupta wrote:
>> Convert the existing subtests to dynamic subtests at pipe level.
>>
>> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
>> ---
>>    tests/kms_invalid_mode.c | 53 +++++++++++++++++-----------------------
>>    1 file changed, 23 insertions(+), 30 deletions(-)
>>
>> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index
>> 630798d8..7e1f683b 100644
>> --- a/tests/kms_invalid_mode.c
>> +++ b/tests/kms_invalid_mode.c
>> @@ -32,6 +32,7 @@ typedef struct _data data_t;
>>    
>>    struct _data {
>>    	int drm_fd;
>> +	enum pipe pipe;
>>    	igt_display_t display;
>>    	igt_output_t *output;
>>    	drmModeResPtr res;
>> @@ -177,21 +178,21 @@ adjust_mode_bad_vtotal(data_t *data, drmModeModeInfoPtr mode)
>>    	return true;
>>    }
>>    
>> -static int
>> +static void
>>    test_output(data_t *data)
>>    {
>>    	igt_output_t *output = data->output;
>>    	drmModeModeInfo mode;
>>    	struct igt_fb fb;
>> -	int i;
>> +	int ret;
>> +	uint32_t crtc_id;
>>    
>>    	/*
>>    	 * FIXME test every mode we have to be more
>>    	 * sure everything is really getting rejected?
>>    	 */
>>    	mode = *igt_output_get_mode(output);
>> -	if (!data->adjust_mode(data, &mode))
>> -		return 0;
>> +	igt_require(data->adjust_mode(data, &mode));
>>    
>>    	igt_create_fb(data->drm_fd,
>>    		      max_t(uint16_t, mode.hdisplay, 64), @@ -202,32 +203,14 @@
>> test_output(data_t *data)
>>    
>>    	kmstest_unset_all_crtcs(data->drm_fd, data->res);
>>    
>> -	for (i = 0; i < data->res->count_crtcs; i++) {
>> -		int ret;
>> -
>> -		igt_info("Checking pipe %c connector %s with mode %s\n",
>> -			 'A'+i, output->name, mode.name);
>> +	crtc_id = data->display.pipes[data->pipe].crtc_id;
>>    
>> -		ret = drmModeSetCrtc(data->drm_fd, data->res->crtcs[i],
>> -				     fb.fb_id, 0, 0,
>> -				     &output->id, 1, &mode);
>> -		igt_assert_lt(ret, 0);
>> -	}
>> +	ret = drmModeSetCrtc(data->drm_fd, crtc_id,
>> +			     fb.fb_id, 0, 0,
>> +			     &output->id, 1, &mode);
> 
> Instead of using drm calls, is it possible to use igt kms wrappers?
> 
> igt_output_set_pipe();
> try_commit();
> 
> - Bhanu
> 
>> +	igt_assert_lt(ret, 0);
>>    
>>    	igt_remove_fb(data->drm_fd, &fb);
>> -
>> -	return 1;
>> -}
>> -
>> -static void test(data_t *data)
>> -{
>> -	int valid_connectors = 0;
>> -
>> -	for_each_connected_output(&data->display, data->output) {
>> -		valid_connectors += test_output(data);
>> -	}
>> -
>> -	igt_require_f(valid_connectors, "No suitable connectors found\n");
>>    }
>>    
>>    static int i915_max_dotclock(data_t *data) @@ -297,6 +280,10 @@
>> static data_t data;
>>    
>>    igt_main
>>    {
>> +
>> +	enum pipe pipe;
>> +	igt_output_t *output;
>> +
>>    	igt_fixture {
>>    		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>    
>> @@ -311,9 +298,15 @@ igt_main
>>    	}
>>    
>>    	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
>> -		igt_subtest(subtests[i].name) {
>> -			data.adjust_mode = subtests[i].adjust_mode;
>> -			test(&data);
>> +		igt_subtest_with_dynamic(subtests[i].name) {
>> +			for_each_pipe_with_valid_output(&data.display, pipe, output) {
>> +				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {
>> +					data.output = output;
>> +					data.pipe = pipe;
>> +					data.adjust_mode = subtests[i].adjust_mode;
>> +					test_output(&data);
>> +				}
>> +			}
>>    		}
>>    	}
>>    
> 
