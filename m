Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D02E7E0C7
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 11:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD68110E14D;
	Mon,  9 Feb 2026 11:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2MGwhuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D19B10E14D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770636293; x=1802172293;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=456DNEWa7HboG0UNx2qOLnc8OQ2Z+74Hkw+tnl1vLCs=;
 b=R2MGwhuCqLfHmmyIPn3kMpLQdwOk12xe/Ilmjq+GQLGfiC+3ds5umihu
 cpQ4UY8xOq5dyQY0sf3Yiuyc7xYfdjqdeONXxoCjk11ztFZJAoLymFwSF
 O+rwSRn00XPjq1J+fU2QGW+NayV/+qs2S6O38prDDwDsi64ymbRpQAA5o
 tPjx575JZxAXROBwbPHSw81TL4WiSREXnY+GaMxdHFWZ0+gk53kM+IjhG
 Gnt2wQwfkneFzJteOE2/OeE6S7+XFRK3ClTrj5YuUFgmeSMLQ0OTU1Xu5
 q+H4faLuxJuaS7gEjpu6w5+ity+ySzvfZVSCM/CUmmMMIl3IkPrhaJRMG A==;
X-CSE-ConnectionGUID: oMt9omOuTqCQaVbdYwLCTw==
X-CSE-MsgGUID: NviXbKUkS76PZ8CUQINkeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="89162915"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="89162915"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 03:24:52 -0800
X-CSE-ConnectionGUID: cga9Mj0QTS68cwzijZofsQ==
X-CSE-MsgGUID: 4NQJy3hJS4SnHlTESz3mLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="215732836"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 03:24:51 -0800
Date: Mon, 9 Feb 2026 12:24:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org, michal.wajdeczko@intel.com
Subject: Re: [PATCH] tests/intel/xe_configfs: Reset configfs group after each
 subtest
Message-ID: <20260209112448.iuzegnjsokqztko5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org,
 michal.wajdeczko@intel.com
References: <20260204160308.107154-2-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204160308.107154-2-nitin.r.gote@intel.com>
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
On 2026-02-04 at 21:33:09 +0530, Nitin Gote wrote:
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
> v1->v2:
>   Instead of manually resetting each attribute,
>   it's cleaner to remove and recreate the configfs group after
>   each subtests. (Michal)
> 
>  tests/intel/xe_configfs.c | 47 +++++++++++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index d2dfd2e87..aa3435392 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -361,7 +361,6 @@ int igt_main()
>  
>  		configfs_fd = igt_configfs_open("xe");
>  		igt_require(configfs_fd != -1);
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		igt_install_exit_handler(restore);
>  	}
>  
> @@ -369,39 +368,69 @@ int igt_main()
>  	igt_subtest("survivability-mode") {
>  		igt_require(IS_BATTLEMAGE(devid));
>  		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_survivability_mode(configfs_device_fd);
> +		close(configfs_device_fd);
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
>  	}
>  
>  	igt_describe("Validate engines_allowed with invalid options");
> -	igt_subtest("engines-allowed-invalid")
> +	igt_subtest("engines-allowed-invalid") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_engines_allowed_invalid(configfs_device_fd);
> +		close(configfs_device_fd);
> +		igt_fs_remove_dir(configfs_fd, bus_addr);

You added the same two lines, use helper function instead, here
and below.

Regards,
Kamil

> +	}
>  
>  	igt_describe("Validate engines_allowed");
> -	igt_subtest("engines-allowed")
> +	igt_subtest("engines-allowed") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_engines_allowed(configfs_device_fd);
> +		close(configfs_device_fd);
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	}
>  
>  	igt_describe("Validate gt_types_allowed");
> -	igt_subtest("gt-types-allowed")
> +	igt_subtest("gt-types-allowed") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_gt_types_allowed(configfs_device_fd);
> +		close(configfs_device_fd);
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	}
>  
>  	igt_describe("Validate ctx_restore_post_bb with invalid options");
> -	igt_subtest("ctx-restore-post-bb-invalid")
> +	igt_subtest("ctx-restore-post-bb-invalid") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore_invalid(configfs_device_fd, "post");
> +		close(configfs_device_fd);
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	}
>  
>  	igt_describe("Validate ctx_restore_post_bb");
> -	igt_subtest("ctx-restore-post-bb")
> +	igt_subtest("ctx-restore-post-bb") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore(configfs_device_fd, "post");
> +		close(configfs_device_fd);
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	}
>  
>  	igt_describe("Validate ctx_restore_mid_bb with invalid options");
> -	igt_subtest("ctx-restore-mid-bb-invalid")
> +	igt_subtest("ctx-restore-mid-bb-invalid") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore_invalid(configfs_device_fd, "mid");
> +		close(configfs_device_fd);
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	}
>  
>  	igt_describe("Validate ctx_restore_mid_bb");
> -	igt_subtest("ctx-restore-mid-bb")
> +	igt_subtest("ctx-restore-mid-bb") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore(configfs_device_fd, "mid");
> +		close(configfs_device_fd);
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	}
>  
>  	igt_fixture() {
> -		close(configfs_device_fd);
>  		close(configfs_fd);
>  	}
>  }
> -- 
> 2.50.1
> 
