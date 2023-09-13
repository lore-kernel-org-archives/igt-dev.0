Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F49910E49D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 10:44:16 +0000 (UTC)
Message-ID: <35110ca3-32ea-c6ec-db31-40a444984e77@intel.com>
Date: Wed, 13 Sep 2023 16:13:39 +0530
Content-Language: en-US
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230908175039.1291593-1-swati2.sharma@intel.com>
 <20230908175039.1291593-4-swati2.sharma@intel.com>
 <efd53eb0-6c82-17e7-0133-9e7f5cd36df5@intel.com>
 <3ec1a44b-52f1-c3a4-0cc0-f1a6a2230bbb@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <3ec1a44b-52f1-c3a4-0cc0-f1a6a2230bbb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] tests/intel/kms_pm_dc: Use linear
 modifier to set primary plane
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


On Mon-11-09-2023 08:40 pm, Sharma, Swati2 wrote:
> 
> On 11-Sep-23 8:15 PM, Modem, Bhanuprakash wrote:
>> Hi Swati,
>>
>> On Fri-08-09-2023 11:20 pm, Swati Sharma wrote:
>>> To setup primary plane, use DRM_FORMAT_MOD_LINEAR instead of
>>> I915_FORMAT_MOD_X_TILED.
>>>
>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>> ---
>>>   tests/intel/kms_pm_dc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>>> index 895fe4b4c..b5779eaa5 100644
>>> --- a/tests/intel/kms_pm_dc.c
>>> +++ b/tests/intel/kms_pm_dc.c
>>> @@ -231,7 +231,7 @@ static void setup_primary(data_t *data)
>>>       igt_create_color_fb(data->drm_fd,
>>>                   data->mode->hdisplay, data->mode->vdisplay,
>>>                   DRM_FORMAT_XRGB8888,
>>> -                I915_FORMAT_MOD_X_TILED,
>>> +                DRM_FORMAT_MOD_LINEAR,
>>
>> Any special reason for this change?
> 
> For DC states validation, it doesn't matter with which modifier we are 
> creating fb.
> With this change we can make this test independent of x-tiling support.

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> 
>>
>> - Bhanu
>>
>>>                   1.0, 1.0, 1.0,
>>>                   &data->fb_white);
>>>       igt_plane_set_fb(primary, &data->fb_white);
