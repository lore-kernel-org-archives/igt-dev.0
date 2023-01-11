Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67EE10E6F3
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 06:38:22 +0000 (UTC)
Message-ID: <f042869c-0e43-bc5d-eabc-d32ccdc2e726@intel.com>
Date: Wed, 11 Jan 2023 12:08:17 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230109152832.3310-1-swati2.sharma@intel.com>
 <20230109152832.3310-6-swati2.sharma@intel.com>
 <ca1004026bd146070b5d0c4b3538961fb0a65692.camel@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <ca1004026bd146070b5d0c4b3538961fb0a65692.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] tests/i915/kms_dsc: Enable
 validation for VDSC YCbCr420
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks Jouni for the review.
Please find my replies inline.

On 10-Jan-23 5:26 PM, Hogander, Jouni wrote:
> Hello,
> 
> See my inline comments below.
> 
> On Mon, 2023-01-09 at 20:58 +0530, Swati Sharma wrote:
>> Existing i-g-t is extended to enable validation for VDSC YCbCr420.
>> If a mode is supported in both RGB and YCbCr420 output formats by the
>> sink, i915 driver policy is to try RGB first and fall back to
>> YCbCr420, if
>> mode cannot be shown using RGB. To test YCbCr420, we need a debugfs
>> entry (force_dsc_ycbcr420) to force this output format; so that
>> YCbCr420 code
>> gets executed.
>>  From i-g-t, we have set this debugfs entry. However, before setting
>> debugfs entry, we have checked capability i.e. YCbCr420 is supported
>> by
>> both platform (D14+) and sink.
>> Also, all the modes doesn't support both YCbCr420 and RGB formats; so
>> if
>> sink and platform supports YCbCr420 we will do try commit with each
>> mode
>> till we get a successful commit.
>>
>> v2: -used is_dsc_ycbcr420_supported() (Ankit)
>>      -handled try-commit correctly (Ankit)
>>      -instead of flag use enum for output formats (Ankit)
>> v3: -instead of global count, pass count as para (Ankit)
>>      -print output format (Ankit)
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   lib/igt_kms.c               |  17 ++++
>>   lib/igt_kms.h               |   6 ++
>>   tests/i915/kms_dsc.c        | 157 +++++++++++++++++++++++-----------
>> --
>>   tests/i915/kms_dsc_helper.c |  49 +++++++++++
>>   tests/i915/kms_dsc_helper.h |   4 +
>>   5 files changed, 177 insertions(+), 56 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 31e6dfda0..0f1f7c6b9 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -966,6 +966,23 @@ const char *kmstest_scaling_filter_str(int
>> filter)
>>          return find_type_name(scaling_filter_names, filter);
>>   }
>>   
>> +static const struct type_name dsc_output_format_names[] = {
>> +       { DSC_FORMAT_RGB444, "RGB444" },
>> +       { DSC_FORMAT_YCBCR420, "YCBCR420" },
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
>> index be5482e08..61ec8fbec 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -106,10 +106,16 @@ enum igt_custom_edid_type {
>>    */
>>   #define kmstest_port_name(port) ((port) + 'A')
>>   
>> +enum dsc_output_format {
>> +       DSC_FORMAT_RGB444,
>> +       DSC_FORMAT_YCBCR420
>> +};
>> +
>>   const char *kmstest_encoder_type_str(int type);
>>   const char *kmstest_connector_status_str(int status);
>>   const char *kmstest_connector_type_str(int type);
>>   const char *kmstest_scaling_filter_str(int filter);
>> +const char *kmstest_dsc_output_format_str(int output_format);
>>   
>>   void kmstest_dump_mode(drmModeModeInfo *mode);
>>   #define MAX_HDISPLAY_PER_PIPE 5120
>> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
>> index f264d37a7..689cb81b1 100644
>> --- a/tests/i915/kms_dsc.c
>> +++ b/tests/i915/kms_dsc.c
>> @@ -68,6 +68,19 @@ static drmModeModeInfo
>> *get_highres_mode(igt_output_t *output)
>>          return highest_mode;
>>   }
>>   
>> +static drmModeModeInfo *get_next_mode(igt_output_t *output, int
>> count)
>> +{
>> +       drmModeConnector *connector = output->config.connector;
>> +       drmModeModeInfo *next_mode = NULL;
>> +
>> +       for (int i = count; i < connector->count_modes; i++) {
>> +               next_mode = &connector->modes[i];
>> +               break;
>> +       }
>> +
>> +       return next_mode;
> 
> return output->config.connector->modes[count]; ?

Yes, this is doable.

>> +}
>> +
>>   static bool check_big_joiner_pipe_constraint(data_t *data)
>>   {
>>          igt_output_t *output = data->output;
>> @@ -97,75 +110,103 @@ static void test_cleanup(data_t *data)
>>   
>>   /* re-probe connectors and do a modeset with DSC */
>>   static void update_display(data_t *data, enum dsc_test_type
>> test_type,
>> -                          unsigned int plane_format)
>> +                          unsigned int plane_format, enum
>> dsc_output_format output_format)
>>   {
>> +       int ret;
>>          bool enabled;
>>          igt_plane_t *primary;
>>          drmModeModeInfo *mode;
>> +       int count = 0;
>> +       bool test_complete = false;
>>          igt_output_t *output = data->output;
>>          igt_display_t *display = &data->display;
>>   
>> -       /* sanitize the state before starting the subtest */
>> -       igt_display_reset(display);
>> -       igt_display_commit(display);
>> +       while (!test_complete) {
>> +               /* sanitize the state before starting the subtest */
>> +               igt_display_reset(display);
>> +               igt_display_commit(display);
>>   
>> -       igt_debug("DSC is supported on %s\n", data->output->name);
>> -       save_force_dsc_en(data);
>> -       force_dsc_enable(data);
>> +               igt_debug("DSC is supported on %s\n", data->output-
>>> name);
>> +               save_force_dsc_en(data);
>> +               force_dsc_enable(data);
>>   
>> -       if (test_type == TEST_DSC_BPC) {
>> -               igt_debug("Trying to set input BPC to %d\n", data-
>>> input_bpc);
>> -               force_dsc_enable_bpc(data);
>> -       }
>> +               if (output_format == DSC_FORMAT_YCBCR420) {
>> +                       igt_debug("DSC YCbCr420 is supported on
>> %s\n", data->output->name);
>> +                       save_force_dsc_ycbcr420_en(data);
>> +                       force_dsc_ycbcr420_enable(data);
>> +               }
>>   
>> -       igt_output_set_pipe(output, data->pipe);
>> +               if (test_type == TEST_DSC_BPC) {
>> +                       igt_debug("Trying to set input BPC to %d\n",
>> data->input_bpc);
>> +                       force_dsc_enable_bpc(data);
>> +               }
>>   
>> -       mode = get_highres_mode(output);
>> -       igt_require(mode != NULL);
>> -       igt_output_override_mode(output, mode);
>> +               igt_output_set_pipe(output, data->pipe);
>>   
>> -       primary = igt_output_get_plane_type(output,
>> DRM_PLANE_TYPE_PRIMARY);
>> +               if (output_format == DSC_FORMAT_YCBCR420)
>> +                       mode = get_next_mode(output, count);
>> +               else
>> +                       mode = get_highres_mode(output);
> 
> If I understood your code correctly what you really want to loop is:
> 
> count = 0;
> do {
> 	if (output_format == DSC_FORMAT_YCBCR420)
> 		mode = get_next_mode(output, count);
> 	else
> 		mode = get_highres_mode(output);
> 	igt_require(mode != NULL);
> 	igt_output_override_mode(output, mode);
> } while(igt_display_try_commit_atomic(display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL));
> 
> everything else seems to remain same over iterations and if
> output_format != DSC_FORMAT_YCBCR420 even the mode is not changed.
> 
> Currently you are looping everything. E.g. igt_create_pattern_fb is
> called several times and the igt_remove_fb is done only once in
> test_cleanup.

Right, we should remove fb before continue as per current code.
We are creating fb with mode->width and mode->height and this can't
be kept outside loop.
> 
>> +
>> +               igt_require(mode != NULL);
>> +               igt_output_override_mode(output, mode);
>> +
>> +               primary = igt_output_get_plane_type(output,
>> DRM_PLANE_TYPE_PRIMARY);
>> +
>> +               igt_skip_on(!igt_plane_has_format_mod(primary,
>> plane_format,
>> +                           DRM_FORMAT_MOD_LINEAR));
>> +
>> +               igt_create_pattern_fb(data->drm_fd,
>> +                                     mode->hdisplay,
>> +                                     mode->vdisplay,
>> +                                     plane_format,
>> +                                     DRM_FORMAT_MOD_LINEAR,
>> +                                     &data->fb_test_pattern);
>> +
>> +               igt_plane_set_fb(primary, &data->fb_test_pattern);
>> +               ret = igt_display_try_commit_atomic(display,
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +               if (ret == 0) {
>> +                       igt_display_commit(display);
> 
> Isn't igt_display_try_commit_atomic enough or why you are doing
> igt_display_commit even if igt_display_try_commit_atomic succeeded?
> 
>> +                       test_complete = true;
>> +               } else if (output_format == DSC_FORMAT_YCBCR420) {
>> +                       count++;
>> +                       continue;
>> +               }
>> +
>> +               igt_assert_eq(ret, 0);
>> +
>> +               /*
>> +                * Until we have CRC check support, manually check if
>> RGB test
>> +                * pattern has no corruption.
>> +                */
>> +               manual("RGB test pattern without corruption");
>> +
>> +               enabled = igt_is_dsc_enabled(data->drm_fd, output-
>>> name);
>> +               igt_info("Current mode is: %dx%d @%dHz -- DSC is:
>> %s\n",
>> +                                       mode->hdisplay,
>> +                                       mode->vdisplay,
>> +                                       mode->vrefresh,
>> +                                       enabled ? "ON" : "OFF");
>> +
>> +               restore_force_dsc_en();
>> +               if (output_format == DSC_FORMAT_YCBCR420)
>> +                       restore_force_dsc_ycbcr420_en();
>>   
>> -       igt_skip_on(!igt_plane_has_format_mod(primary, plane_format,
>> -                   DRM_FORMAT_MOD_LINEAR));
>> -
>> -       igt_create_pattern_fb(data->drm_fd,
>> -                             mode->hdisplay,
>> -                             mode->vdisplay,
>> -                             plane_format,
>> -                             DRM_FORMAT_MOD_LINEAR,
>> -                             &data->fb_test_pattern);
>> -
>> -       igt_plane_set_fb(primary, &data->fb_test_pattern);
>> -       igt_display_commit(display);
>> -
>> -       /* until we have CRC check support, manually check if RGB
>> test
>> -        * pattern has no corruption.
>> -        */
>> -       manual("RGB test pattern without corruption");
>> -
>> -       enabled = igt_is_dsc_enabled(data->drm_fd, output->name);
>> -       igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
>> -                               mode->hdisplay,
>> -                               mode->vdisplay,
>> -                               mode->vrefresh,
>> -                               enabled ? "ON" : "OFF");
>> -
>> -       restore_force_dsc_en();
>> -       igt_debug("Reset compression BPC\n");
>> -       data->input_bpc = 0;
>> -       force_dsc_enable_bpc(data);
>> -
>> -       igt_assert_f(enabled,
>> -                    "Default DSC enable failed on connector: %s
>> pipe: %s\n",
>> -                    output->name,
>> -                    kmstest_pipe_name(data->pipe));
>> -
>> -       test_cleanup(data);
>> +               igt_debug("Reset input BPC\n");
>> +               data->input_bpc = 0;
>> +               force_dsc_enable_bpc(data);
>> +
>> +               igt_assert_f(enabled,
>> +                           "Default DSC enable failed on connector:
>> %s pipe: %s\n",
>> +                           output->name,
>> +                           kmstest_pipe_name(data->pipe));
>> +
>> +               test_cleanup(data);
>> +       }
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
>> @@ -194,15 +235,19 @@ static void test_dsc(data_t *data, enum
>> dsc_test_type test_type, int bpc,
>>                  else
>>                          snprintf(name, sizeof(name), "-%s",
>> igt_format_str(plane_format));
>>   
>> -               igt_dynamic_f("pipe-%s-%s%s",
>> kmstest_pipe_name(data->pipe), data->output->name, name)
>> -                       update_display(data, test_type,
>> plane_format);
>> +               igt_dynamic_f("pipe-%s-%s%s-%s",
>> kmstest_pipe_name(data->pipe), data->output->name, name,
>> kmstest_dsc_output_format_str(output_format))
>> +                       update_display(data, test_type, plane_format,
>> output_format);
>>          }
>>   }
>>   
>>   static void run_test(data_t *data, enum dsc_test_type test_type, int
>> bpc,
>>                       unsigned int plane_format)
>>   {
>> -       test_dsc(data, test_type, bpc, plane_format);
>> +       test_dsc(data, test_type, bpc, plane_format,
>> DSC_FORMAT_RGB444);
>> +
>> +       /* YCbCr420 DSC is supported on display version 14+ */
>> +       if ((data->disp_ver >= 14) &&
>> (is_dsc_ycbcr420_supported(data)))
>> +               test_dsc(data, test_type, bpc, plane_format,
>> DSC_FORMAT_YCBCR420);
>>   }
>>   
>>   igt_main
>> diff --git a/tests/i915/kms_dsc_helper.c
>> b/tests/i915/kms_dsc_helper.c
>> index 7b75be82e..8f0326f13 100644
>> --- a/tests/i915/kms_dsc_helper.c
>> +++ b/tests/i915/kms_dsc_helper.c
>> @@ -30,7 +30,9 @@
>>   #include "kms_dsc_helper.h"
>>   
>>   bool force_dsc_en_orig;
>> +bool force_dsc_ycbcr420_en_orig;
>>   int force_dsc_restore_fd = -1;
>> +int force_dsc_ycbcr420_restore_fd = -1;
>>   
>>   void force_dsc_enable(data_t *data)
>>   {
>> @@ -80,6 +82,7 @@ void restore_force_dsc_en(void)
>>   void kms_dsc_exit_handler(int sig)
>>   {
>>          restore_force_dsc_en();
>> +       restore_force_dsc_ycbcr420_en();
>>   }
>>   
>>   bool check_dsc_on_connector(data_t *data)
>> @@ -129,3 +132,49 @@ bool check_gen11_bpc_constraint(data_t *data)
>>   
>>          return true;
>>   }
>> +
>> +void force_dsc_ycbcr420_enable(data_t *data)
>> +{
>> +       int ret;
>> +
>> +       igt_debug("Forcing DSC YCbCr420 on %s\n", data->output-
>>> name);
>> +       ret = igt_force_dsc_ycbcr420_enable(data->drm_fd,
>> +                                           data->output->name);
>> +       igt_assert_f(ret > 0, "forcing dsc ycbcr420 debugfs_write
>> failed\n");
>> +}
>> +
>> +void save_force_dsc_ycbcr420_en(data_t *data)
>> +{
>> +       force_dsc_ycbcr420_en_orig =
>> +               igt_is_force_dsc_ycbcr420_enabled(data->drm_fd,
>> +                                                 data->output-
>>> name);
>> +       force_dsc_ycbcr420_restore_fd =
>> +               igt_get_dsc_ycbcr420_debugfs_fd(data->drm_fd,
>> +                                               data->output->name);
>> +       igt_assert(force_dsc_ycbcr420_restore_fd >= 0);
>> +}
>> +
>> +void restore_force_dsc_ycbcr420_en(void)
>> +{
>> +       if (force_dsc_ycbcr420_restore_fd < 0)
>> +               return;
>> +
>> +       igt_debug("Restoring DSC YCbCr420 enable\n");
>> +       igt_assert(write(force_dsc_ycbcr420_restore_fd,
>> force_dsc_ycbcr420_en_orig ? "1" : "0", 1) == 1);
>> +
>> +       close(force_dsc_ycbcr420_restore_fd);
>> +       force_dsc_ycbcr420_restore_fd = -1;
>> +}
>> +
>> +bool is_dsc_ycbcr420_supported(data_t *data)
>> +{
>> +       igt_output_t *output = data->output;
>> +
>> +       if (!igt_is_dsc_ycbcr420_supported(data->drm_fd, output-
>>> name)) {
>> +               igt_debug("DSC YCbCr420 not supported on connector
>> %s\n",
>> +                         output->name);
>> +               return false;
>> +       }
>> +
>> +       return true;
>> +}
>> diff --git a/tests/i915/kms_dsc_helper.h
>> b/tests/i915/kms_dsc_helper.h
>> index cfca2ed98..57cb67737 100644
>> --- a/tests/i915/kms_dsc_helper.h
>> +++ b/tests/i915/kms_dsc_helper.h
>> @@ -62,5 +62,9 @@ void kms_dsc_exit_handler(int sig);
>>   bool check_dsc_on_connector(data_t *data);
>>   bool check_gen11_dp_constraint(data_t *data);
>>   bool check_gen11_bpc_constraint(data_t *data);
>> +void force_dsc_ycbcr420_enable(data_t *data);
>> +void save_force_dsc_ycbcr420_en(data_t *data);
>> +void restore_force_dsc_ycbcr420_en(void);
>> +bool is_dsc_ycbcr420_supported(data_t *data);
>>   
>>   #endif
> 

-- 
~Swati Sharma
