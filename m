Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBF310E1E4
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 04:39:02 +0000 (UTC)
Message-ID: <90cb5a0c-4d5f-b1d7-c599-e31ef761c6e9@intel.com>
Date: Thu, 24 Mar 2022 10:08:33 +0530
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220318081741.14772-1-karthik.b.s@intel.com>
 <YjSP6ry3yj+QkgXf@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <YjSP6ry3yj+QkgXf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "tests/kms_async_flips: Make the
 crc test faster"
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

On 3/18/2022 7:28 PM, Ville Syrjälä wrote:
> On Fri, Mar 18, 2022 at 01:47:41PM +0530, Karthik B S wrote:
>> This reverts commit 9cb64a757d2ff1e180b1648e611439d94afd697d.
>>
>> This patch was added to speed up the test and get better results with
>> shard-skls. But even with this we're still seeing failure on shard-skl.
> Please mention the dg2 woes in the commit message so we
> understand why the revert was necessary.
>
> With that
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thanks for the review. Will update the commit message with this detail 
and get it merged.

Thanks,
Karthik.B.S
>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_async_flips.c | 22 ++++++----------------
>>   1 file changed, 6 insertions(+), 16 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index c658630c..5e11cd43 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -472,28 +472,19 @@ static unsigned int clock_ms(void)
>>   	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
>>   }
>>   
>> -static void paint_fb(int fd, struct igt_fb *fb, uint32_t color, int height)
>> +static void paint_fb(int fd, struct igt_fb *fb, uint32_t color)
>>   {
>>   	igt_draw_rect_fb(fd, NULL, 0, fb,
>>   			 gem_has_mappable_ggtt(fd) ?
>>   			 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
>> -			 0, 0, 1, height, color);
>> +			 0, 0, 1, fb->height, color);
>>   }
>>   
>>   static void test_crc(data_t *data)
>>   {
>>   	unsigned int frame = 0;
>>   	unsigned int start;
>> -	int ret, height;
>> -	drmModeModeInfoPtr mode;
>> -
>> -	/* make things faster by using a smallish mode */
>> -	mode = &data->connector->modes[0];
>> -	if (mode->hdisplay > 1024 && mode->vdisplay > 786)
>> -		mode = igt_std_1024_mode_get(data->refresh_rate);
>> -	else
>> -		mode = igt_memdup(mode, sizeof(*mode));
>> -	height = mode->vdisplay;
>> +	int ret;
>>   
>>   	data->flip_count = 0;
>>   	data->frame_count = 0;
>> @@ -503,8 +494,7 @@ static void test_crc(data_t *data)
>>   	igt_draw_fill_fb(data->drm_fd, &data->bufs[!frame], 0xff0000ff);
>>   
>>   	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
>> -			     &data->connector->connector_id, 1, mode);
>> -	free(mode);
>> +			     &data->connector->connector_id, 1, &data->connector->modes[0]);
>>   	igt_assert_eq(ret, 0);
>>   
>>   	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
>> @@ -520,7 +510,7 @@ static void test_crc(data_t *data)
>>   
>>   	while (clock_ms() - start < 2000) {
>>   		/* fill the next fb with the expected color */
>> -		paint_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff, height);
>> +		paint_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff);
>>   
>>   		data->flip_pending = true;
>>   		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
>> @@ -531,7 +521,7 @@ static void test_crc(data_t *data)
>>   
>>   		/* clobber the previous fb which should no longer be scanned out */
>>   		frame = !frame;
>> -		paint_fb(data->drm_fd, &data->bufs[frame], rand(), height);
>> +		paint_fb(data->drm_fd, &data->bufs[frame], rand());
>>   	}
>>   
>>   	igt_pipe_crc_stop(data->pipe_crc);
>> -- 
>> 2.22.0

