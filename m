Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC4F6E972
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 10:55:54 +0000 (UTC)
References: <20211019094030.553874-1-maarten.lankhorst@linux.intel.com>
 <20211019094030.553874-2-maarten.lankhorst@linux.intel.com>
 <YW6ZVoESdqRdYwPG@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <f1c0185d-3224-ed4c-e155-f21acab9b845@linux.intel.com>
Date: Tue, 19 Oct 2021 12:55:51 +0200
MIME-Version: 1.0
In-Reply-To: <YW6ZVoESdqRdYwPG@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_draw: Use device coherent
 and cpu coherent mappings for draw methods.
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

Op 19-10-2021 om 12:09 schreef Ville Syrjälä:
> On Tue, Oct 19, 2021 at 11:40:30AM +0200, Maarten Lankhorst wrote:
>> This will allow kms_frontbuffer_tracking to draw buffers for frontbuffer tracking on dg1.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  lib/igt_draw.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
>> index da1d39fcba95..62ca4761a9f2 100644
>> --- a/lib/igt_draw.c
>> +++ b/lib/igt_draw.c
>> @@ -341,8 +341,8 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
>>  	if (tiling != I915_TILING_NONE)
>>  		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
>>  
>> -	ptr = gem_mmap__cpu(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
>> -			    PROT_READ | PROT_WRITE);
>> +	ptr = gem_mmap__cpu_coherent(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
>> +				     PROT_READ | PROT_WRITE);
>>  
>>  	switch (tiling) {
>>  	case I915_TILING_NONE:
>> @@ -391,8 +391,8 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
>>  	if (tiling != I915_TILING_NONE)
>>  		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
>>  
>> -	ptr = gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
>> -			   PROT_READ | PROT_WRITE);
>> +	ptr = gem_mmap__device_coherent(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
>> +					PROT_READ | PROT_WRITE);
> That seems to have a silent fallback to mmap_gtt, so on
> first blush this does not seem to have 100% identical
> behaviour anymore.
>
> Then again gem_mmap__wc() should assert if you attempt to
> use it on a machine that doesn't support WC mmaps. So I guess
> it ends up being the same in practice? Maybe we should have an
> assert in draw_rect_mmap_wc() that either lmem or wc mmap is
> available?

It's not 100% identical, but the conditions in which WC Is not available are only on some

specific systems that lack PAT. I wouldn't worry much about the fallback, they will likely fail

just as hard when the mmap_wc fails.

> Or maybe we don't want to conflate mmap_wc and mmap_fixed
> (which I guess is some code for "lmem"?) and instead igt_draw
> should have separate methods for each?

I don't think in many places we care, and we're still discussing keeping mmap type fixed on creation of the object,

so I think not worrying about different types would be an excellent idea.
