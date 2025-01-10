Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C053EE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 12:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CB610F084;
	Fri, 10 Jan 2025 12:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OsgNLEBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C276410F084
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736510826; x=1768046826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qigwLU2XZul9FpZn1VVInL51Tz0gots8wIuMXXhQ9B4=;
 b=OsgNLEBh4eraOINbZ7PInk7TAQVjOCpNfomKcXwAv9C03JWag5emL5oa
 sjCzl5Yk0ptgofhaEoMLrDcsQDMZYVUKm8YTy24ww2ayNRIamPTk59Zn3
 QOjBs6fQFWTJPq0L+Io9FqQUQMrB+CqdGK877SfzJFDFcaLjk/YYDWcAq
 y8J0hOf+7H/8oaHcuZfxspnjKNFNE7MSKvcRAe0A7ux/Ff/hoGHwk/u9y
 aeJP06RiHJOUaeK0Cit0tTirC1MRYDhO/6V/CreIZgMYNneK6rbV88JhZ
 7nIDp8004grc/8j0INaQHrT4Luh7vpPoits3Y0Jp4jkh0KLcXgNoqreLw A==;
X-CSE-ConnectionGUID: TVS4HvjjTPiYyHUgPMvgUQ==
X-CSE-MsgGUID: dp9rNOB0TUaZYBRnQG2T1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54342215"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="54342215"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 04:07:05 -0800
X-CSE-ConnectionGUID: PZ7oewIuQuSB0rAqblo7VA==
X-CSE-MsgGUID: oKphe9ViSnGEgrWGvdZZvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103601559"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:07:04 -0800
Date: Fri, 10 Jan 2025 13:07:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com
Subject: Re: [PATCH v1] tests/xe_debugfs: Improve test_gt subtest
Message-ID: <20250110120701.yo3cfev43c2jqx7o@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com
References: <20250109105721.914096-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109105721.914096-1-pravalika.gurram@intel.com>
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
On 2025-01-09 at 16:27:21 +0530, Pravalika Gurram wrote:
> Read the debugfs entries in the loop to improve
> the readability.
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 84 +++++++---------------------------------
>  1 file changed, 13 insertions(+), 71 deletions(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index bcbb5036a..3d8c17921 100644
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
> -
> -	sprintf(name, "gt%d/uc/guc_log", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);

Why not two loops? One for main folder, second for 'uc'?
Or by a function call, see below.

> +	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
> +		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> +		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +		if (!strstr(name, "uc")) {
> +			igt_debugfs_dump(fd, name);

imho better skip in case name is dir:
		if (igt_debugfs_is_dir(fd, name))
			continue;

this would allow to write it clean with help of new function:

 	sprintf(name, "/gt%d", gt_id);
  	validate_read(fd, name, expected_files, ARRAY_SIZE(expected_files));

 	sprintf(name, "/gt%d/uc", gt_id);
  	validate_read(fd, name, expected_files_uc, ARRAY_SIZE(expected_files_uc));

Regards,
Kamil

> +		} else {
> +			for (int j = 0; j < ARRAY_SIZE(expected_files_uc); j++) {
> +				sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[j]);
> +				igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +				igt_debugfs_dump(fd, name);
> +			}
> +		}
> +	}
>  
>  	sprintf(name, "/gt%d", gt_id);
>  	validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
> -- 
> 2.34.1
> 
