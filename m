Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601A1C83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 13:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157EC10EA57;
	Fri, 11 Jul 2025 13:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdaboME3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A3A10EA57
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 13:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752240482; x=1783776482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fgCLiDXJuczWhFcR8RSm5sF+v3iPYl2/DfOvVkCEyGQ=;
 b=kdaboME3p+WYYRRWezr7Wji+FG3sE1NoBFMp0tLSTng0M6WwSNfV1kq2
 9P1OjQLyNsLW1jv4V9llCLE49ll4yZKTt1tCSwFQ3saHC7oTARYoeFSzX
 02+TLcQ3CsCo58uXuVXOHVPerKerG/1Nh0SA/ITqA9Za2dmt8Y8hixCnO
 idVubzjOGeYY0PVnJNwlIh6euovAAGNltP5La7O73N+cJ4/YAVV0CURUq
 hJyNCe8VBwAwoGDun0S+qmI3OQaqpimLWET0mrSzDQxEv6WmAhUlvj3rk
 qmvJJXQp9myOkY0sXCVH+Ly0XkhpNgQFd/jO5W63cnAPUibOMjopjEuz1 g==;
X-CSE-ConnectionGUID: oJBWz+LWSMOOmJCB5CZTzQ==
X-CSE-MsgGUID: J/voIcD4QbedKkcUUjwMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54667010"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54667010"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 06:28:02 -0700
X-CSE-ConnectionGUID: 0tGpFFPVSjSzq23k955q/g==
X-CSE-MsgGUID: At7soz+OShStoR1yGcAaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="156156100"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 06:28:00 -0700
Date: Fri, 11 Jul 2025 15:27:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe: Fix usage of xe_dev_max_gt() for array
 allocation
Message-ID: <20250711132757.4l3gjlqfyuyl7dh4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250710-fix-use-of-xe_dev_max_gt-for-array-allocation-v1-1-4b255bba56d8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710-fix-use-of-xe_dev_max_gt-for-array-allocation-v1-1-4b255bba56d8@intel.com>
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

Hi Gustavo,
On 2025-07-10 at 17:53:10 -0300, Gustavo Sousa wrote:
> The function xe_dev_max_gt() returns the maximum GT ID. Because the ID
> is zero-based, if we want to allocate an array that can hold positions
> for all possible GTs, we need to take xe_dev_max_gt() + 1.
> 
> Fix the current allocations to conform to that.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Fixes: edd059dcd652 ("tests/xe: Don't assume max GT ID is num_gt - 1")
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_gt_freq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 2c90804282c9f9f2ca5cfd0ddc1c7b9f01410225..d0f35b10a5fe4b09779ca8120120b22c98477b44 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -408,8 +408,8 @@ igt_main
>  		max_gt = xe_dev_max_gt(fd);
>  
>  		/* The defaults are the same. Stashing the gt0 is enough */
> -		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * max_gt);
> -		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * max_gt);
> +		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
> +		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * (max_gt + 1));
>  
>  		xe_for_each_gt(fd, gt) {
>  			stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
> 
> ---
> base-commit: eacde5c2acc37c1570e27b68b8b6c39d8b61fb32
> change-id: 20250710-fix-use-of-xe_dev_max_gt-for-array-allocation-e8400cce536c
> 
> Best regards,
> -- 
> Gustavo Sousa <gustavo.sousa@intel.com>
> 
