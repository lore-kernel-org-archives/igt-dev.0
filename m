Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1905BC25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 13:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F22410E2DF;
	Wed,  5 Jun 2024 13:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtVsJbSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E432910E7DC
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717594143; x=1749130143;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HOKeX+AfCaJ8xlRx7xRCJUWZj4yGkXxrNXy4hNjDbLs=;
 b=OtVsJbSKgXpRr5zwngKzCjy8R2MFOAJX0womYGPkyUb1Gvfojj4wQvjj
 5wLnracQNvMYQ1kBw8P3a5cyPOHEN7QblZu8F7hoUobF1Id0KwC5sjbqU
 CZ5bZoB75vRvgS4CKFZ5gK+nfM5rR+BLskJxnRNUTt8KXcdfDIXImbg/l
 C7bx7MVa7O5rCsOXyuqZHrQxHrSqwkJaL1erbKnySOxbXId3YFbRGR9c8
 t9y4FebJ2yxxiC8wuBJM+GnckiKVZnWfrN9B9HLMxsJhoOfu4xIxwD7DE
 hD9OcBeMTp95MpBsFhpqlvG3voNty2lvjflB7NHM0WuaYsOEGx7skwwTU A==;
X-CSE-ConnectionGUID: rCa3tJoRQyW7QmH+WJfq0A==
X-CSE-MsgGUID: ma2ihhCoQkil388cqU9HwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14089139"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14089139"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 06:29:02 -0700
X-CSE-ConnectionGUID: oyCQQWx6TdWAQrLO1yFdDg==
X-CSE-MsgGUID: iBTmsL4bSqiOXMtjv0wgaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37576122"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 06:29:01 -0700
Message-ID: <8d091de3-ef09-4052-ae06-72d66de6e270@intel.com>
Date: Wed, 5 Jun 2024 15:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] lib/igt_sysfs: add helpers to access engine sysfs
 directory
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com>
 <20240528-iga64_inline_ups-v5-4-fdd8e9dcd64c@intel.com>
 <20240529092143.wne456de23isnwop@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240529092143.wne456de23isnwop@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 29.05.2024 11:21, Kamil Konieczny wrote:
> Hi Andrzej,
> On 2024-05-28 at 16:04:50 +0200, Andrzej Hajda wrote:
>> Helpers follow convention of xe_sysfs_gt_(path|open).
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_sysfs.h |  3 +++
>>   2 files changed, 74 insertions(+)
>>
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 0c5817eb1580..e11eecc25aa1 100644
>> --- a/lib/igt_sysfs.c
>> +++ b/lib/igt_sysfs.c
>> @@ -40,7 +40,9 @@
>>   #include <dirent.h>
>>   #include <unistd.h>
>>   #include <fcntl.h>
>> +#include <xe_drm.h>
>>   
>> +#include "drmtest.h"
>>   #include "igt_core.h"
>>   #include "igt_sysfs.h"
>>   #include "igt_device.h"
>> @@ -263,6 +265,75 @@ int xe_sysfs_gt_open(int xe_device, int gt)
>>   	return open(path, O_RDONLY);
>>   }
>>   
>> +static const char *engine_class_to_str(__u16 class)
>> +{
>> +	const char *str[] = {
>> +		[DRM_XE_ENGINE_CLASS_RENDER] = "rcs",
>> +		[DRM_XE_ENGINE_CLASS_COPY] = "bcs",
>> +		[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = "vcs",
>> +		[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
>> +		[DRM_XE_ENGINE_CLASS_COMPUTE] = "ccs",
>> +	};
> These looks like intel-specific global helper.

It is just static helper used only by xe_sysfs_engine_path.
Do you want to make it global? If yes, where it should be put?

>
>> +
>> +	if (class < ARRAY_SIZE(str))
>> +		return str[class];
>> +
>> +	return "unk";
>> +}
>> +
>> +/**
>> + * xe_sysfs_engine_path:
>> + * @xe_device: fd of the device
>> + * @gt: gt number
>> + * @class: engine class
>> + * @path: buffer to fill with the sysfs gt path to the device
>> + * @pathlen: length of @path buffer
>> + *
>> + * Returns:
>> + * The directory path, or NULL on failure.
>> + */
>> +char *
>> +xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
>> +{
>> +	struct stat st;
>> +	int tile = IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
>> +
>> +	if (xe_device < 0)
>> +		return NULL;
>> +
>> +	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
>> +		return NULL;
>> +
>> +	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
>> +		 major(st.st_rdev), minor(st.st_rdev), tile, gt, engine_class_to_str(class));
>> +
>> +	if (!access(path, F_OK))
>> +		return path;
>> +
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * xe_sysfs_engine_open:
>> + * @xe_device: fd of the device
>> + * @gt: gt number
>> + * @class: engine class
>> + *
>> + * This opens the sysfs gt directory corresponding to device and tile for use
>> + *
>> + * Returns:
>> + * The directory fd, or -1 on failure.
>> + */
>> +int xe_sysfs_engine_open(int xe_device, int gt, int class)
>> +{
>> +	char path[96];
> ------------- ^^
> Is it enough?

Format string has 50 chars, so I guess yes, it should be enough.

Regards
Andrzej

>
> Regards,
> Kamil
>
>> +
>> +	if (!xe_sysfs_engine_path(xe_device, gt, class, path, sizeof(path)))
>> +		return -1;
>> +
>> +	return open(path, O_RDONLY);
>> +}
>> +
>>   /**
>>    * igt_sysfs_gt_path:
>>    * @device: fd of the device
>> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
>> index f37d80ec130e..6c604d939013 100644
>> --- a/lib/igt_sysfs.h
>> +++ b/lib/igt_sysfs.h
>> @@ -166,4 +166,7 @@ int xe_sysfs_gt_open(int xe_device, int gt);
>>   char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen);
>>   int xe_sysfs_tile_open(int xe_device, int tile);
>>   int xe_sysfs_get_num_tiles(int xe_device);
>> +char *xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen);
>> +int xe_sysfs_engine_open(int xe_device, int gt, int class);
>> +
>>   #endif /* __IGT_SYSFS_H__ */
>>
>> -- 
>> 2.34.1
>>

