Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C5D10E0E6
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 12:57:01 +0000 (UTC)
Message-ID: <423be03a-b5de-07ac-35cf-54d5c10ce2ed@intel.com>
Date: Wed, 15 Nov 2023 18:26:38 +0530
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20231115070344.1488683-1-bhanuprakash.modem@intel.com>
 <20231115070344.1488683-4-bhanuprakash.modem@intel.com>
 <425199b137a40c80e7b3f57f016e996dbf6f7dd2.camel@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <425199b137a40c80e7b3f57f016e996dbf6f7dd2.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 3/5] tests/intel/kms_dirtyfb: Use blitter as a
 default draw method
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


On Wed-15-11-2023 03:45 pm, Hogander, Jouni wrote:
> On Wed, 2023-11-15 at 12:33 +0530, Bhanuprakash Modem wrote:
>> As Rendercopy support in IGT is not present for few latest
>> platforms, use Blitter as default draw method.
>>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Jouni Högander <jouni.hogander@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/intel/kms_dirtyfb.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
>> index b14cc8bec..c072c221d 100644
>> --- a/tests/intel/kms_dirtyfb.c
>> +++ b/tests/intel/kms_dirtyfb.c
>> @@ -177,7 +177,7 @@ static void prepare(data_t *data)
>>                              &data->fbs[0]);
>>   
>>          igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[0],
>> -                        IGT_DRAW_RENDER, 0, 0, data->fbs[0].width,
>> +                        IGT_DRAW_BLT, 0, 0, data->fbs[0].width,
> 
> I think you should use same method in prepare as you are using in the
> test itself. I.e. utilize that "supports" helper and use rendercopy if
> possible here.

Sure, in that case this patch could be folded with the patch-4. I'll 
float the new rev of patches soon.

- Bhanu

> 
> BR,
> 
> Jouni Högander
> 
>>                           data->fbs[0].height, 0xFF);
>>   
>>          primary = igt_output_get_plane_type(data->output,
>> @@ -197,7 +197,7 @@ static void prepare(data_t *data)
>>                              DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
>>                              &data->fbs[1]);
>>          igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],
>> -                        IGT_DRAW_RENDER, 0, 0, data->fbs[1].width,
>> +                        IGT_DRAW_BLT, 0, 0, data->fbs[1].width,
>>                           data->fbs[1].height, 0xFF);
>>   
>>          igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> 
> 
