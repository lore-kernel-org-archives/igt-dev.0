Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689A710E3B6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 08:23:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 s21-20020a1cf215000000b0039ee8149524so491098wmc.5
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 01:23:37 -0700 (PDT)
Message-ID: <c61193a8-a321-7342-e8cb-e54e37a38af5@gmail.com>
Date: Fri, 17 Jun 2022 11:23:29 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>,
 Nidhi Gupta <nidhi1.gupta@intel.com>
References: <20220616215654.5522-1-nidhi1.gupta@intel.com>
 <20220616215654.5522-2-nidhi1.gupta@intel.com>
 <Yqw3XKQlSVy74dP2@platvala-desk.ger.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <Yqw3XKQlSVy74dP2@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_draw_crc.c: Convert
 tests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 17.6.2022 11.12, Petri Latvala wrote:
> On Fri, Jun 17, 2022 at 03:26:53AM +0530, Nidhi Gupta wrote:
>> Convert the existing subtests to dynamic subtests at pipe level.
>>
>> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
>> ---
>>   tests/i915/kms_draw_crc.c | 26 ++++++++++++++++++++------
>>   1 file changed, 20 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
>> index 33fefed4..04cae0aa 100644
>> --- a/tests/i915/kms_draw_crc.c
>> +++ b/tests/i915/kms_draw_crc.c
>> @@ -40,6 +40,7 @@ drmModeResPtr drm_res;
>>   drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
>>   struct buf_ops *bops;
>>   igt_pipe_crc_t *pipe_crc;
>> +igt_display_t display;
>>   
>>   static const uint32_t formats[] = {
>>   	DRM_FORMAT_XRGB8888,
>> @@ -265,6 +266,7 @@ static void setup_environment(void)
>>   	drm_fd = drm_open_driver_master(DRIVER_INTEL);
>>   	igt_require(drm_fd >= 0);
>>   
>> +	igt_display_require(&display, drm_fd);
>>   	drm_res = drmModeGetResources(drm_fd);
>>   	igt_require(drm_res);
>>   	igt_assert(drm_res->count_connectors <= MAX_CONNECTORS);
>> @@ -331,6 +333,8 @@ igt_main
>>   {
>>   	enum igt_draw_method method;
>>   	int format_idx, modifier_idx;
>> +	igt_output_t *output;
>> +	enum pipe pipe;
>>   
>>   	igt_fixture
>>   		setup_environment();
>> @@ -340,18 +344,28 @@ igt_main
>>   	for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
>>   		igt_describe("This subtest verfies igt_draw library works "
>>   			     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
>> -		igt_subtest_f("draw-method-%s-%s-%s",
>> +		igt_subtest_with_dynamic_f("draw-method-%s-%s-%s",
>>   			      format_str(format_idx),
>>   			      igt_draw_get_method_name(method),
>> -			      modifier_str(modifier_idx))
>> -			draw_method_subtest(method, format_idx,
>> -					    modifiers[modifier_idx]);
>> +			      modifier_str(modifier_idx)) {
>> +			for_each_pipe_with_valid_output(&display, pipe, output) {
>> +				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {
>> +					draw_method_subtest(method, format_idx,
>> +					    	    modifiers[modifier_idx]);
>> +				}
> 
> There's an easy thumb rule to follow: If you're looping over all
> output/pipe combinations, and you're not even passing the output and
> pipe to the test, you're just repeating the same operation n times.

Added to Petri's comment, when test description says lets try if 
igt_draw library actually works there's not much point testing different 
pipes/connectors since igt_draw library doesn't depend on those.

> 
> 
>> +			}
>> +		}
>>   	} } }
>>   
>>   	igt_describe("This subtest verifies CRC after filling fb with x-tiling "
>>   		     "or none.");
>> -	igt_subtest("fill-fb")
>> -		fill_fb_subtest();
>> +	igt_subtest_with_dynamic("fill-fb") {
>> +		for_each_pipe_with_valid_output(&display, pipe, output) {
>> +			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {
>> +				fill_fb_subtest();
>> +			}
> 
> Same here.
> 
> 
> 
