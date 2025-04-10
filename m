Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E7CC3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 18:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0ED10E05A;
	Thu, 10 Apr 2025 18:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvCWQQU3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EAF10E05A
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 18:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744308681; x=1775844681;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZBsO6jBw5ofmk7dQ1FfiHJxANFLuUaERu7uyJXAlvwk=;
 b=ZvCWQQU3BNjFF9q9rINKSD/d4gj5/7nzccaaHt6rS9WRVTOUNOVTTp5B
 /y/+sd/ZgkoPJmedwM6KWq+RWZe/fBf9KDQmxjHXJ663GJlxnIhU2YOOk
 7XsIjkYCInoZriXI6rE4HoNcYrr0YQzypm3tGHxKGH6UbH2wjPL5ilrlV
 elPRaJQmIqVHOqW35TvMLJndKWMq7y0e1SAt7ApDZpOS6gDg4xb7fAC1T
 dpS9warIcdCLgGsvCAzzqik+F94CPmYZebP0Z0tjOjCQNcn88mZF05MGA
 +GQrE8f2SetqNytJfU6txLgLtVElbjc4n8NOL8ZQF/5tjYShqoRpU2JzS Q==;
X-CSE-ConnectionGUID: ZvIoVYgrSju5s3wOcsRDIA==
X-CSE-MsgGUID: +wFIlzuzScOW+ebVlQYG1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57219627"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57219627"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 11:11:21 -0700
X-CSE-ConnectionGUID: tgfDD8V8Qxa9SVTyE4uY+g==
X-CSE-MsgGUID: fo4iWZZNR9Sn0T341hmaYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128840158"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 11:11:20 -0700
Date: Thu, 10 Apr 2025 20:11:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 matthew.brost@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/intel_sysfs_debugfs: Remove xe-gt
Message-ID: <20250410181117.6ovckutjog7wleah@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 matthew.brost@intel.com, pravalika.gurram@intel.com
References: <20250410090315.4201-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410090315.4201-1-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-04-10 at 11:03:15 +0200, Peter Senna Tschudin wrote:
> The intel_sysfs_debugfs test now includes functionality to read all Xe
> debugfs files, making the older xe-gt test redundant. Additionally,
> xe-gt causes issues when testing Virtual Functions (VFs) in SR-IOV
> setups, as some of the debugfs files it expects are not present for VFs.
> 
> Rather than extending the overlapping and problematic xe-gt, this commit
> removes it entirely.

I agree on removing reading part but not on existence checks.
Imho start with small refactor:

- remove readings
- change existing checks so they will print _all_ missing
  debugfs nodes and only after that test will fail if there
  were misses

Final step should be:
- adding a flag for those nodes which should not exist on VF,
  detect that and ignore this on VFs.

These could be done in one or in two patches.

Regards,
Kamil

> 
> Cc: marcin.bernatowicz@intel.com
> Cc: matthew.brost@intel.com
> Cc: pravalika.gurram@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  tests/intel/intel_sysfs_debugfs.c | 66 -------------------------------
>  1 file changed, 66 deletions(-)
> 
> diff --git a/tests/intel/intel_sysfs_debugfs.c b/tests/intel/intel_sysfs_debugfs.c
> index 6beb94109..431934aee 100644
> --- a/tests/intel/intel_sysfs_debugfs.c
> +++ b/tests/intel/intel_sysfs_debugfs.c
> @@ -322,63 +322,6 @@ xe_test_base(int fd, struct drm_xe_query_config *config)
>  	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
>  }
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
>  /**
>   * SUBTEST: xe-forcewake
>   * Description: Check forcewake debugfs devnode
> @@ -475,15 +418,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  			xe_test_base(fd, xe_config(fd));
>  		}
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
>  		igt_describe("Check forcewake debugfs devnode");
>  		igt_subtest("xe-forcewake") {
>  			xe_test_forcewake(fd);
> -- 
> 2.43.0
> 
