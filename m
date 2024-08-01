Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C945FC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 09:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EA410E8C7;
	Thu,  1 Aug 2024 09:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DehjkD5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4D810E8C7
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722503443; x=1754039443;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=oDWJn9I8ELQqKeTuD08+wN+4IkO/cpxq0j/JWh1PU/0=;
 b=DehjkD5ZI/uytQYXlQ596cdeaJLBtn4MTF74W7V+0jQUqrGZHuFXLhzY
 zLAbbGlpwQFHTQhOszrT1EfxAFh7ZyRvv0IBZIcXjh4sJkQvUL528+Mk3
 rb8DOfjU4Jg7sQdYMV8cgjekrYUJ0s++wlvQnjAgC4vCMUIDS7+66uVqe
 2mPGCbPHMASKW942K72V4ir5nD2HGO7SzPIWniTnwrb6BHKCA8yUt/P1A
 fpfhnlCMiaRyX2Qd0VsnlgG852G3RT10Zoh/KHo2+jpxTs+SbIQYYM/fU
 0AAjhQVrud/uaXGwwfpHTOLBjQANJZ7xlHVs+n8inaRzXKT6K9yac8uFZ w==;
X-CSE-ConnectionGUID: gPnOOGwJQMqe6sVEdJwMGg==
X-CSE-MsgGUID: eLI2VkTXQZGm5HJOyEYEhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31094178"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31094178"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:10:42 -0700
X-CSE-ConnectionGUID: kyM/7kHCQWaLtOVZzIEpxA==
X-CSE-MsgGUID: abDh6wJhQJqFoha20URTiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="92506396"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.96.225])
 ([10.245.96.225])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:10:41 -0700
Message-ID: <705dabb2-0af8-47c3-9ded-4dbdc88b90e9@linux.intel.com>
Date: Thu, 1 Aug 2024 11:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_sysfs: Add xe_sysfs_gt_has_attr to
 check attribute existence
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
 <20240730164232.286232-2-marcin.bernatowicz@linux.intel.com>
 <20240731180018.ajp3jvnznvyo7c5g@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240731180018.ajp3jvnznvyo7c5g@kamilkon-DESK.igk.intel.com>
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



On 7/31/2024 8:00 PM, Kamil Konieczny wrote:
> Hi Marcin,
> On 2024-07-30 at 18:42:30 +0200, Marcin Bernatowicz wrote:
>> Introduce xe_sysfs_gt_has_attr to verify if a specified attribute
>> exists within the sysfs gt directory of a device.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   lib/igt_sysfs.c | 25 +++++++++++++++++++++++++
>>   lib/igt_sysfs.h |  1 +
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 550472d81..bcfd9fad1 100644
>> --- a/lib/igt_sysfs.c
>> +++ b/lib/igt_sysfs.c
>> @@ -265,6 +265,31 @@ int xe_sysfs_gt_open(int xe_device, int gt)
>>   	return open(path, O_RDONLY);
>>   }
>>   
>> +/**
>> + * xe_sysfs_gt_has_attr:
>> + * @xe_device: fd of the device
>> + * @gt: gt number
>> + * @attr: attr inside sysfs gt dir that needs to be checked for existence
>> + *
>> + * This checks if specified attr exists in device sysfs gt directory.
>> + *
>> + * Returns:
>> + * true if attr exists in sysfs, false otherwise.
>> + */
>> +bool xe_sysfs_gt_has_attr(int xe_device, int gt, const char *attr)
>> +{
>> +	bool has_attr;
>> +	int gt_fd;
>> +
>> +	gt_fd = xe_sysfs_gt_open(xe_device, gt);
>> +	if (gt_fd < 0)
>> +		return false;
>> +
>> +	has_attr = igt_sysfs_has_attr(gt_fd, attr);
> 
> Did you check that this will not assert on some unexpected
> boundary conditions?

igt_sysfs_has_attr does not assert

> 
>> +	close(gt_fd);
> 
> Add newline before return here, with this:

Ok
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
>> +	return has_attr;
>> +}
>> +
>>   static const char *xe_engine_class_to_str(__u16 class)
>>   {
>>   	static const char * const str[] = {
>> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
>> index 5d050c786..b0288fe36 100644
>> --- a/lib/igt_sysfs.h
>> +++ b/lib/igt_sysfs.h
>> @@ -168,6 +168,7 @@ void igt_sysfs_engines(int xe, int engines, const char **property,
>>   
>>   char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen);
>>   int xe_sysfs_gt_open(int xe_device, int gt);
>> +bool xe_sysfs_gt_has_attr(int xe_device, int gt, const char *attr);
>>   char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen);
>>   int xe_sysfs_tile_open(int xe_device, int tile);
>>   int xe_sysfs_get_num_tiles(int xe_device);
>> -- 
>> 2.31.1
>>
