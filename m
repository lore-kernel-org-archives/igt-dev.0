Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A213210E856
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 06:34:33 +0000 (UTC)
Message-ID: <fb118f04-9e25-6aaa-465f-66cc7fc33455@intel.com>
Date: Wed, 21 Sep 2022 12:04:14 +0530
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220913135244.15703-1-karthik.b.s@intel.com>
 <c5757160-11c1-7672-6cf0-09f8fafcfd10@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <c5757160-11c1-7672-6cf0-09f8fafcfd10@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Convert
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

On 9/14/2022 10:01 AM, Modem, Bhanuprakash wrote:
> On Tue-13-09-2022 07:22 pm, Karthik B S wrote:
>> Covert the existing subtests to dynamic subtests at pipe/output level.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_plane_alpha_blend.c | 149 ++++++++++++++++++++++------------
>>   1 file changed, 96 insertions(+), 53 deletions(-)
>>
>> diff --git a/tests/kms_plane_alpha_blend.c 
>> b/tests/kms_plane_alpha_blend.c
>> index bd064d1e..3e7ac7ec 100644
>> --- a/tests/kms_plane_alpha_blend.c
>> +++ b/tests/kms_plane_alpha_blend.c
>> @@ -466,12 +466,11 @@ static void coverage_premult_constant(data_t 
>> *data, enum pipe pipe, igt_plane_t
>>       igt_pipe_crc_stop(data->pipe_crc);
>>   }
>>   -static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, 
>> bool blend,
>> -                    bool must_multiply,
>> +static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, 
>> igt_output_t *output,
>> +                    bool blend, bool must_multiply,
>>                       void(*test)(data_t *, enum pipe, igt_plane_t *))
>>   {
>>       igt_display_t *display = &data->display;
>> -    igt_output_t *output = igt_get_single_output_for_pipe(display, 
>> pipe);
>>       igt_plane_t *plane;
>>       bool found = false;
>>       bool multiply = false;
>> @@ -506,68 +505,114 @@ static void run_test_on_pipe_planes(data_t 
>> *data, enum pipe pipe, bool blend,
>>       igt_require_f(multiply, "Multiplied (plane x pixel) alpha not 
>> available\n");
>>   }
>>   -static void run_subtests(data_t *data, enum pipe pipe)
>> +static const struct {
>> +    const char *name;
>> +    void (*test)(data_t *, enum pipe, igt_plane_t *);
>> +    bool blend;
>> +    bool must_multiply;
>> +    const char *desc;
>> +} subtests[] = {
>> +    { .name = "alpha-basic",
>> +      .test = basic_alpha,
>> +      .blend = false,
>> +      .must_multiply = true,
>> +      .desc = "Tests basic plane alpha properties.",
>> +    },
>> +    { .name = "alpha-7efc",
>> +      .test = alpha_7efc,
>> +      .blend = false,
>> +      .must_multiply = true,
>> +      .desc = "Uses alpha values 0x7e and 0xfc to validate fg.alpha 
>> and "
>> +          "plane_alpha are swappable on pre-multiplied blend mode.",
>> +    },
>> +    { .name = "coverage-7efc",
>> +      .test = coverage_7efc,
>> +      .blend = true,
>> +      .must_multiply = true,
>> +      .desc = "Uses alpha values 0x7e and 0xfc to validate fg.alpha 
>> and "
>> +          "plane_alpha are swappable on coverage blend mode.",
>> +    },
>> +    { .name = "coverage-vs-premult-vs-constant",
>> +      .test = coverage_premult_constant,
>> +      .blend = true,
>> +      .must_multiply = false,
>> +      .desc = "Tests pipe coverage blending properties.",
>> +    },
>> +    { .name = "alpha-transparent-fb",
>> +      .test = argb_transparent,
>> +      .blend = false,
>> +      .must_multiply = false,
>> +      .desc = "Tests the alpha property with transparent fb.",
>> +    },
>> +    { .name = "alpha-opaque-fb",
>> +      .test = argb_opaque,
>> +      .blend = false,
>> +      .must_multiply = false,
>> +      .desc = "Tests alpha properties with opaque fb.",
>> +    },
>> +    { .name = "constant-alpha-min",
>> +      .test = constant_alpha_min,
>> +      .blend = true,
>> +      .must_multiply = false,
>> +      .desc = "Tests plane alpha and blending properties with 
>> minimum alpha value.",
>> +    },
>> +    { .name = "constant-alpha-mid",
>> +      .test = constant_alpha_mid,
>> +      .blend = true,
>> +      .must_multiply = false,
>> +      .desc = "Tests plane alpha and blending properties with medium 
>> alpha value.",
>> +    },
>> +    { .name = "constant-alpha-max",
>> +      .test = constant_alpha_max,
>> +      .blend = true,
>> +      .must_multiply = false,
>> +      .desc = "Tests plane alpha and blending properties with 
>> maximum alpha value.",
>> +    },
>> +};
>> +
>> +static void pipe_check(igt_display_t *display, enum pipe pipe)
>>   {
>> -    igt_fixture {
>> -        bool found = false;
>> -        igt_plane_t *plane;
>> -
>> - igt_display_require_output_on_pipe(&data->display, pipe);
>> -        for_each_plane_on_pipe(&data->display, pipe, plane) {
>> -            if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
>> -                continue;
>> +    bool found = false;
>> +    igt_plane_t *plane;
>>   -            found = true;
>> -            break;
>> -        }
>> +    igt_display_require_output_on_pipe(display, pipe);
>> +    for_each_plane_on_pipe(display, pipe, plane) {
>> +        if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
>> +            continue;
>>   -        igt_require_f(found, "Found no plane on pipe %s with alpha 
>> blending supported\n",
>> -                  kmstest_pipe_name(pipe));
>> +        found = true;
>> +        break;
>
> Let's make this function as bool & return true if we found a valid 
> plane else false. And execute igt_dynamic() based on this return value.

Hi,

Thank you for the review. Sure, will update this.

>
>>       }
>>   -    igt_describe("Tests basic plane alpha properties.");
>> -    igt_subtest_f("pipe-%s-alpha-basic", kmstest_pipe_name(pipe))
>> -        run_test_on_pipe_planes(data, pipe, false, true, basic_alpha);
>> +    igt_require_f(found, "Found no plane on pipe %s with alpha 
>> blending supported\n",
>> +              kmstest_pipe_name(pipe));
>>   -    igt_describe("Uses alpha values 0x7e and 0xfc to validate 
>> fg.alpha and "
>> -             "plane_alpha are swappable on pre-multiplied blend 
>> mode.");
>> -    igt_subtest_f("pipe-%s-alpha-7efc", kmstest_pipe_name(pipe))
>> -        run_test_on_pipe_planes(data, pipe, false, true, alpha_7efc);
>> -
>> -    igt_describe("Uses alpha values 0x7e and 0xfc to validate 
>> fg.alpha and "
>> -             "plane_alpha are swappable on coverage blend mode.");
>> -    igt_subtest_f("pipe-%s-coverage-7efc", kmstest_pipe_name(pipe))
>> -        run_test_on_pipe_planes(data, pipe, true, true, coverage_7efc);
>> -
>> -    igt_describe("Tests pipe coverage blending properties.");
>> -    igt_subtest_f("pipe-%s-coverage-vs-premult-vs-constant", 
>> kmstest_pipe_name(pipe))
>> -        run_test_on_pipe_planes(data, pipe, true, false, 
>> coverage_premult_constant);
>> -
>> -    igt_describe("Tests the alpha property with transparent fb.");
>> -    igt_subtest_f("pipe-%s-alpha-transparent-fb", 
>> kmstest_pipe_name(pipe))
>> -        run_test_on_pipe_planes(data, pipe, false, false, 
>> argb_transparent);
>> +}
>>   -    igt_describe("Tests alpha properties with opaque fb.");
>> -    igt_subtest_f("pipe-%s-alpha-opaque-fb", kmstest_pipe_name(pipe))
>> -        run_test_on_pipe_planes(data, pipe, false, false, argb_opaque);
>> +static void run_subtests(data_t *data)
>> +{
>> +    igt_output_t *output;
>> +    enum pipe pipe;
>>   -    igt_describe("Tests plane alpha and blending properties with 
>> minimum alpha value.");
>> -    igt_subtest_f("pipe-%s-constant-alpha-min", 
>> kmstest_pipe_name(pipe))
>> -        run_test_on_pipe_planes(data, pipe, true, false, 
>> constant_alpha_min);
>> +    for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
>> +        igt_describe_f("%s\n", subtests[i].desc);
>>   -    igt_describe("Tests plane alpha and blending properties with 
>> medium alpha value");
>> -    igt_subtest_f("pipe-%s-constant-alpha-mid", 
>> kmstest_pipe_name(pipe))
>> -        run_test_on_pipe_planes(data, pipe, true, false, 
>> constant_alpha_mid);
>> +        igt_subtest_with_dynamic(subtests[i].name) {
>> +            for_each_pipe(&data->display, pipe) {
>> +                pipe_check(&data->display, pipe);
>> +                output = 
>> igt_get_single_output_for_pipe(&data->display, pipe);
>
> There is a possibility of (output == NULL), So best option is to use 
> for_each_pipe_with_single_output().
Sure, will update this.
>
>>   -    igt_describe("Tests plane alpha and blending properties with 
>> maximum alpha value");
>> -    igt_subtest_f("pipe-%s-constant-alpha-max", 
>> kmstest_pipe_name(pipe))
>> -        run_test_on_pipe_planes(data, pipe, true, false, 
>> constant_alpha_max);
>> +                igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), 
>> output->name)
>> +                    run_test_on_pipe_planes(data, pipe, output, 
>> subtests[i].blend,
>> +                                subtests[i].must_multiply, 
>> subtests[i].test);
>
> There are few igt_require*() inside run_test_on_pipe_planes().
> Those should be moved to outside (Just before calling igt_dynamic*()).
Sure, will move this before dynamic and not trigger the dynamic subtest 
if requirement is not met.
>
> Also, as these are plane tests, we don't need to prepare the crtc for 
> each plane. So we need some cleanup to optimize this logic.
>
> for_each_plane() {
>   prepare_crtc();
>   test();
> }
>
> prepare_crtc();
> for_each_plane() {
>   test();
> }

Agreed, will update this.

Thanks,
Karthik.B.S
>
> - Bhanu
>
>> +            }
>> +        }
>> +    }
>>   }
>>     igt_main
>>   {
>>       data_t data = {};
>> -    enum pipe pipe;
>>         igt_fixture {
>>           data.gfx_fd = drm_open_driver_master(DRIVER_ANY);
>> @@ -576,9 +621,7 @@ igt_main
>>           igt_require(data.display.is_atomic);
>>       }
>>   -    for_each_pipe_static(pipe)
>> -        igt_subtest_group
>> -            run_subtests(&data, pipe);
>> +    run_subtests(&data);
>>         igt_fixture {
>>           igt_display_reset(&data.display);
>
