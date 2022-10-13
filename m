Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECF110E32C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 19:05:29 +0000 (UTC)
Message-ID: <96ffa57b-8277-9194-039e-a814caac68bd@amd.com>
Date: Thu, 13 Oct 2022 13:05:24 -0600
To: Mark Yacoub <markyacoub@chromium.org>
References: <20221012235706.75569-1-alex.hung@amd.com>
 <CAJUqKUr1QyvaRZ-gAfRt5Cz2xU+Nkxf_cQ5GCwVyBPTc6hEB8w@mail.gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <CAJUqKUr1QyvaRZ-gAfRt5Cz2xU+Nkxf_cQ5GCwVyBPTc6hEB8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_universal_plane: turn off pipe
 when primary plane is off
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



On 2022-10-13 08:19, Mark Yacoub wrote:
> On Wed, Oct 12, 2022 at 7:57 PM Alex Hung <alex.hung@amd.com> wrote:
>>
>> GPU drivers can reject when crtc is on and primary plane is off,
>> so turn crtc off with primary plane and turn it on afterwards.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   tests/kms_universal_plane.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
>> index 64416afd..468f7a4e 100644
>> --- a/tests/kms_universal_plane.c
>> +++ b/tests/kms_universal_plane.c
>> @@ -62,6 +62,13 @@ typedef struct {
>>          struct igt_fb biggreen_fb, smallred_fb, smallblue_fb;
>>   } gen9_test_t;
>>
>> +static void
>> +set_pipe_on_off(igt_display_t *display, igt_output_t *output, enum pipe pipe)
>> +{
>> +       igt_output_set_pipe(output, pipe);
>> +       igt_display_commit2(display, COMMIT_LEGACY);
> Why did you choose legacy commit?

This seems to be most stable. I observed failures / regressions if using 
atomic and universal on both intel and amd devices, but not with legacy.

>> +}
>> +
>>   static void
>>   functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pipe)
>>   {
>> @@ -228,12 +235,14 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>>          igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_7);
>>
>>          /* Step 11: Disable primary plane */
>> +       set_pipe_on_off(&data->display, output, PIPE_NONE);
>>          igt_plane_set_fb(primary, NULL);
>>          igt_display_commit2(display, COMMIT_UNIVERSAL);
>>
>>          /* Step 12: Legacy modeset to yellow FB (CRC 8) */
>>          igt_plane_set_fb(primary, &test.yellow_fb);
>>          igt_display_commit2(display, COMMIT_LEGACY);
>> +       set_pipe_on_off(&data->display, output, pipe);
>>          igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
>>
>>          /* Step 13: Legacy API', blue primary, red sprite */
>> @@ -497,8 +506,10 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>>          igt_display_commit2(&data->display, COMMIT_LEGACY);
>>
>>          /* Disable the primary plane */
>> +       set_pipe_on_off(&data->display, output, PIPE_NONE);
>>          igt_plane_set_fb(primary, NULL);
>>          igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
>> +       set_pipe_on_off(&data->display, output, pipe);
>>
>>          /*
>>           * Issue a pageflip to red FB
>> @@ -520,9 +531,11 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>>           * completes, which we don't have a good way to specifically test for,
>>           * but at least we can make sure that nothing blows up.
>>           */
>> +       set_pipe_on_off(&data->display, output, pipe);
>>          igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
>>                                     test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
>>                                     &test) == 0);
>> +       set_pipe_on_off(&data->display, output, PIPE_NONE);
>>          igt_plane_set_fb(primary, NULL);
>>          igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
>>
>> --
>> 2.38.0
>>
