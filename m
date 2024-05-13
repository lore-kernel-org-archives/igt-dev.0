Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA48C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 13:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A723210E10F;
	Mon, 13 May 2024 13:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNwjqhch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7206C10E10F
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715606408; x=1747142408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S5A7PFwYXvqfHWtSVaqDf15yQKEPDwOpQL7DWm1YWSk=;
 b=kNwjqhchMWQLjvqW+Ex14KzyFUhxJX6gKqQ7eM/wODI0Qur3cGLDev2Z
 d1dyhECSLf6h4UbHzYbC45i9bD1NalPkpD4lPAjqup55R4j7L3JXEflzd
 tXHZwe403urYKUv01xsXxSqn/fo2Oh//ogAXG9AJiuFjS0anL2X/Qk7eV
 nJr4Ojw9oOL8AzMlWFakPxjP1EXmbgQPRssxzSJykzYD7nG6t5S8XO41i
 nZErhTIn4GcSB5BS9P90ySkK3+AhPfh6Hv2GI93T8I32ZwLjdnqLKPkPA
 yW6EBTV0fWSTdo3cWUyfyDoejfx7b+WGlJbs5tNHmoG6cY1AyYnI+lZ0q Q==;
X-CSE-ConnectionGUID: QMicp6bhTAGUyPmRVxUVZA==
X-CSE-MsgGUID: CNtMSPjhTaSbMUKAG6JdwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15353739"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="15353739"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:19:34 -0700
X-CSE-ConnectionGUID: P/hGdebKSo2H/P6yVqk7Rw==
X-CSE-MsgGUID: QXoo0/uqSGu9m3Inn1/kqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34887873"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 06:19:32 -0700
Date: Mon, 13 May 2024 15:19:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 brian.welty@intel.com, tomasz.mistat@intel.com, himanshu.girotra@intel.com
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_exec_fault_mode: account for
 EBUSY in support check
Message-ID: <20240513131929.ia4ugeavkvzz5zsc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 brian.welty@intel.com, tomasz.mistat@intel.com,
 himanshu.girotra@intel.com
References: <20240510182438.3178575-1-jonathan.cavitt@intel.com>
 <20240510182438.3178575-3-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510182438.3178575-3-jonathan.cavitt@intel.com>
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
On 2024-05-10 at 11:24:38 -0700, Jonathan Cavitt wrote:
> It's possible for xe_supports_faults to return false if the system is
> busy with multiple running tests.  This is because the check looks for
> all active VMs and searches for VMs that do not have faults enabled,
> returning false if any exist.  Recently, this check has been changed to
> return EBUSY when the check fails in this way, so wait for up to two
> seconds for all the active VMs to flush out before proceeding.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 0b3f4cb8de..4f55756e92 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -406,8 +406,18 @@ igt_main
>  	int fd;
>  
>  	igt_fixture {
> +		struct timespec tv = {};
> +		bool supports_faults;
> +		int ret;
> +		int timeout = igt_run_in_simulation() ? 20 : 2;
> +
>  		fd = drm_open_driver(DRIVER_XE);
> -		igt_require(xe_supports_faults(fd));
> +		do {

Could you add here a few ms wait here?
    if (ret)
            wait 5 miliseconds;

With or without it,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +			ret = xe_supports_faults(fd);
> +		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < timeout);
> +
> +		supports_faults = !ret;
> +		igt_require(supports_faults);
>  	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -- 
> 2.25.1
> 
