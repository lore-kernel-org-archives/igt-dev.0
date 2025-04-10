Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1DCC369A4
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 09:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181EA10E84F;
	Thu, 10 Apr 2025 09:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnw2hTv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499FC10E84F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744277435; x=1775813435;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NzmXf8qfYNzkRa7GoVMIDsj3Hw+s+OOKSyDvxdlF61c=;
 b=fnw2hTv5yon9MhI8sPyLCy8ENUeTN3ytCeQhXRg4ehFGsuiJRyD0/sZT
 z7sOUMgRrxl8WrNVBdLhzEHfl0DZWJV0rvdG0iA1AJCtQdfgPSOtu9NyS
 O2pzuyRKTeAv57lLyf4wUBxkcAwpnx1RKzB9WpjKrjTDrqtOz8nbLxqvh
 zkly+l2ecwdeOVFcqoAlVU7j/XRsRPcS4q2J1+b0j+tJJzMUoSHUACFEN
 k3fpVu06dOtincGQ28jg9WbAPpn9i46zHMAFgSEaT4eKn4tOCV0/BVCRk
 nun4f6Ksw3yp8AEoWPnAfLhG8CGAe0EMwxZ9/Aw9EN0RwWNPCqxMcob48 w==;
X-CSE-ConnectionGUID: nlyvzhoISLWpgdXVIkVQHw==
X-CSE-MsgGUID: zKjjPzd5RbK422mw7a6jng==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="55964101"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="55964101"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:30:34 -0700
X-CSE-ConnectionGUID: N+NzLjLMRdaynzj0/qbuNQ==
X-CSE-MsgGUID: Yiv/7E+3QpCCvUlAxBRsFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129395681"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.203])
 ([10.245.80.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:30:32 -0700
Message-ID: <99c5f0aa-c2ca-422a-b0fe-5ee591402e41@linux.intel.com>
Date: Thu, 10 Apr 2025 11:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/intel_sysfs_debugfs: Remove xe-gt
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, matthew.brost@intel.com,
 pravalika.gurram@intel.com, kamil.konieczny@linux.intel.com
References: <20250410090315.4201-1-peter.senna@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250410090315.4201-1-peter.senna@linux.intel.com>
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



On 4/10/2025 11:03 AM, Peter Senna Tschudin wrote:
> The intel_sysfs_debugfs test now includes functionality to read all Xe
> debugfs files, making the older xe-gt test redundant. Additionally,
> xe-gt causes issues when testing Virtual Functions (VFs) in SR-IOV
> setups, as some of the debugfs files it expects are not present for VFs.
> 
> Rather than extending the overlapping and problematic xe-gt, this commit
> removes it entirely.
> 
> Cc: marcin.bernatowicz@intel.com
> Cc: matthew.brost@intel.com
> Cc: pravalika.gurram@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>   tests/intel/intel_sysfs_debugfs.c | 66 -------------------------------
>   1 file changed, 66 deletions(-)
> 
> diff --git a/tests/intel/intel_sysfs_debugfs.c b/tests/intel/intel_sysfs_debugfs.c
> index 6beb94109..431934aee 100644
> --- a/tests/intel/intel_sysfs_debugfs.c
> +++ b/tests/intel/intel_sysfs_debugfs.c
> @@ -322,63 +322,6 @@ xe_test_base(int fd, struct drm_xe_query_config *config)
>   	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
>   }
>   
> -/**
> - * SUBTEST: xe-gt
> - * Description: Check all gt debugfs devnodes
> - * TODO: add support for ``force_reset`` entries
> - */
> -static void
> -xe_test_gt(int fd, int gt_id)
> -{
> -	char name[256];
> -	static const char * const expected_files[] = {
> -		"uc",
> -		"steering",
> -		"topology",
> -		"sa_info",
> -		"hw_engines",
> -		"pat",
> -		"mocs",
> -//		"force_reset"
> -		"ggtt",
> -		"register-save-restore",
> -		"workarounds",
> -		"default_lrc_rcs",
> -		"default_lrc_ccs",
> -		"default_lrc_bcs",
> -		"default_lrc_vcs",
> -		"default_lrc_vecs",
> -		"hwconfig"
> -
> -	};
> -	static const char * const expected_files_uc[] = {
> -		"huc_info",
> -		"guc_log",
> -		"guc_info",
> -//		"guc_ct_selftest"
> -	};
> -
> -	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
> -		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> -		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -		if (igt_debugfs_is_dir(fd, expected_files[i], gt_id))
> -			continue;
> -		igt_debugfs_dump(fd, name);
> -	}
> -
> -	for (int i = 0; i < ARRAY_SIZE(expected_files_uc); i++) {
> -		sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[i]);
> -		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -		igt_debugfs_dump(fd, name);
> -	}
> -
> -	sprintf(name, "/gt%d", gt_id);
> -	xe_validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
> -
> -	sprintf(name, "/gt%d/uc", gt_id);
> -	xe_validate_entries(fd, name, expected_files_uc, ARRAY_SIZE(expected_files_uc));
> -}
> -
>   /**
>    * SUBTEST: xe-forcewake
>    * Description: Check forcewake debugfs devnode
> @@ -475,15 +418,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			xe_test_base(fd, xe_config(fd));
>   		}
>   
> -		igt_describe("Check all gt debugfs devnodes");
> -		igt_subtest("xe-gt") {
> -			xe_for_each_gt(fd, gt) {
> -				snprintf(devnode, sizeof(devnode), "gt%d", gt);
> -				igt_require(igt_debugfs_exists(fd, devnode, O_RDONLY));
> -				xe_test_gt(fd, gt);
> -			}
> -		}
> -

LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   		igt_describe("Check forcewake debugfs devnode");
>   		igt_subtest("xe-forcewake") {
>   			xe_test_forcewake(fd);

