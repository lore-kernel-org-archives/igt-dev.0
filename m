Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AA710E55B
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 05:04:41 +0000 (UTC)
Message-ID: <f59eaa95-1cc2-5452-d83a-aa3f79f0de69@intel.com>
Date: Fri, 9 Sep 2022 10:34:27 +0530
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220901063705.12600-1-karthik.b.s@intel.com>
 <cff5e872-8cab-acc8-3f91-14908e20a2fb@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <cff5e872-8cab-acc8-3f91-14908e20a2fb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: Convert
 tests to Dynamic
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

On 9/5/2022 3:13 PM, Modem, Bhanuprakash wrote:
> On Thu-01-09-2022 12:07 pm, Karthik B S wrote:
>> Covert the existing subtests to dynamic subtests at pipe/output level.
>> Also move the cleanup part outside the subtest so that it is run even if
>> a failure is seen in the subtest.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_content_protection.c | 366 ++++++++++++++++++---------------
>>   1 file changed, 196 insertions(+), 170 deletions(-)
>>
>> diff --git a/tests/kms_content_protection.c 
>> b/tests/kms_content_protection.c
>> index 3041f1cd..dde6345c 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -273,17 +273,6 @@ static void 
>> test_cp_enable_with_retry(igt_output_t *output,
>>     }
>>   -static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
>> -{
>> -    int i;
>> -
>> -    for (i = 0; i < display->n_outputs; i++)
>> -        if (display->outputs[i].pending_pipe == pipe)
>> -            return false;
>> -
>> -    return true;
>> -}
>> -
>>   static void test_cp_lic(igt_output_t *output)
>>   {
>>       bool ret;
>> @@ -317,90 +306,62 @@ static bool write_srm_as_fw(const __u8 *srm, 
>> int len)
>>   }
>>     static void test_content_protection_on_output(igt_output_t *output,
>> +                          enum pipe pipe,
>>                             enum igt_commit_style s,
>>                             int content_type)
>>   {
>>       igt_display_t *display = &data.display;
>> -    igt_plane_t *primary;
>> -    enum pipe pipe;
>>       bool ret;
>>   -    for_each_pipe(display, pipe) {
>> -        if (!igt_pipe_connector_valid(pipe, output))
>> -            continue;
>> -
>> -        /*
>> -         * If previous subtest of connector failed, pipe
>> -         * attached to that connector is not released.
>> -         * Because of that we have to choose the non
>> -         * attached pipe for this subtest.
>> -         */
>> -        if (!igt_pipe_is_free(display, pipe))
>> -            continue;
>> -
>> -        modeset_with_fb(pipe, output, s);
>> -        test_cp_enable_with_retry(output, s, 3, content_type, false,
>> -                      false);
>> -
>> -        if (data.cp_tests & CP_TYPE_CHANGE) {
>> -            /* Type 1 -> Type 0 */
>> -            test_cp_enable_with_retry(output, s, 3,
>> -                          HDCP_CONTENT_TYPE_0, false,
>> -                          true);
>> -            /* Type 0 -> Type 1 */
>> -            test_cp_enable_with_retry(output, s, 3,
>> -                          content_type, false,
>> -                          true);
>> -        }
>> -
>> -        if (data.cp_tests & CP_MEI_RELOAD) {
>> -            igt_assert_f(!igt_kmod_unload("mei_hdcp", 0),
>> -                     "mei_hdcp unload failed");
>> +    modeset_with_fb(pipe, output, s);

Hi,

Thank you for the review.

>
> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_content_protection.c#n169 
>
>
> Overiding with default mode: Does it really required?
Agreed, don't think its required as we're trying to override with 
default mode only, will update this.
>
>> +    test_cp_enable_with_retry(output, s, 3, content_type, false,
>> +                  false);
>> +
>> +    if (data.cp_tests & CP_TYPE_CHANGE) {
>> +        /* Type 1 -> Type 0 */
>> +        test_cp_enable_with_retry(output, s, 3,
>> +                      HDCP_CONTENT_TYPE_0, false,
>> +                      true);
>> +        /* Type 0 -> Type 1 */
>> +        test_cp_enable_with_retry(output, s, 3,
>> +                      content_type, false,
>> +                      true);
>> +    }
>>   -            /* Expected to fail */
>> -            test_cp_enable_with_retry(output, s, 3,
>> -                          content_type, true, false);
>> +    if (data.cp_tests & CP_MEI_RELOAD) {
>> +        igt_assert_f(!igt_kmod_unload("mei_hdcp", 0),
>> +                 "mei_hdcp unload failed");
>>   -            igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
>> -                     "mei_hdcp load failed");
>> +        /* Expected to fail */
>> +        test_cp_enable_with_retry(output, s, 3,
>> +                      content_type, true, false);
>>   -            /* Expected to pass */
>> -            test_cp_enable_with_retry(output, s, 3,
>> -                          content_type, false, false);
>> -        }
>> +        igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
>> +                 "mei_hdcp load failed");
>>   -        if (data.cp_tests & CP_LIC)
>> -            test_cp_lic(output);
>> +        /* Expected to pass */
>> +        test_cp_enable_with_retry(output, s, 3,
>> +                      content_type, false, false);
>> +    }
>>   -        if (data.cp_tests & CP_DPMS) {
>> -            igt_pipe_set_prop_value(display, pipe,
>> -                        IGT_CRTC_ACTIVE, 0);
>> -            igt_display_commit2(display, s);
>> +    if (data.cp_tests & CP_LIC)
>> +        test_cp_lic(output);
>>   -            igt_pipe_set_prop_value(display, pipe,
>> -                        IGT_CRTC_ACTIVE, 1);
>> -            igt_display_commit2(display, s);
>> +    if (data.cp_tests & CP_DPMS) {
>> +        igt_pipe_set_prop_value(display, pipe,
>> +                    IGT_CRTC_ACTIVE, 0);
>> +        igt_display_commit2(display, s);
>>   -            ret = wait_for_prop_value(output, CP_ENABLED,
>> -                          KERNEL_AUTH_TIME_ALLOWED_MSEC);
>> -            if (!ret)
>> -                test_cp_enable_with_retry(output, s, 2,
>> -                              content_type, false,
>> -                              false);
>> -        }
>> +        igt_pipe_set_prop_value(display, pipe,
>> +                    IGT_CRTC_ACTIVE, 1);
>> +        igt_display_commit2(display, s);
>>   -        test_cp_disable(output, s);
>> -        primary = igt_output_get_plane_type(output,
>> -                            DRM_PLANE_TYPE_PRIMARY);
>> -        igt_plane_set_fb(primary, NULL);
>> -        igt_output_set_pipe(output, PIPE_NONE);
>> -
>> -        /*
>> -         * Testing a output with a pipe is enough for HDCP
>> -         * testing. No ROI in testing the connector with other
>> -         * pipes. So Break the loop on pipe.
>> -         */
>> -        break;
>> +        ret = wait_for_prop_value(output, CP_ENABLED,
>> +                      KERNEL_AUTH_TIME_ALLOWED_MSEC);
>> +        if (!ret)
>> +            test_cp_enable_with_retry(output, s, 2,
>> +                          content_type, false,
>> +                          false);
>>       }
>>   }
>>   @@ -499,26 +460,64 @@ static bool output_hdcp_capable(igt_output_t 
>> *output, int content_type)
>
> Please fix the indentation in output_hdcp_capable()
> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_content_protection.c#n480 
>
Sure, will fix this.
>
>>           return true;
>>   }
>>   +static void
>> +test_fini(igt_output_t *output, enum igt_commit_style s)
>> +{
>> +    igt_plane_t *primary;
>> +
>> +    test_cp_disable(output, s);
>> +    primary = igt_output_get_plane_type(output,
>> +                        DRM_PLANE_TYPE_PRIMARY);
>> +    igt_plane_set_fb(primary, NULL);
>> +    igt_output_set_pipe(output, PIPE_NONE);
>
> Need a commit here.
Yes, will add this.
>
>> +}
>> +
>>   static void
>>   test_content_protection(enum igt_commit_style s, int content_type)
>>   {
>>       igt_display_t *display = &data.display;
>>       igt_output_t *output;
>> +    enum pipe pipe;
>>       int valid_tests = 0;
>>         if (data.cp_tests & CP_MEI_RELOAD)
>>           igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
>>                     "mei_hdcp module is not loaded\n");
>>   +    if (data.cp_tests & CP_UEVENT) {
>> +        data.uevent_monitor = igt_watch_uevents();
>> +        igt_flush_uevents(data.uevent_monitor);
>> +    }
>> +
>> +    igt_display_reset(display);
>
> Reset could be inside igt_dynamic()?
I actually found an issue with the current test. Since the modeset is 
not being done before checking if output is HDCP capable, the test is 
skipping on the second output on MST configuration. So will move the 
modeset before the HDCP capable check and so will retain igt_reset also 
outside. Sounds good?
>
>> +
>>       for_each_connected_output(display, output) {
>>           if (!output_hdcp_capable(output, content_type))
>>               continue;
>>   -        test_content_protection_on_output(output, s, content_type);
>> +        for_each_pipe(display, pipe) {
>> +            if (!igt_pipe_connector_valid(pipe, output))
>> +                continue;
>> +
>> +            igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), 
>> output->name)
>> +                test_content_protection_on_output(output, pipe, s, 
>> content_type);
>> +
>> +            test_fini(output, s);
>> +            /*
>> +             * Testing a output with a pipe is enough for HDCP
>> +             * testing. No ROI in testing the connector with other
>> +             * pipes. So Break the loop on pipe.
>> +             */
>> +            break;
>> +        }
>> +
>>           valid_tests++;
>>       }
>>         igt_require_f(valid_tests, "No connector found with HDCP 
>> capability\n");
>
> This check is not required, igt_subtest_with_dynamic() will throw a 
> SKIP if igt_dynamic() is not executed.
Sure, will remove this.
>
>> +
>> +    if (data.cp_tests & CP_UEVENT)
>> +        igt_cleanup_uevents(data.uevent_monitor);
>>   }
>>     static int parse_path_blob(char *blob_data)
>> @@ -723,6 +722,94 @@ static void create_fbs(void)
>>                   0.f, 1.f, 0.f, &data.green);
>>   }
>>   +static const struct {
>> +    const char *desc;
>> +    const char *name;
>> +    unsigned int cp_tests;
>> +    bool content_type;
>> +} subtests[] = {
>> +    { .desc = "Test content protection with atomic modesetting",
>> +      .name = "atomic",
>> +      .cp_tests = 0,
>> +      .content_type = HDCP_CONTENT_TYPE_0
>> +    },
>> +    { .desc = "Test content protection with DPMS ON/OFF during 
>> atomic modesetting.",
>> +      .name = "atomic-dpms",
>> +      .cp_tests = CP_DPMS,
>> +      .content_type = HDCP_CONTENT_TYPE_0
>> +    },
>> +    { .desc = "Test for the integrity of link.",
>> +      .name = "LIC",
>> +      .cp_tests = CP_LIC,
>> +      .content_type = HDCP_CONTENT_TYPE_0,
>> +    },
>> +    { .desc = "Test content protection with content type 1 "
>> +          "that can be handled only through HDCP2.2.",
>> +      .name = "type1",
>> +      .cp_tests = 0,
>> +      .content_type = HDCP_CONTENT_TYPE_1,
>> +    },
>> +    { .desc = "Test the teardown and rebuild of the interface between "
>> +          "I915 and mei hdcp.",
>> +      .name = "mei_interface",
>> +      .cp_tests = CP_MEI_RELOAD,
>> +      .content_type = HDCP_CONTENT_TYPE_1,
>> +    },
>> +    { .desc = "Test the content type change when the content 
>> protection already enabled",
>> +      .name = "content_type_change",
>> +      .cp_tests = CP_TYPE_CHANGE,
>> +      .content_type = HDCP_CONTENT_TYPE_1,
>> +    },
>> +    { .desc = "Test to detect the HDCP status change when we are 
>> reading the uevent "
>> +          "sent with the corresponding connector id and property id.",
>> +      .name = "uevent",
>> +      .cp_tests = CP_UEVENT,
>> +      .content_type = HDCP_CONTENT_TYPE_0,
>> +    },
>> +    /*
>> +     *  Testing the revocation check through SRM needs a HDCP sink with
>> +     *  programmable Ksvs or we need a uAPI from kernel to read the
>> +     *  connected HDCP sink's Ksv. With that we would be able to add 
>> that
>> +     *  Ksv into a SRM and send in for revocation check. Since we 
>> dont have
>> +     *  either of these options, we test SRM writing from userspace and
>> +     *  validation of the same at kernel. Something is better than 
>> nothing.
>> +     */
>> +    { .desc = "This test writes the facsimile SRM into the 
>> /lib/firmware/"
>> +          "and check the kernel parsing of it by invoking the hdcp 
>> authentication.",
>> +      .name = "srm",
>> +      .cp_tests = 0,
>> +      .content_type = HDCP_CONTENT_TYPE_0,
>> +    },
>> +};
>> +
>> +static const struct {
>> +    const char *desc;
>> +    const char *name;
>> +    unsigned int cp_tests;
>> +    bool content_type;
>> +} mst_subtests[] = {
>> +    { .desc = "Test Content protection(Type 0) over DP MST.",
>> +      .name = "dp-mst-type-0",
>> +      .cp_tests = 0,
>> +      .content_type = HDCP_CONTENT_TYPE_0
>> +    },
>> +    { .desc = "Test Content protection(Type 0) over DP MST with LIC.",
>> +      .name = "dp-mst-lic-type-0",
>> +      .cp_tests = CP_LIC,
>> +      .content_type = HDCP_CONTENT_TYPE_0
>> +    },
>> +    { .desc = "Test Content protection(Type 1) over DP MST.",
>> +      .name = "dp-mst-type-1",
>> +      .cp_tests = 0,
>> +      .content_type = HDCP_CONTENT_TYPE_1,
>> +    },
>> +    { .desc = "Test Content protection(Type 1) over DP MST with LIC.",
>> +      .name = "dp-mst-lic-type-1",
>> +      .cp_tests = CP_LIC,
>> +      .content_type = HDCP_CONTENT_TYPE_1,
>> +    },
>> +};
>> +
>>   igt_main
>>   {
>>       igt_fixture {
>> @@ -733,107 +820,46 @@ igt_main
>>       }
>>         igt_describe("Test content protection with legacy style 
>> commit.");
>> -    igt_subtest("legacy") {
>> +    igt_subtest_with_dynamic("legacy") {
>>           data.cp_tests = 0;
>>           test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
>>       }
>>   -    igt_describe("Test content protection with atomic modesetting");
>> -    igt_subtest("atomic") {
>> -        igt_require(data.display.is_atomic);
>> -        data.cp_tests = 0;
>> -        test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
>> -    }
>> +    igt_subtest_group {
>> +        igt_fixture
>> +            igt_require(data.display.is_atomic);
>>   -    igt_describe("Test content protection with DPMS ON/OFF during 
>> atomic modesetting.");
>> -    igt_subtest("atomic-dpms") {
>> -        igt_require(data.display.is_atomic);
>> -        data.cp_tests = CP_DPMS;
>> -        test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
>> -    }
>> +        for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
>> +            igt_describe_f("%s", subtests[i].desc);
>>   -    igt_describe("Test for the integrity of link.");
>> -    igt_subtest("LIC") {
>> -        igt_require(data.display.is_atomic);
>> -        data.cp_tests = CP_LIC;
>> -        test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
>> -    }
>> +            igt_subtest_with_dynamic(subtests[i].name) {
>> +                data.cp_tests = subtests[i].cp_tests;
>>   -    igt_describe("Test content protection with content type 1 that "
>> -             "can be handled only through HDCP2.2.");
>> -    igt_subtest("type1") {
>> -        igt_require(data.display.is_atomic);
>> -        test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
>> -    }
>> +                if (!strcmp(subtests[i].name, "srm")) {
>> +                    bool ret;
>>   -    igt_describe("Test the teardown and rebuild of the interface 
>> between "
>> -             "I915 and mei hdcp.");
>> -    igt_subtest("mei_interface") {
>> -        igt_require(data.display.is_atomic);
>> -        data.cp_tests = CP_MEI_RELOAD;
>> -        test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
>> -    }
>> -
>> -    igt_describe("Test the content type change when the content 
>> protection already "
>> -             "enabled.");
>> -    igt_subtest("content_type_change") {
>> -        igt_require(data.display.is_atomic);
>> -        data.cp_tests = CP_TYPE_CHANGE;
>> -        test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
>> -    }
>> +                    ret = write_srm_as_fw((const __u8 *)facsimile_srm,
>> +                                 sizeof(facsimile_srm));
>> +                    igt_assert_f(ret, "SRM update failed");
>> +                }
>>   -    igt_describe("Test to detect the HDCP status change when we 
>> are reading the uevent "
>> -             "sent with the corresponding connector id and property 
>> id.");
>> -    igt_subtest("uevent") {
>> -        igt_require(data.display.is_atomic);
>> -        data.cp_tests = CP_UEVENT;
>> -        data.uevent_monitor = igt_watch_uevents();
>> -        igt_flush_uevents(data.uevent_monitor);
>> -        test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
>> -        igt_cleanup_uevents(data.uevent_monitor);
>> -    }
>> -
>> -    /*
>> -     *  Testing the revocation check through SRM needs a HDCP sink with
>> -     *  programmable Ksvs or we need a uAPI from kernel to read the
>> -     *  connected HDCP sink's Ksv. With that we would be able to add 
>> that
>> -     *  Ksv into a SRM and send in for revocation check. Since we 
>> dont have
>> -     *  either of these options, we test SRM writing from userspace and
>> -     *  validation of the same at kernel. Something is better than 
>> nothing.
>> -     */
>> -    igt_describe("This test writes the facsimile SRM into the 
>> /lib/firmware/ "
>> -             "and check the kernel parsing of it by invoking the 
>> hdcp authentication.");
>> -    igt_subtest("srm") {
>> -        bool ret;
>> -
>> -        igt_require(data.display.is_atomic);
>> -        data.cp_tests = 0;
>> -        ret = write_srm_as_fw((const __u8 *)facsimile_srm,
>> -                      sizeof(facsimile_srm));
>> -        igt_assert_f(ret, "SRM update failed");
>> -        test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
>> -    }
>> -
>> -    igt_describe("Test Content protection over DP MST");
>> -    igt_subtest("dp-mst-type-0") {
>> -        test_content_protection_mst(HDCP_CONTENT_TYPE_0);
>> +                test_content_protection(COMMIT_ATOMIC, 
>> subtests[i].content_type);
>> +            }
>> +        }
>>       }
>>   -    igt_describe("Test Content protection over DP MST with LIC");
>> -    igt_subtest("dp-mst-lic-type-0") {
>> -        data.cp_tests = CP_LIC;
>> -        test_content_protection_mst(HDCP_CONTENT_TYPE_0);
>> -    }
>> +    igt_subtest_group {
>> +        igt_fixture
>> +            igt_require(data.display.is_atomic);
>>   -    igt_describe("Test Content protection over DP MST");
>> -    igt_subtest("dp-mst-type-1") {
>> -        test_content_protection_mst(HDCP_CONTENT_TYPE_1);
>> -    }
>> +        for (int i = 0; i < ARRAY_SIZE(mst_subtests); i++) {
>> +            igt_describe_f("%s", mst_subtests[i].desc);
>>   -    igt_describe("Test Content protection over DP MST with LIC");
>> -    igt_subtest("dp-mst-lic-type-1") {
>> -        data.cp_tests = CP_LIC;
>> -        test_content_protection_mst(HDCP_CONTENT_TYPE_1);
>> +            igt_subtest(mst_subtests[i].name) {
>> +                data.cp_tests = mst_subtests[i].cp_tests;
>> + test_content_protection_mst(mst_subtests[i].content_type);
>
> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_content_protection.c#n610 
>
>
> if pipe/output combo is invalid, we must try with another combo.
Sure, will update this logic.
>
> Also, do we need 2 or more outputs in case of MST?
Yes, the test intends to test HDCP with MST config having 2 or more outputs.
>
>> +            }
>> +        }
>>       }
>>         igt_fixture {
>
> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_content_protection.c#n840 
>
>
> Can we move test_content_protection_cleanup() to test_fini()?

This wouldn't be possible as we're using the same fb across all the 
subtests, we're removing the fb directly at the end.  And making sure 
all outputs have CP disabled. So could this be retained as is?

Thanks,
Karthik.B.S

>
> - Bhanu
>
>
