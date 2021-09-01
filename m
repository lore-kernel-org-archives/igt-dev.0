Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53196E169
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 10:03:52 +0000 (UTC)
References: <20210831060013.1215605-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <87fsupv6fl.wl-ashutosh.dixit@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <315e600f-36f9-4c3c-c437-440e0ba6f668@intel.com>
Date: Wed, 1 Sep 2021 11:03:42 +0100
MIME-Version: 1.0
In-Reply-To: <87fsupv6fl.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t,
 V3] lib/i915: Use FIXED mapping only for discrete memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 31/08/2021 19:02, Dixit, Ashutosh wrote:
> On Mon, 30 Aug 2021 23:00:13 -0700, Tejas Upadhyay wrote:
>>
>> The FIXED mapping is only used for discrete, and mapping type
>> is pre-defined. This disables the other type of mmap
>> offsets when discrete memory is used.
>>
>> Taken from kernel commit:
>> commit 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")
>>
>> Changes since V2:
>> 	- Add previous logic check for GTT offset type - Ashutosh Dixit
>> 	- Added documentation for library API change - Daniel Vetter
>> Changes since V1:
>>          - Make logic more readable - Petri Latvala
>>
>> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
>> ---
>>   include/drm-uapi/i915_drm.h |  1 +
>>   lib/i915/gem_mman.c         | 20 +++++++++++++++++++-
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
>> index a1c0030c..b46367f2 100644
>> --- a/include/drm-uapi/i915_drm.h
>> +++ b/include/drm-uapi/i915_drm.h
>> @@ -871,6 +871,7 @@ struct drm_i915_gem_mmap_offset {
>>   #define I915_MMAP_OFFSET_WC  1
>>   #define I915_MMAP_OFFSET_WB  2
>>   #define I915_MMAP_OFFSET_UC  3
>> +#define I915_MMAP_OFFSET_FIXED 4
> 
> I don't believe we can add stuff to i915_drm.h like this we need to sync
> with the kernel in drm-next? Also I915_MMAP_OFFSET_FIXED is already
> available in lib/i915/i915_drm_local.h, so do we need to add this?
> 
> Matt, do you have any comments on this since you introduced the FIXED mmap
> type? I am ok with the patch otherwise. Thanks.

Yeah, the header sync should probably be a separate change, including 
removing the version in i915_drm_local.h.

> 
>>
>> 	/*
>> 	 * Zero-terminated chain of extensions.
>> diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
>> index 0406a0b9..aa9ac6f3 100644
>> --- a/lib/i915/gem_mman.c
>> +++ b/lib/i915/gem_mman.c
>> @@ -73,9 +73,27 @@ bool gem_has_legacy_mmap(int fd)
>> 	return errno != EOPNOTSUPP;
>>   }
>>
>> +/**
>> + * gem_has_mmap_offset_type:
>> + * @fd: open i915 drm file descriptor
>> + * @*t: pointer to mmap_offset
>> + *
>> + * This functions checks the mmap offset type is supported or not.
>> + * For discrete memory only FIXED mmap_offset type is supported
>> + * and for non-discrete memory all other offset type except FIXED
>> + * are supported.
>> + *
>> + * Returns: True if supported or False if not.
>> + */
>>   bool gem_has_mmap_offset_type(int fd, const struct mmap_offset *t)
>>   {
>> -	return gem_has_mmap_offset(fd) || t->type == I915_MMAP_OFFSET_GTT;
>> +	if (gem_has_mmap_offset(fd))
>> +		if (gem_has_lmem(fd))
>> +			return t->type == I915_MMAP_OFFSET_FIXED;
>> +		else
>> +			return t->type != I915_MMAP_OFFSET_FIXED;
>> +	else
>> +		return t->type == I915_MMAP_OFFSET_GTT;
>>   }
>>
>>   /**
>> --
>> 2.31.1
>>
