Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF276C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 09:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8969110E378;
	Tue, 15 Apr 2025 09:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frKMCUo4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1CD10E378
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744709141; x=1776245141;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k9umJXc607Xcfzz3z65w8IqMt4CPLKu4op0C3qBKW5A=;
 b=frKMCUo4QB032ZXJy2Frr5hYUzBr5KwgaWnQlNtbLWXb/M3g/DjWPB8Y
 s1Clz9SF4cBIXXqE/SemGoe22m53R4sJPSixq9yccZ8+gIxUi1Ckb0hoC
 b00FmDzvc4ctIZ6HvghF0pSfABTi5Y4YuMqaMgldqYonyQI6B0neDtYUv
 lNg9HPVMwQ9nor7H+TMjPBMfHW5mfIH2VDD1inPs5lr6+SNk9fBn41uIb
 BYSHgW8lwnsatDPz6C9oHNG2bvtNs9DqWxQu/VdWkxjJcBpfnFs+y/8Gi
 5jmlG7hM4mzADkFnZkicWhTfHcFMdubD9yO3zW/Vn9GZ+H/pPiSUBnP7F Q==;
X-CSE-ConnectionGUID: 6KT4FZigS3u/WqX48B0z/Q==
X-CSE-MsgGUID: hKsDao9xQ+iBlQwLvdfa3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50035468"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="50035468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:25:41 -0700
X-CSE-ConnectionGUID: 7+wlAeXaTAuOpFNGD8GDHg==
X-CSE-MsgGUID: OqcWm0zORyOllY+hQqLxvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="167230511"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:25:39 -0700
Date: Tue, 15 Apr 2025 11:25:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 matthew.brost@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/intel_sysfs_debugfs: Remove xe-gt
Message-ID: <20250415092536.sjkoxqszaozwo6cr@kamilkon-DESK.igk.intel.com>
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

These removes both vars devnode and gt and after that compiler
warns about unused vars:

[591/1970] Compiling C object tests/intel_sysfs_debugfs.p/intel_intel_sysfs_debugfs.c.o
../tests/intel/intel_sysfs_debugfs.c: In function '__igt_unique____real_main359':
../tests/intel/intel_sysfs_debugfs.c:364:13: warning: unused variable 'gt' [-Wunused-variable]
  364 |         int gt;
      |             ^~
../tests/intel/intel_sysfs_debugfs.c:362:14: warning: unused variable 'devnode' [-Wunused-variable]
  362 |         char devnode[PATH_MAX];
      |              ^~~~~~~

Please fix and resend with both r-b from Marcin and my a-b.

Regards,
Kamil

> -			}
> -		}
> -
>  		igt_describe("Check forcewake debugfs devnode");
>  		igt_subtest("xe-forcewake") {
>  			xe_test_forcewake(fd);
> -- 
> 2.43.0
> 
