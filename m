Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C32C1124D4
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 05:30:27 +0000 (UTC)
Message-ID: <471a3049-b507-de58-b588-d9a9b3499751@intel.com>
Date: Thu, 11 Aug 2022 11:00:16 +0530
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220808055945.11247-1-karthik.b.s@intel.com>
 <6b7caf7a-2dad-a404-844a-0cd430c5a30e@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <6b7caf7a-2dad-a404-844a-0cd430c5a30e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Convert tests
 to dynamic
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

On 8/9/2022 2:59 PM, Modem, Bhanuprakash wrote:
> On Mon-08-08-2022 11:29 am, Karthik B S wrote:
>> Covert the existing subtests to dynamic subtests at pipe/output level.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_plane_multiple.c | 69 +++++++++++++++++++++-----------------
>>   1 file changed, 39 insertions(+), 30 deletions(-)
>>
>> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
>> index 1679f7ce..3b4c53e9 100644
>> --- a/tests/kms_plane_multiple.c
>> +++ b/tests/kms_plane_multiple.c
>> @@ -363,15 +363,11 @@ test_plane_position_with_output(data_t *data, 
>> enum pipe pipe,
>>   }
>>     static void
>> -test_plane_position(data_t *data, enum pipe pipe, uint64_t modifier)
>> +test_plane_position(data_t *data, enum pipe pipe, igt_output_t 
>> *output, uint64_t modifier)
>>   {
>> -    igt_output_t *output;
>>       int n_planes = opt.all_planes ?
>>               data->display.pipes[pipe].n_planes : DEFAULT_N_PLANES;
>>   -    output = igt_get_single_output_for_pipe(&data->display, pipe);
>> -    igt_require(output);
>> -
>>       if (!opt.user_seed)
>>           opt.seed = time(NULL);
>>   @@ -381,30 +377,45 @@ test_plane_position(data_t *data, enum pipe 
>> pipe, uint64_t modifier)
>>                       n_planes, modifier);
>>   }
>>   -static void
>> -run_tests_for_pipe(data_t *data, enum pipe pipe)
>> +static void run_test(data_t *data, uint64_t modifier)
>>   {
>> -    igt_fixture {
>> -        igt_require_pipe(&data->display, pipe);
>> -        igt_require(data->display.pipes[pipe].n_planes > 0);
>> -    }
>> -
>> -    igt_subtest_f("atomic-pipe-%s-tiling-x", kmstest_pipe_name(pipe))
>> -        test_plane_position(data, pipe, I915_FORMAT_MOD_X_TILED);
>> -
>> -    igt_subtest_f("atomic-pipe-%s-tiling-y", kmstest_pipe_name(pipe))
>> -        test_plane_position(data, pipe, I915_FORMAT_MOD_Y_TILED);
>> +    enum pipe pipe;
>> +    igt_output_t *output;
>>   -    igt_subtest_f("atomic-pipe-%s-tiling-yf", 
>> kmstest_pipe_name(pipe))
>> -        test_plane_position(data, pipe, I915_FORMAT_MOD_Yf_TILED);
>> + igt_skip_on(!igt_display_has_format_mod(&data->display,
>> +                        DRM_FORMAT_XRGB8888, modifier));
>
> Instead of Triggering the SKIP, just return from this function. IGT 
> will throw SKIP automatically, since there is no execution of 
> igt_dynamic().
>
> Else, we can move this check to igt_fixture just before calling 
> igt_subtest_with_dynamic()
>
> "Trigger subtest & SKIP" Vs "Don't trigger".

Thank you for the review.

Sure, will remove the igt_skip_on and return using this condition.

>
>>   - igt_subtest_f("atomic-pipe-%s-tiling-4", kmstest_pipe_name(pipe))
>> -        test_plane_position(data, pipe, I915_FORMAT_MOD_4_TILED);
>> +    for_each_pipe(&data->display, pipe) {
>> +        for_each_valid_output_on_pipe(&data->display, pipe, output) {
>
> We have a helper to combine these two loops. 
> for_each_pipe_with_valid_output().
Sure, will fix this.
>
> BTW, since it is a plane test, does the output is really matter?
> If there is no dependency with the output, then we better to use
> for_each_pipe_with_single_output()
Just keeping it since this is a MPO test and might catch some BW issues 
on different displays. For ex: A 2 display setup with a 8k display as 
the second display.
>
>> + igt_display_reset(&data->display);
>>   -    igt_subtest_f("atomic-pipe-%s-tiling-none", 
>> kmstest_pipe_name(pipe))
>> -        test_plane_position(data, pipe, DRM_FORMAT_MOD_LINEAR);
>> +            igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), 
>> output->name)
>> +                test_plane_position(data, pipe, output, modifier);
>
> There are few SKIPs inside igt_dynamic() i.e get_reference_crc(), is 
> there any chance to avoid those?
Will remove the skip's which is used for checking modifier as now it is 
being checked anyway before the start of the subtest. Only one skip 
would still remain within the dynamic subtest which will hit if 
try_commit fails.
>
>> +        }
>> +    }
>>   }
>>   +static const struct {
>> +    const char *name;
>> +    uint64_t modifier;
>> +} subtests[] = {
>> +    { .name = "tiling-none",
>> +      .modifier = DRM_FORMAT_MOD_LINEAR,
>> +    },
>> +    { .name = "tiling-x",
>> +      .modifier = I915_FORMAT_MOD_X_TILED,
>> +    },
>> +    { .name = "tiling-y",
>> +      .modifier = I915_FORMAT_MOD_Y_TILED,
>> +    },
>> +    { .name = "tiling-yf",
>> +      .modifier = I915_FORMAT_MOD_Yf_TILED,
>> +    },
>> +    { .name = "tiling-4",
>> +      .modifier = I915_FORMAT_MOD_4_TILED,
>> +    },
>> +};
>> +
>>   static data_t data;
>>     static int opt_handler(int option, int option_index, void *input)
>> @@ -447,8 +458,6 @@ struct option long_options[] = {
>>     igt_main_args("", long_options, help_str, opt_handler, NULL)
>>   {
>> -    enum pipe pipe;
>> -
>>       igt_fixture {
>>           data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>           kmstest_set_vt_graphics_mode();
>> @@ -457,16 +466,16 @@ igt_main_args("", long_options, help_str, 
>> opt_handler, NULL)
>>           igt_require(data.display.is_atomic);
>
> Please add igt_display_require_output() in igt_fixture to avoid 
> execution on no-display configs.

Sure, will add this.

Thanks,
Karthik.B.S
>
> - Bhanu
>
>>       }
>>   -    for_each_pipe_static(pipe) {
>> +    for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
>>           igt_describe("Check that the kernel handles atomic updates 
>> of "
>>                    "multiple planes correctly by changing their "
>>                    "geometry and making sure the changes are "
>>                    "reflected immediately after each commit.");
>> -        igt_subtest_group
>> -            run_tests_for_pipe(&data, pipe);
>> +
>> +        igt_subtest_with_dynamic(subtests[i].name)
>> +            run_test(&data, subtests[i].modifier);
>>       }
>>   -    igt_fixture {
>> +    igt_fixture
>>           igt_display_fini(&data.display);
>> -    }
>>   }
>
