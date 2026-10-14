Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C9ACC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 13:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA71710FE30;
	Wed, 14 Oct 2026 13:55:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D0010FE22
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791986065; x=1823522065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qzE9srWA2Z4ZKHnobYOeJ8rJZBLGHUxE2VIb5PjHF/U=;
 b=HTThxGw/20e9g2OQBjuyy2MQfKiBb+BCoLc8DZT/1ZChy0RMmB17udRZ
 2m8FjPWnC4xlKdtv8Oq/Oc0AODVl5eWHWpIrOGgw11dpEc+GrDv/zrKU7
 kcxhWpVGPMeG9D43KZ0ThecaXPgeaDHz6dTwuxOIG5aaMImQ1NfK1eyax
 ufiMngxKbWRrKFJX4n04zxYrJ/mG3aXmH8DAuZTgP0zHHdAzZRqFzL3fp
 RKI8VHCcyIw2gLGTxuRtt1HbSaCJdjy68YELA6dh902ozKmdYTuFxRZ8c
 MX2ZVMHXH2qk47UxHjAHBM7c3iUmAsFPckRImYQirCUUVLa1dDCT/Z9Sp A==;
X-CSE-ConnectionGUID: tFwarz6aRX6GMs2Fd4HWmw==
X-CSE-MsgGUID: kzC0mlJtRWezVXNzgZyzbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="740076"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="740076"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:54:25 -0700
X-CSE-ConnectionGUID: 7ljPzloETg6I32QBRFaUNA==
X-CSE-MsgGUID: cw3veeU4S/y5fnUuHQLyhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1756779"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:54:17 -0700
Date: Wed, 14 Oct 2026 15:54:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 vinay.belgaumkar@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Nishit Sharma <nishit.sharma@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH] tests/intel/xe_wedged: ignore expected CORE_COMPUTE
 error in dmesg
Message-ID: <20261014132143.k3z6i2aqzsv3cnyi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 vinay.belgaumkar@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Nishit Sharma <nishit.sharma@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
References: <20261014115047.352174-2-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014115047.352174-2-mallesh.koujalagi@intel.com>
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

Hi Mallesh,
On 2026-10-14 at 17:20:47 +0530, Mallesh Koujalagi wrote:
> Wedge tests intentionally force a GT reset failure, which can trigger
> a CORE_COMPUTE hardware error (SIGID=203) in dmesg.
> 
> Ignore this expected error so igt_runner does not treat it as a test
> failure.
> 

Add cc before your s-o-b, also add few more devs found by git blame,
so also +cc  

Nishit Sharma <nishit.sharma@intel.com>
Shuicheng Lin <shuicheng.lin@intel.com>

> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_wedged.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 4f5197e2a..fe8ea6969 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -54,7 +54,8 @@ static void ignore_wedged_in_dmesg(void)
>  				    "|EngineClass: [0-9]+ [a-z]+"
>  				    "|EngineInstance: [0-9]+"
>  				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
> -				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error");
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
> +				    "|SIGID=203");
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  }
>  
>  static void force_wedged(int fd)
> -- 
> 2.48.1
> 
