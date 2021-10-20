Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E46F6E47B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 12:53:53 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w19so25835363edd.2
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 05:53:52 -0700 (PDT)
References: <20211020091238.28554-1-juhapekka.heikkila@gmail.com>
 <YXAFjysN60Y69ISY@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <7093f649-c1ae-a4ef-7420-787a94d75358@gmail.com>
Date: Wed, 20 Oct 2021 15:53:28 +0300
MIME-Version: 1.0
In-Reply-To: <YXAFjysN60Y69ISY@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Use same
 modifier for reference crc as for test crc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 20.10.2021 15.03, Ville Syrjälä wrote:
> On Wed, Oct 20, 2021 at 12:12:38PM +0300, Juha-Pekka Heikkila wrote:
>> Create reference crc with same modifier as is used for testing. This
>> will reduce non test related anomalies.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   tests/kms_plane_multiple.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
>> index ece00097e..30e4bcc0d 100644
>> --- a/tests/kms_plane_multiple.c
>> +++ b/tests/kms_plane_multiple.c
>> @@ -111,10 +111,13 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
>>   
>>   	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>>   			    DRM_FORMAT_XRGB8888,
>> -			    DRM_FORMAT_MOD_LINEAR,
>> +			    modifier,
>>   			    color->red, color->green, color->blue,
>>   			    &data->fb[primary->index]);
>>   
>> +	igt_skip_on(!igt_plane_has_format_mod(data->plane[primary->index],
>> +		    DRM_FORMAT_XRGB8888, modifier));
>> +
> 
> Maybe do that before the create_fb()?

Yep, I misplaced that. CI results also talk about that. I'll move it 
above create_fb and push.

> 
> Otherwise seems fine.
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
>>   	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
>>   
>>   	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> -- 
>> 2.28.0
> 
