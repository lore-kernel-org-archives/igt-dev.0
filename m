Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA270F9EDF3
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 14:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BBB10E9FF;
	Wed, 22 Apr 2026 14:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8GyJxI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E3610E9FF
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 14:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776869669; x=1808405669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8ormo6CJGAdsf1/ne/xaCLAo2jI4IPLrXUNYI/q2VyE=;
 b=I8GyJxI9zjFEmStZlYihsxtr/TiApDS+zsqfz1aikBWgvOBHlBsQYSph
 34xO9oNUNl6AR7prJlLeeQiJVhp8FjYrYei0+yvEJd9PU00fOosRcLtCh
 Q1GnsZGuoLgC7jUa6fvLJGtSh0CcQ6P8H6GlotAKBAtZoQXFE5asBIkzv
 KDgM22b09rwiOJBlT5klvOxFtAMTMWM56H3xvq8jVyJvOs9y0c1x3EBjl
 qRUf4XC/xeQ++tJFXNV8i9dqJ/JJnkuHrxq2+8piBoaAmOZnZOXz0zFVG
 jfTf00Bp/cCejsmsloPy4P633jmTKSFZQBRkrK8kMOluz+NU4dKdlq55+ Q==;
X-CSE-ConnectionGUID: kfe7wzKBT4+LpX0qvUSPSQ==
X-CSE-MsgGUID: 5kubAwDoQs64MOjI5gct0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77739689"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="77739689"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 07:54:29 -0700
X-CSE-ConnectionGUID: MmlL4B6mTrmK6lHMu+KiTg==
X-CSE-MsgGUID: 9DybsbguTbupCHpDHxPmpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="255647775"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 07:54:28 -0700
Date: Wed, 22 Apr 2026 16:54:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2] tests/intel/xe_configfs: ctx_restore_*_bb rollback on
 invalid input
Message-ID: <20260422145426.tccr2rvobpapaboq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260420063816.1054855-1-smitha.balasubramanyam@intel.com>
 <20260422091516.1073756-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260422091516.1073756-1-smitha.balasubramanyam@intel.com>
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

Hi Smitha,
On 2026-04-22 at 14:45:16 +0530, Smitha Balasubramanyam wrote:
> Add a test vector with a partially invalid second command in the
> ctx_restore_*_bb invalid-case suite to ensure a malformed multi-line
> BB is rejected and the stored BB remains empty (rollback).
> 
> Replaced the hardcoded "ctx_restore_post_bb" write with the computed
> file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
> invalid-case tests work for both "post" and "mid" variants.
> 

Still too much changes in one patch. Please first create a fix
in first patch, then in second add new functionality.

In a fix add Fixes: tag.

Regards,
Kamil

> Changes since v1:
> - Fixed alignment issue
> - Updated commit message
> 
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> ---
>  tests/intel/xe_configfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 755524e7c..39762e030 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -225,12 +225,16 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>  		{ .test = "invalid-engine-instance",
>  		  .in = "rcs0 reg 4F100 DEADBEEF",
>  		},
> +		{ .test = "invalid-second-command",
> +		  .in = "rcs cmd 11000001 4F100 DEADBEEF\n"
> +			"rcs cmd 11000001 4F10G DEADBEEF",
> +		},
>  	};
>  	char buf[4096] = { };
>  	char file[64] = { };
>  
>  	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
> -	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
> +	igt_sysfs_set(configfs_device_fd, file, "");
>  
>  	/*
>  	 * These only test if command parsing is correct,
> -- 
> 2.43.0
> 
