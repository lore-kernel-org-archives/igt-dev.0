Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E804D10F53
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 13:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C391610E274;
	Wed, 26 Nov 2025 13:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4OSckIl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F208710E274
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764165513; x=1795701513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bAHcKkiO0wVx5HfnM8VTQRbNs1WamqXZkp3auiXI1LQ=;
 b=K4OSckIlvyUjD2A9sI+geI5LHJ9XhcktXTFI2CZf+hYI/DT7uUUeUWu7
 f8GN/TjyNchw5Nj/WqM7y7pVrdVAOw0lgzc15GwFToYdev0HFePc5GFVb
 yb8RYLFEJjE5TgL8XU3cK9QudI8GcUUm0HbLafQP34PNU3nAeT3Z5uxBw
 v4spmhE21ZEZrPLa0vo4iD/7vRfdhG1bTO5Jge0B3+h5daicmFrrcW1Rv
 0P86onVbR5LuhdqNVjRjbRfk/bAd/zNtORqipOmF87G99/Anv+RfOEd7Y
 VS26aGlmIlXUcqz/iptvflBf0UYxLgRDWlDT2E+nY+9pYvsmELI914bLH g==;
X-CSE-ConnectionGUID: wCi+zNpSQYiEOWCMOMeVkQ==
X-CSE-MsgGUID: UvzuGXeKRF2bbgWjjJxbVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83595315"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="83595315"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 05:58:32 -0800
X-CSE-ConnectionGUID: +HDQ4v9zRi6LRt4x9EMKZg==
X-CSE-MsgGUID: +Bmm3JtKQqurMP4ksat+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="198054691"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 05:58:30 -0800
Date: Wed, 26 Nov 2025 14:58:27 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH] tests/intel/xe_gt_freq: Modify test to support new
 throttle reasons sysfs
Message-ID: <aScHgw56ElfJUFKV@black.igk.intel.com>
References: <20251121114947.3946699-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121114947.3946699-2-sk.anirban@intel.com>
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

On Fri, Nov 21, 2025 at 05:19:48PM +0530, Sk Anirban wrote:
> Change throttle_basic_api to read the new atomic reasons attribute
> instead of checking status and individual reason files separately.
> This validates the kernel's TOCTOU-free throttling interface.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/xe_gt_freq.c | 45 ++++++++++++----------------------------
>  1 file changed, 13 insertions(+), 32 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index d0f35b10a..30e359a47 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -47,48 +47,29 @@ static bool within_expected_range(uint32_t freq, uint32_t val)
>  		(freq >= val - FREQ_UNIT_MHZ);
>  }
>  
> -static uint32_t get_throttle(int fd, int gt_id, const char *throttle_file)
> +/**
> + * SUBTEST: throttle_basic_api
> + * Description: Test basic throttle API
> + */
> +
> +static void test_throttle_basic_api(int fd, int gt_id)
>  {
> -	uint32_t val;
> +	char reasons[1024];

A bit too optimistic? :D

Let's use only what we need.

>  	char throttle_attr[40];
>  	int gt_fd;
>  
> -	snprintf(throttle_attr, sizeof(throttle_attr),
> -		 "freq0/throttle/%s", throttle_file);
> +	snprintf(throttle_attr, sizeof(throttle_attr), "freq0/throttle/reasons");
>  	gt_fd = xe_sysfs_gt_open(fd, gt_id);
>  	igt_assert_lte(0, gt_fd);
>  
> -	igt_sysfs_scanf(gt_fd, throttle_attr, "%u", &val);
> +	igt_assert(igt_sysfs_scanf(gt_fd, throttle_attr, "%1023s", reasons) == 1);

Can this be igt_assert_eq()?

> -	igt_debug("gt%d/freq0/throttle/%s: %u\n", gt_id, throttle_file, val);
> +	igt_debug("gt%d/freq0/throttle/reasons: %s\n", gt_id, reasons);
>  
> -	close(gt_fd);
> -	return val;
> -}
> +	if (strcmp(reasons, "none") != 0)

Do you need '!= 0'?

Raag

> +		igt_info("GT %d is being throttled due to: %s\n", gt_id, reasons);
>  
> -/**
> - * SUBTEST: throttle_basic_api
> - * Description: Test basic throttle API
> - */
> -
> -static void test_throttle_basic_api(int fd, int gt_id)
> -{
> -	uint32_t status, reasons;
> -
> -	status = get_throttle(fd, gt_id, "status");
> -	reasons = get_throttle(fd, gt_id, "reason_pl1");
> -	reasons |= get_throttle(fd, gt_id, "reason_pl2");
> -	reasons |= get_throttle(fd, gt_id, "reason_pl4");
> -	reasons |= get_throttle(fd, gt_id, "reason_prochot");
> -	reasons |= get_throttle(fd, gt_id, "reason_ratl");
> -	reasons |= get_throttle(fd, gt_id, "reason_thermal");
> -	reasons |= get_throttle(fd, gt_id, "reason_vr_tdc");
> -	reasons |= get_throttle(fd, gt_id, "reason_vr_thermalert");
> -
> -	if (status)
> -		igt_assert(reasons);
> -	else
> -		igt_assert(!reasons);
> +	close(gt_fd);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
