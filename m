Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D22C61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 11:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE0410E61B;
	Wed, 11 Jun 2025 11:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJ/dl3qM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C00110E61D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749640160; x=1781176160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q2kkXaKUHtRnQSj66D4vJS/SExXo8JajKdr1uVXPGtQ=;
 b=FJ/dl3qMn++TFzM2EKBVepbOJPRjXyzY6k7nzzXTs85NhfiVPE763kzI
 63n1R/nxcxwuJZLMOTM6c3GUhSwB9eMwlzymWP1sZUsjRB3M3vLjxl2xb
 sIoWcJ3OSYgNytpPOE28mvmrvl0uQt2xzvJcJx3yHFWjZK9nWrtSxxJO2
 6658FYs9z9OkMJMRaeOJdZGcDmVEQmF4jsDcwPy/ybLx/hOey5N1uDg5H
 uCx7rnLwTwlmR3ik7EZuA150Sp7QmnC5uhhyAKX0X7Of5M+0q4HC9gy6+
 rR4gHhcJ1DPRpNzqWrBfW4isDQLPyAnoSP9ohznw4tKWskFzwgzCQ9vpI g==;
X-CSE-ConnectionGUID: wAs+c8HHSyqDPly75TZ+ow==
X-CSE-MsgGUID: IlT/EMmtRmqR0uMU1UOeQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51865855"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51865855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:09:20 -0700
X-CSE-ConnectionGUID: FfmzuwmvRUuB/18sS+Ba0A==
X-CSE-MsgGUID: X6Usj+20QRudxK4UBsJEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="152057920"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:09:18 -0700
Date: Wed, 11 Jun 2025 13:09:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 23/43] lib/igt_device_scan: Allow to find device
 by sysname
Message-ID: <20250611110916.ixunwvqyyxl6zp2m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250313173318.5818-1-jose.exposito89@gmail.com>
 <20250313173318.5818-24-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313173318.5818-24-jose.exposito89@gmail.com>
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

Hi José,
On 2025-03-13 at 18:32:58 +0100, José Expósito wrote:
> The VKMS driver allows to create multiple devices handled by the same
> driver but with a different sysname.
> 
> In order to differentiate between them, allow to find devices by
> sysname.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Please rebase your series as few of configfs changes got merged.

Also for this change +cc Zbigniew
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Regards,
Kamil

> ---
>  lib/igt_device_scan.c | 22 ++++++++++++++++++++++
>  lib/igt_device_scan.h |  2 ++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 711bedc5c..5cbd347a3 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -231,6 +231,7 @@ struct igt_device {
>  	char *subsystem;
>  	char *syspath;
>  	char *devnode;
> +	char *sysname;
>  
>  	/* /dev/dri/... paths */
>  	char *drm_card;
> @@ -664,6 +665,7 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev,
>  	idev->syspath = strdup_nullsafe(udev_device_get_syspath(dev));
>  	idev->subsystem = strdup_nullsafe(udev_device_get_subsystem(dev));
>  	idev->devnode = strdup_nullsafe(udev_device_get_devnode(dev));
> +	idev->sysname = strdup_nullsafe(udev_device_get_sysname(dev));
>  
>  	if (idev->devnode && strstr(idev->devnode, "/dev/dri/card"))
>  		idev->drm_card = strdup(idev->devnode);
> @@ -2059,6 +2061,26 @@ bool igt_device_card_match_pci(const char *filter,
>         return __igt_device_card_match(filter, card, true);
>  }
>  
> +bool igt_device_find_card_by_sysname(const char *sysname,
> +				     struct igt_device_card *card)
> +{
> +	struct igt_device *dev;
> +
> +	igt_assert(card);
> +	igt_assert(sysname);
> +
> +	memset(card, 0, sizeof(*card));
> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +		if (strcmp(dev->sysname, sysname) == 0) {
> +			__copy_dev_to_card(dev, card);
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * igt_device_get_pretty_name
>   * @card: pointer to igt_device_card struct
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 92741fe3c..2a61777b0 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -92,6 +92,8 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_integrated_card(struct igt_device_card *card);
>  bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
> +bool igt_device_find_card_by_sysname(const char *sysname,
> +				     struct igt_device_card *card);
>  char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
>  int igt_open_card(struct igt_device_card *card);
>  int igt_open_render(struct igt_device_card *card);
> -- 
> 2.48.1
> 
