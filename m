Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C24C10EDEC
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 11:15:04 +0000 (UTC)
Message-ID: <4ea98540-5e1f-adb4-14fd-c05941feddaf@intel.com>
Date: Fri, 3 Jun 2022 16:44:47 +0530
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220601093956.8005-1-karthik.b.s@intel.com>
 <20220601093956.8005-2-karthik.b.s@intel.com>
 <95a9d385-b42e-7ce2-2184-902d318c648d@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <95a9d385-b42e-7ce2-2184-902d318c648d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_plane_lowres: Convert
 test to dynamic
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

On 6/3/2022 9:55 AM, Modem, Bhanuprakash wrote:
> On Wed-01-06-2022 03:09 pm, Karthik B S wrote:
>> Covert the existing subtests to dynamic subtests at pipe/output level.
>>
>> v2: -Use array of structures to populate subtests to avoid code
>>       duplication (Bhanu)
>>      -Update subtest name (Bhanu)
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_plane_lowres.c | 89 ++++++++++++++++++++++------------------
>>   1 file changed, 49 insertions(+), 40 deletions(-)
>>
>> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
>> index 3f3f77c8..7149bf18 100644
>> --- a/tests/kms_plane_lowres.c
>> +++ b/tests/kms_plane_lowres.c
>> @@ -256,30 +256,58 @@ test_planes_on_pipe(data_t *data, uint64_t 
>> modifier)
>>       igt_plane_t *plane;
>>       unsigned tested = 0;
>>   -    igt_require_pipe(&data->display, data->pipe);
>> -    igt_display_require_output_on_pipe(&data->display, data->pipe);
>> - igt_skip_on(!igt_display_has_format_mod(&data->display,
>> -                        DRM_FORMAT_XRGB8888, modifier));
>> +    for_each_plane_on_pipe(&data->display, data->pipe, plane)
>> +        tested += test_planes_on_pipe_with_output(data, plane, 
>> modifier);
>>   -    data->output = igt_get_single_output_for_pipe(&data->display, 
>> data->pipe);
>> -    igt_require(data->output);
>> +    igt_assert(tested > 0);
>> +}
>>   -    igt_info("Testing connector %s using pipe %s\n",
>> -         igt_output_name(data->output), kmstest_pipe_name(data->pipe));
>> +static void run_test(data_t *data, uint64_t modifier)
>> +{
>> +    enum pipe pipe;
>> +    igt_output_t *output;
>>   -    for_each_plane_on_pipe(&data->display, data->pipe, plane)
>> -        tested += test_planes_on_pipe_with_output(data, plane, 
>> modifier);
>> + igt_skip_on(!igt_display_has_format_mod(&data->display,
>> +                        DRM_FORMAT_XRGB8888, modifier));
>>   -    igt_output_set_pipe(data->output, PIPE_NONE);
>> -    igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +    for_each_pipe(&data->display, pipe) {
>> +        for_each_valid_output_on_pipe(&data->display, pipe, output) {
>> +            data->pipe = pipe;
>> +            data->output = output;
>>   -    igt_assert(tested > 0);
>> +            igt_display_reset(&data->display);
>> +            igt_output_set_pipe(data->output, data->pipe);
>> +
>> +            igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), 
>> data->output->name)
>> +                test_planes_on_pipe(data, DRM_FORMAT_MOD_LINEAR);
>
> s/DRM_FORMAT_MOD_LINEAR/modifier/

Will fix this.

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
>>   igt_main
>>   {
>>       data_t data = {};
>> -    enum pipe pipe;
>>         igt_fixture {
>>           data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> @@ -293,33 +321,14 @@ igt_main
>>           igt_require(data.display.is_atomic);
>>       }
>>   -    for_each_pipe_static(pipe) {
>> -        data.pipe = pipe;
>> -        igt_describe("Tests the visibility of the planes when 
>> switching between "
>> -                 "high and low resolution with tiling as none.");
>> -        igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
>> -            test_planes_on_pipe(&data, DRM_FORMAT_MOD_LINEAR);
>> -
>> -        igt_describe("Tests the visibility of the planes when 
>> switching between "
>> -                 "high and low resolution with x-tiling.");
>> -        igt_subtest_f("pipe-%s-tiling-x", kmstest_pipe_name(pipe))
>> -            test_planes_on_pipe(&data, I915_FORMAT_MOD_X_TILED);
>> -
>> -        igt_describe("Tests the visibility of the planes when 
>> switching between "
>> -                 "high and low resolution with y-tiling.");
>> -        igt_subtest_f("pipe-%s-tiling-y", kmstest_pipe_name(pipe))
>> -            test_planes_on_pipe(&data, I915_FORMAT_MOD_Y_TILED);
>> -
>> -        igt_describe("Tests the visibility of the planes when 
>> switching between "
>> -                 "high and low resolution with yf-tiling.");
>> -        igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
>> -            test_planes_on_pipe(&data, I915_FORMAT_MOD_Yf_TILED);
>> -
>> -        igt_subtest_f("pipe-%s-tiling-4", kmstest_pipe_name(pipe))
>> -            test_planes_on_pipe(&data, I915_FORMAT_MOD_4_TILED);
>> +    for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
>> +        igt_describe_f("Tests the visibility of the planes when 
>> switching between "
>> +                   "high and low resolution with %s", 
>> subtests[i].name);
>
> Please add newline '\n'.
Will add this.
>
>
> With above changes, this patch is
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Thank you for the rb.

Thanks,
Karthik.B.S
>
> - Bhanu
>
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
