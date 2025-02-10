Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1143CC02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 10:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1010E4F4;
	Mon, 10 Feb 2025 10:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSfSDIMQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CBE10E4F4
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 10:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739184242; x=1770720242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZOUs34ihDb7Z+ccEMRWKlX2WYQYPgMbpLTkXBAv/AW8=;
 b=QSfSDIMQX2PsskLvL1pcww7DvKuGGMn84IjEKxKx1qXcG/gokqBoxmIy
 v+9kSIrMySKo0viGgjAyzu2Yb1GYYiEs62Z4wEbIA+xouQIy/OypY1nxi
 dK6okXVrlM2meRDlZw5Ac/OEkVT3+kBMkiT707QtYxvIDfQ7fnvCGdmik
 X0IEZSw/wtbbEtXUVQEZNnGP/PM+pqInm3q3rBakj7wKnz2aZfV5212N1
 XfcDvP1N/q9GuM9f5Cbwav3IJFB11xC18rOvLIZLtqGcYDQ+iJQee9TBZ
 knc2qGH8KCv1nmADoyIkmmaBINGGGOgCUuUgIhpvaiCASH8gwX7L5bG9b Q==;
X-CSE-ConnectionGUID: I3MzsiefT/W8R4dNjCHDrA==
X-CSE-MsgGUID: iMUpcVaHRfeP6ngR/uo6JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39909236"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="39909236"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 02:44:01 -0800
X-CSE-ConnectionGUID: Ma4e0EkKQaqdLVFsdY79dg==
X-CSE-MsgGUID: JVhjrBwrTpuaoYGc3SG6lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="117169490"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.99.135])
 ([10.245.99.135])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 02:43:59 -0800
Message-ID: <9162314f-efd8-4180-ab29-5ca2c5f15704@linux.intel.com>
Date: Mon, 10 Feb 2025 11:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] lib/xe/xe_sriov_debugfs: Add helper to read
 VF's configuration data
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
References: <20250207094031.15942-1-lukasz.laguna@intel.com>
 <20250207094031.15942-2-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250207094031.15942-2-lukasz.laguna@intel.com>
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



On 2/7/2025 10:40 AM, Lukasz Laguna wrote:
> Add helper allowing to read configuration data that VF queried from GuC
> during probe.
> 
> v2:
>   - remove redundant fd closing (Marcin)
>   - move helper to xe_sriov_debugfs lib (Marcin)
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   lib/xe/xe_sriov_debugfs.c | 78 +++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_debugfs.h |  5 +++
>   2 files changed, 83 insertions(+)
> 
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index abb1bf7d5..fb8a7c3e3 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -471,3 +471,81 @@ DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool *, get_boolean, __igt_sysfs_get_boolean)
>    * Return: 0 on success, negative error code on failure.
>    */
>   DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool, set_boolean, __igt_sysfs_set_boolean)
> +
> +

CHECK:LINE_SPACING: Please don't use multiple blank lines


> +/**
> + * __xe_sriov_vf_debugfs_get_selfconfig - Read VF's configuration data.
> + * @vf: VF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @gt_num: GT number
> + * @value: Pointer to store the read value
> + *
> + * Reads the specified shared resource @res from selfconfig of given VF device
> + * @vf on GT @gt_num.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
> +					    unsigned int gt_num, uint64_t *value)

CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

> +{
> +	FILE *file;
> +	size_t n = 0;
> +	char *line = NULL;
> +	int fd, ret = 0;
> +
> +	fd = igt_debugfs_gt_open(vf, gt_num, "vf/self_config", O_RDONLY);
> +	if (fd < 0)
> +		return fd;
> +	file = fdopen(fd, "r");
> +	if (!file) {
> +		close(fd);
> +		return -errno;
> +	}
> +
> +	while (getline(&line, &n, file) >= 0) {
> +		switch (res) {
> +		case XE_SRIOV_SHARED_RES_CONTEXTS:
> +			ret = sscanf(line, "GuC contexts: %lu", value);
> +			break;
> +		case XE_SRIOV_SHARED_RES_DOORBELLS:
> +			ret = sscanf(line, "GuC doorbells: %lu", value);
> +			break;
> +		case XE_SRIOV_SHARED_RES_GGTT:
> +			ret = sscanf(line, "GGTT size: %lu", value);
> +			break;
> +		case XE_SRIOV_SHARED_RES_LMEM:
> +			ret = sscanf(line, "LMEM size: %lu", value);
> +			break;
> +		}
> +
> +		if (ret > 0)
> +			break;
> +	}
> +
> +	free(line);
> +	fclose(file);
> +
> +	return ret ? 0 : -1;
> +}
> +/**

CHECK:LINE_SPACING: Please use a blank line after 
function/struct/union/enum declarations

> + * xe_sriov_vf_debugfs_get_selfconfig - Read VF's configuration data.
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_vf_debugfs_get_selfconfig().
> + * Instead of returning an error code, it returns the quota value and asserts
> + * in case of an error.
> + *
> + * Return: The quota for the given shared resource.
> + *         Asserts in case of failure.
> + */
> +uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
> +					       unsigned int gt_num)

CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

> +{
> +	uint64_t value;
> +
> +	igt_fail_on(__xe_sriov_vf_debugfs_get_selfconfig(vf, res, gt_num, &value));
> +
> +	return value;
> +}
> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
> index cd5f932be..4983afbb3 100644
> --- a/lib/xe/xe_sriov_debugfs.h
> +++ b/lib/xe/xe_sriov_debugfs.h
> @@ -39,4 +39,9 @@ int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
>   				      unsigned int gt_num, const char *attr,
>   				      bool value);
>   
> +int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
> +					 unsigned int gt_num, uint64_t *value);
> +uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
> +					    unsigned int gt_num);
> +
>   #endif /* __XE_SRIOV_DEBUGFS_H__ */

