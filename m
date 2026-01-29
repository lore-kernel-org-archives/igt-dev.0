Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24BAD6100B
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 11:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B4710E102;
	Thu, 29 Jan 2026 11:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYwzw2+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CC610E102
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769687277; x=1801223277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gShU9nD8q6OfOMogIEU8LJwdqoTiiiAFEdXWtdP/qn8=;
 b=OYwzw2+vBG2Nlj2fuV6uckwXawRAeblEXuP9lhpdXGgjeuqanIlFt6E1
 6iRxl2QbPXXTCFAmwpTcz/eYzY5/pLV46X1Kacwzjbdok1TZrCKvUUOY4
 JaqisKgI0n72xVQgbiQyN4Tm64Xw4B8F3/B0GAxj2YLL0/aTuv+whkZJm
 NDMoB1p2Dc0lxxWvJ6kW+p9zZP+ea/A+1VkqTBaN3al1KtMxoBhT0lEbo
 2BTPmcO1O7ZpT3UFFIgXv8949HWiVT7FJRN8YusJxBTI5DwQcSkPG+qhc
 xDO5U0MfchT0xInitkhZrFAvYUd5OA/DY4QzCEt3x8Olo4nyAoHAz6jrw g==;
X-CSE-ConnectionGUID: uu6TZnegQYuiEQfjZSzMvg==
X-CSE-MsgGUID: 4x8qGANqR4+GYsCvELp/BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74774455"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="74774455"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:47:57 -0800
X-CSE-ConnectionGUID: xj6GZKJ3QKOAzJLT1E8Jqg==
X-CSE-MsgGUID: qKFrv2CGShCdB35CbvJS7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208917042"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:47:54 -0800
Date: Thu, 29 Jan 2026 12:47:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com
Subject: Re: [PATCH] lib/xe_gt: Handle unknown C-state
Message-ID: <20260129114752.nk3aqzrzhd6jvtof@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com
References: <20260129105938.1114574-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129105938.1114574-2-sk.anirban@intel.com>
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
On 2026-01-29 at 16:29:39 +0530, Sk Anirban wrote:
> When GT C-state reads as "unknown", return false with a debug
> message instead of silently failing the "gt-c6" comparison.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  lib/xe/xe_gt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index ed19bec74..9164c4e3c 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -220,6 +220,11 @@ bool xe_gt_is_in_c6(int fd, int gt)
>  	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
>  	close(gt_fd);
>  
> +	if (!strcmp(gt_c_state, "unknown")) {
> +		igt_debug("GT %d C-state is unknown\n", gt);
> +		return false;
> +	}
> +
>  	return strcmp(gt_c_state, "gt-c6") == 0;

If you want a debug on failure, why not print it:

	if (!strcmp(gt_c_state, "gt-c6"))
  		return true;

	igt_debug("GT%d C-state is %s\n", gt, gt_c_state);

	return false;

Regards,
Kamil

>  }
>  
> -- 
> 2.43.0
> 
