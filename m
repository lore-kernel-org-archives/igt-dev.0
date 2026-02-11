Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01ECE9E2EB
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 11:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A13A10E00B;
	Wed, 11 Feb 2026 11:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzBzArIy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E9510E00B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770810670; x=1802346670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0WzJ+cFnWI2fWjj3QUdHqEFVnTPdimFfQ07Yj25ol18=;
 b=hzBzArIyQK/kJ3l9gQjZLzJ3vhwqQToHGUeAApzW0ntJ1qz7dMnMjWJB
 z5gF+3FzzdwdrT/TMEFv33IYOSQZFYFtdq3MC6i39+mfkaI6BnykT1RsV
 gjTPvL+ksaGX1bpkT/6kNUDyVwBfN+Ev0Ce+TVZu9xZ7vZmr3qtPib6gG
 juafIHJDPBwH3tEQecODjqSE4krpmGbkxfovIh6mSEE95+VeCkKk4RLYf
 P29P4syc6ocUVp9E5CFNP5cvxwTRQEjUxzNBu7ZwPdud89Z6UCEdeGdEp
 Ncqlj9+zHoKLC53Sfro5q0optKgIJQ8Z5qe6jmZXsstD1BGBILTXl6/52 w==;
X-CSE-ConnectionGUID: Qnt9+J2HTkaN+FjCG5VXow==
X-CSE-MsgGUID: qwHp7+qESle3WB98Ir2CQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82277619"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82277619"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 03:51:09 -0800
X-CSE-ConnectionGUID: pJj6KnqcTm+XrztenBw3wg==
X-CSE-MsgGUID: emw8AqlcS4WyIbkfBRylnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211268819"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:51:08 -0800
Date: Wed, 11 Feb 2026 12:50:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org, michal.wajdeczko@intel.com
Subject: Re: [PATCH] tests/intel/xe_configfs: Reset configfs group after each
 subtest
Message-ID: <20260211115053.bbhirqp3uhj5gy5z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org,
 michal.wajdeczko@intel.com
References: <20260209131853.145876-2-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260209131853.145876-2-nitin.r.gote@intel.com>
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

Hi Nitin,
On 2026-02-09 at 18:48:54 +0530, Nitin Gote wrote:
> The xe_configfs test uses a shared configfs group across all subtests.
> When subtests modify configfs attributes without resetting them, the
> modified values persist and affect subsequent subtests. For example,
> ctx-restore-mid-bb reports register value mismatches due to stale
> batch buffer data from previous subtests.
> 
> Fix by removing the configfs device directory after each subtest and
> letting the next subtest recreate it to get default values as
> hardcoded in the driver.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6204
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
> Hi Kamil,
> Thank you for the review, I used helper function
> in v3 version.
> 
> v2->v3: Use helper function (Kamil)
> v1->v2:
>   Instead of manually resetting each attribute,
>   it's cleaner to remove and recreate the configfs group after
>   each subtests. (Michal)
> 
>  tests/intel/xe_configfs.c | 45 +++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index d2dfd2e87..59c9359f5 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -346,6 +346,12 @@ static int create_device_configfs_group(int configfs_fd)
>  	return configfs_device_fd;
>  }
>  
> +static void close_configfs_group(int configfs_fd, int configfs_device_fd)
> +{
> +	close(configfs_device_fd);
> +	igt_fs_remove_dir(configfs_fd, bus_addr);
> +}
> +
>  int igt_main()
>  {
>  	int fd, configfs_fd, configfs_device_fd;
> @@ -361,7 +367,6 @@ int igt_main()
>  
>  		configfs_fd = igt_configfs_open("xe");
>  		igt_require(configfs_fd != -1);
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		igt_install_exit_handler(restore);
>  	}
>  
> @@ -369,39 +374,61 @@ int igt_main()
>  	igt_subtest("survivability-mode") {
>  		igt_require(IS_BATTLEMAGE(devid));
>  		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_survivability_mode(configfs_device_fd);
> +		close_configfs_group(configfs_fd, configfs_device_fd);
>  	}
>  
>  	igt_describe("Validate engines_allowed with invalid options");
> -	igt_subtest("engines-allowed-invalid")
> +	igt_subtest("engines-allowed-invalid") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_engines_allowed_invalid(configfs_device_fd);
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
>  
>  	igt_describe("Validate engines_allowed");
> -	igt_subtest("engines-allowed")
> +	igt_subtest("engines-allowed") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_engines_allowed(configfs_device_fd);
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
>  
>  	igt_describe("Validate gt_types_allowed");
> -	igt_subtest("gt-types-allowed")
> +	igt_subtest("gt-types-allowed") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_gt_types_allowed(configfs_device_fd);
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
>  
>  	igt_describe("Validate ctx_restore_post_bb with invalid options");
> -	igt_subtest("ctx-restore-post-bb-invalid")
> +	igt_subtest("ctx-restore-post-bb-invalid") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore_invalid(configfs_device_fd, "post");
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
>  
>  	igt_describe("Validate ctx_restore_post_bb");
> -	igt_subtest("ctx-restore-post-bb")
> +	igt_subtest("ctx-restore-post-bb") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore(configfs_device_fd, "post");
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
>  
>  	igt_describe("Validate ctx_restore_mid_bb with invalid options");
> -	igt_subtest("ctx-restore-mid-bb-invalid")
> +	igt_subtest("ctx-restore-mid-bb-invalid") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore_invalid(configfs_device_fd, "mid");
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
>  
>  	igt_describe("Validate ctx_restore_mid_bb");
> -	igt_subtest("ctx-restore-mid-bb")
> +	igt_subtest("ctx-restore-mid-bb") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore(configfs_device_fd, "mid");
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
>  
>  	igt_fixture() {
> -		close(configfs_device_fd);
>  		close(configfs_fd);
>  	}

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  }
> -- 
> 2.50.1
> 
