Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC7610E66B
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jan 2023 11:32:36 +0000 (UTC)
Message-ID: <e5a7b6a1-e4b7-4646-be0a-7a8fc5b17c69@intel.com>
Date: Tue, 24 Jan 2023 17:02:29 +0530
MIME-Version: 1.0
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230124065152.19747-1-swati2.sharma@intel.com>
 <20230124065152.19747-6-swati2.sharma@intel.com>
 <7aa881b2d134409be0149dca267423d22cff5ec3.camel@intel.com>
Content-Language: en-US
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <7aa881b2d134409be0149dca267423d22cff5ec3.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/i915/kms_dsc: Enable
 validation for VDSC output formats
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



On 24-Jan-23 4:23 PM, Hogander, Jouni wrote:
> On Tue, 2023-01-24 at 12:21 +0530, Swati Sharma wrote:
>> Existing i-g-t is extended to enable validation for VDSC output
>> formats. Output
>> format is selected as per driver policy. For ex: If a mode is
>> supported
>> in both RGB and YCbCr420 output formats by the sink, i915 driver
>> policy is
>> to try RGB first and fall back to YCbCr420, if mode cannot be shown
>> using RGB.
>>
>> To test DSC output format, a debugfs entry is created to force this
>> output format.
>> However, before setting debugfs entry, we have checked capability
>> i.e. output
>> format is supported by both platform and sink.
>>
>> Also, each mode doesn't support all output formats; so if both sink
>> and platform
>> support an output format, we will do a try commit with each mode till
>> we get a
>> successful commit.
>>
>> v2: -used is_dsc_ycbcr420_supported() (Ankit)
>>      -handled try-commit correctly (Ankit)
>>      -instead of flag use enum for output formats (Ankit)
>> v3: -instead of global count, pass count as para (Ankit)
>>      -print output format (Ankit)
>> v4: -optimized while loop (Jouni)
>>      -used only try commit (Jouni)
>>      -fixed get_next_mode() (Jouni)
>> v5: -made generic test to validate all output formats (Jani N)
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   lib/igt_kms.c               |  20 +++++++
>>   lib/igt_kms.h               |   1 +
>>   tests/i915/kms_dsc.c        | 103 +++++++++++++++++++++++++++++-----
>> --
>>   tests/i915/kms_dsc_helper.c |  36 +++++++++++++
>>   tests/i915/kms_dsc_helper.h |   4 ++
>>   5 files changed, 144 insertions(+), 20 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 31e6dfda0..bbdcf97f1 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -966,6 +966,26 @@ const char *kmstest_scaling_filter_str(int
>> filter)
>>          return find_type_name(scaling_filter_names, filter);
>>   }
>>   
>> +static const struct type_name dsc_output_format_names[] = {
>> +       { DSC_FORMAT_DEFAULT, "DEFAULT" },
>> +       { DSC_FORMAT_RGB, "RGB" },
>> +       { DSC_FORMAT_YCBCR420, "YCBCR420" },
>> +       { DSC_FORMAT_YCBCR422, "YCBCR422" },
>> +       { DSC_FORMAT_YCBCR444, "YCBCR444" },
>> +       {}
>> +};
>> +
>> +/**
>> + * kmstest_dsc_output_format_str:
>> + * @output_format: DSC_FORMAT_* output format value
>> + *
>> + * Returns: A string representing the output format @output format.
>> + */
>> +const char *kmstest_dsc_output_format_str(int output_format)
>> +{
>> +       return find_type_name(dsc_output_format_names,
>> output_format);
>> +}
>> +
>>   static const struct type_name connector_type_names[] = {
>>          { DRM_MODE_CONNECTOR_Unknown, "Unknown" },
>>          { DRM_MODE_CONNECTOR_VGA, "VGA" },
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index d677d39f9..5b48409f4 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -118,6 +118,7 @@ const char *kmstest_encoder_type_str(int type);
>>   const char *kmstest_connector_status_str(int status);
>>   const char *kmstest_connector_type_str(int type);
>>   const char *kmstest_scaling_filter_str(int filter);
>> +const char *kmstest_dsc_output_format_str(int output_format);
>>   
>>   void kmstest_dump_mode(drmModeModeInfo *mode);
>>   #define MAX_HDISPLAY_PER_PIPE 5120
>> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
>> index 62df87636..99aeb7ddc 100644
>> --- a/tests/i915/kms_dsc.c
>> +++ b/tests/i915/kms_dsc.c
>> @@ -36,7 +36,8 @@ IGT_TEST_DESCRIPTION("Test to validate display
>> stream compression");
>>   
>>   enum dsc_test_type {
>>          TEST_DSC_BASIC,
>> -       TEST_DSC_BPC
>> +       TEST_DSC_BPC,
>> +       TEST_DSC_OUTPUT_FORMAT
>>   };
>>   
>>   typedef struct {
>> @@ -44,6 +45,7 @@ typedef struct {
>>          uint32_t devid;
>>          igt_display_t display;
>>          struct igt_fb fb_test_pattern;
>> +       enum dsc_output_format output_format;
>>          unsigned int plane_format;
>>          igt_output_t *output;
>>          int input_bpc;
>> @@ -52,6 +54,7 @@ typedef struct {
>>          enum pipe pipe;
>>   } data_t;
>>   
>> +int output_format_list[] = {DSC_FORMAT_DEFAULT, DSC_FORMAT_RGB,
>> DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
> 
> static
> 
>>   int format_list[] =  {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010,
>> DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>>   uint32_t bpc_list[] = {12, 10, 8};
>>   
>> @@ -72,6 +75,17 @@ static drmModeModeInfo
>> *get_highres_mode(igt_output_t *output)
>>          return highest_mode;
>>   }
>>   
>> +static drmModeModeInfo *get_next_mode(igt_output_t *output, int
>> index)
>> +{
>> +       drmModeConnector *connector = output->config.connector;
>> +       drmModeModeInfo *next_mode = NULL;
>> +
>> +       if (index < connector->count_modes)
>> +               next_mode = &connector->modes[index];
>> +
>> +       return next_mode;
>> +}
>> +
>>   static bool check_big_joiner_pipe_constraint(data_t *data)
>>   {
>>          igt_output_t *output = data->output;
>> @@ -102,7 +116,9 @@ static void test_cleanup(data_t *data)
>>   /* re-probe connectors and do a modeset with DSC */
>>   static void update_display(data_t *data, enum dsc_test_type
>> test_type)
>>   {
>> +       int ret;
>>          bool enabled;
>> +       int index = 0;
>>          igt_plane_t *primary;
>>          drmModeModeInfo *mode;
>>          igt_output_t *output = data->output;
>> @@ -121,26 +137,47 @@ static void update_display(data_t *data, enum
>> dsc_test_type test_type)
>>                  force_dsc_enable_bpc(data->drm_fd, data->output,
>> data->input_bpc);
>>          }
>>   
>> -       igt_output_set_pipe(output, data->pipe);
>> -
>> -       mode = get_highres_mode(output);
>> -       igt_require(mode != NULL);
>> -       igt_output_override_mode(output, mode);
>> +       if (test_type == TEST_DSC_OUTPUT_FORMAT) {
>> +               igt_debug("Trying to set DSC %s output format\n",
>> +                          kmstest_dsc_output_format_str(data-
>>> output_format));
>> +               force_dsc_output_format(data->drm_fd, data->output,
>> data->output_format);
>> +       }
>>   
>> +       igt_output_set_pipe(output, data->pipe);
>>          primary = igt_output_get_plane_type(output,
>> DRM_PLANE_TYPE_PRIMARY);
>>   
>>          igt_skip_on(!igt_plane_has_format_mod(primary, data-
>>> plane_format,
>>                      DRM_FORMAT_MOD_LINEAR));
>>   
>> -       igt_create_pattern_fb(data->drm_fd,
>> -                             mode->hdisplay,
>> -                             mode->vdisplay,
>> -                             data->plane_format,
>> -                             DRM_FORMAT_MOD_LINEAR,
>> -                             &data->fb_test_pattern);
>> +       do {
>> +               if (data->output_format == DSC_FORMAT_DEFAULT) {
>> +                       mode = get_highres_mode(output);
>> +               } else {
>> +                       mode = get_next_mode(output, index);
>> +                       index++;
>> +               }
>>   
>> -       igt_plane_set_fb(primary, &data->fb_test_pattern);
>> -       igt_display_commit(display);
>> +               igt_require(mode != NULL);
>> +               igt_output_override_mode(output, mode);
>> +
>> +               igt_create_pattern_fb(data->drm_fd,
>> +                                     mode->hdisplay,
>> +                                     mode->vdisplay,
>> +                                     data->plane_format,
>> +                                     DRM_FORMAT_MOD_LINEAR,
>> +                                     &data->fb_test_pattern);
>> +               igt_plane_set_fb(primary, &data->fb_test_pattern);
>> +
>> +               ret = igt_display_try_commit_atomic(display,
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +               if (data->output_format != DSC_FORMAT_DEFAULT && ret
>> != 0) {
>> +                       igt_remove_fb(data->drm_fd, &data-
>>> fb_test_pattern);
>> +                               continue;
>> +               } else {
>> +                               break;
>> +               }
>> +       } while(1);
>> +
>> +       igt_assert_eq(ret, 0);
>>   
>>          /* until we have CRC check support, manually check if RGB
>> test
>>           * pattern has no corruption.
>> @@ -155,10 +192,15 @@ static void update_display(data_t *data, enum
>> dsc_test_type test_type)
>>                                  enabled ? "ON" : "OFF");
>>   
>>          restore_force_dsc_en();
>> -       igt_debug("Reset compression BPC\n");
>> +
>> +       igt_debug("Reset input BPC\n");
>>          data->input_bpc = 0;
>>          force_dsc_enable_bpc(data->drm_fd, data->output, data-
>>> input_bpc);
>>   
>> +       igt_debug("Reset DSC output format\n");
>> +       data->output_format = DSC_FORMAT_DEFAULT;
>> +       force_dsc_output_format(data->drm_fd, data->output, data-
>>> output_format);
>> +
>>          igt_assert_f(enabled,
>>                       "Default DSC enable failed on connector: %s
>> pipe: %s\n",
>>                       output->name,
>> @@ -168,7 +210,7 @@ static void update_display(data_t *data, enum
>> dsc_test_type test_type)
>>   }
>>   
>>   static void test_dsc(data_t *data, enum dsc_test_type test_type, int
>> bpc,
>> -                    unsigned int plane_format)
>> +                    unsigned int plane_format, enum
>> dsc_output_format output_format)
>>   {
>>          igt_display_t *display = &data->display;
>>          igt_output_t *output;
>> @@ -176,6 +218,7 @@ static void test_dsc(data_t *data, enum
>> dsc_test_type test_type, int bpc,
>>          enum pipe pipe;
>>   
>>          for_each_pipe_with_valid_output(display, pipe, output) {
>> +               data->output_format = output_format;
>>                  data->plane_format = plane_format;
>>                  data->input_bpc = bpc;
>>                  data->output = output;
>> @@ -184,6 +227,10 @@ static void test_dsc(data_t *data, enum
>> dsc_test_type test_type, int bpc,
>>                  if (!check_dsc_on_connector(data->drm_fd, data-
>>> output))
>>                          continue;
>>   
>> +               if (!is_dsc_output_format_supported(data->drm_fd,
>> data->disp_ver,
>> +                                                   data->output,
>> data->output_format))
>> +                       continue;
>> +
>>                  if (!check_gen11_dp_constraint(data->drm_fd, data-
>>> output, data->pipe))
>>                          continue;
>>   
>> @@ -195,6 +242,9 @@ static void test_dsc(data_t *data, enum
>> dsc_test_type test_type, int bpc,
>>   
>>                  if (test_type == TEST_DSC_BPC)
>>                          snprintf(name, sizeof(name), "-%dbpc-%s",
>> data->input_bpc, igt_format_str(data->plane_format));
>> +               else if (test_type == TEST_DSC_OUTPUT_FORMAT)
>> +                       snprintf(name, sizeof(name), "-%s-%s",
>> kmstest_dsc_output_format_str(data->output_format),
>> +
>> igt_format_str(data->plane_format));
>>                  else
>>                          snprintf(name, sizeof(name), "-%s",
>> igt_format_str(data->plane_format));
>>   
>> @@ -226,14 +276,16 @@ igt_main
>>                       "by a connector by forcing DSC on all connectors
>> that support it "
>>                       "with default parameters");
>>          igt_subtest_with_dynamic("basic-dsc")
>> -                       test_dsc(&data, TEST_DSC_BASIC, 0,
>> DRM_FORMAT_XRGB8888);
>> +                       test_dsc(&data, TEST_DSC_BASIC, 0,
>> +                                DRM_FORMAT_XRGB8888,
>> DSC_FORMAT_DEFAULT);
>>   
>>          igt_describe("Tests basic display stream compression
>> functionality if supported "
>>                       "by a connector by forcing DSC on all connectors
>> that support it "
>>                       "with default parameters and creating fb with
>> diff formats");
>>          igt_subtest_with_dynamic("dsc-with-formats") {
>>                  for (int k = 0; k < ARRAY_SIZE(format_list); k++)
>> -                       test_dsc(&data, TEST_DSC_BASIC, 0,
>> format_list[k]);
>> +                       test_dsc(&data, TEST_DSC_BASIC, 0,
>> +                                format_list[k], DSC_FORMAT_DEFAULT);
>>          }
>>   
>>          igt_describe("Tests basic display stream compression
>> functionality if supported "
>> @@ -241,7 +293,8 @@ igt_main
>>                       "with certain input BPC for the connector");
>>          igt_subtest_with_dynamic("dsc-with-bpc") {
>>                  for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
>> -                       test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
>> DRM_FORMAT_XRGB8888);
>> +                       test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
>> +                                DRM_FORMAT_XRGB8888,
>> DSC_FORMAT_DEFAULT);
>>          }
>>   
>>          igt_describe("Tests basic display stream compression
>> functionality if supported "
>> @@ -250,11 +303,21 @@ igt_main
>>          igt_subtest_with_dynamic("dsc-with-bpc-formats") {
>>                  for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
>>                          for (int k = 0; k < ARRAY_SIZE(format_list);
>> k++) {
>> -                               test_dsc(&data, TEST_DSC_BPC,
>> bpc_list[j], format_list[k]);
>> +                               test_dsc(&data, TEST_DSC_BPC,
>> bpc_list[j],
>> +                               format_list[k], DSC_FORMAT_DEFAULT);
>>                          }
>>                  }
>>          }
>>   
>> +       igt_describe("Tests basic display stream compression
>> functionality if supported "
>> +                    "by a connector by forcing DSC and output format
>> on all connectors "
>> +                    "that support it");
>> +       igt_subtest_with_dynamic("dsc-with-output-formats") {
>> +               for (int k = 0; k < ARRAY_SIZE(output_format_list);
>> k++)
>> +                       test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, 0,
>> DRM_FORMAT_XRGB8888,
>> +                                output_format_list[k]);
>> +       }
>> +
>>          igt_fixture {
>>                  igt_display_fini(&data.display);
>>                  close(data.drm_fd);
>> diff --git a/tests/i915/kms_dsc_helper.c
>> b/tests/i915/kms_dsc_helper.c
>> index e2c278c7a..c70b7aae8 100644
>> --- a/tests/i915/kms_dsc_helper.c
>> +++ b/tests/i915/kms_dsc_helper.c
>> @@ -97,3 +97,39 @@ bool check_gen11_bpc_constraint(int drmfd,
>> igt_output_t *output, int input_bpc)
>>   
>>          return true;
>>   }
>> +
>> +void force_dsc_output_format(int drmfd, igt_output_t *output,
>> +                            enum dsc_output_format output_format)
>> +{
>> +       int ret;
>> +
>> +       igt_debug("Forcing DSC %s output format on %s\n",
>> +                 kmstest_dsc_output_format_str(output_format),
>> output->name);
>> +       ret = igt_force_dsc_output_format(drmfd, output->name,
>> output_format);
>> +       igt_assert_f(ret > 0, "forcing dsc output format
>> debugfs_write failed\n");
> 
> Isn't it !ret or ret == 0 as you did earlier?

Yes, it should be changed. Missed by mistake.
> 
>> +}
>> +
>> +/* YCbCr420 DSC is supported on display version 14+ with DSC1.2a */
>> +static bool is_dsc_output_format_supported_by_platform(int disp_ver,
>> enum dsc_output_format output_format)
>> +{
>> +       if (disp_ver < 14 && output_format == DSC_FORMAT_YCBCR420) {
>> +               igt_debug("Ouput format DSC YCBCR420 supported on
>> D14+ platforms\n");
>> +               return false;
>> +       }
>> +
>> +       return true;
>> +}
>> +
>> +bool is_dsc_output_format_supported(int disp_ver, int drmfd,
>> igt_output_t *output,
>> +                                   enum dsc_output_format
>> output_format)
>> +{
>> +       if (!(igt_is_dsc_output_format_supported_by_sink(drmfd,
>> output->name, output_format)) &&
>> +            (is_dsc_output_format_supported_by_platform(disp_ver,
>> output_format))) {
>> +                   igt_debug("DSC %s output format not supported on
>> connector %s\n",
>> +
>> kmstest_dsc_output_format_str(output_format),
>> +                              output->name);
>> +                       return false;
>> +               }
>> +
>> +       return true;
>> +}
>> diff --git a/tests/i915/kms_dsc_helper.h
>> b/tests/i915/kms_dsc_helper.h
>> index fe479dac4..244293cd0 100644
>> --- a/tests/i915/kms_dsc_helper.h
>> +++ b/tests/i915/kms_dsc_helper.h
>> @@ -31,5 +31,9 @@ void kms_dsc_exit_handler(int sig);
>>   bool check_dsc_on_connector(int drmfd, igt_output_t *output);
>>   bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum
>> pipe pipe);
>>   bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int
>> input_bpc);
>> +void force_dsc_output_format(int drmfd, igt_output_t *output,
>> +                            enum dsc_output_format output_format);
>> +bool is_dsc_output_format_supported(int disp_ver, int drmfd,
>> igt_output_t *output,
>> +                                   enum dsc_output_format
>> output_format);
>>   
>>   #endif
> 

-- 
~Swati Sharma
