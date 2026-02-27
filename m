Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D59FEFB56
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 14:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F8610EB97;
	Fri, 27 Feb 2026 14:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKBrYi+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3919910EB78
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 14:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772201539; x=1803737539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vYlZkeDjxQc7SL4/FjZH9qaqKqmYWzJ1qeAFsGuIE6A=;
 b=iKBrYi+Qj9Gg0srOaozTq4wVF3BRpXnjZi4AUkIySgG8STrZsckr00yO
 68aWZhZHSa5+c377SVmLhtBJ0ObvtqF+kEjHL5yv+4A9nHIZ5HSFk5kDc
 FQgioJcpdMEp8yBM76LvHAOk+Yq7uRIKXADFLdweMLOuOjJwBgdE0DqVu
 VMMEo51VkTNyfmO0HzI7zfrVsnSUM1ebMLStY7rH9ORQ6LLgYfHCvoJcc
 xQt6Wkhpo62s59LsiWgbDLpVIM5gqhd9iZjNZ+qWATkuIf2S26QDLAFem
 Si8MUNtWj9GTABUZ6eLm6EP5wgF5Pco1kOGrGSWScv0fUvSnO0jpVYKTl g==;
X-CSE-ConnectionGUID: XcoCZ8RhTSOiOY7Om8QBZQ==
X-CSE-MsgGUID: +f7oKpaaQVyF6vv6RCJkPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98750059"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="98750059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 06:12:19 -0800
X-CSE-ConnectionGUID: 38QjPQLaSm6ELZELcHxKGQ==
X-CSE-MsgGUID: c+k2J7eSSGuhssFTeJCbog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="217015783"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:12:17 -0800
Date: Fri, 27 Feb 2026 15:12:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com, alex.zuo@intel.com
Subject: Re: [PATCH] tests/intel/kms: Drop unneeded igt_device_set_master calls
Message-ID: <20260227141202.b6kfzyw7ibqqugqw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com
References: <20260226231036.83942-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226231036.83942-2-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2026-02-26 at 23:10:37 +0000, Jonathan Cavitt wrote:
> In kms_fbcon_fbt, igt_set_device_master is already called on the target
> fd by drm_open_driver_master, so doing so again in the subtest function
> is unnecessary.
> 
> In kms_pm_rpm, we call __drm_open_driver and igt_set_device_master while
> asserting the return of the former is not -1.  This is already
> accomplished by drm_open_driver_master, which also has additional guards
> in place for i915, so just call that instead.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/kms_fbcon_fbt.c | 1 -
>  tests/intel/kms_pm_rpm.c    | 4 +---
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index 36de84f985..e44be15f60 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -371,7 +371,6 @@ static void restore_fbcon(struct drm_info *drm)
>  
>  static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
>  {
> -	igt_device_set_master(drm->fd);
>  	kmstest_set_vt_graphics_mode();

Please send this in separate patch.

>  
>  	igt_require(feature->supported_on_chipset(drm->fd, drm->debugfs_fd));
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 5f24fd49b1..e16218ceeb 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -750,9 +750,7 @@ static bool setup_environment(void)
>  	if (has_runtime_pm)
>  		goto out;
>  
> -	drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
> -	igt_require(drm_fd != -1);
> -	igt_device_set_master(drm_fd);
> +	drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);

This is not equivalent, __drm_open_driver() will not open second fd
for cleanup with at_exit(), so imho please drop this change.

Regards,
Kamil

>  
>  	debugfs = igt_debugfs_dir(drm_fd);
>  	igt_require(debugfs != -1);
> -- 
> 2.43.0
> 
