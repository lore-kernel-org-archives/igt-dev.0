Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBB810E32C
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 15:32:21 +0000 (UTC)
Message-ID: <10312d16-e516-447b-8ba8-cdc10ed0aca8@intel.com>
Date: Tue, 10 Oct 2023 21:02:15 +0530
MIME-Version: 1.0
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926114751.2757259-1-bhanuprakash.modem@intel.com>
 <20230926114751.2757259-2-bhanuprakash.modem@intel.com>
 <1489acac-66a9-02a5-912a-280a1c5d1b96@intel.com>
In-Reply-To: <1489acac-66a9-02a5-912a-280a1c5d1b96@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t 1/2] tests/intel/kms_pm_lpsp: Test optimization
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 27-Sep-23 12:48 PM, Sharma, Swati2 wrote:
> Hi Bhanu,
> 
> On 26-Sep-23 5:17 PM, Bhanuprakash Modem wrote:
>> - Don't skip dynamic subtest, instead don't run it
>> - Remove hard coded pipe & make it generic
> 
> LPSP is enabled only on pipe A, then why we want to make this generic?
> 
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/intel/kms_pm_lpsp.c | 49 +++++++++++++++++++++++++--------------
>>   1 file changed, 32 insertions(+), 17 deletions(-)
>>
>> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
>> index 14f4b77f5..d3e543048 100644
>> --- a/tests/intel/kms_pm_lpsp.c
>> +++ b/tests/intel/kms_pm_lpsp.c
>> @@ -38,7 +38,7 @@
>>    * Category: Display
>>    *
>>    * SUBTEST: kms-lpsp
>> - * Description: This test validates lpsp on all connected outputs on 
>> low power PIPE_A
>> + * Description: This test validates lpsp on all connected outputs on 
>> low power pipes
>>    * Driver requirement: i915, xe
>>    * Functionality: pm_lpsp
>>    * Mega feature: Display Power
>> @@ -65,6 +65,7 @@ typedef struct {
>>       struct igt_fb fb;
>>       drmModeModeInfo *mode;
>>       igt_output_t *output;
>> +    enum pipe pipe;
>>   } data_t;
>>   static bool lpsp_is_enabled(data_t *data)
>> @@ -122,8 +123,7 @@ static void setup_lpsp_output(data_t *data)
>>   {
>>       igt_plane_t *primary;
>> -    /* set output pipe = PIPE_A for LPSP */
>> -    igt_output_set_pipe(data->output, PIPE_A);
>> +    igt_output_set_pipe(data->output, data->pipe);
>>       primary = igt_output_get_plane_type(data->output,
>>                           DRM_PLANE_TYPE_PRIMARY);
>>       igt_plane_set_fb(primary, NULL);
>> @@ -152,15 +152,12 @@ static void test_cleanup(data_t *data)
>>       data->output = NULL;
>>   }
>> -static void test_lpsp(data_t *data)
>> +static bool test_constraint(data_t *data)
>>   {
>>       drmModeConnectorPtr c = data->output->config.connector;
>>       int i;
>> -    /* LPSP is low power single pipe usages i.e. PIPE_A */
>> -    igt_require(igt_pipe_connector_valid(PIPE_A, data->output));
>> -    igt_require_f(i915_output_is_lpsp_capable(data->drm_fd, 
>> data->output),
>> -              "output is not lpsp capable\n");
>> +    igt_display_reset(&data->display);
>>       data->mode = igt_output_get_mode(data->output);
>> @@ -172,13 +169,15 @@ static void test_lpsp(data_t *data)
>>                   data->mode = &c->modes[i];
>>                   igt_output_override_mode(data->output,
>>                                data->mode);
>> -                break;
>> +                return true;
>>               }
>>           }
>> -    igt_require(data->mode->hdisplay <= 3840 &&
>> -            data->mode->vdisplay <= 2160);
>> +    return false;
>> +}
>> +static void test_lpsp(data_t *data)
>> +{
>>       setup_lpsp_output(data);
>>       igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
>>                "%s: lpsp is not enabled\n%s:\n%s\n",
>> @@ -211,19 +210,35 @@ igt_main
>>           screens_disabled_subtest(&data);
>>       }
>> -    igt_describe("This test validates lpsp on all connected outputs 
>> on low power PIPE_A");
>> +    igt_describe("This test validates lpsp on all connected outputs 
>> on low power pipes");
>>       igt_subtest_with_dynamic_f("kms-lpsp") {
>>           igt_display_t *display = &data.display;
>>           igt_output_t *output;
>> +        enum pipe pipe;
>>           for_each_connected_output(display, output) {
>> -            igt_dynamic_f("kms-lpsp-%s",
>> -                      
>> kmstest_connector_type_str(output->config.connector->connector_type)) {
>> +            if (!i915_output_is_lpsp_capable(data.drm_fd, output))
>> +                continue;
>> +
>> +            for_each_pipe(display, pipe) {
>> +                if (!igt_pipe_connector_valid(pipe, output))
>> +                    continue;
>> +
>> +                /* LPSP is low power single pipe usages i.e. PIPE_A */
>> +                if (pipe != PIPE_A)
>> +                    continue;
>> +
>>                   data.output = output;
>> -                test_lpsp(&data);
>> -            }
>> +                data.pipe = pipe;
>> +
>> +                if (!test_constraint(&data))
>> +                    continue;
>> -            test_cleanup(&data);
>> +                igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), 
>> igt_output_name(output))
>> +                    test_lpsp(&data);
>> +
>> +                test_cleanup(&data);
>> +            }
>>           }
>>       }
