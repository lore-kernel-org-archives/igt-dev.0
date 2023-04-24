Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FE710E60B
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 20:57:55 +0000 (UTC)
Message-ID: <6bcbbde7-8154-6b3f-d874-74aadbd34dbd@igalia.com>
Date: Mon, 24 Apr 2023 17:57:40 -0300
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230424172407.451109-1-mcanal@igalia.com>
 <ZEbH75wVYbn63VIT@intel.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <ZEbH75wVYbn63VIT@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: require GAMMA_LUT
 property for legacy_lut tests
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

On 4/24/23 15:18, Ville Syrjälä wrote:
> On Mon, Apr 24, 2023 at 02:24:07PM -0300, Maíra Canal wrote:
>> Currently, the tests pixel-format and pixel-format-source-clamping
>> fail for drivers that doesn't have the IGT_CRTC_GAMMA_LUT property,
>> as they are not able to complete drmModeCrtcSetGamma() successfully.
>> Therefore, require the IGT_CRTC_GAMMA_LUT property before running the
>> tests. This way the tests can skip gracefully for drivers without
>> this property.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   tests/kms_plane.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index 62aee9ad..a0e4e80f 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -451,6 +451,8 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
>>   	uint16_t *lut;
>>   	int i, lut_size;
>>   
>> +	igt_require(igt_pipe_obj_has_prop(pipe_obj, IGT_CRTC_GAMMA_LUT));
> 
> Skipping all pixel format tests isn't a great plan.

I'm not sure if we can perform the tests without the legacy LUT, as
we need it to drop the precision down so that errors caused by the
RGB <-> YCbCr conversion end up being ignored.

Currently, I'm performing this test in VKMS and it is failing. As
VKMS don't provide the GAMMA_LUT property, the test simply fails
when hits the drmModeCrtcSetGamma() function. I believe that it
would be better to skip gracefully than fail, considering that
in both cases the pixel format tests are not being executed.

Best Regards,
- Maíra Canal

> 
> Also, you want to check crtc->gamma_size intead. That is what
> indicates support for the legacy gamma.
> 
>> +
>>   	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
>>   	lut_size = crtc->gamma_size;
>>   	drmModeFreeCrtc(crtc);
>> @@ -474,6 +476,8 @@ static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
>>   	uint16_t *r, *g, *b;
>>   	int i, lut_size;
>>   
>> +	igt_require(igt_pipe_obj_has_prop(pipe_obj, IGT_CRTC_GAMMA_LUT));
>> +
>>   	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
>>   	lut_size = crtc->gamma_size;
>>   	drmModeFreeCrtc(crtc);
>> -- 
>> 2.40.0
> 
