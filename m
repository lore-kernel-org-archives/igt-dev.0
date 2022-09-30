Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DFE10EBC7
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 08:51:37 +0000 (UTC)
Message-ID: <8beed0f0-e838-2370-0fe0-e056faf96e41@intel.com>
Date: Fri, 30 Sep 2022 14:21:14 +0530
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220922141157.159926-1-mohammed.thasleem@intel.com>
 <20220928133703.55196-1-mohammed.thasleem@intel.com>
 <7afd23ab-e89d-5341-b43f-cbc24c5a680b@intel.com>
 <YzaqzkBOfA6GqsKm@platvala-desk.ger.corp.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <YzaqzkBOfA6GqsKm@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_properties: Create dynamic
 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri-30-09-2022 02:07 pm, Petri Latvala wrote:
> On Thu, Sep 29, 2022 at 07:56:58PM +0530, Modem, Bhanuprakash wrote:
>> On Wed-28-09-2022 07:07 pm, Mohammed Thasleem wrote:
>>> Modified kms_properties to include dynamic test cases.
>>>
>>> v2: Fixed compilation issue.
>>> v3: Removed redundant code.
>>> v4: Moved get_prop_sanity calls to igt_subtest_group.
>>>
>>> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>>> ---
>>>    tests/kms_properties.c | 172 ++++++++++++++++++-----------------------
>>>    1 file changed, 75 insertions(+), 97 deletions(-)
>>>
>>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>>> index dd5a93aa..476769e0 100644
>>> --- a/tests/kms_properties.c
>>> +++ b/tests/kms_properties.c
>>> @@ -230,48 +230,30 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
>>>    static void plane_properties(igt_display_t *display, bool atomic)
>>>    {
>>> -	bool found_any = false, found;
>>>    	igt_output_t *output;
>>>    	enum pipe pipe;
>>> -	if (atomic)
>>> -		igt_skip_on(!display->is_atomic);
>>> -
>>> -	for_each_pipe(display, pipe) {
>>> -		found = false;
>>> -
>>> -		for_each_valid_output_on_pipe(display, pipe, output) {
>>> -			found_any = found = true;
>>> -
>>> +	for_each_pipe_with_valid_output(display, pipe, output) {
>>> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
>>> +			      igt_output_name(output)) {
>>>    			run_plane_property_tests(display, pipe, output, atomic);
>>> -			break;
>>>    		}
>>> +		break;
>>>    	}
>>> -
>>> -	igt_skip_on(!found_any);
>>>    }
>>>    static void crtc_properties(igt_display_t *display, bool atomic)
>>>    {
>>> -	bool found_any_valid_pipe = false, found;
>>>    	enum pipe pipe;
>>>    	igt_output_t *output;
>>> -	if (atomic)
>>> -		igt_skip_on(!display->is_atomic);
>>> -
>>> -	for_each_pipe(display, pipe) {
>>> -		found = false;
>>> -
>>> -		for_each_valid_output_on_pipe(display, pipe, output) {
>>> -			found_any_valid_pipe = found = true;
>>> -
>>> +	for_each_pipe_with_valid_output(display, pipe, output) {
>>> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
>>> +			      igt_output_name(output)) {
>>>    			run_crtc_property_tests(display, pipe, output, atomic);
>>> -			break;
>>>    		}
>>> +		break;
>>>    	}
>>> -
>>> -	igt_skip_on(!found_any_valid_pipe);
>>>    }
>>>    static void connector_properties(igt_display_t *display, bool atomic)
>>> @@ -280,22 +262,12 @@ static void connector_properties(igt_display_t *display, bool atomic)
>>>    	enum pipe pipe;
>>>    	igt_output_t *output;
>>> -	if (atomic)
>>> -		igt_skip_on(!display->is_atomic);
>>> -
>>> -	for_each_connected_output(display, output) {
>>> -		bool found = false;
>>> -
>>> -		for_each_pipe(display, pipe) {
>>> -			if (!igt_pipe_connector_valid(pipe, output))
>>> -				continue;
>>> -
>>> -			found = true;
>>> +	for_each_pipe_with_valid_output(display, pipe, output) {
>>> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
>>> +				igt_output_name(output)) {
>>>    			run_connector_property_tests(display, pipe, output, atomic);
>>> -			break;
>>>    		}
>>> -
>>> -		igt_assert_f(found, "Connected output should have at least 1 valid crtc\n");
>>> +		break;
>>>    	}
>>>    	for (i = 0; i < display->n_outputs; i++)
>>> @@ -707,26 +679,58 @@ static void invalid_properties(igt_display_t *display, bool atomic)
>>>    	igt_output_t *output;
>>>    	igt_plane_t *plane;
>>>    	enum pipe pipe;
>>> -	int i;
>>> -
>>> -	if (atomic)
>>> -		igt_skip_on(!display->is_atomic);
>>>    	for_each_pipe(display, pipe)
>>> -		test_object_invalid_properties(display, display->pipes[pipe].crtc_id, DRM_MODE_OBJECT_CRTC, atomic);
>>> +		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
>>> +			test_object_invalid_properties(display, display->pipes[pipe].crtc_id,
>>> +						       DRM_MODE_OBJECT_CRTC, atomic);
>>>    	for_each_pipe(display, pipe)
>>> -		for_each_plane_on_pipe(display, pipe, plane)
>>> -			test_object_invalid_properties(display, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
>>> +		igt_dynamic_f("pipe-%s-plane", kmstest_pipe_name(pipe))
>>> +			for_each_plane_on_pipe(display, pipe, plane)
>>> +				test_object_invalid_properties(display, plane->drm_plane->plane_id,
>>> +							       DRM_MODE_OBJECT_PLANE, atomic);
>>> +
>>> +	for_each_connected_output(display, output)
>>> +		igt_dynamic_f("%s", igt_output_name(output))
>>> +			test_object_invalid_properties(display, output->id,
>>> +						       DRM_MODE_OBJECT_CONNECTOR, atomic);
>>> -	for (i = 0, output = &display->outputs[0]; i < display->n_outputs; output = &display->outputs[++i])
>>> -		test_object_invalid_properties(display, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
>>
>> Please fix the same inside test_object_invalid_properties()
>> use for_each_connected_output()
>>
>>>    }
>>>    igt_main
>>>    {
>>>    	igt_display_t display;
>>> +	static const struct {
>>> +		const char *name;
>>> +		void (*func)(igt_display_t *, bool);
>>> +		const bool atomic;
>>> +		const char *desc;
>>> +	} funcs[] = {
>>> +		{ "plane-properties-legacy", plane_properties, false,
>>> +		  "Tests plane properties with legacy commit" },
>>> +		{ "plane-properties-atomic", plane_properties, true,
>>> +		  "Tests plane properties with atomic commit" },
>>> +		{ "crtc-properties-legacy", crtc_properties, false,
>>> +		  "Tests crtc properties with legacy commit" },
>>> +		{ "crtc-properties-atomic", crtc_properties, true,
>>> +		  "Tests crtc properties with atomic commit" },
>>> +		{ "connector-properties-legacy", connector_properties, false,
>>> +		  "Tests connector properties with legacy commit" },
>>
>> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_properties.c#n301
>>
>> for (i = 0; i < display->n_outputs; i++)
>>    if (!igt_output_is_connected(&display->outputs[i]))
>>      run_connector_property_tests(display, PIPE_NONE, &display->outputs[i],
>> atomic);
>>
>> I can recommend to create a new api for_each_output() to iterate all
>> outputs.
> 
> There's for_each_connected_output already.

Yes, but this test is looking for the disconnected outputs.

My idea is to have 2 helpers (maybe 3) [1]

- for_each_output
- for_each_connected_output
- for_each_disconnected_output

[1]: https://patchwork.freedesktop.org/series/109253/

- Bhanu

> 
> 
