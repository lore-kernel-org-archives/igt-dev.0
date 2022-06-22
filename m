Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469D0113ACA
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 06:27:06 +0000 (UTC)
Message-ID: <d0929a13-2b36-404c-1b9b-7e4a083ef5a5@intel.com>
Date: Wed, 22 Jun 2022 11:56:39 +0530
Content-Language: en-US
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220615061123.4158764-1-bhanuprakash.modem@intel.com>
 <c0e30271-6b70-e189-80ac-ea73280fa76d@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <c0e30271-6b70-e189-80ac-ea73280fa76d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_dither: Skip if current & requested
 BPC doesn't match
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

On Tue-21-06-2022 12:09 pm, Nautiyal, Ankit K wrote:
> Hi Bhanu,
> 
> Please find the comments inline.
> 
> On 6/15/2022 11:41 AM, Bhanuprakash Modem wrote:
>> The "max bpc" property only ensures that the bpc will not go beyond
>> the value set through this property. It does not guarantee that the
>> same bpc will be used for the given mode.
>>
>> If clock/bandwidth constraints permit, the max bpc will be used to
>> show the mode, otherwise the bpc will be reduced. So, if we really
>> want a particular bpc set, we can try reducing the resolution, till
>> we get the bpc that we set in max bpc property.
>>
>> This patch will skip the test, if there is no valid resolution to get
>> the same bpc as set by max_bpc property.
>>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/kms_dither.c | 72 ++++++++++++++++++++++++----------------------
>>   1 file changed, 37 insertions(+), 35 deletions(-)
>>
>> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
>> index c72f83be..02896b37 100644
>> --- a/tests/kms_dither.c
>> +++ b/tests/kms_dither.c
>> @@ -46,10 +46,6 @@ IGT_TEST_DESCRIPTION("Test Dithering block status");
>>   typedef struct data {
>>       igt_display_t display;
>>       igt_plane_t *primary;
>> -    igt_output_t *output;
>> -    igt_pipe_t *pipe;
>> -    drmModeModeInfo *mode;
>> -    enum pipe pipe_id;
> 
> Perhaps commit message can have a line for this change as well.
> 
> 
>>       int drm_fd;
>>       igt_fb_t fb;
>>   } data_t;
>> @@ -60,30 +56,23 @@ typedef struct {
>>   } dither_status_t;
>>   /* Prepare test data. */
>> -static void prepare_test(data_t *data, igt_output_t *output, enum 
>> pipe pipe)
>> +static void prepare_test(data_t *data, igt_output_t *output, enum 
>> pipe p)
>>   {
>>       igt_display_t *display = &data->display;
>> +    igt_pipe_t *pipe = &data->display.pipes[p];
>> -    data->pipe_id = pipe;
>> -    data->pipe = &data->display.pipes[data->pipe_id];
>> -    igt_assert(data->pipe);
>> +    igt_assert(pipe);
>>       igt_display_reset(display);
>> -    data->output = output;
>> -    igt_assert(data->output);
>> -
>> -    data->mode = igt_output_get_mode(data->output);
>> -    igt_assert(data->mode);
>> -
>>       data->primary =
>> -        igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>> +        igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -    igt_output_set_pipe(data->output, data->pipe_id);
>> +    igt_output_set_pipe(output, p);
>>   }
>>   /* Returns the current state of dithering from the crtc debugfs. */
>> -static dither_status_t get_dither_state(data_t *data)
>> +static dither_status_t get_dither_state(data_t *data, enum pipe pipe)
>>   {
>>       char buf[512], tmp[5];
>>       char *start_loc;
>> @@ -103,11 +92,34 @@ static dither_status_t get_dither_state(data_t 
>> *data)
>>       igt_assert_eq(sscanf(start_loc, ", dither=%s", tmp), 1);
>>       status.dither = !strcmp(tmp, "yes,");
>> -    status.bpc = igt_get_pipe_current_bpc(data->drm_fd, data->pipe_id);
>> +    status.bpc = igt_get_pipe_current_bpc(data->drm_fd, pipe);
>>       return status;
>>   }
>> +static bool i915_clock_constraint(data_t *data, enum pipe pipe,
>> +                  igt_output_t *output, int bpc)
>> +{
>> +    drmModeConnector *connector = output->config.connector;
>> +    igt_display_t *display = &data->display;
>> +
>> +    igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
>> +
>> +    for_each_connector_mode(output) {
>> +        igt_output_override_mode(output, &connector->modes[j__]);
>> +        igt_display_commit2(display, display->is_atomic ? 
>> COMMIT_ATOMIC : COMMIT_LEGACY);
> 
> I think this should be igt_display_try_commit2, otherwise the test will 
> fail and not try different modes.

Thanks for the review Ankit.

NO, Commit should pass for every mode, but "current bpc" (which is 
pipe_bpp/3) might be less than the requested. So that we can iterate 
over all available modes until it matches with requested bpc.

Commit failures due to some other reasons are not expected to catch here.

- Bhanu

> 
> Otherwise patch seems to be fine to me.
> 
> Regards,
> 
> Ankit
> 
> 
>> +
>> +        if (!igt_check_output_bpc_equal(data->drm_fd, pipe,
>> +                        output->name, bpc))
>> +            continue;
>> +
>> +        return true;
>> +    }
>> +
>> +    igt_output_override_mode(output, NULL);
>> +    return false;
>> +}
>> +
>>   static void test_dithering(data_t *data, enum pipe pipe,
>>                  igt_output_t *output,
>>                  int fb_bpc, int fb_format,
>> @@ -121,14 +133,12 @@ static void test_dithering(data_t *data, enum 
>> pipe pipe,
>>               output->name, kmstest_pipe_name(pipe));
>>       prepare_test(data, output, pipe);
>> -    igt_assert(igt_create_fb(data->drm_fd, data->mode->hdisplay,
>> -                 data->mode->vdisplay, fb_format,
>> +    igt_assert(igt_create_fb(data->drm_fd, 512, 512, fb_format,
>>                    DRM_FORMAT_MOD_LINEAR, &data->fb));
>>       igt_plane_set_fb(data->primary, &data->fb);
>> -    igt_plane_set_size(data->primary, data->mode->hdisplay, 
>> data->mode->vdisplay);
>>       bpc = igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>> -    igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 
>> output_bpc);
>> +    igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 
>> output_bpc);
>>       if (display->is_atomic)
>>           ret = igt_display_try_commit_atomic(display,
>> @@ -141,12 +151,9 @@ static void test_dithering(data_t *data, enum 
>> pipe pipe,
>>       igt_require_f(!ret, "%s don't support %d-bpc\n",
>>                   output->name, output_bpc);
>> -    igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : 
>> COMMIT_LEGACY);
>> -
>> -    if (!igt_check_output_bpc_equal(data->drm_fd, pipe, output->name, 
>> output_bpc)) {
>> -        igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc);
>> -        igt_fail_on_f(true, "Failed to set max_bpc as: %d\n", 
>> output_bpc);
>> -    }
>> +    igt_require_f(i915_clock_constraint(data, pipe, output, output_bpc),
>> +            "No supported mode found to use %d-bpc on %s\n",
>> +            output_bpc, output->name);
>>       /*
>>        * Check the status of Dithering block:
>> @@ -155,7 +162,7 @@ static void test_dithering(data_t *data, enum pipe 
>> pipe,
>>        * If fb_bpc is greater than output_bpc, Dithering should be 
>> enabled
>>        * Else disabled
>>        */
>> -    status = get_dither_state(data);
>> +    status = get_dither_state(data, pipe);
>>       igt_info("FB BPC:%d, Panel BPC:%d, Pipe BPC:%d, Expected 
>> Dither:%s, Actual result:%s\n",
>>             fb_bpc, output_bpc, status.bpc,
>> @@ -167,17 +174,12 @@ static void test_dithering(data_t *data, enum 
>> pipe pipe,
>>       * Otherwise, previously updated value will stay forever and
>>       * may cause the failures for next/other subtests.
>>       */
>> -    igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, bpc);
>> +    igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc);
>>       igt_plane_set_fb(data->primary, NULL);
>>       igt_output_set_pipe(output, PIPE_NONE);
>>       igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC 
>> : COMMIT_LEGACY);
>>       igt_remove_fb(data->drm_fd, &data->fb);
>> -    /* Check if crtc bpc is updated with requested one. */
>> -    igt_require_f((status.bpc == output_bpc),
>> -            "%s can support max %u-bpc, but requested %d-bpc\n",
>> -                output->name, status.bpc, output_bpc);
>> -
>>       /* Compute the result. */
>>       if (fb_bpc > output_bpc)
>>           igt_assert_f(status.dither, "(fb_%dbpc > output_%dbpc): 
>> Dither should be enabled\n",
