Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4118F10E439
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 05:45:36 +0000 (UTC)
Message-ID: <a8ff2616-a5e5-d02a-75f3-8d0d25adc9f4@intel.com>
Date: Fri, 30 Dec 2022 11:15:12 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-42-bhanuprakash.modem@intel.com>
 <92331c54-3b97-5eb8-d1c0-ff2783f0b356@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <92331c54-3b97-5eb8-d1c0-ff2783f0b356@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 41/52] tests/i915/kms_cdclk: Add support
 for Bigjoiner
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

On Thu-29-12-2022 02:58 pm, Swati Sharma wrote:
> Hi Bhanu,
> 
> The intention of cdclk test is to bump cdclk when we have transition
> from low resolution to high resolution (this was tested)
> Changes done in test_mode_transition_on_all_outputs, you have set
> high resolution first followed by low resolution. Why?

I thought, we just need to check the clock by changing the resolution in 
any order (high to low (or) high to low).

Also, realized this test is limited to 4K, hence we can drop this patch.

- Bhanu

> 
> On 15-Nov-22 10:38 PM, Bhanuprakash Modem wrote:
>> As many 2x tests are currently running on Pipe-A & B only, those
>> tests will always SKIP if there is any 8K supported panel in the
>> config. Instead of Skipping the test, add some intelligence to
>> the subtest to identify the valid pipe/output combo to execute
>> the subtest.
>>
>> V2: - Use updated helper name
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/i915/kms_cdclk.c | 93 +++++++++++++++++++++++-------------------
>>   1 file changed, 51 insertions(+), 42 deletions(-)
>>
>> diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
>> index 991a7c50..ce945623 100644
>> --- a/tests/i915/kms_cdclk.c
>> +++ b/tests/i915/kms_cdclk.c
>> @@ -243,20 +243,17 @@ static void 
>> test_mode_transition_on_all_outputs(data_t *data)
>>       int debugfs_fd = data->debugfs_fd;
>>       drmModeModeInfo *mode, *mode_hi, *mode_lo;
>>       igt_output_t *output;
>> -    int valid_outputs = 0;
>>       int cdclk_ref, cdclk_new;
>>       uint16_t width = 0, height = 0;
>>       struct igt_fb fb;
>>       igt_pipe_t *pipe;
>>       igt_plane_t *plane;
>> -    int i = 0, j = 0;
>> +    enum pipe p, active_pipes[IGT_MAX_PIPES];
>> +    int i = 0, active_pipe_count = 0;
>>       do_cleanup_display(display);
>>       igt_display_reset(display);
>> -    for_each_connected_output(&data->display, output)
>> -        valid_outputs++;
>> -
>>       for_each_connected_output(display, output) {
>>           mode = igt_output_get_mode(output);
>>           igt_assert(mode);
>> @@ -269,52 +266,59 @@ static void 
>> test_mode_transition_on_all_outputs(data_t *data)
>>       igt_create_pattern_fb(data->drm_fd, width, height, 
>> DRM_FORMAT_XRGB8888,
>>                     DRM_FORMAT_MOD_LINEAR, &fb);
>> -    i = 0;
>> +
>>       for_each_connected_output(display, output) {
>> -        pipe = &display->pipes[i];
>> -        plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +        for_each_pipe(display, p) {
>> +            mode = NULL;
>> -        mode = NULL;
>> +            igt_output_set_pipe(output, p);
>> +            mode = igt_output_get_mode(output);
>> +            igt_assert(mode);
>> -        igt_output_set_pipe(output, i);
>> -        mode = igt_output_get_mode(output);
>> -        igt_assert(mode);
>> +            mode_hi = get_highres_mode(output);
>> +            igt_require(mode_hi != NULL);
>> +
>> +            igt_output_override_mode(output, mode_hi);
>> +            if (!i915_pipe_output_combo_valid(display)) {
>> +                igt_output_set_pipe(output, PIPE_NONE);
>> +                continue;
>> +            }
>> -        mode_lo = get_lowres_mode(output);
>> +            active_pipes[active_pipe_count++] = p;
>> +            pipe = &display->pipes[p];
>> +            plane = igt_pipe_get_plane_type(pipe, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +            igt_plane_set_fb(plane, &fb);
>> +            igt_fb_set_size(&fb, plane, mode_hi->hdisplay, 
>> mode_hi->vdisplay);
>> +            igt_plane_set_size(plane, mode_hi->hdisplay, 
>> mode_hi->vdisplay);
>> -        igt_output_override_mode(output, mode_lo);
>> -        igt_plane_set_fb(plane, &fb);
>> -        igt_fb_set_size(&fb, plane, mode_lo->hdisplay, 
>> mode_lo->vdisplay);
>> -        igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
>> -        i++;
>> +            break;
>> +        }
>>       }
>>       igt_display_commit2(display, COMMIT_ATOMIC);
>> -    cdclk_ref = get_current_cdclk_freq(debugfs_fd);
>> +    cdclk_new = get_current_cdclk_freq(debugfs_fd);
>> -    j = 0;
>>       for_each_connected_output(display, output) {
>> -        pipe = &display->pipes[j];
>> -        plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +        for (i = 0; i < active_pipe_count; i++) {
>> +            pipe = &display->pipes[active_pipes[i]];
>> +            plane = igt_pipe_get_plane_type(pipe, 
>> DRM_PLANE_TYPE_PRIMARY);
>> -        mode = NULL;
>> +            mode = NULL;
>> +            igt_output_set_pipe(output, i);
>> +            mode = igt_output_get_mode(output);
>> +            igt_assert(mode);
>> -        igt_output_set_pipe(output, j);
>> -        mode = igt_output_get_mode(output);
>> -        igt_assert(mode);
>> -
>> -        mode_hi = get_highres_mode(output);
>> -        igt_require(mode_hi != NULL);
>> +            mode_lo = get_lowres_mode(output);
>> -        igt_output_override_mode(output, mode_hi);
>> -        igt_plane_set_fb(plane, &fb);
>> -        igt_fb_set_size(&fb, plane, mode_hi->hdisplay, 
>> mode_hi->vdisplay);
>> -        igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
>> -        j++;
>> +            igt_output_override_mode(output, mode_lo);
>> +            igt_plane_set_fb(plane, &fb);
>> +            igt_fb_set_size(&fb, plane, mode_lo->hdisplay, 
>> mode_lo->vdisplay);
>> +            igt_plane_set_size(plane, mode_lo->hdisplay, 
>> mode_lo->vdisplay);
>> +        }
>>       }
>>       igt_display_commit2(display, COMMIT_ATOMIC);
>> -    cdclk_new = get_current_cdclk_freq(debugfs_fd);
>> +    cdclk_ref = get_current_cdclk_freq(debugfs_fd);
>>       igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
>>       /* cdclk should bump */
>> @@ -332,13 +336,18 @@ static void run_cdclk_test(data_t *data, 
>> uint32_t flags)
>>       enum pipe pipe;
>>       for_each_pipe_with_valid_output(display, pipe, output) {
>> -        igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), 
>> output->name)
>> -            if (igt_pipe_connector_valid(pipe, output)) {
>> -                if (flags & TEST_PLANESCALING)
>> -                    test_plane_scaling(data, pipe, output);
>> -                if (flags & TEST_MODETRANSITION)
>> -                    test_mode_transition(data, pipe, output);
>> -            }
>> +        igt_output_set_pipe(output, pipe);
>> +        if (!i915_pipe_output_combo_valid(display)) {
>> +            igt_output_set_pipe(output, PIPE_NONE);
>> +            continue;
>> +        }
>> +
>> +        igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), 
>> output->name) {
>> +            if (flags & TEST_PLANESCALING)
>> +                test_plane_scaling(data, pipe, output);
>> +            if (flags & TEST_MODETRANSITION)
>> +                test_mode_transition(data, pipe, output);
>> +        }
>>       }
>>   }
> 
