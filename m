Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CB7C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4288410EA59;
	Thu, 27 Jun 2024 07:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gud/s2rV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F407410EA59
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719473965; x=1751009965;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gviC+QBas7A64DzvRgKGdRRG2niQULXeSHtDgqVZ3XU=;
 b=gud/s2rVnddD6cYqai45WcxdNx4NRkG68n9yP+vAafZ56JlIKwO0Fu6J
 0QaW/9IgiuAnt0Xi9THK3LKySbcM0y0XV8pjg60XJt76V5A9f3tG2aD5M
 ZjwOc9EXTQpT2DGBFYmPQLQGsXhDXetNlKWxK0ZYjvOCKHVZ6BIHJbRGz
 nbZmG0p71jmzHh4YbjFyeGJga6zjmG+kSsF+KBnQThdynXUYsI7YqxIov
 nr6/vzxJ82PpTScKyQ7/L+e9nNMsRCmoOdAPVVcoxjPd5K3bS8HZ6g5N2
 /GdOvje3wEcoseonSiFrb0An2nckMuD6+X6//iBdAgnZG1PZDnFg/jAvK Q==;
X-CSE-ConnectionGUID: mKkkoxizQiyUXv99wSd13g==
X-CSE-MsgGUID: 5e2bHYFcSdqntj4tfPQzNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16418636"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16418636"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:39:24 -0700
X-CSE-ConnectionGUID: KPfP6MBfSyalzLayM5CReA==
X-CSE-MsgGUID: +NEOWYopRka+oxVfX97ERg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44351911"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.80.70])
 ([10.245.80.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:39:23 -0700
Message-ID: <d475b754-cab5-4999-9bc2-4db56532e64d@intel.com>
Date: Thu, 27 Jun 2024 09:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] lib/igt_sysfs: add helpers to access engine sysfs
 directory
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
 <20240612-iga64_inline_ups-v7-4-0d4b840498c7@intel.com>
 <20240617140454.yr5oio6wdru4zrsb@zkempczy-mobl2>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240617140454.yr5oio6wdru4zrsb@zkempczy-mobl2>
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



On 17.06.2024 16:04, Zbigniew Kempczyński wrote:
> On Wed, Jun 12, 2024 at 11:39:02AM +0200, Andrzej Hajda wrote:
>> Helpers follow convention of xe_sysfs_gt_(path|open).
>>
>> v7:
>>    - staticize local const array
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_sysfs.h |  3 +++
>>   2 files changed, 74 insertions(+)
>>
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 0c5817eb1580..90b923a99a26 100644
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
>> +	static const char * const str[] = {
>> +		[DRM_XE_ENGINE_CLASS_RENDER] = "rcs",
>> +		[DRM_XE_ENGINE_CLASS_COPY] = "bcs",
>> +		[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = "vcs",
>> +		[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
>> +		[DRM_XE_ENGINE_CLASS_COMPUTE] = "ccs",
>> +	};
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
> Why tile is hardcoded here? I think it should be passed as an argument
> if you're providing gt and class as arguments.

Apparently I forgot to address the comment, forgive me :)
Back to the subject, I have just copied/simplified/pasted current 
practice in igt, see xe_sysfs_gt_path.
I have just assumed that with currently supported cards it is enough to 
deduce tile from gt and platform,
no need to complicate things, till it become necessary.

Regards
Andrzej

>
> --
> Zbigniew
>
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

