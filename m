Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95959E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 14:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5287E10E34E;
	Wed, 18 Dec 2024 14:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A60n2Qpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C5010E34E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734532330; x=1766068330;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZuVYLXKmLn9GiKt5EX3OuR28s4prRBzymjMP1+xpx14=;
 b=A60n2QpnflPbTUmZJbP7BV3ZUfnHvIx3TwHvgTS1YmBT3AjlZUFnsXQY
 d4MFNoPa4zLxX1SGhnc9HrTmyeMY/nDh/A9sTP83Jce/3iEHkhnOCUOBb
 3fiXnJHeGi43y9VYF7pThPxzwJshgQ942AbMIEkezhk9EXc0dH0IVvtw1
 JjdD513uibJyDvvVoSwZsIt7CJK2SF0IqczHiE6HNuBeEwZl7VuyEF/Ne
 Cfe/o2UzhzOyRIBVhK1l/xqBc9HQZDgJucXpUqEjedD9KGv3a3Y8fm75g
 grzEObVXkCwYcG3dJ+UZyy3U9q9HaWbmE5tsBEyeqPl5/d9rD6oU49xyt A==;
X-CSE-ConnectionGUID: FjdLKA2/S8qXXNTHjPSeDg==
X-CSE-MsgGUID: U5pMPdHGSbS2mkNiSvsFiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46426991"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46426991"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:32:10 -0800
X-CSE-ConnectionGUID: M70enT58QJ+8Bkb8Tn2aOA==
X-CSE-MsgGUID: TKlfCT6ER/qaPTEU/QrSdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="102734749"
Received: from sshkruni-mobl2.ger.corp.intel.com (HELO [10.213.202.48])
 ([10.213.202.48])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:32:08 -0800
Message-ID: <34038e2e-b9c0-4a87-be51-6f3619b35ba4@linux.intel.com>
Date: Wed, 18 Dec 2024 15:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>
References: <20241217135659.673564-1-pravalika.gurram@intel.com>
 <55894817-9c88-4e95-b648-72e3f031e10c@linux.intel.com>
 <17f7620a-c797-447a-8eea-f9120e8af98f@linux.intel.com>
 <BL1PR11MB55254606B8D1785DBE18402E84052@BL1PR11MB5525.namprd11.prod.outlook.com>
 <BL1PR11MB55258BBC7DA922DF4D9DCC8C84052@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <BL1PR11MB55258BBC7DA922DF4D9DCC8C84052@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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



On 18.12.2024 12:57, Gurram, Pravalika wrote:
> 
> 
>> -----Original Message-----
>> From: Gurram, Pravalika
>> Sent: Wednesday, December 18, 2024 3:42 PM
>> To: Peter Senna Tschudin <peter.senna@linux.intel.com>; igt-
>> dev@lists.freedesktop.org
>> Subject: RE: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
>> debugfs entries
>>
>>
>>
>>> -----Original Message-----
>>> From: Peter Senna Tschudin <peter.senna@linux.intel.com>
>>> Sent: Wednesday, December 18, 2024 3:07 PM
>>> To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
>>> dev@lists.freedesktop.org
>>> Subject: Re: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to
>>> check few debugfs entries
>>>
>>> Hi Pravalika,
>>>
>>> Two more cents.
>>>
>>> On 18.12.2024 09:56, Peter Senna Tschudin wrote:
>>>> Hi Pravalika,
>>>>
>>>> Please see my comment below.
>>>>
>>>> On 17.12.2024 14:56, Pravalika Gurram wrote:
>>>>> Read and dump  below debugfs entries.
>>>>> ggtt
>>>>> register-save-restore
>>>>> workarounds
>>>>> default_lrc_rcs
>>>>> default_lrc_ccs
>>>>> default_lrc_bcs
>>>>> default_lrc_vcs
>>>>> default_lrc_vecs
>>>>> hwconfig"
>>>>>
>>>>> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
>>>>> ---
>>>>>  tests/intel/xe_debugfs.c | 46
>>>>> ++++++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 46 insertions(+)
>>>>>
>>>>> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
>>>>> index 700575031..bcbb5036a 100644
>>>>> --- a/tests/intel/xe_debugfs.c
>>>>> +++ b/tests/intel/xe_debugfs.c
>>>>> @@ -162,6 +162,16 @@ test_gt(int fd, int gt_id)
>>>>>  		"pat",
>>>>>  		"mocs",
>>>>>  //		"force_reset"
>>>>> +		"ggtt",
>>>>> +		"register-save-restore",
>>>>> +		"workarounds",
>>>>> +		"default_lrc_rcs",
>>>>> +		"default_lrc_ccs",
>>>>> +		"default_lrc_bcs",
>>>>> +		"default_lrc_vcs",
>>>>> +		"default_lrc_vecs",
>>>>> +		"hwconfig"
>>>>> +
>>>
>>> 1. Are we confident that these will always be present? I am asking because
>>>    of the igt_assert() that will abort when an entry is not found.
>>>
>> From kernel code point of view these debugfs need to be created on device
>> boot up
>>
>> static const struct drm_info_list debugfs_list[] = {
>>         {"hw_engines", .show = xe_gt_debugfs_simple_show, .data =
>> hw_engines},
>>         {"force_reset", .show = xe_gt_debugfs_simple_show, .data =
>> force_reset},
>>         {"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data =
>> force_reset_sync},
>>         {"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>>         {"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>         {"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>         {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>>         {"powergate_info", .show = xe_gt_debugfs_simple_show, .data =
>> powergate_info},
>>         {"register-save-restore", .show = xe_gt_debugfs_simple_show, .data =
>> register_save_restore},
>>         {"workarounds", .show = xe_gt_debugfs_simple_show, .data =
>> workarounds},
>>         {"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>>         {"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
>>         {"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data =
>> rcs_default_lrc},
>>         {"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data =
>> ccs_default_lrc},
>>         {"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data =
>> bcs_default_lrc},
>>         {"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data =
>> vcs_default_lrc},
>>         {"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data =
>> vecs_default_lrc},
>>         {"stats", .show = xe_gt_debugfs_simple_show, .data =
>> xe_gt_stats_print_info},
>>         {"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig}, };
>>> 2. Why don't we simply scan for available files instead of hard coding
>>>    expected files?
>>>
>>> Thanks
>> The test scope itself is like we need to check whether hard-coded entries
>> that are created are present or not if not assert.
>> and these changes are to improve the code coverage
>>
>> -- Pravlika
> @Brost, Matthew could you please comment on question asked by peter

The problem is that the version of the kernel determines which files to create
and IGT will always be lagging behind. If code coverage is the main objective,
implementing something similar in C is likely to do the job:

$ cd /sys/kernel/debug/dri/0000:00:02.0/gt0
$ find . -type f -exec cat {} \;

Matt, am I missing something or can we simply scan for files at the right
directories?
