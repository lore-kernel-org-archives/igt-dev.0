Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA5CCCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 12:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02B810E161;
	Thu,  6 Nov 2025 12:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xecglf9q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0806010E161
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762432951; x=1793968951;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TlNwUrNvKw/LldkU5G0gFi/13qM8UvHEwBUt+ylDSO0=;
 b=Xecglf9qXw1/pDNZLi6FbAz+wMcePExKWdh0HZtbSex1MSxgoGjqgSQ8
 HaB1pmOdRcc7mCWIblhxSp0THgCxl5LUtdg+IGj4E7Cc4uTfdfo88sSyf
 IwZ3SwfXKifiLFogRj5N7MASPbT3QRxcxP3W5yqJwM+6e5CthOmyR5vCK
 lvJXKthA9b7GI7y461rreehXjWDsdVvgZL6F4y5ryeNkV56b3uJ2HBlff
 xieDoaFeUNSfZwWPyu/Z99YDeEeP+g5Qwo5Y5YzaobGgqFuwWz80Rw+f+
 IROyrleCIQH9fvx/PDn5JbxIlsByBVhSFOu36kih6o14J7tWnTin4+as5 Q==;
X-CSE-ConnectionGUID: AuHdtXqZRxSaX85zB7wY+g==
X-CSE-MsgGUID: T5xLdVZvSFSKNkJsA6bYNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75918257"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75918257"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:42:31 -0800
X-CSE-ConnectionGUID: TbXMRqjVS+OcOnaE3IJCBA==
X-CSE-MsgGUID: mADLMCdKTM20ATRzEBEuYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187692406"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.65])
 ([172.28.180.65])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:42:29 -0800
Message-ID: <24c045f5-7c23-43b7-bbc0-fc43e594e497@linux.intel.com>
Date: Thu, 6 Nov 2025 13:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] lib/xe/xe_query: Add tile helpers and iteration
 macro
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, jakub1.kolakowski@intel.com
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
 <20251031125633.1374273-4-marcin.bernatowicz@linux.intel.com>
 <2cbfa06f-88fa-43fe-8184-bd5f6f856b7d@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <2cbfa06f-88fa-43fe-8184-bd5f6f856b7d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 11/6/2025 12:32 PM, Laguna, Lukasz wrote:
>
> On 10/31/2025 13:56, Marcin Bernatowicz wrote:
>> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>
>> Add helpers for tile-level access:
>>   - xe_tiles_count(): return number of tiles
>>   - xe_tile_get_main_gt_id(): get MAIN GT ID for a tile
>>   - xe_for_each_tile(): iterate over tiles via tile_mask
>>
>> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   lib/xe/xe_query.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>   lib/xe/xe_query.h |  6 ++++++
>>   2 files changed, 51 insertions(+)
>>
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index a89e0b980..e58b3bf1e 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -515,6 +515,22 @@ unsigned int xe_dev_max_gt(int fd)
>>       return igt_fls(xe_dev->gt_mask) - 1;
>>   }
>>   +/**
>> + * xe_tiles_count
>
> missing colon
Ok
>
>> + * @fd: xe device fd
>> + *
>> + * Return number of tiles for xe device fd.
>> + */
>> +uint8_t xe_tiles_count(int fd)
>> +{
>> +    struct xe_device *xe_dev;
>> +
>> +    xe_dev = find_in_cache(fd);
>> +    igt_assert(xe_dev);
>> +
>> +    return igt_hweight(xe_dev->tile_mask);
>> +}
>> +
>>   /**
>>    * all_memory_regions:
>>    * @fd: xe device fd
>> @@ -995,6 +1011,35 @@ uint16_t xe_gt_get_tile_id(int fd, int gt)
>>       return xe_dev->gt_list->gt_list[gt].tile_id;
>>   }
>>   +/**
>> + * xe_tile_get_main_gt_id:
>> + * @fd: xe device fd
>> + * @tile: tile id
>> + *
>> + * Returns main GT ID for given @tile.
>> + */
>> +uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile)
>
> nit: uint16_t? Do we expect so many GTs?
>
uint16_t mirrors the uAPI type in xe_drm.h (struct drm_xe_gt::gt_id is 
__u16), so keeping it ensures consistency with the driver/uAPI.
>> +{
>> +    struct xe_device *xe_dev;
>> +    int gt_id = -1;
>> +
>> +    xe_dev = find_in_cache(fd);
>> +    igt_assert(xe_dev);
>> +
>> +    for (int i = 0; i < xe_dev->gt_list->num_gt; i++) {
>> +        const struct drm_xe_gt *gt_data = &xe_dev->gt_list->gt_list[i];
>> +
>> +        if (gt_data->tile_id == tile && gt_data->type == 
>> DRM_XE_QUERY_GT_TYPE_MAIN) {
>> +            gt_id = gt_data->gt_id;
>> +            break;
>> +        }
>> +    }
>> +
>> +    igt_assert_f(gt_id >= 0, "No main GT found for tile %d\n", tile);
>> +
>> +    return gt_id;
>> +}
>> +
>>   /**
>>    * xe_hwconfig_lookup_value:
>>    * @fd: xe device fd
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> index 715b64e2f..bcdfb54b0 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -86,6 +86,10 @@ struct xe_device {
>>       for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
>>            __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) 
>> != 0; \
>>            igt_unique(__mask) &= ~(1ull << __gt))
>> +#define xe_for_each_tile(__fd, __tile) \
>> +    for (uint64_t igt_unique(__mask) = 
>> xe_device_get(__fd)->tile_mask; \
>> +         __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) 
>> != 0; \
>> +         igt_unique(__mask) &= ~(1ull << __tile))
>>   #define xe_for_each_mem_region(__fd, __memreg, __r) \
>>       for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < 
>> igt_fls(__memreg); igt_unique(__i)++) \
>>           for_if(__r = (__memreg & (1ull << igt_unique(__i))))
>> @@ -101,6 +105,7 @@ struct xe_device {
>>     unsigned int xe_number_gt(int fd);
>>   unsigned int xe_dev_max_gt(int fd);
>> +uint8_t xe_tiles_count(int fd);
>>   uint64_t all_memory_regions(int fd);
>>   uint64_t system_memory(int fd);
>>   const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int 
>> gt_id);
>> @@ -135,6 +140,7 @@ uint16_t xe_gt_type(int fd, int gt);
>>   bool xe_is_media_gt(int fd, int gt);
>>   bool xe_is_main_gt(int fd, int gt);
>>   uint16_t xe_gt_get_tile_id(int fd, int gt);
>> +uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
>>   uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig 
>> attribute, uint32_t *len);
>>   int xe_query_pxp_status(int fd);
>>   int xe_wait_for_pxp_init(int fd);
>
> Looks good overall, just please fix the missing colon:
> Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
>
