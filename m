Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5EB10E113
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 12:39:17 +0000 (UTC)
Message-ID: <83d0d48b-502f-0b36-fc0d-513d22fa9c75@intel.com>
Date: Wed, 15 Nov 2023 18:09:01 +0530
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20231115070344.1488683-1-bhanuprakash.modem@intel.com>
 <20231115070344.1488683-6-bhanuprakash.modem@intel.com>
 <11ce2f7dcaa83740b75551a7ccb3a99261b3fe92.camel@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <11ce2f7dcaa83740b75551a7ccb3a99261b3fe92.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 5/5] tests/intel/kms_dirtyfb: Restructure
 dynamic subtests
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

Hi Jouni,

On Wed-15-11-2023 03:49 pm, Hogander, Jouni wrote:
> On Wed, 2023-11-15 at 12:33 +0530, Bhanuprakash Modem wrote:
>> Instead of having all features under single subtest, create
>> a subtest for each feature.
>>
>> Before:
>> igt@kms_dirtyfb@dirtyfb-ioctl@psr-eDP-1
>> igt@kms_dirtyfb@dirtyfb-ioctl@fbc-eDP-1
>> igt@kms_dirtyfb@dirtyfb-ioctl@drrs-eDP-1
>>
>> After:
>> igt@kms_dirtyfb@psr-dirtyfb-ioctl@pipe-A-eDP-1
>> igt@kms_dirtyfb@fbc-dirtyfb-ioctl@pipe-A-eDP-1
>> igt@kms_dirtyfb@drrs-dirtyfb-ioctl@pipe-A-eDP-1
> 
> Obviously you have some specific reason for this change:
> 
> Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
> 
> Just for curiosity, what is the problem with the original approach?

There is no problem with previous approach, but this patch helps in 
below areas.

1. Better reporting: As features are at dynamic subtest level, single 
dynamic subtest failure treats entire subtest as fail. With this change, 
we can get the feature level pass/fail rate.
2. Execution time: Earlier time taken to complete one subtest is (F*C*T) 
secs, Now, it'll reduce to (C*T) secs which will help to prevent CI 
timeouts.

Where F is number of features, C is number of connectors, and T is time 
to complete one dynamic subtest.

- Bhanu

> 
> BR,
> 
> Jouni Högander
>>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Jouni Högander <jouni.hogander@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/intel/kms_dirtyfb.c | 67 +++++++++++++++++++++++++++----------
>> --
>>   1 file changed, 46 insertions(+), 21 deletions(-)
>>
>> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
>> index a0f61b7a3..5ab2dc59f 100644
>> --- a/tests/intel/kms_dirtyfb.c
>> +++ b/tests/intel/kms_dirtyfb.c
>> @@ -20,15 +20,26 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is
>> working properly with "
>>    * TEST: kms dirtyfb
>>    * Category: Display
>>    * Description: Test DIRTYFB ioctl functionality.
>> + * Driver requirement: i915, xe
>> + * Functionality: dirtyfb
>> + * Mega feature: General Display Features
>> + * Test category: functionality test
>>    *
>> - * SUBTEST: dirtyfb-ioctl
>> + * SUBTEST: default-dirtyfb-ioctl
>>    * Description: Test DIRTYFB ioctl is working properly using GPU
>>    *              frontbuffer rendering with features like FBC, PSR
>>    *              and DRRS.
>> - * Driver requirement: i915, xe
>> - * Functionality: dirtyfb, fbc, psr, drrs
>> - * Mega feature: General Display Features
>> - * Test category: functionality test
>> + *
>> + * SUBTEST: %s-dirtyfb-ioctl
>> + * Description: Test DIRTYFB ioctl is working properly using GPU
>> + *              frontbuffer rendering with %arg[1] feature.
>> + * Functionality: dirtyfb, %arg[1]
>> + *
>> + * arg[1]:
>> + *
>> + * @drrs:    drrs
>> + * @fbc:     fbc
>> + * @psr:     psr1
>>    */
>>   
>>   #ifndef PAGE_ALIGN
>> @@ -160,10 +171,6 @@ static void prepare(data_t *data)
>>   {
>>          igt_plane_t *primary;
>>   
>> -       igt_skip_on(!check_support(data));
>> -
>> -       igt_display_reset(&data->display);
>> -
>>          data->mode = igt_output_get_mode(data->output);
>>   
>>          igt_output_set_pipe(data->output, data->pipe);
>> @@ -297,19 +304,37 @@ igt_main
>>                  igt_display_reset(&data.display);
>>          }
>>   
>> -       igt_describe("Test dirtyFB ioctl");
>> -       igt_subtest_with_dynamic("dirtyfb-ioctl") {
>> -               data.pipe = PIPE_A;
>> -               for_each_valid_output_on_pipe(&data.display,
>> data.pipe,
>> -                                             data.output) {
>> -                       for (data.feature = FEATURE_DEFAULT;
>> data.feature > 0;
>> -                            data.feature = data.feature >> 1) {
>> -                               igt_dynamic_f("%s-%s",
>> feature_str(data.feature),
>> -
>> igt_output_name(data.output)) {
>> -                                       prepare(&data);
>> -                                       run_test(&data);
>> -                                       cleanup(&data);
>> +       for (data.feature = FEATURE_DEFAULT; data.feature > 0;
>> +            data.feature = data.feature >> 1) {
>> +               igt_describe_f("Test dirtyFB ioctl with %s",
>> feature_str(data.feature));
>> +               igt_subtest_with_dynamic_f("%s-dirtyfb-ioctl",
>> feature_str(data.feature)) {
>> +                       for_each_pipe(&data.display, data.pipe) {
>> +                               int valid_tests = 0;
>> +
>> +                               for_each_valid_output_on_pipe(&data.d
>> isplay,
>> +
>> data.pipe,
>> +
>> data.output) {
>> +                                       if (!check_support(&data))
>> +                                               continue;
>> +
>> +                                       igt_display_reset(&data.displ
>> ay);
>> +                                       igt_output_set_pipe(data.outp
>> ut, data.pipe);
>> +                                       if
>> (!intel_pipe_output_combo_valid(&data.display))
>> +                                               continue;
>> +
>> +                                       valid_tests++;
>> +                                       igt_dynamic_f("%s-%s",
>> +
>> kmstest_pipe_name(data.pipe),
>> +
>> igt_output_name(data.output)) {
>> +                                               prepare(&data);
>> +                                               run_test(&data);
>> +                                               cleanup(&data);
>> +                                       }
>>                                  }
>> +
>> +                               /* One pipe is enough. */
>> +                               if (valid_tests)
>> +                                       break;
>>                          }
>>                  }
>>          }
> 
