Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C91BE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 15:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C624F10EED2;
	Thu,  5 Dec 2024 15:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SG4F57Nc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166BE10EED2
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733413010; x=1764949010;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u9Pen0OrnQafB0e8IDKKqbPw7BQnZKs+XeuO+1joRWo=;
 b=SG4F57Nc8rLild/crFUpAlbAgI/KRzkmjYsv0LXbN05Jqn0hkiNmbAVs
 X06HGioFp3UVSQNWVic9whztvq1PHuNrLSsmF04pIxRBm6M1+5lJEmnsk
 QxLkT1cCSjFdwGTNBVRIlsVbFbWBFdXrXa1qRpaHCbJ7X5sQQpq6I5n0T
 QljHVBKMnref4o1OOIkHJE3xZfcVzLuohJ2afCkEKC4lLJfhNMpYC/LP9
 6JiiECGIyp9DDWqGmabJXUkr8pOO9EGu20xgI0Xk/qbeQKN6cLc/kaU35
 s9mITfVWY7Ijs3/j3xggXiaNhzcGN3L9scgCzZE5B5xeLiN2Ip0QzE9qh Q==;
X-CSE-ConnectionGUID: 61R3asayTwyJTG7qczItLA==
X-CSE-MsgGUID: gSgB8livQgi9GD32T7w7zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33874578"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33874578"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:36:50 -0800
X-CSE-ConnectionGUID: /EvCnzKmRDWFy2wNYrRvdg==
X-CSE-MsgGUID: orJPkj8nQteoBL/fGwitcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94009803"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.113.95])
 ([10.245.113.95])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:36:48 -0800
Message-ID: <c5a5b11d-4e3c-48c6-b7f0-6643bc19be3b@linux.intel.com>
Date: Thu, 5 Dec 2024 16:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/xe/xe_sriov_debugfs: Add debugfs get/set
 functions for u32, u64, bool
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com
References: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
 <20241127200302.1376594-2-marcin.bernatowicz@linux.intel.com>
 <ea50177f-e2dc-4451-bacc-fe8b62a3ccae@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <ea50177f-e2dc-4451-bacc-fe8b62a3ccae@intel.com>
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



On 12/2/2024 2:03 PM, Laguna, Lukasz wrote:
> On 11/27/2024 21:02, Marcin Bernatowicz wrote:
>> Add helper functions to get and set SR-IOV debugfs attributes for u32,
>> u64, and boolean types.
>>
>> Functions added:
>> - __xe_sriov_pf_debugfs_get_u32
>> - __xe_sriov_pf_debugfs_set_u32
>> - __xe_sriov_pf_debugfs_get_u64
>> - __xe_sriov_pf_debugfs_set_u64
>> - __xe_sriov_pf_debugfs_get_boolean
>> - __xe_sriov_pf_debugfs_set_boolean
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Narasimha C V <narasimha.c.v@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   lib/xe/xe_sriov_debugfs.c | 194 ++++++++++++++++++++++++++++++++++++++
>>   lib/xe/xe_sriov_debugfs.h |  18 ++++
>>   2 files changed, 212 insertions(+)
>>
>> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
>> index c87f91492..038912f23 100644
>> --- a/lib/xe/xe_sriov_debugfs.c
>> +++ b/lib/xe/xe_sriov_debugfs.c
>> @@ -9,6 +9,7 @@
>>   #include "drmtest.h"
>>   #include "igt_debugfs.h"
>>   #include "igt_sriov_device.h"
>> +#include "igt_sysfs.h"
>>   #include "xe/xe_query.h"
>>   #include "xe/xe_sriov_debugfs.h"
>>   #include "xe/xe_sriov_provisioning.h"
>> @@ -204,3 +205,196 @@ cleanup:
>>       return ret;
>>   }
>> +
>> +static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
>> +                     unsigned int gt_num)
>> +{
>> +    char path[PATH_MAX];
>> +
>> +    if (igt_debug_on_f(!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, 
>> path,
>> +                             sizeof(path)),
>> +               "path: %s\n", path))
>> +        return -1;
>> +
>> +    return open(path, O_RDONLY);
> 
> O_RDWR?

It's a directory so O_RDONLY should be sufficient.

> 
>> +}
>> +
>> +/**
>> + * __xe_sriov_pf_debugfs_get_u32:
>> + * @pf: PF device file descriptor
>> + * @vf_num: VF number (1-based) or 0 for PF
>> + * @gt_num: GT number
>> + * @attr: debugfs attribute name
>> + * @value: pointer to read value
>> + *
>> + * Reads SR-IOV debugfs attribute @attr for given PF device @pf,
>> + * VF number @vf_num on GT @gt_num.
>> + *
>> + * Return: 0 on success and negative error on failure.
>> + */
>> +int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
>> +                  unsigned int gt_num, const char *attr,
>> +                  uint32_t *value)
>> +{
>> +    bool ret;
>> +    int dir;
>> +
>> +    dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
>> +    if (igt_debug_on(dir < 0))
>> +        return false;
> 
> return dir;

Good catch! Since most of these functions share the same structure, I'll 
introduce a macro to eliminate redundancy and reduce the risk of errors.

Thanks,
marcin

> 
>> +
>> +    ret = __igt_sysfs_get_u32(dir, attr, value);
>> +    close(dir);
>> +
>> +    return ret ? 0 : -1;
>> +}
>> +
>> +/**
>> + * __xe_sriov_pf_debugfs_set_u32:
>> + * @pf: PF device file descriptor
>> + * @vf_num: VF number (1-based) or 0 for PF
>> + * @gt_num: GT number
>> + * @attr: debugfs attribute name
>> + * @value: u32 value to be set
>> + *
>> + * Writes @value to SR-IOV debugfs attribute @attr for given PF 
>> device @pf,
>> + * VF number @vf_num on GT @gt_num.
>> + *
>> + * Return: 0 on success and negative error on failure.
>> + */
>> +int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
>> +                  unsigned int gt_num, const char *attr,
>> +                  uint32_t value)
>> +{
>> +    bool ret;
>> +    int dir;
>> +
>> +    dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
>> +    if (igt_debug_on(dir < 0))
>> +        return dir;
>> +
>> +    ret = __igt_sysfs_set_u32(dir, attr, value);
>> +    close(dir);
>> +
>> +    return ret ? 0 : -1;
>> +}
>> +
>> +/**
>> + * __xe_sriov_pf_debugfs_get_u64:
>> + * @pf: PF device file descriptor
>> + * @vf_num: VF number (1-based) or 0 for PF
>> + * @gt_num: GT number
>> + * @attr: debugfs attribute name
>> + * @value: pointer to read value
>> + *
>> + * Reads SR-IOV debugfs attribute @attr for given PF device @pf,
>> + * VF number @vf_num on GT @gt_num.
>> + *
>> + * Return: 0 on success and negative error on failure.
>> + */
>> +int __xe_sriov_pf_debugfs_get_u64(int pf, unsigned int vf_num,
>> +                  unsigned int gt_num, const char *attr,
>> +                  uint64_t *value)
>> +{
>> +    bool ret;
>> +    int dir;
>> +
>> +    dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
>> +    if (igt_debug_on(dir < 0))
>> +        return dir;
>> +
>> +    ret = __igt_sysfs_get_u64(dir, attr, value);
>> +    close(dir);
>> +
>> +    return ret ? 0 : -1;
>> +}
>> +
>> +/**
>> + * __xe_sriov_pf_debugfs_set_u64:
>> + * @pf: PF device file descriptor
>> + * @vf_num: VF number (1-based) or 0 for PF
>> + * @gt_num: GT number
>> + * @attr: debugfs attribute name
>> + * @value: u64 value to be set
>> + *
>> + * Writes @value to SR-IOV debugfs attribute @attr for given PF 
>> device @pf,
>> + * VF number @vf_num on GT @gt_num.
>> + *
>> + * Return: 0 on success and negative error on failure.
>> + */
>> +int __xe_sriov_pf_debugfs_set_u64(int pf, unsigned int vf_num,
>> +                  unsigned int gt_num, const char *attr,
>> +                  uint64_t value)
>> +{
>> +    bool ret;
>> +    int dir;
>> +
>> +    dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
>> +    if (igt_debug_on(dir < 0))
>> +        return dir;
>> +
>> +    ret = __igt_sysfs_set_u64(dir, attr, value);
>> +    close(dir);
>> +
>> +    return ret ? 0 : -1;
>> +}
>> +
>> +/**
>> + * __xe_sriov_pf_debugfs_get_boolean:
>> + * @pf: PF device file descriptor
>> + * @vf_num: VF number (1-based) or 0 for PF
>> + * @gt_num: GT number
>> + * @attr: debugfs attribute name
>> + * @value: pointer to read value
>> + *
>> + * Reads SR-IOV debugfs attribute @attr for given PF device @pf,
>> + * VF number @vf_num on GT @gt_num.
>> + *
>> + * Return: 0 on success and negative error on failure.
>> + */
>> +int __xe_sriov_pf_debugfs_get_boolean(int pf, unsigned int vf_num,
>> +                      unsigned int gt_num, const char *attr,
>> +                      bool *value)
>> +{
>> +    bool ret;
>> +    int dir;
>> +
>> +    dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
>> +    if (igt_debug_on(dir < 0))
>> +        return dir;
>> +
>> +    ret = __igt_sysfs_get_boolean(dir, attr, value);
>> +    close(dir);
>> +
>> +    return ret ? 0 : -1;
>> +}
>> +
>> +/**
>> + * __xe_sriov_pf_debugfs_set_boolean:
>> + * @pf: PF device file descriptor
>> + * @vf_num: VF number (1-based) or 0 for PF
>> + * @gt_num: GT number
>> + * @attr: debugfs attribute name
>> + * @value: u64 value to be set
>> + *
>> + * Writes @value to SR-IOV debugfs attribute @attr for given PF 
>> device @pf,
>> + * VF number @vf_num on GT @gt_num.
>> + *
>> + * Return: 0 on success and negative error on failure.
>> + */
>> +int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
>> +                      unsigned int gt_num, const char *attr,
>> +                      bool value)
>> +{
>> +    bool ret;
>> +    int dir;
>> +
>> +    dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
>> +    if (igt_debug_on(dir < 0))
>> +        return dir;
>> +
>> +    ret = __igt_sysfs_set_boolean(dir, attr, value);
>> +    close(dir);
>> +
>> +    return ret ? 0 : -1;
>> +}
>> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
>> index 856445e76..2db965f9b 100644
>> --- a/lib/xe/xe_sriov_debugfs.h
>> +++ b/lib/xe/xe_sriov_debugfs.h
>> @@ -16,5 +16,23 @@ int xe_sriov_pf_debugfs_read_provisioned_ranges(int 
>> pf_fd, enum xe_sriov_shared_
>>                           unsigned int gt_id,
>>                           struct xe_sriov_provisioned_range **ranges,
>>                           unsigned int *nr_ranges);
>> +int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
>> +                  unsigned int gt_num, const char *attr,
>> +                  uint32_t *value);
>> +int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
>> +                  unsigned int gt_num, const char *attr,
>> +                  uint32_t value);
>> +int __xe_sriov_pf_debugfs_get_u64(int pf, unsigned int vf_num,
>> +                  unsigned int gt_num, const char *attr,
>> +                  uint64_t *value);
>> +int __xe_sriov_pf_debugfs_set_u64(int pf, unsigned int vf_num,
>> +                  unsigned int gt_num, const char *attr,
>> +                  uint64_t value);
>> +int __xe_sriov_pf_debugfs_get_boolean(int pf, unsigned int vf_num,
>> +                      unsigned int gt_num, const char *attr,
>> +                      bool *value);
>> +int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
>> +                      unsigned int gt_num, const char *attr,
>> +                      bool value);
>>   #endif /* __XE_SRIOV_DEBUGFS_H__ */

