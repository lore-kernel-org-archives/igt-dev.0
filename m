Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF89910EAB6
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Mar 2022 04:57:54 +0000 (UTC)
Message-ID: <5d5bd74b-1cbd-29d2-0cfe-dee50e870442@intel.com>
Date: Mon, 7 Mar 2022 10:27:41 +0530
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
References: <20220224051648.91470-1-bhanuprakash.modem@intel.com>
 <20220224051648.91470-4-bhanuprakash.modem@intel.com>
 <20220304012021.GB5029@labuser-Z97X-UD5H>
 <9296e826-a323-9038-f7c6-17803cecd2e1@intel.com>
In-Reply-To: <9296e826-a323-9038-f7c6-17803cecd2e1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 3/5] tests/kms_vrr: Add Negative tests to
 validate VRR
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri-04-03-2022 09:32 am, Modem, Bhanuprakash wrote:
> On Fri-04-03-2022 06:50 am, Navare, Manasi wrote:
>> On Thu, Feb 24, 2022 at 10:46:46AM +0530, Bhanuprakash Modem wrote:
>>> This patch will try to enable VRR on Non-VRR panel. VRR should
>>> not be enabled on the Non-VRR panel. Hence Kernel should reject
>>> the commit.
>>>
>>> Cc: Manasi Navare <manasi.d.navare@intel.com>
>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> ---
>>>   tests/kms_vrr.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++--
>>>   1 file changed, 67 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
>>> index 8976d4a6c3..7deab77311 100644
>>> --- a/tests/kms_vrr.c
>>> +++ b/tests/kms_vrr.c
>>> @@ -45,6 +45,7 @@ enum {
>>>       TEST_DPMS = 1 << 0,
>>>       TEST_SUSPEND = 1 << 1,
>>>       TEST_FLIPLINE = 1 << 2,
>>> +    TEST_NEGATIVE = 1 << 3,
>>>   };
>>>   typedef struct range {
>>> @@ -244,6 +245,34 @@ static void prepare_test(data_t *data, 
>>> igt_output_t *output, enum pipe pipe)
>>>       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   }
>>> +static void prepare_negative_test(data_t *data, igt_output_t 
>>> *output, enum pipe pipe)
>>> +{
>>> +    drmModeModeInfo *mode;
>>> +
>>> +    /* Reset output */
>>> +    igt_display_reset(&data->display);
>>> +    igt_output_set_pipe(output, pipe);
>>> +
>>> +    /* Capture VRR range */
>>> +    data->range = get_vrr_range(data, output);
>>> +
>>> +    /* Prepare resources */
>>> +    mode = igt_output_get_mode(output);
>>> +    igt_assert(igt_create_fb(data->drm_fd, mode->hdisplay, 
>>> mode->vdisplay,
>>> +                 DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>> +                 &data->fb0));
>>> +
>>> +    /* Take care of any required modesetting before the test begins. */
>>> +    data->primary = igt_output_get_plane_type(output, 
>>> DRM_PLANE_TYPE_PRIMARY);
>>> +    igt_plane_set_fb(data->primary, &data->fb0);
>>> +
>>> +    /* Clear vrr_enabled state before enabling it, because
>>> +     * it might be left enabled if the previous test fails.
>>> +     */
>>> +    igt_pipe_set_prop_value(&data->display, pipe, 
>>> IGT_CRTC_VRR_ENABLED, 0);
>>> +    igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>> +}
>>> +
>>>   /* Performs an atomic non-blocking page-flip on a pipe. */
>>>   static void
>>>   do_flip(data_t *data, igt_fb_t *fb)
>>> @@ -430,6 +459,32 @@ test_basic(data_t *data, enum pipe pipe, 
>>> igt_output_t *output, uint32_t flags)
>>>       igt_remove_fb(data->drm_fd, &data->fb0);
>>>   }
>>> +/* VRR on Non-VRR panel: VRR should not be enabled on the Non-VRR 
>>> panel.
>>> + * Kernel should reject the commit.
>>> + */
>>> +static void
>>> +test_negative_basic(data_t *data, enum pipe pipe,
>>> +            igt_output_t *output, uint32_t flags)
>>> +{
>>> +    int ret;
>>> +
>>> +    igt_info("VRR Negative Test execution on %s, PIPE_%s.\n",
>>> +            output->name, kmstest_pipe_name(pipe));
>>> +
>>> +    prepare_negative_test(data, output, pipe);
>>> +    igt_pipe_set_prop_value(&data->display, pipe, 
>>> IGT_CRTC_VRR_ENABLED, 1);
>>> +
>>> +    ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>> +    igt_assert_f(ret == 0, "VRR shouln't be enabled on Non-VRR 
>>> panel.\n");
>>
>> No this is not correct since in the kernel, if its a non VRR panel 
>> then it will just
>> do the modeset without enabling VRR so you will just see the visual 
>> artifacts but not reject it.
> 
> Hmm, intel_vrr_compute_config() will just return & even don't care about 
> "vrr_enabled" if the panel is Non-VRR.
> 
> In general, if we try to commit with invalid config, Kernel must reject 
> (with -22 invalid arg) right? Here, we requested to enable VRR, but 
> Kernel returned success without enabling it.
> 
> So the flow would be:
> * Set "vrr_enabled" on selected pipe & do modeset
> * Readback the "vrr_enabled" prop to make sure that Kernel enabled the 
> VRR on selected pipe.

Floated to try-bot: https://patchwork.freedesktop.org/series/100463
Logs: 
https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_488/bat-all.html?testfilter=kms_vrr@negative

https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_488/fi-tgl-1115g4/igt@kms_vrr@negative-basic@pipe-a-dp-1.html 

Starting subtest: negative-basic
Starting dynamic subtest: pipe-A-DP-1
(kms_vrr:5413) CRITICAL: Test assertion failure function 
test_negative_basic, file ../tests/kms_vrr.c:483:
(kms_vrr:5413) CRITICAL: Failed assertion: !vrr_enabled
(kms_vrr:5413) CRITICAL: VRR shouln't be enabled on Non-VRR panel.
Dynamic subtest pipe-A-DP-1 failed.

VRR is getting enabled on non-VRR panels.

- Bhanu

> 
> Am I missing anything?
> 
> - Bhanu
> 
>>
>> Manasi
>>
>>> +
>>> +    /* Clean-up */
>>> +    igt_plane_set_fb(data->primary, NULL);
>>> +    igt_output_set_pipe(output, PIPE_NONE);
>>> +    set_vrr_on_pipe(data, pipe, false);
>>> +
>>> +    igt_remove_fb(data->drm_fd, &data->fb0);
>>> +}
>>> +
>>>   /* Runs tests on outputs that are VRR capable. */
>>>   static void
>>>   run_vrr_test(data_t *data, test_t test, uint32_t flags)
>>> @@ -439,8 +494,14 @@ run_vrr_test(data_t *data, test_t test, uint32_t 
>>> flags)
>>>       for_each_connected_output(&data->display, output) {
>>>           enum pipe pipe;
>>> -        if (!has_vrr(output))
>>> -            continue;
>>> +        /* For Negative tests, panel should be non-vrr. */
>>> +        if (flags & TEST_NEGATIVE) {
>>> +            if (has_vrr(output))
>>> +                continue;
>>> +        } else {
>>> +            if (!has_vrr(output))
>>> +                continue;
>>> +        }
>>>           for_each_pipe(&data->display, pipe) {
>>>               if (igt_pipe_connector_valid(pipe, output)) {
>>> @@ -486,6 +547,10 @@ igt_main
>>>       igt_subtest_with_dynamic("flipline")
>>>           run_vrr_test(&data, test_basic, TEST_FLIPLINE);
>>> +    igt_describe("Make sure that VRR should not be enabled on the 
>>> Non-VRR panel.");
>>> +    igt_subtest_with_dynamic("negative-basic")
>>> +        run_vrr_test(&data, test_negative_basic, TEST_NEGATIVE);
>>> +
>>>       igt_fixture {
>>>           igt_display_fini(&data.display);
>>>       }
>>> -- 
>>> 2.35.0
>>>
> 
