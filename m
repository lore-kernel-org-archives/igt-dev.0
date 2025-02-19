Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E1BC021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 12:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6495210E7C8;
	Wed, 19 Feb 2025 12:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/Nm8hoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8FC10E7C8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739967485; x=1771503485;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9qPTWZ/F/QyywIfpvYjLO5WbXMxwzBGj8idGIjfJqG0=;
 b=e/Nm8hoP9EDyCkWonQ9zqhwrzB1wE2BtdO9HQ8ekzOwaTH5fE/B0zl0+
 DDWJ91aXmKxKr897zMxKzsf0dIpYenBdpDxW4Ww4cckj8aIqnKi1qrtVI
 NOIAdfowb2tiGH80SYwELTC05I5LLKmmVn6EZ2si5oKlxd6QGAoCoov+R
 LuOogi8r+FsxB9M4HW27tdFDgeHL+rJGs4+hsrtrh6Rl/5VFCcsDNffPO
 6w9A+qGJrtqdpk1+DTpKBt6emMIUdaTH8jSe3BciZZPPsX2pS8Zcl54WW
 zdsMyvQvGLFQRCuzkuznbrSH12weDAjaXfiHOVTsbCnVJMKZJzRN1T+LG g==;
X-CSE-ConnectionGUID: +F/drgpAT3GAnnLXfqEEBQ==
X-CSE-MsgGUID: ZL3cP+TGQU69rMvQ6wjZ4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40621964"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40621964"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 04:18:05 -0800
X-CSE-ConnectionGUID: l7HAYxo+Q8avLSDGue1oNg==
X-CSE-MsgGUID: uPx6dv4sT4G601t2UbiTNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114563234"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 19 Feb 2025 04:18:03 -0800
Received: from [10.245.96.215] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8030933EB6;
 Wed, 19 Feb 2025 12:18:01 +0000 (GMT)
Message-ID: <11191252-04b7-49c3-b820-eb718f4d9f15@intel.com>
Date: Wed, 19 Feb 2025 13:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_sriov_debugfs: Add VF save/restore
 related functions
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: tomasz.lis@intel.com, marcin.bernatowicz@linux.intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com,
 satyanarayana.k.v.p@intel.com
References: <20250219102534.2630181-1-adam.miszczak@linux.intel.com>
 <20250219102534.2630181-2-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250219102534.2630181-2-adam.miszczak@linux.intel.com>
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



On 19.02.2025 11:25, Adam Miszczak wrote:
> Provide helpers required to exercise VF (fake) migration:
> - control VF state (stop/pause/resume/restore)
> - read/write GuC, GGTT and LMEM state
> - initiate GGTT address relocation
> 
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>  lib/xe/xe_sriov_debugfs.c | 252 ++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_sriov_debugfs.h |  31 +++++
>  2 files changed, 283 insertions(+)
> 
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index 8f30fa312..2e33871ad 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -15,6 +15,10 @@
>  #include "xe/xe_sriov_provisioning.h"
>  
>  #define SRIOV_DEBUGFS_PATH_MAX 96
> +/* Maximum size of buffers used to read GuC, GGTT, LMEM state */
> +#define SRIOV_GUC_STATE_BUF_SIZE_MAX SZ_4M
> +#define SRIOV_GGTT_RAW_BUF_SIZE_MAX SZ_4M
> +#define SRIOV_LMEM_STATE_BUF_SIZE_MAX SZ_512M
>  
>  static char *xe_sriov_pf_debugfs_path(int pf, unsigned int vf_num, unsigned int gt_num, char *path,
>  				      int pathlen)
> @@ -285,6 +289,254 @@ static int validate_vf_ids(enum xe_sriov_shared_res res,
>  	return 0;
>  }
>  
> +static const char *xe_sriov_debugfs_control_value(enum xe_sriov_vf_control operation)
> +{
> +	switch (operation) {
> +	case XE_SRIOV_VF_CONTROL_STOP:
> +		return "stop";
> +	case XE_SRIOV_VF_CONTROL_PAUSE:
> +		return "pause";
> +	case XE_SRIOV_VF_CONTROL_RESUME:
> +		return "resume";
> +	case XE_SRIOV_VF_CONTROL_RESTORE:
> +		return "restore!";

this opcode is only supported by the PF driver compiled with
CONFIG_DRM_XE_DEBUG_SRIOV enabled, which is not set for the CI builds
and never will be enabled (it is purely for low level debug/bringup)

so was this taken into consideration?

> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * xe_sriov_set_vf_control - Controls VF's state.
> + * @pf_fd: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @operation: VF control command to perform
> + *
> + * Allows to send control VF state commands: pause, resume and stop.
> + * Additionally, restore! action is provided to restore previosusly

typo

> + * saved GuC state for VF migration enabling and testing purposes.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_sriov_set_vf_control(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						enum xe_sriov_vf_control operation)
> +{
> +	char path[PATH_MAX];
> +	const char *op_name;
> +
> +	igt_assert(igt_sriov_is_pf(pf_fd) && is_xe_device(pf_fd));
> +	igt_assert(gt_num < xe_number_gt(pf_fd));
> +	igt_assert(vf_num > 0);
> +
> +	if (!xe_sriov_pf_debugfs_path(pf_fd, vf_num, gt_num, path, sizeof(path)))
> +		return -ENOENT;
> +
> +	op_name = xe_sriov_debugfs_control_value(operation);
> +	if (!op_name)
> +		return -EINVAL;
> +
> +	strncat(path, "control", sizeof(path) - strlen(path));
> +
> +	igt_debug("Set VF%d control: %s (%s)\n", vf_num, op_name, path);
> +	igt_debugfs_write(pf_fd, path, op_name);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_relocate_ggtt - Enforce VF's GGTT address relaction.

typo

> + * @pf_fd: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + *
> + * Triggers move of the existing GGTT allocation to other location.
> + */
> +void xe_sriov_relocate_ggtt(int pf_fd, unsigned int vf_num, unsigned int gt_num)
> +{
> +	char path[PATH_MAX];
> +
> +	igt_assert(vf_num > 0);
> +
> +	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/relocate_ggtt", gt_num, vf_num);

do we really have support for the "relocate_ggtt"

> +	__igt_debugfs_write(pf_fd, path, "1", 1);
> +
> +	igt_debug("Set VF%d GGTT relocate (%s)\n", vf_num, path);
> +}
> +
> +/**
> + * xe_sriov_get_guc_state - Read VF's GuC state data.
> + * @pf_fd: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @lmem_state_size: Pointer to store the size of a returned buffer
> + *
> + * Reads the GuC state of given VF device @vf on GT @gt_num.
> + * Allocates an output buffer with a size limited to SRIOV_GUC_STATE_BUF_SIZE_MAX.
> + * The caller should free the allocated space.
> + *
> + * Return: pointer to the GuC state buffer on success, negative error code on failure.
> + */
> +void *xe_sriov_get_guc_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						int *guc_state_size)
> +{
> +	char path[PATH_MAX];
> +	int dir;
> +	void *buf;
> +
> +	igt_assert(vf_num > 0);
> +
> +	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/guc_state", gt_num, vf_num);
> +
> +	buf = malloc(SRIOV_GUC_STATE_BUF_SIZE_MAX);
> +	dir = igt_debugfs_dir(pf_fd);
> +
> +	*guc_state_size = igt_debugfs_simple_read(dir, path, buf, SRIOV_GUC_STATE_BUF_SIZE_MAX);
> +	close(dir);
> +
> +	igt_debug("Read VF%d GuC state: %d B (%s)\n", vf_num, *guc_state_size, path);
> +
> +	return buf;
> +}
> +
> +/**
> + * xe_sriov_set_guc_state - Write VF's GuC state data.
> + * @pf_fd: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @guc_state: Pointer to a buffer to write
> + * @guc_state_size: Size of a buffer to write
> + *
> + * Writes the GuC state of given VF device @vf on GT @gt_num.
> + */
> +void xe_sriov_set_guc_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						void *guc_state, int guc_state_size)
> +{
> +	char path[PATH_MAX];
> +
> +	igt_assert(vf_num > 0);
> +
> +	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/guc_state", gt_num, vf_num);
> +	__igt_debugfs_write(pf_fd, path, guc_state, guc_state_size);
> +
> +	igt_debug("Write VF%d GuC state: %d B (%s)\n", vf_num, guc_state_size, path);
> +}
> +
> +/**
> + * xe_sriov_get_ggtt_raw - Read VF's GGTT state data.
> + * @pf_fd: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @ggtt_raw_size: Pointer to store the size of a returned buffer
> + *
> + * Reads the GGTT state of given VF device @vf on GT @gt_num.
> + * Allocates an output buffer with a size limited to SRIOV_GGTT_RAW_BUF_SIZE_MAX.
> + * The caller should free the allocated space.
> + *
> + * Return: pointer to the GGTT state buffer on success, negative error code on failure.
> + */
> +void *xe_sriov_get_ggtt_raw(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						int *ggtt_raw_size)
> +{
> +	char path[PATH_MAX];
> +	int dir;
> +	void *buf;
> +
> +	igt_assert(vf_num > 0);
> +
> +	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/ggtt_raw", gt_num, vf_num);

this was also not merged upstream ..
and even if it will be exposed, likely only under DEBUG_SRIOV config

> +
> +	buf = malloc(SRIOV_GGTT_RAW_BUF_SIZE_MAX);
> +	dir = igt_debugfs_dir(pf_fd);
> +
> +	*ggtt_raw_size = igt_debugfs_simple_read(dir, path, buf, SRIOV_GGTT_RAW_BUF_SIZE_MAX);
> +	close(dir);
> +
> +	igt_debug("Read VF%d GGTT raw: %d B (%s)\n", vf_num, *ggtt_raw_size, path);
> +
> +	return buf;
> +}
> +
> +/**
> + * xe_sriov_set_ggtt_raw - Write VF's GGTT state data.
> + * @pf_fd: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @ggtt_raw: Pointer to a buffer to write
> + * @ggtt_raw_size: Size of a buffer to write
> + *
> + * Writes the GGTT state of given VF device @vf on GT @gt_num.
> + */
> +void xe_sriov_set_ggtt_raw(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						void *ggtt_raw, int ggtt_raw_size)
> +{
> +	char path[PATH_MAX];
> +
> +	igt_assert(vf_num > 0);
> +
> +	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/ggtt_raw", gt_num, vf_num);
> +	__igt_debugfs_write(pf_fd, path, ggtt_raw, ggtt_raw_size);
> +
> +	igt_debug("Write VF%d GGTT raw: %d B (%s)\n", vf_num, ggtt_raw_size, path);
> +}
> +
> +/**
> + * xe_sriov_get_lmem_state - Read VF's LMEM state data.
> + * @pf_fd: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @lmem_state_size: Pointer to store the size of a returned buffer
> + *
> + * Reads the LMEM state of given VF device @vf on GT @gt_num.
> + * Allocates an output buffer with a size limited to SRIOV_LMEM_STATE_BUF_SIZE_MAX.
> + * The caller should free the allocated space.
> + *
> + * Return: pointer to the LMEM state buffer on success, negative error code on failure.
> + */
> +void *xe_sriov_get_lmem_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						int *lmem_state_size)
> +{
> +	char path[PATH_MAX];
> +	int dir;
> +	void *buf;
> +
> +	igt_assert(vf_num > 0);
> +
> +	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/lmem_state", gt_num, vf_num);
> +
> +	buf = malloc(SRIOV_LMEM_STATE_BUF_SIZE_MAX);
> +	dir = igt_debugfs_dir(pf_fd);
> +
> +	*lmem_state_size = igt_debugfs_simple_read(dir, path, buf, SRIOV_LMEM_STATE_BUF_SIZE_MAX);
> +	close(dir);
> +
> +	igt_debug("Read VF%d LMEM state: %d B (%s)\n", vf_num, *lmem_state_size,  path);
> +
> +	return buf;
> +}
> +
> +/**
> + * xe_sriov_set_lmem_state - Write VF's LMEM state data.
> + * @pf_fd: PF device file descriptor
> + * @vf_num: VF number
> + * @gt_num: GT number
> + * @lmem_state: Pointer to a buffer to write
> + * @lmem_state_size: Size of a buffer to write
> + *
> + * Writes the LMEM state of given VF device @vf on GT @gt_num.
> + */
> +void xe_sriov_set_lmem_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						void *lmem_state, int lmem_state_size)
> +{
> +	char path[PATH_MAX];
> +
> +	igt_assert(vf_num > 0);
> +
> +	sprintf(path, "/sys/kernel/debug/dri/0/gt%u/vf%u/lmem_state", gt_num, vf_num);
> +	__igt_debugfs_write(pf_fd, path, lmem_state, lmem_state_size);
> +
> +	igt_debug("Write VF%d LMEM state: %d B (%s)\n", vf_num, lmem_state_size, path);
> +}
> +
>  /**
>   * xe_sriov_pf_debugfs_read_check_ranges:
>   * @pf_fd: PF device file descriptor
> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
> index 4983afbb3..d801084a9 100644
> --- a/lib/xe/xe_sriov_debugfs.h
> +++ b/lib/xe/xe_sriov_debugfs.h
> @@ -9,6 +9,20 @@
>  enum xe_sriov_shared_res;
>  struct xe_sriov_provisioned_range;
>  
> +/**
> + * enum xe_sriov_vf_control - VF control
> + * @XE_SRIOV_VF_CONTROL_STOP: stop VF
> + * @XE_SRIOV_VF_CONTROL_PAUSE: pause VF
> + * @XE_SRIOV_VF_CONTROL_RESUME: resume VF
> + * @XE_SRIOV_VF_CONTROL_RESTORE: restore VF GuC state
> + */
> +enum xe_sriov_vf_control {
> +	XE_SRIOV_VF_CONTROL_STOP,
> +	XE_SRIOV_VF_CONTROL_PAUSE,
> +	XE_SRIOV_VF_CONTROL_RESUME,
> +	XE_SRIOV_VF_CONTROL_RESTORE,
> +};
> +
>  int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
>  				  const char *attr, int mode);
>  const char *xe_sriov_debugfs_provisioned_attr_name(enum xe_sriov_shared_res res);
> @@ -20,6 +34,23 @@ int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res re
>  					  unsigned int gt_id,
>  					  struct xe_sriov_provisioned_range **ranges,
>  					  unsigned int expected_num_vfs);
> +
> +int xe_sriov_set_vf_control(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						enum xe_sriov_vf_control operation);
> +void xe_sriov_relocate_ggtt(int pf_fd, unsigned int vf_num, unsigned int gt_num);
> +void *xe_sriov_get_guc_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						int *guc_state_size);
> +void xe_sriov_set_guc_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						void *guc_state, int guc_state_size);
> +void *xe_sriov_get_ggtt_raw(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						int *ggtt_raw_size);
> +void xe_sriov_set_ggtt_raw(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						void *ggtt_raw, int ggtt_raw_size);
> +void *xe_sriov_get_lmem_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						int *lmem_state_size);
> +void xe_sriov_set_lmem_state(int pf_fd, unsigned int vf_num, unsigned int gt_num,
> +						void *lmem_state, int lmem_state_size);
> +
>  int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
>  				  unsigned int gt_num, const char *attr,
>  				  uint32_t *value);

