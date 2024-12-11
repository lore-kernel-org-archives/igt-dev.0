Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952F8E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 09:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E3C10EADD;
	Wed, 11 Dec 2024 09:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6j9+rbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D576C10EADD
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 09:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733910464; x=1765446464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TWUv7cUHJVLtUcNUKPhDVjNGEnkSv4rcGMztcdZoiDE=;
 b=e6j9+rbq+cwjpGThhy/+qEvgYsyoG/ZvXVZ1xvoijAqUavYyZS9bDH/g
 PwdjSqSSopEKkk0IWmLqTZW5Cuy6ghLLNWk0E6EGDKhj5RkMALb1PypLn
 UzrT3xI6XbMTuyVwqak0hGJm04r0YL5b9ELcQEKs7/S+09K8uKHpT5kJ3
 5mN2h6iqH7Noj6dpcYxWHeYlEKKn2j7ZLQLhUt3K/QMMV3vWo6g0GtK40
 Ybqso+svFlLJNwg6MC6LovIjV9IZaB4W9NfimDoF/mp6GLCAtE9Fn6+j7
 3ZLzCMYVjoIQeMBMNNcuoc5epo5WLwKyDRFesIh1XxfSHZrjkG7OxUYGw g==;
X-CSE-ConnectionGUID: r7By8oGVQiix6nM1AkKaHw==
X-CSE-MsgGUID: 8ArgHw2QSUK4RNFYT0mhJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34408442"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="34408442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:47:43 -0800
X-CSE-ConnectionGUID: jRuXbk9qTnC1OXlLiDE18A==
X-CSE-MsgGUID: 3M2Hve/uT9yOS2KuHHTRNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126667098"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:47:38 -0800
Date: Wed, 11 Dec 2024 10:47:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: george.zhang@amd.com
Cc: igt-dev@lists.freedesktop.org, santhosh.reddy.guddati@intel.com,
 sunpeng.li@amd.com, chiahsuan.chung@amd.com, alex.hung@amd.com,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH] tests/kms_async_flips: Only check joiner mode on intel
 device
Message-ID: <20241211094735.ccewia6ietiifx3k@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 george.zhang@amd.com, igt-dev@lists.freedesktop.org,
 santhosh.reddy.guddati@intel.com, sunpeng.li@amd.com,
 chiahsuan.chung@amd.com, alex.hung@amd.com,
 Jeevan B <jeevan.b@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20241210223903.954518-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210223903.954518-1-george.zhang@amd.com>
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

Hi george.zhang,
On 2024-12-10 at 17:39:03 -0500, george.zhang@amd.com wrote:
> From: George Zhang <george.zhang@amd.com>
> 
> The joiner mode check causes the kms_async_flip tests to fail on
> non-intel devices. Added a guard to only check the joiner mode if
> running on intel device.
> 
> v2: Moved guard to within is_joiner_mode function
> 

I will add to CC devs found with git blame and in patch itself:

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil

> Signed-off-by: George Zhang <george.zhang@amd.com>
> ---
>  lib/igt_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 43ca2d4c2..3d061abc5 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6467,6 +6467,9 @@ bool is_joiner_mode(int drm_fd, igt_output_t *output)
>  	int max_dotclock;
>  	drmModeModeInfo mode;
>  
> +        if (!is_intel_device(drm_fd))
> +                return false;
> +
>  	max_dotclock = igt_get_max_dotclock(drm_fd);
>  	is_joiner = bigjoiner_mode_found(drm_fd,
>  					 output->config.connector,
> -- 
> 2.34.1
> 
