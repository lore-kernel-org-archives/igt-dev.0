Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E57C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E1910E1C4;
	Wed, 22 May 2024 16:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXjuLRa5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1F310E1C4
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394586; x=1747930586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OmO7EONppXozy4kTPEHRJc95MXE9bHDNXDDfr/Rm1NU=;
 b=bXjuLRa5tSM9hzGjK4cjr6rHzKW182pHheFI7AJyXvEAAQb1nbnhuPoJ
 Wg4i993WgA27kcXv5ybmKPxHtbtXLgPYbiN7SZJSZO1AvIcdXqDiyo9w6
 xffVPqZw6uCnJzxcEJ8rnHyj02XUfnrGT8u+7NY+f5Quh+xZYHncT5Mk2
 Vx9vbsp8O4DXFqQaEo1zBE/QKlv/fQwV6QHu5lz5SpUMCDkjpc2Y33dmH
 ycTBoC879ZqxB3vy7mkf2pFvIxpv712WqzK1U/lRScDoR3KleIBCYYQxV
 ZQOf4pegfZFUaY9/2EdRjdkRrz2kgLwGEF08uIHnPAftQyYL6cm/pMY0T g==;
X-CSE-ConnectionGUID: 5ftRuVOHRjiqEbxetuNhtA==
X-CSE-MsgGUID: 6ts7bimISeivKaQLnEnuUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12777613"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12777613"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:16:25 -0700
X-CSE-ConnectionGUID: BLXqNXleQ/Wq6Wh+HBzIKg==
X-CSE-MsgGUID: UmE5BBF3QF68XG9vC7HA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="70743203"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:16:23 -0700
Date: Wed, 22 May 2024 18:16:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Shawn Lee <shawn.c.lee@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_sysfs_edid_timing: Skip the first detect
Message-ID: <20240522161606.httnpgasf37tb66y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Shawn Lee <shawn.c.lee@intel.com>
References: <20240518003345.203255-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240518003345.203255-1-khaled.almahallawy@intel.com>
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

Hi Khaled,
On 2024-05-17 at 17:33:45 -0700, Khaled Almahallawy wrote:
> It is observed in some chrome devices that the first detect take a
> long time due to PPS. In another device it was found the eDP panel
> misbehaving and keep sending multiple long HPD during PPS which
> trigger HPD storm warning. This first detect will always exceeds the
> THRESHOLD_PER_CONNECTOR and will cause the test to fail.
> 
> Avoid that by skipping the measurement for the first detect.
> Also adding more debug logs in the test and kernel to be able to
> correlate the results.
> 
> Fixes: VLK-52052, VLK-56861

Please do not write this in description.

Also look into CI report and reply to it, in replay cut it after
'Known' report begins.


> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Shawn Lee <shawn.c.lee@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  tests/kms_sysfs_edid_timing.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
> index dbc66c876..b7832dd83 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -50,7 +50,7 @@
>  #define THRESHOLD_PER_CONNECTOR		150
>  #define THRESHOLD_PER_CONNECTOR_MEAN	140
>  #define THRESHOLD_ALL_CONNECTORS_MEAN	100
> -#define CHECK_TIMES			15
> +#define CHECK_TIMES			16
>  
>  IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
>  		     "connector and fails if either the time it takes for "
> @@ -89,15 +89,25 @@ igt_simple_main
>  		for (i = 0; i < CHECK_TIMES; i++) {
>  			struct timespec ts = {};
>  			int fd;
> +			uint64_t current;
>  
>  			if ((fd = open(path, O_WRONLY)) < 0)
>  				continue;
>  
> +			igt_kmsg(KMSG_DEBUG "%s: start detect\n", path);
------------^^^^^^^^
Why not igt_debug?

>  			igt_nsec_elapsed(&ts);
>  			igt_ignore_warn(write(fd, "detect\n", 7));
> -			igt_mean_add(&mean, igt_nsec_elapsed(&ts));
> -
> +			current = igt_nsec_elapsed(&ts);
> +			igt_kmsg(KMSG_DEBUG "%s: end detect\n", path);
------------^^^^^^^^
Same here, why not igt_debug?

>  			close(fd);
> +
> +			/* Skip first detect */
> +			if(i == 0)
--------------^
Add space after 'if', so it will be:
			if (i == 0)

You could use checkpatch.pl from Linux kernel to catch similar
problems.

Regards,
Kamil

> +				continue;
> +
> +			igt_mean_add(&mean, current);
> +			igt_debug("%s: i=%d current=%02fdms mean.max=%02fms mean.min=%02fms\n",
> +				de->d_name, i, current/1e6,  mean.max/1e6, mean.min/1e6);
>  		}
>  
>  		igt_debug("%s: mean.max %.2fns, %.2fus, %.2fms, "
> -- 
> 2.34.1
> 
