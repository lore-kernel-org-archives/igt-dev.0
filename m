Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164FAC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 15:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43B910E075;
	Thu,  9 Jul 2026 15:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3iYH+Q2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC9710E075
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783609933; x=1815145933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UicrQIQFkdsSq32bkgCDyd4/6Xj9RTbaoSkgEiaLfrY=;
 b=S3iYH+Q2aneLhLZAd8hIByw24vzt+SjQOrvw05IkRobRILIE+NFhV+UQ
 kLLiKgGA9R4ReEblk3M13FKo4dWG/rSF0LV93c9S7GaNv6GU6eyz677YZ
 qEXYEO6EsWq18Z8TAsm/AZOslVSF80WpjeMORg+18HFjVyIts8gDfDnS0
 UE0pI53h9IIHIlRRaNOZ5PivHZAYve5Cbs+baIWqY2n/fxSX2tRrLvaEM
 hJFPh5IaJGIm/e5NshwccvgWzi/GolNyzNU11w74O/QUTEJW9bA0ge137
 yC8KytanzOK1M34vOvv4v8c6B8AVjY4Dp35evt8WqqGE08KNbnnHqZQuz w==;
X-CSE-ConnectionGUID: 2cWb1VeJSnWGZMmccn4TIQ==
X-CSE-MsgGUID: K9YvnNG9Twu4xl5h+42D+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88210669"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88210669"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 08:12:13 -0700
X-CSE-ConnectionGUID: TT1yLZexR1mYJeeQJFKReQ==
X-CSE-MsgGUID: +ah1bHd7RcOCVtKLB/eS7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="248245411"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 08:12:09 -0700
Date: Thu, 9 Jul 2026 17:12:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com
Subject: Re: [PATCH 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Message-ID: <20260709151204.fzvhu4voxtu3wv7e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com
References: <20260709070905.405108-4-sk.anirban@intel.com>
 <20260709070905.405108-5-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709070905.405108-5-sk.anirban@intel.com>
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

Hi Sk,
On 2026-07-09 at 12:39:07 +0530, Sk Anirban wrote:
> The kernel now reports -ENOTRECOVERABLE when the device is wedged.
> As runtime-survivability deliberately wedges the device, update
> dmesg regex so igt_runner does not treat the expected error logs
> as failures.
> 
> kernel implementation:
> https://patchwork.freedesktop.org/series/168780/
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/xe_survivability.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 74488bbea..cc54b37ad 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -43,12 +43,13 @@ static char bus_addr[NAME_MAX];
>  static void ignore_wedged_in_dmesg(void)
>  {
>  	/* this is needed for igt_runner so it will ignore it */
> -	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"

Please keep old value for some time (a year?).

> +	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ENOTRECOVERABLE"
>  				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> -				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|GT[0-9A-Fa-f]*: reset failed .-ENOTRECOVERABLE"

Same here, keep both.

>  				    "|GT[0-9A-Fa-f]*: Failed to submit"
>  				    "|Modules linked in:"
> -				    "|__pfx___drm_");
> +				    "|__pfx___drm_"
> +				    "|-ENOTRECOVERABLE");

Do not add such, it could made to ignore errors in unrelated context.

Regards,
Kamil

>  }
>  
>  static bool check_survivability_mode_sysfs(void)
> -- 
> 2.43.0
> 
