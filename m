Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027BEF5A8AA
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 18:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDF210E752;
	Mon, 20 Apr 2026 18:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2uQbdMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705B810E182
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 18:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776709556; x=1808245556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FwQKHi92nyfXzOxNeMJnrtuRn+7E+B5a5DKy5w0TdJ4=;
 b=b2uQbdMbS8xR1OQyA7v4+k/B9XzRL8/8na1fLDgmNo5hySgppcnZr/IT
 Qk+6oeoYdE7XO+QXtYEwFDg6SOacKHIvYXPTj4+A+85SqJvF0qwMQpKH1
 w1MErzcP7RV3OVQ/IArdc9S8ve9Sz/L4zS9Ld/Dffun8zPXJEKZT3P/Fs
 Ygc6HpPFOHQVyk8F+kXA9yCJnkJ9q/X0dxJ943qSLJwf2xdcVgOz1JPBs
 k8kETW4/3k6zGgOtXRPKl73+i5a5cOT06RRyVWC7TWwv6yEtoPGV65Dal
 Tyz3McJ144vhTVJtqzj7Fl/njLCtzhi7p62n+jlb7u/Az7+hff3em6Vlg g==;
X-CSE-ConnectionGUID: nOYs7agATgmQY0Ije+kIYw==
X-CSE-MsgGUID: WaDqTwhaQ2OxvSnkvglTbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77545994"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="77545994"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 11:25:55 -0700
X-CSE-ConnectionGUID: KBILTd5ZRcK6AX1Db7Cgew==
X-CSE-MsgGUID: w6HLMMHqRnKpt5BrlFxWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="232074742"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 11:25:54 -0700
Date: Mon, 20 Apr 2026 20:25:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel: ctx_restore rollback on invalid input
Message-ID: <20260420182551.whmhkdkvhv356xus@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260420063816.1054855-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420063816.1054855-1-smitha.balasubramanyam@intel.com>
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
On 2026-04-20 at 12:08:16 +0530, Smitha Balasubramanyam wrote:

sorry for second mail, one more nit. When you modify only
one test please use its name as a prfix, so here, instead of

[PATCH] tests/intel: ctx_restore rollback on invalid input

write something like:

[PATCH] tests/intel/xe_configfs: Fix ctx_restore_*_bb rollback

Regards,
Kamil

> Add a test vector with a partially invalid second command in the
> ctx_restore_*_bb invalid-case suite to ensure a malformed multi-line
> BB is rejected and the stored BB remains empty (rollback).
> 
> Replaced the hardcoded "ctx_restore_post_bb" write with the computed
> file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
> invalid-case tests work for both "post" and "mid" variants.
> 
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> ---
>  tests/intel/xe_configfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 755524e7c..97ea95da8 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -225,12 +225,16 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>  		{ .test = "invalid-engine-instance",
>  		  .in = "rcs0 reg 4F100 DEADBEEF",
>  		},
> +		{ .test = "invalid-second-command",
> +			.in = "rcs cmd 11000001 4F100 DEADBEEF\n"
> +				"rcs cmd 11000001 4F10G DEADBEEF",
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
