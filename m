Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CDED3B7F2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 15:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6373310E139;
	Mon,  8 Dec 2025 15:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huAaXic5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D2E10E139
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765206674; x=1796742674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k48ocUE1F8x8f52/SfIGFUu5b1z8J63ECcUIqjfgszU=;
 b=huAaXic5fRmPKlFshWUpJr1yYHKzdOflvY+CbQJO89ud5VYhkU2dqryv
 gKUBUXt1iAZGeOofjjanS5TChuztL6GxogTYmsO7AJNK42qbtmjvvBuak
 1iZY5BsgRB2S7ciMnLOk7lmjz8KlUkRUevisuhuF4bYvJ8SzYcNG6BhTH
 U2RkuMAXZI3cNRQDmc876f62RdbdUvxuekzWkRi1fV0VjxeNi9U/ZFoYS
 ByIhcSY3quaZJC9OKuJV6uo/9Dw60UTLuPjEwzeGI1CYgNwIrJ6iaf6VM
 LK3YVMRYnDqlgqn665fGVBl1GB5Y1Jge0NU9ahCgXeagKSm1yqhdT6VjS Q==;
X-CSE-ConnectionGUID: MQI0rKHKRM2LMOPPX2fUdg==
X-CSE-MsgGUID: +uzat8PwQa+KqwPfJgSxgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="70767726"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="70767726"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 07:11:13 -0800
X-CSE-ConnectionGUID: jwkyYrigT6ywYzZ5RzfUfA==
X-CSE-MsgGUID: ZLGihr1MSI+yvjFTdkoy/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="195568302"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 07:11:10 -0800
Date: Mon, 8 Dec 2025 16:11:07 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v2 1/2] tests/intel/xe_gt_freq: Modify test to support
 new throttle reasons sysfs
Message-ID: <aTbqi7ZQO0IZjXdE@black.igk.intel.com>
References: <20251204062428.401397-4-sk.anirban@intel.com>
 <20251204062428.401397-5-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204062428.401397-5-sk.anirban@intel.com>
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

On Thu, Dec 04, 2025 at 11:54:30AM +0530, Sk Anirban wrote:
> Change throttle_basic_api to read the new atomic reasons attribute
> instead of checking status and individual reason files separately.
> This validates the kernel's TOCTOU-free throttling interface.

...

> +	char *throttle_reasons;
> +	int sysfs_fd;
> +
> +	sysfs_fd = xe_sysfs_gt_open(fd, gt_id);

This is actually gt_open so let's use gt_fd for consistency.

> +	igt_assert_lte(0, sysfs_fd);
> +
> +	throttle_reasons = igt_sysfs_get(sysfs_fd, "freq0/throttle/reasons");
> +	igt_assert(throttle_reasons);
> +
> +	igt_debug("gt%d/freq0/throttle/reasons: %s\n", gt_id, throttle_reasons);
> +
> +	if (strcmp(throttle_reasons, "none"))
> +		igt_info("GT %d is being throttled due to reasons: %s\n", gt_id, throttle_reasons);

I'm wondering if we should print the results explicitly and drop the
duplicate igt_debug() above? I'll let you decide which message to use :)

Raag

> +	free(throttle_reasons);
> +	close(sysfs_fd);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
