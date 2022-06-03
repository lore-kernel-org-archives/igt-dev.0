Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B991120DE
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 11:15:46 +0000 (UTC)
Message-ID: <c49a2530-db92-3300-7a02-054c6fed9a9b@intel.com>
Date: Fri, 3 Jun 2022 16:45:34 +0530
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220601093956.8005-1-karthik.b.s@intel.com>
 <20220601093956.8005-3-karthik.b.s@intel.com>
 <21887286-b2e0-7a56-f8e6-a058cb5b0e07@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <21887286-b2e0-7a56-f8e6-a058cb5b0e07@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_plane_lowres: Test
 cleanup
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
>> Add test cleanup function and call it outside the dynamic subtest, so
>> that the cleanup happens even in case of subtest failure.
>>
>> v2: -Move igt_display_reset() and igt_output_set_pipe() outside
>>       the plane loop (Bhanu)
>>      -Add igt_display_require_output() in fixture (Bhanu)
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Thank you for the rb.

Thanks,
Karthik.B.S

>
> - Bhanu
>
>> ---
>>   tests/kms_plane_lowres.c | 39 ++++++++++++++++++++++-----------------
>>   1 file changed, 22 insertions(+), 17 deletions(-)
>>
>> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
>> index 7149bf18..e6b2926c 100644
>> --- a/tests/kms_plane_lowres.c
>> +++ b/tests/kms_plane_lowres.c
>> @@ -52,6 +52,7 @@ typedef struct {
>>           igt_crc_t crc;
>>       } ref_hires;
>>       int x, y;
>> +    igt_pipe_crc_t *pipe_crc;
>>   } data_t;
>>     static drmModeModeInfo
>> @@ -71,7 +72,8 @@ get_lowres_mode(int drmfd, igt_output_t *output,
>>       }
>>         igt_require_f(mode_default->vdisplay - min->vdisplay > 2 * SIZE,
>> -              "Current mode not tall enough; plane would still be 
>> onscreen after switching to lowest mode.\n");
>> +              "Current mode for output %s not tall enough; "
>> +              "plane would still be onscreen after switching to 
>> lowest mode.\n", output->name);
>>         return *min;
>>   }
>> @@ -161,13 +163,10 @@ test_planes_on_pipe_with_output(data_t *data, 
>> igt_plane_t *plane, uint64_t modif
>>   {
>>       const drmModeModeInfo *mode;
>>       drmModeModeInfo mode_lowres;
>> -    igt_pipe_crc_t *pipe_crc;
>>       unsigned tested = 0;
>>       igt_plane_t *primary;
>>       igt_crc_t crc_lowres, crc_hires1, crc_hires2;
>>   -    igt_output_set_pipe(data->output, data->pipe);
>> -
>>       primary = compatible_main_plane(plane, data->output, data->devid);
>>       mode = igt_output_get_mode(data->output);
>>       mode_lowres = get_lowres_mode(data->drm_fd, data->output, mode);
>> @@ -191,18 +190,15 @@ test_planes_on_pipe_with_output(data_t *data, 
>> igt_plane_t *plane, uint64_t modif
>>       create_ref_fb(data, modifier, mode, &data->ref_hires.fb);
>>       create_ref_fb(data, modifier, &mode_lowres, &data->ref_lowres.fb);
>>   -    pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
>> -                    INTEL_PIPE_CRC_SOURCE_AUTO);
>> -
>>       igt_output_override_mode(data->output, &mode_lowres);
>>       igt_plane_set_fb(primary, &data->ref_lowres.fb);
>>       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> -    igt_pipe_crc_collect_crc(pipe_crc, &data->ref_lowres.crc);
>> +    igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_lowres.crc);
>>         igt_output_override_mode(data->output, NULL);
>>       igt_plane_set_fb(primary, &data->ref_hires.fb);
>>       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> -    igt_pipe_crc_collect_crc(pipe_crc, &data->ref_hires.crc);
>> +    igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_hires.crc);
>>         igt_plane_set_fb(primary, &data->fb_primary);
>>       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> @@ -213,19 +209,19 @@ test_planes_on_pipe_with_output(data_t *data, 
>> igt_plane_t *plane, uint64_t modif
>>         igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>   -    igt_pipe_crc_collect_crc(pipe_crc, &crc_hires1);
>> +    igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hires1);
>>         /* switch to lower resolution */
>>       igt_output_override_mode(data->output, &mode_lowres);
>>       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>   -    igt_pipe_crc_collect_crc(pipe_crc, &crc_lowres);
>> +    igt_pipe_crc_collect_crc(data->pipe_crc, &crc_lowres);
>>         /* switch back to higher resolution */
>>       igt_output_override_mode(data->output, NULL);
>>       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>   -    igt_pipe_crc_collect_crc(pipe_crc, &crc_hires2);
>> +    igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hires2);
>>         igt_assert_crc_equal(&data->ref_hires.crc, &crc_hires1);
>>       igt_assert_crc_equal(&data->ref_hires.crc, &crc_hires2);
>> @@ -234,10 +230,7 @@ test_planes_on_pipe_with_output(data_t *data, 
>> igt_plane_t *plane, uint64_t modif
>>       igt_plane_set_fb(plane, NULL);
>>       tested++;
>>   -    igt_pipe_crc_free(pipe_crc);
>> -
>>       igt_plane_set_fb(primary, NULL);
>> -    igt_output_set_pipe(data->output, PIPE_NONE);
>>         igt_remove_fb(data->drm_fd, &data->fb_plane[1]);
>>       igt_remove_fb(data->drm_fd, &data->fb_plane[0]);
>> @@ -245,8 +238,6 @@ test_planes_on_pipe_with_output(data_t *data, 
>> igt_plane_t *plane, uint64_t modif
>>       igt_remove_fb(data->drm_fd, &data->ref_hires.fb);
>>       igt_remove_fb(data->drm_fd, &data->ref_lowres.fb);
>>   -    igt_display_reset(&data->display);
>> -
>>       return tested;
>>   }
>>   @@ -262,6 +253,14 @@ test_planes_on_pipe(data_t *data, uint64_t 
>> modifier)
>>       igt_assert(tested > 0);
>>   }
>>   +static void test_cleanup(data_t *data)
>> +{
>> +    igt_pipe_crc_free(data->pipe_crc);
>> +
>> +    igt_output_set_pipe(data->output, PIPE_NONE);
>> +    igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +}
>> +
>>   static void run_test(data_t *data, uint64_t modifier)
>>   {
>>       enum pipe pipe;
>> @@ -278,8 +277,13 @@ static void run_test(data_t *data, uint64_t 
>> modifier)
>>               igt_display_reset(&data->display);
>>               igt_output_set_pipe(data->output, data->pipe);
>>   +            data->pipe_crc = igt_pipe_crc_new(data->drm_fd, 
>> data->pipe,
>> +                              INTEL_PIPE_CRC_SOURCE_AUTO);
>> +
>>               igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), 
>> data->output->name)
>>                   test_planes_on_pipe(data, DRM_FORMAT_MOD_LINEAR);
>> +
>> +            test_cleanup(data);
>>           }
>>       }
>>   }
>> @@ -318,6 +322,7 @@ igt_main
>>             igt_require_pipe_crc(data.drm_fd);
>>           igt_display_require(&data.display, data.drm_fd);
>> +        igt_display_require_output(&data.display);
>>           igt_require(data.display.is_atomic);
>>       }
>
