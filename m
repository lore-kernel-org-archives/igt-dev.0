Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905C7C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 10:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544C810E4EF;
	Mon, 10 Feb 2025 10:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfgyKlwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4E310E4EF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739185046; x=1770721046;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=ccQzN86ptcKZa0MkJ9Khl/lpu+U6gFJXELFjr35WDio=;
 b=WfgyKlwTXdHAiyCpqxQp29fqpyBYd48z4jmL4atY64Edu/FPVZsF3PN6
 nkbtezgSKD85P6NOcEaXaxRNf6sfmgZxhCHO+nQgq9yxpuetN02e/bzPA
 nDSz+UewsYxWYlJtkxflF6LKRXSJR1JhXr47se1m/r1Xa+RRl/HqxVtR7
 IHDbV9tn1YpqTd71GGHvD4Wqwojn2xkAKoF1CrCD99xZ0y7vy2vkoRDE1
 6m58KHMp57ZmXd09jscJPLBM3z3MQIV8KfYLDHlrFsxy2xej2MfXYwK+2
 e9GZAyqEw2lYNU9ThA8LNSS+nTnTWG8D3zrJlYs7kqeQZ37Vtws01fM13 g==;
X-CSE-ConnectionGUID: hsI4OK5BTOqr7HQFxjE+9Q==
X-CSE-MsgGUID: REzC+Bs3R2OsJ3xKI+2FKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39910488"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="39910488"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 02:57:25 -0800
X-CSE-ConnectionGUID: t3eB+RhkSGGSjo0yPzknqA==
X-CSE-MsgGUID: xyWotfTvQzWSCMFh8x4xhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149345994"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.99.135])
 ([10.245.99.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 02:57:24 -0800
Message-ID: <14a69a85-8068-4d29-938d-30467efc6ea7@linux.intel.com>
Date: Mon, 10 Feb 2025 11:57:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] lib/xe/xe_sriov_debugfs: Add helper to read
 VF's configuration data
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
References: <20250207094031.15942-1-lukasz.laguna@intel.com>
 <20250207094031.15942-2-lukasz.laguna@intel.com>
 <9162314f-efd8-4180-ab29-5ca2c5f15704@linux.intel.com>
Content-Language: en-US
In-Reply-To: <9162314f-efd8-4180-ab29-5ca2c5f15704@linux.intel.com>
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



On 2/10/2025 11:43 AM, Bernatowicz, Marcin wrote:
> 
> 
> On 2/7/2025 10:40 AM, Lukasz Laguna wrote:
>> Add helper allowing to read configuration data that VF queried from GuC
>> during probe.
>>
>> v2:
>>   - remove redundant fd closing (Marcin)
>>   - move helper to xe_sriov_debugfs lib (Marcin)
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> ---
>>   lib/xe/xe_sriov_debugfs.c | 78 +++++++++++++++++++++++++++++++++++++++
>>   lib/xe/xe_sriov_debugfs.h |  5 +++
>>   2 files changed, 83 insertions(+)
>>
>> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
>> index abb1bf7d5..fb8a7c3e3 100644
>> --- a/lib/xe/xe_sriov_debugfs.c
>> +++ b/lib/xe/xe_sriov_debugfs.c
>> @@ -471,3 +471,81 @@ DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool *, 
>> get_boolean, __igt_sysfs_get_boolean)
>>    * Return: 0 on success, negative error code on failure.
>>    */
>>   DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool, set_boolean, 
>> __igt_sysfs_set_boolean)
>> +
>> +
> 
> CHECK:LINE_SPACING: Please don't use multiple blank lines
> 
> 
>> +/**
>> + * __xe_sriov_vf_debugfs_get_selfconfig - Read VF's configuration data.
>> + * @vf: VF device file descriptor
>> + * @res: Shared resource type (see enum xe_sriov_shared_res)
>> + * @gt_num: GT number
>> + * @value: Pointer to store the read value
>> + *
>> + * Reads the specified shared resource @res from selfconfig of given 
>> VF device
>> + * @vf on GT @gt_num.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum 
>> xe_sriov_shared_res res,
>> +                        unsigned int gt_num, uint64_t *value)
> 
> CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
> 
>> +{
>> +    FILE *file;
>> +    size_t n = 0;
>> +    char *line = NULL;
>> +    int fd, ret = 0;
>> +
>> +    fd = igt_debugfs_gt_open(vf, gt_num, "vf/self_config", O_RDONLY);
>> +    if (fd < 0)
>> +        return fd;
>> +    file = fdopen(fd, "r");
>> +    if (!file) {
>> +        close(fd);
>> +        return -errno;
>> +    }
>> +
>> +    while (getline(&line, &n, file) >= 0) {
>> +        switch (res) {
>> +        case XE_SRIOV_SHARED_RES_CONTEXTS:
>> +            ret = sscanf(line, "GuC contexts: %lu", value);
>> +            break;
>> +        case XE_SRIOV_SHARED_RES_DOORBELLS:
>> +            ret = sscanf(line, "GuC doorbells: %lu", value);
>> +            break;
>> +        case XE_SRIOV_SHARED_RES_GGTT:
>> +            ret = sscanf(line, "GGTT size: %lu", value);
>> +            break;
>> +        case XE_SRIOV_SHARED_RES_LMEM:
>> +            ret = sscanf(line, "LMEM size: %lu", value);
>> +            break;
>> +        }
>> +
>> +        if (ret > 0)
>> +            break;
>> +    }
>> +
>> +    free(line);
>> +    fclose(file);
>> +
>> +    return ret ? 0 : -1;
>> +}
>> +/**
> 
> CHECK:LINE_SPACING: Please use a blank line after function/struct/union/ 
> enum declarations
> 
>> + * xe_sriov_vf_debugfs_get_selfconfig - Read VF's configuration data.
>> + * @pf: PF device file descriptor
>> + * @res: Shared resource type (see enum xe_sriov_shared_res)
>> + * @gt_num: GT number
>> + *
>> + * A throwing version of __xe_sriov_vf_debugfs_get_selfconfig().
>> + * Instead of returning an error code, it returns the quota value and 
>> asserts
>> + * in case of an error.
>> + *
>> + * Return: The quota for the given shared resource.
>> + *         Asserts in case of failure.
>> + */
>> +uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum 
>> xe_sriov_shared_res res,
>> +                           unsigned int gt_num)
> 
> CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
>

LGTM, with some style corrections.
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>


>> +{
>> +    uint64_t value;
>> +
>> +    igt_fail_on(__xe_sriov_vf_debugfs_get_selfconfig(vf, res, gt_num, 
>> &value));
>> +
>> +    return value;
>> +}
>> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
>> index cd5f932be..4983afbb3 100644
>> --- a/lib/xe/xe_sriov_debugfs.h
>> +++ b/lib/xe/xe_sriov_debugfs.h
>> @@ -39,4 +39,9 @@ int __xe_sriov_pf_debugfs_set_boolean(int pf, 
>> unsigned int vf_num,
>>                         unsigned int gt_num, const char *attr,
>>                         bool value);
>> +int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum 
>> xe_sriov_shared_res res,
>> +                     unsigned int gt_num, uint64_t *value);
>> +uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum 
>> xe_sriov_shared_res res,
>> +                        unsigned int gt_num);
>> +
>>   #endif /* __XE_SRIOV_DEBUGFS_H__ */
> 

