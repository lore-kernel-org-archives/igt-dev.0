Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45639C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 13:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF9510EAF5;
	Fri, 17 Jan 2025 13:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHw+AvjA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5662D10EB02
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 13:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737119937; x=1768655937;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=MRUq0jXdnPOn7IYDRH1VUEMHgRbR8jTNF2WxF00fVR0=;
 b=MHw+AvjAOdL0TqaBgd+MW3DVaowNLsBnt2lBJSB6ByXAwlQPnJH+QvNA
 /RP5+ejVFOjBeikwJEqhoCH7YlTNIJ1Q3o//6ipe1U4x4PxM0D0fDLl0j
 L/TZqhQNK6gpV1dWga1LYzKPDXy7ZlOwn81EkXbCxfV2T6AK9ytOgkMMn
 uBowQ7WwnNmd12pHXCDBfuZnsQq0cKyqdJMXP9/qE4rGG8W3OWWOShXQa
 HX/iPqb6mJgd/teMQmSEQrTcmJAkj0CqHwnzeTLWzf7eW+R+qJVBr3tpV
 EKLNGNf99flSpppvHuXanzO79pLLPfGQ1Xk9CZmAtzX6m9Yio+s3YPJ3X g==;
X-CSE-ConnectionGUID: Mh6EGFy8Qluo64Ij7nYhBQ==
X-CSE-MsgGUID: 5EF91PPwQ/Sl+uspK3bo1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36829358"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="36829358"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 05:18:57 -0800
X-CSE-ConnectionGUID: YdCiiKWaTP+835udt36GQg==
X-CSE-MsgGUID: m10q+/4PQzihAn5KobzHnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129063268"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.214])
 ([10.245.246.214])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 05:18:56 -0800
Message-ID: <2208c434-10f1-4fb3-ba89-1f7bcfd8d03a@intel.com>
Date: Fri, 17 Jan 2025 14:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_util: introduce helper for enabling
 ccs mode
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
References: <20241216131137.50945-1-dominik.grzegorzek@intel.com>
 <e2c35d58-f033-45a9-8d95-1c90ed60d0e7@intel.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <e2c35d58-f033-45a9-8d95-1c90ed60d0e7@intel.com>
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

On 17.01.2025 14:07, Manszewski, Christoph wrote:
> Hi Dominik,
> 
> On 16.12.2024 14:11, Dominik Grzegorzek wrote:
>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>>
>> Multiple tests will require enabled ccs mode. Add special helper to
>> avoid code duplication.
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/xe/xe_util.c | 31 +++++++++++++++++++++++++++++++
>>   lib/xe/xe_util.h |  1 +
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
>> index 9482819c2..f7ae19f08 100644
>> --- a/lib/xe/xe_util.c
>> +++ b/lib/xe/xe_util.c
>> @@ -302,3 +302,34 @@ int xe_gt_count_engines_by_class(int fd, int gt, 
>> int class)
>>       return n;
>>   }
>> +
>> +/**
>> + * xe_sysfs_enable_ccs_mode:
>> + * @fd: pointer to xe drm fd, can reopened multiple times
>> + *
>> + * Enables ccs_mode on all GTs, it must succeed for at least one GT.
>> + * Since function requires the driver to be closed during ccs_mode 
>> change
>> + * @fd will be closed then re-opened.
>> + */
>> +void xe_sysfs_enable_ccs_mode(int *fd)
>> +{
>> +    int gt, gt_fd, num_slices, ccs_mode, num_gt, enabled_count = 0;
>> +
>> +    num_gt = xe_number_gt(*fd);
>> +
>> +    for (gt = 0; gt < num_gt; gt++) {
>> +        gt_fd = xe_sysfs_gt_open(*fd, gt);
>> +        drm_close_driver(*fd);
> 
> Why not outside the loop?

Nevermind

> 
> Thanks,
> Christoph
> 
>> +
>> +        if (!igt_debug_on(igt_sysfs_scanf(gt_fd, "num_cslices", "%u", 
>> &num_slices) <= 0) &&
>> +            !igt_debug_on(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 
>> num_slices) <= 0) &&
>> +            !igt_debug_on(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", 
>> &ccs_mode) <= 0) &&
>> +            !igt_debug_on(num_slices != ccs_mode))
>> +            enabled_count++;
>> +        close(gt_fd);
>> +        *fd = drm_open_driver(DRIVER_XE);
>> +    }
>> +
>> +    if (!enabled_count)
>> +        igt_require_f(0, "Cannot enable ccs mode for any GT\n");

Unless I am missing something (again):
igt_require_f(enabled_count, "Cannot enable ccs mode for any GT\n")?

Reviewed-by: Chritoph Manszewski <christoph.manszewski@intel.com>

>> +}
>> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
>> index b9fbfc5cd..a82c44a2a 100644
>> --- a/lib/xe/xe_util.h
>> +++ b/lib/xe/xe_util.h
>> @@ -53,5 +53,6 @@ int xe_gt_fill_engines_by_class(int fd, int gt, int 
>> class,
>>                   struct drm_xe_engine_class_instance eci[static 
>> XE_MAX_ENGINE_INSTANCE]);
>>   int xe_gt_count_engines_by_class(int fd, int gt, int class);
>> +void xe_sysfs_enable_ccs_mode(int *fd);
>>   #endif /* XE_UTIL_H */
