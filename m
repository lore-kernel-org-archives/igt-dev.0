Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2F7C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 10:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E553710E81C;
	Thu, 17 Jul 2025 10:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9ne/EDU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51AF10E7FB
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752749058; x=1784285058;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PMu5HGbCEIzBwTwa4nZqcrx+RlkvEie5kxHGgOJBGBw=;
 b=R9ne/EDUbDA4y9L0tHY/JvIhEj/AEpjex7oCmvB8OAKhmVykGRwBNV93
 JOlEIHwG6IPPFxjPICLlPNVG0rE153Nf4kDPGeSf/QOu1kjE9DHpvxMNR
 k6OD64Bi7zS1d3rzm8aZjSx/n5Bo+AglTN2q0su2VkP2KSajCkZUGYskt
 TejJvSewUpVcV32UnoE8PDoxRapgBeREJbZubt20bS3kc9ikaU9XD5UZ7
 a1asPmZ7ZJ9d0zLSZltDQiizkYiaT7gZ2vPW1KywgyAKoQP+Fk9slV4mp
 qC04tmK27vMuk0s+p14oBY35Rt9pRKAWQS5S3HNSn1BDTb3P51adU06Z9 Q==;
X-CSE-ConnectionGUID: w3hy2ZIRSveoyl5umDFfGw==
X-CSE-MsgGUID: ARmXsfvwT1egjA/lHq4W9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54893309"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="54893309"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 03:44:18 -0700
X-CSE-ConnectionGUID: pkaEKvIWQtayzPn/fLXr/A==
X-CSE-MsgGUID: qZVEQ9H8S7aY9nRDrB96hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="158119255"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 03:44:16 -0700
Date: Thu, 17 Jul 2025 12:44:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pranay Samala <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_sysfs: Remove redundant variable assignment
Message-ID: <20250717104400.khgbp6oy5atpthif@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20250716132752.1279098-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250716132752.1279098-1-pranay.samala@intel.com>
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

Hi Pranay,
On 2025-07-16 at 18:57:52 +0530, Pranay Samala wrote:

as Ashutosh pointed out, this is a fix, as code was printing a var
which has no assigned value. Please improve subject, for example to:

[PATCH i-g-t] lib/igt_sysfs: Fix mask printing


> Eliminate redundant assignment in debug mask setup.
> Simplified the logic by directly using the input
> parameter for logging and sysfs operations.

Improve also description, for example:

Remove variable which is printed but has no assigned value.

> 
> Fixes: 835f38b71973 ("lib/igt_sysfs: Update new debug mask requested by user")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_sysfs.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index aec157b5b..96ca57ed9 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -506,7 +506,6 @@ void igt_drm_debug_mask_reset_exit_handler(int sig)
>   */
>  void igt_drm_debug_mask_update(unsigned int mask_to_set)
>  {
> -	unsigned int new_debug_mask;
>  	static bool debug_mask_read_once = true;
>  	char buf[20];
>  	int dir;
> @@ -525,8 +524,8 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
>  		}
>  	}
>  
> -	igt_debug("Setting DRM debug mask to %d\n", new_debug_mask);
> -	snprintf(buf, sizeof(buf), "%d", new_debug_mask);
> +	igt_debug("Setting DRM debug mask to %d\n", mask_to_set);

When printing to screen imho it is better to use hex values,
as these are bits, so please use '0x%x' instead of '%d'

If you will make this change please also describe it in commit
message, for example:

Also while at this, print it's value as hex as this is bitmask.

Regards,
Kamil

> +	snprintf(buf, sizeof(buf), "%d", mask_to_set);
>  	igt_assert(igt_sysfs_set(dir, "debug", buf));
>  
>  	close(dir);
> -- 
> 2.34.1
> 
