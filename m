Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06585C02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 12:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA2710E3CE;
	Mon, 20 Jan 2025 12:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcpoli8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE73710E3CE
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737374798; x=1768910798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fO0e6Wm0Xm6ozQacJ2ArPLBHUq4DNd627aFsVdKOpxo=;
 b=jcpoli8cX10B51ek8PAI2zmmLu12IgHMkBuBSG0u6oo0Skcp1VHq63MJ
 PjwojuCxtRejfrftm9iW/rTqi6atBy21/plOD8blVWv/xmnl1HR0reity
 2zzIBMeI/e1ruKIDYMs5+91yFtEjLX5fEWVHR9jHUg3nDe3s8q3aUi035
 wrk6SHVgjuRC6ZH3MbrcxlV+xE7JxSljLHN2nWh5+7VeQCSVy6ILse/a+
 oBATkZfnS3EJrswM3KWKCacJ9CxcbdMY9CiOCBscVFfxUalDCn3UVVgfK
 vUG6NdjNtC491nI0V6/XrgtYhZCfq/6owskcttJ5jTga6+v96hnRjMWwI w==;
X-CSE-ConnectionGUID: lSZWbo8lSpSadIPjEc54SQ==
X-CSE-MsgGUID: uvSyWeMSQ92OQW0aEyw/TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="49158093"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="49158093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 04:06:37 -0800
X-CSE-ConnectionGUID: iu5SThBiQBO0u9rc0Q4/6w==
X-CSE-MsgGUID: +ajB6ecQREi23k3qmqBgKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="107036841"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 04:06:36 -0800
Date: Mon, 20 Jan 2025 13:06:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>, lucas.demarchi@intel.com
Subject: Re: [PATCH v2] tests/xe_debugfs: Improve test_gt subtest
Message-ID: <20250120120633.x2qoubgrks334zth@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 lucas.demarchi@intel.com
References: <20250113134558.947544-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113134558.947544-1-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2025-01-13 at 19:15:58 +0530, Pravalika Gurram wrote:

one nit about subject, it is now:
[PATCH v2] tests/xe_debugfs: Improve test_gt subtest

imho better:
[PATCH v2] tests/intel/xe_debugfs: Improve gt subtest

You could get list of subtest with --list option, for example
./xe_debugfs --list

produces output:

base
gt
forcewake

There is no test_gt there as a subtest name. Btw this could be
corrected at merge time.

> Read the debugfs entries in the loop to improve the readability.
> Added library function to check whether the debugfs is a directory or not.
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_debugfs.c        | 27 +++++++++++++
>  lib/igt_debugfs.h        |  1 +
>  tests/intel/xe_debugfs.c | 82 ++++++----------------------------------
>  3 files changed, 40 insertions(+), 70 deletions(-)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index f4f749e30..cd604e7c6 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -376,6 +376,33 @@ igt_debugfs_gt_open(int device, unsigned int gt, const char *filename, int mode)
>  	return ret;
>  }
>  
> +/**
> + * igt_debugfs_is_dir:
> + * @drm_fd: fd of the device
> + * @name: name of the debugfs node to check
> + * @gt: gt instance number
> + *
> + * This helps to find the debugfs file is  a directory or not
> + *
> + * Returns:
> + * true if the debugfs is a directory
> + */
> +bool igt_debugfs_is_dir(int drm_fd, const char *name, int gt_id)
> +{
> +	char path[128];
> +	struct stat st;
> +
> +	if (fstat(drm_fd, &st) != 0)
> +		return false;
> +
> +	snprintf(path, sizeof(path), "/sys/kernel/debug/dri/%d/gt%d/%s",
> +						minor(st.st_rdev), gt_id, name);
> +	if (!stat(path, &st) && S_ISDIR(st.st_mode))
> +		return true;
> +
> +	return false;
> +}
> +
>  /**
>   * igt_debugfs_simple_read:
>   * @dir: fd of the debugfs directory
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index 3e6194ade..f4044d545 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -39,6 +39,7 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
>  int igt_debugfs_pipe_dir(int device, int pipe, int mode);
>  
>  int igt_debugfs_open(int fd, const char *filename, int mode);
> +bool igt_debugfs_is_dir(int drm_fd, const char *name, int gt_id);
>  bool igt_debugfs_exists(int fd, const char *filename, int mode);
>  void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
>  void __igt_debugfs_write(int fd, const char *filename, const char *buf, int size);
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index bcbb5036a..c653daae4 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -180,77 +180,19 @@ test_gt(int fd, int gt_id)
>  //		"guc_ct_selftest"
>  	};
>  
> -	sprintf(name, "gt%d/hw_engines", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/sa_info", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/steering", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/topology", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/pat", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/mocs", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/ggtt", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/register-save-restore", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/workarounds", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/default_lrc_rcs", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/default_lrc_ccs", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/default_lrc_bcs", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/default_lrc_vecs", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/default_lrc_vcs", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/hwconfig", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/uc/guc_info", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/uc/huc_info", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> +	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
> +		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> +		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +		if (igt_debugfs_is_dir(fd, expected_files[i], gt_id))
> +			continue;
> +		igt_debugfs_dump(fd, name);
> +	}
>  
> -	sprintf(name, "gt%d/uc/guc_log", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> +	for (int i = 0; i < ARRAY_SIZE(expected_files_uc); i++) {
> +		sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[i]);
> +		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +		igt_debugfs_dump(fd, name);
> +	}
>  
>  	sprintf(name, "/gt%d", gt_id);
>  	validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
> -- 
> 2.34.1
> 
