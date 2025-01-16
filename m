Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3C3C02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 09:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFC410E915;
	Thu, 16 Jan 2025 09:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ci8e9U7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA10010E915
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737020505; x=1768556505;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O+YtA6pcqkya8vzvfveCNMTtYDdQItNMp4mptpXlU3Q=;
 b=ci8e9U7VsPeJfzmOisj6R3GpHnPZ50O5CuLRLobJWa6OcWIyjd5QOfuk
 UHEVzXu6yjQU4LzkoM5BSNaCUpoCzfxQpZmSX3tzNY9YKS5g68BEZ0U3I
 YY/5L4b7mSqPp2gIZI64YseraEm1Fa0FgNCvAWYmWyTKc1NTOC/jDJ51y
 12FODu1bD4/XbuLkfxBX1dDX2BzeXf+ZCA5D3OyF/14F3IAFo8leMzdNx
 366pZVAywltvmz0o1U0eWW+kh+ZRsA//ZTTFlW3cJ+1uEGa9ExQYwDTar
 4bUDTY4HuP6n8i2E52HXXC3pRxaJh7j2fxg4YWBXZRAciMJ/LFBR+cizm w==;
X-CSE-ConnectionGUID: xUKxc70hSSOuwCcRJh6LuQ==
X-CSE-MsgGUID: e7Eh5zCtS8WxIB87AnYQRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48054611"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="48054611"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:41:44 -0800
X-CSE-ConnectionGUID: DfB5lkuTSv2H3wmkRkfFgQ==
X-CSE-MsgGUID: CmExj1qDSlOUTpyCLhpEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136296985"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:41:39 -0800
Date: Thu, 16 Jan 2025 10:41:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v4] tests/intel/xe_pm_residency: Skip on igt_power_open
 failure
Message-ID: <20250116094134.w3eompshuiimjsrr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, riana.tauro@intel.com
References: <20250110212237.4052-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110212237.4052-1-jonathan.cavitt@intel.com>
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
On 2025-01-10 at 21:22:37 +0000, Jonathan Cavitt wrote:
> The xe_pm_residency@toggle-gt-c6 test fails when
> gt_c6_power >= gt_c0_power.  These values are reported by
> igt_power_get_mW, which will always report 0 in the case that
> igt_power_open fails to open either the hwmon_fd or rapl.fd.  Since the
> expected result will always be a failure in this case, skip the
> assertion that gt_c6_power < gt_c0_power.

Applied, thanks!

Regards,
Kamil

> 
> v2: Do not skip the full test, and instead only ignore the part that is
> guaranteed to fail.
> 
> v3: Use || instead of && (Riana)
> 
> v4: Reprovision
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/958
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 06f4a0bc6b..f9e96d6087 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -289,10 +289,14 @@ static void measure_power(struct igt_power *gpu, double *power)
>  static void toggle_gt_c6(int fd, int n)
>  {
>  	double gt_c0_power, gt_c6_power;
> -	int gt;
> +	int gt, ret;
>  	struct igt_power gpu;
>  
> -	igt_power_open(fd, &gpu, "gpu");
> +	/*
> +	 * igt_power_get_mW will always return 0 if igt_power_open fails,
> +	 * so skip the power check in this case.
> +	 */
> +	ret = igt_power_open(fd, &gpu, "gpu");
>  
>  	do {
>  		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> @@ -319,7 +323,7 @@ static void toggle_gt_c6(int fd, int n)
>  	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
>  
>  	/* FIXME: Remove dgfx check after hwmon is added */
> -	if (!xe_has_vram(fd))
> +	if (!(xe_has_vram(fd) || ret))
>  		igt_assert_f(gt_c6_power < gt_c0_power,
>  			     "Power consumed in GT C6 should be lower than GT C0\n");
>  }
> -- 
> 2.43.0
> 
