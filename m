Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Tue, 8 Jun 2021 09:19:39 +0000
Message-ID: <BY5PR11MB437298B9B622322E6663495E89379@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1622176025-12499-1-git-send-email-vidya.srinivas@intel.com>
 <CO6PR11MB55693230CBD2262DDCF5A0C18D379@CO6PR11MB5569.namprd11.prod.outlook.com>
 <80bed39a-e899-f211-ae2f-279312b52084@gmail.com>
 <BY5PR11MB4372F22C0AF1AEC2CD3A20D089379@BY5PR11MB4372.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4372F22C0AF1AEC2CD3A20D089379@BY5PR11MB4372.namprd11.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_big_fb:
 Wait for vblank before collecting CRC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Lin, Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello Juha-Pekka

Instead of wait for vblank, this also works
igt_pipe_crc_start-> igt_pipe_crc_get_current for small fb after commit -> then igt_pipe_crc_get_current For big fb -> compare -> igt_pipe_crc_stop

Would this change be okay? Kindly suggest. igt_pipe_crc_collect_crc is not working. It gives CRC mismatch for few subtests like subtest y-tiled-32bpp-rotate-0

Have submitted the change here https://patchwork.freedesktop.org/patch/437657/?series=90389&rev=6

Thank you so much.

Regards
Vidya

-----Original Message-----
From: Srinivas, Vidya 
Sent: Tuesday, June 8, 2021 1:19 PM
To: juhapekka.heikkila@gmail.com; Modem, Bhanuprakash <Bhanuprakash.Modem@intel.com>; intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
Cc: Lin, Charlton <Charlton.Lin@intel.com>
Subject: RE: [igt-dev] [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_big_fb: Wait for vblank before collecting CRC

Hello Juha-Pekka and Bhanu

Thank you for the review comments. Apologies Juha-Pekka, I will incorporate your review comments and try out.

Regards
Vidya


-----Original Message-----
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Sent: Tuesday, June 8, 2021 1:04 PM
To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Srinivas, Vidya <vidya.srinivas@intel.com>; intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
Cc: Lin, Charlton <charlton.lin@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_big_fb: Wait for vblank before collecting CRC

On 8.6.2021 10.01, Modem, Bhanuprakash wrote:
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf 
>> Of Vidya Srinivas
>> Sent: Friday, May 28, 2021 9:57 AM
>> To: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
>> Cc: markyacoub@chromium.org; Lin, Charlton <charlton.lin@intel.com>
>> Subject: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_big_fb: Wait for 
>> vblank before collecting CRC
>>
>> Without wait for vblank, CRC mismatch is seen between big and small 
>> CRC on few Gen11 systems.
>>
>> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
>> ---
>>   tests/kms_big_fb.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c index
>> b35727a09bd0..f90363c3beb2 100644
>> --- a/tests/kms_big_fb.c
>> +++ b/tests/kms_big_fb.c
>> @@ -254,6 +254,7 @@ static void unset_lut(data_t *data)
>>   static bool test_plane(data_t *data)
>>   {
>>   	igt_plane_t *plane = data->plane;
>> +	igt_display_t *display = &data->display;
> 
> For code readability purpose, I think we need to update to use this 
> variable wherever we are using "&data->display" in this function.
> s/"&data->display"/"display"/
> 
> With above change, this patch LGTM
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 

I still don't see benefit in this patch. For now all this look like is doing is slow down the test and if this actually helps there's a real bug somewhere which is not here. My earlier review comments were not addressed hence repeat here, see below.


>>   	struct igt_fb *small_fb = &data->small_fb;
>>   	struct igt_fb *big_fb = &data->big_fb;
>>   	int w = data->big_fb_width - small_fb->width; @@ -337,16 +338,17 
>> @@ static bool test_plane(data_t *data)
>>   		igt_display_commit2(&data->display, data->display.is_atomic ?
>>   				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>>
>> -
>> +		igt_wait_for_vblank(data->drm_fd,
>> +display->pipes[data->pipe].crtc_offset);

Above this line there's flip to different fb. Below this line crc calculation is restarted, get one crc and stop crc. There's several vblanks already spent here, if now adding one more somehow helps it sound like there's problems in crc calculation on some platform or kernel is saying too early framebuffer is ready to be shown. Am I missing something here?

/Juha-Pekka

>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
>>
>>   		igt_plane_set_fb(plane, big_fb);
>>   		igt_fb_set_position(big_fb, plane, x, y);
>>   		igt_fb_set_size(big_fb, plane, small_fb->width, 
>> small_fb->height);
>> +

spurious empty line need to be removed.

>>   		igt_plane_set_size(plane, data->width, data->height);
>>   		igt_display_commit2(&data->display, data->display.is_atomic ?
>>   				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>> -
>> +		igt_wait_for_vblank(data->drm_fd, 
>> +display->pipes[data->pipe].crtc_offset);
>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &big_crc);
>>
>>   		igt_plane_set_fb(plane, NULL);
>> --
>> 2.7.4
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
