Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A0AD12690
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 11:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C2410E013;
	Tue,  5 Nov 2024 11:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2HvbUMt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402EA10E013
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 11:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730806798; x=1762342798;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G2I44ydNf3kzZ2XbeANANvU9XcwjB91PYFgFuXtk2fo=;
 b=N2HvbUMt10C2vLdEygD8lYp+mIz1/ldIUAyo+RZsh/mTpGqF7b/vKokg
 x1/YLEABAE73DV3NYW7TPspLrGtIcbIXtDlCFXpiSr+hCR99FarYIhFLG
 5dBjFm5w5Ntp+xMRJwy9BdOUHNZ1+aQcTgDUNFR8VR6UY3yRXHLCOpwQN
 w2+XWfPjaBTyj7KNkB550+3JbiestpYv4eyx8eQWwLOLz6q/azyKmFluR
 0hCyfn4TkPKOpO8bY/pfTnYQNG9fg+78G3ofOXilcgi8SjkPAblsS7YCZ
 Nw2EkJ0wceS5hj2mSBLSzcgtG4OPbuXmWv5+QanNWbejruWLhe8tjekYa Q==;
X-CSE-ConnectionGUID: Igzbgux/Sq66rqWTT+35Sw==
X-CSE-MsgGUID: hDGUygONS9WvJLqwtTtYBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41095382"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41095382"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 03:39:58 -0800
X-CSE-ConnectionGUID: uJ65EgEJQXSQ2BGfxI+6Dg==
X-CSE-MsgGUID: oQBU1s77RpCnQcrNjFe1QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88761687"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.245.112.13])
 ([10.245.112.13])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 03:39:54 -0800
Message-ID: <5b26294b-d305-4424-af70-49e39ab96782@linux.intel.com>
Date: Tue, 5 Nov 2024 12:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] lib/xe/xe_sriov_debugfs: Add function to read
 provisioned ranges
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com
References: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
 <20241030193629.1238637-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20241030193629.1238637-4-marcin.bernatowicz@linux.intel.com>
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

On 30.10.2024 20:36, Marcin Bernatowicz wrote:
> Implement xe_sriov_pf_debugfs_read_provisioned_ranges() to read and
> parse VFs provisioned ranges from the debug filesystem. Introduce
> xe_sriov_debugfs_provisioned_attr_name() to get the debugfs attribute
> name for a given shared resource type.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_debugfs.c | 139 +++++++++++++++++++++++++++++++++++++-
>   lib/xe/xe_sriov_debugfs.h |   8 ++-
>   2 files changed, 145 insertions(+), 2 deletions(-)
>
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index dc6ef9da3..84fd08c3c 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -9,8 +9,9 @@
>   #include "drmtest.h"
>   #include "igt_debugfs.h"
>   #include "igt_sriov_device.h"
> -#include "xe/xe_sriov_debugfs.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_sriov_debugfs.h"
> +#include "xe/xe_sriov_provisioning.h"
>   
>   #define SRIOV_DEBUGFS_PATH_MAX 96
>   
> @@ -67,3 +68,139 @@ int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_n
>   
>   	return debugfs;
>   }
> +
> +/**
> + * xe_sriov_debugfs_provisioned_attr_name:
> + * @res: The shared resource type
> + *
> + * Returns the name of the debugfs provisioned attribute corresponding
> + * to the given shared resource type.
> + *
> + * Return: A string representing the debugfs provisioned attribute name if the
> + *         resource type is valid, otherwise NULL.
> + */
> +const char *xe_sriov_debugfs_provisioned_attr_name(enum xe_sriov_shared_res res)
> +{
> +	switch (res) {
> +	case XE_SRIOV_SHARED_RES_CONTEXTS:
> +		return "contexts_provisioned";
> +	case XE_SRIOV_SHARED_RES_DOORBELLS:
> +		return "doorbells_provisioned";
> +	case XE_SRIOV_SHARED_RES_GGTT:
> +		return "ggtt_provisioned";
> +	case XE_SRIOV_SHARED_RES_LMEM:
> +		return "lmem_provisioned";
> +	}
> +
> +	return NULL;
> +}
> +
> +static int parse_provisioned_range(const char *line,
> +				   struct xe_sriov_provisioned_range *range,
> +				   enum xe_sriov_shared_res res)
> +{
> +	int ret = -1;
> +
> +	switch (res) {
> +	case XE_SRIOV_SHARED_RES_CONTEXTS:
> +	case XE_SRIOV_SHARED_RES_DOORBELLS:
> +		if (sscanf(line, "VF%u: %lu-%lu", &range->vf_id, &range->start, &range->end) == 3)
> +			ret = 0;
> +		break;
> +	case XE_SRIOV_SHARED_RES_GGTT:
> +		if (sscanf(line, "VF%u: %lx-%lx", &range->vf_id, &range->start, &range->end) == 3)
> +			ret = 0;
> +		break;
> +	case XE_SRIOV_SHARED_RES_LMEM:
> +		/* Convert to an inclusive range as is the case for other resources.
> +		 * The start is always 0 and the end is the value read - 1.
> +		 */
> +		if (sscanf(line, "VF%u: %lu", &range->vf_id, &range->end) == 2)
> +			ret = 0;
> +		if (!range->end)
> +			return -1;
> +		range->end -= 1;
> +		range->start = 0;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_debugfs_pf_read_provisioned_ranges:
> + * @pf_fd: PF device file descriptor
> + * @res: resource
> + * @gt_id: GT number
> + * @ranges: pointer to array of provisioned ranges
> + * @nr_ranges: pointer to number of read provisioned VFs
> + *
> + * Read provisioned ranges of shared resources.
Nit: in the other descriptions, I see conjugation in the 3rd person - so 
"Reads" for consistency?
> + * Allocates the space for ranges and updates
> + * the nr_ranges to the number of read ranges.
> + * The caller should free the allocated space.
> + *
> + * Return: 0 if successful in reading ranges, otherwise negative error code.
> + */
> +int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_res res,
> +						unsigned int gt_id,
> +						struct xe_sriov_provisioned_range **ranges,
> +						unsigned int *nr_ranges)
> +{
> +	struct xe_sriov_provisioned_range *new_ranges;
> +	struct xe_sriov_provisioned_range range;
> +	FILE *file;
> +	size_t n = 0;
> +	const char *fname;
> +	char *line = NULL;
> +	int fd, ret = 0;
> +	ssize_t nread;
> +
> +	*nr_ranges = 0;
> +	*ranges = NULL;
> +
> +	fname = xe_sriov_debugfs_provisioned_attr_name(res);
> +	if (!fname)
> +		return -EINVAL;
> +
> +	fd = xe_sriov_pf_debugfs_attr_open(pf_fd, 0, gt_id, fname, O_RDONLY);
> +	if (fd < 0)
> +		return -ENOENT;
> +	file = fdopen(fd, "r");
> +	if (!file) {
> +		close(fd);
> +		return -errno;
> +	}
> +
> +	while ((nread = getline(&line, &n, file)) != -1) {
> +		ret = parse_provisioned_range(line, &range, res);
> +		if (ret) {
> +			igt_debug("Failed to parse line: %s\n", line);
> +			goto cleanup;
> +		}
> +
> +		new_ranges = realloc(*ranges, sizeof(range) * (*nr_ranges + 1));
> +		if (!new_ranges) {
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +		*ranges = new_ranges;
> +		memcpy(&(*ranges)[*nr_ranges], &range, sizeof(range));
> +		(*nr_ranges)++;
> +	}
> +
> +	if (ferror(file))
> +		ret = -EIO;
> +
> +cleanup:
> +	free(line);
> +	fclose(file);
> +
> +	if (ret < 0) {
> +		free(*ranges);
> +		*ranges = NULL;
> +		*nr_ranges = 0;
> +	}
> +
> +	return ret;
> +}
> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
> index e859ff5b2..856445e76 100644
> --- a/lib/xe/xe_sriov_debugfs.h
> +++ b/lib/xe/xe_sriov_debugfs.h
> @@ -6,9 +6,15 @@
>   #ifndef __XE_SRIOV_DEBUGFS_H__
>   #define __XE_SRIOV_DEBUGFS_H__
>   
> -#include <stdint.h>
> +enum xe_sriov_shared_res;
> +struct xe_sriov_provisioned_range;
>   
>   int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
>   				  const char *attr, int mode);
> +const char *xe_sriov_debugfs_provisioned_attr_name(enum xe_sriov_shared_res res);
> +int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_res res,
> +						unsigned int gt_id,
> +						struct xe_sriov_provisioned_range **ranges,
> +						unsigned int *nr_ranges);
>   
>   #endif /* __XE_SRIOV_DEBUGFS_H__ */
LGTM,
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
