Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270B06E2D1
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 13:39:33 +0000 (UTC)
References: <20211019094030.553874-1-maarten.lankhorst@linux.intel.com>
 <YW6Xn4Ysgnna9NFG@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <fb9289e9-ff14-0dfa-51e4-faccf1ffb749@linux.intel.com>
Date: Wed, 20 Oct 2021 15:29:47 +0200
MIME-Version: 1.0
In-Reply-To: <YW6Xn4Ysgnna9NFG@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: create i915 bo in lmem,
 if available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Op 19-10-2021 om 12:02 schreef Ville Syrjälä:
> On Tue, Oct 19, 2021 at 11:40:29AM +0200, Maarten Lankhorst wrote:
>> create_bo_for_fb() should call gem_buffer_create_fb_obj, as this is the
>> function used to create an object in lmem. This will fix the
>> kms_frontbuffer_tracking tests failing on DG1.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  lib/igt_fb.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 63f3c86e75f0..216b1d5c4aff 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -1092,7 +1092,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
>>  		if (is_i915_device(fd)) {
>>  			int err;
>>  
>> -			fb->gem_handle = gem_create(fd, fb->size);
>> +			fb->gem_handle = gem_buffer_create_fb_obj(fd, fb->size);
> Looks to do what we need.
>
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
>>  			err = __gem_set_tiling(fd, fb->gem_handle,
>>  					       igt_fb_mod_to_tiling(fb->modifier),
>>  					       fb->strides[0]);
>> -- 
>> 2.33.0

Thanks, pushed this patch & second amended patch. :)

Now DG1 crashes on FBC properly.

~Maarten
