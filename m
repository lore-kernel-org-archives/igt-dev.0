Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ADDC87FD4
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 19:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFCC10E0C3;
	Thu, 29 Aug 2024 19:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8IxQGxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4657A10E0C3
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724960044; x=1756496044;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UKX8l9AqMvzAjOMwmTDjoJh3JBbwrXDvKCvlbffolXc=;
 b=M8IxQGxj1lI2bS6nQmzSP4z6Yr75LqflnF2yxDhowBY1rEuc886P1ocQ
 yAVeOgKG0BF/u2je1zL+jdqsWtCOi29/0x3yY4bRGwhXdBuaHXoTawaqM
 NsOtrDRqGSDMN4a0wX8qCpJPv5jsgBhiq0oHKk5k/E8cDOu786TsasnbL
 lsn+dohIabhBbG/9GtkBZntlIiLFSBx45owIjXNwUT55tIB6mjMmLCLFq
 /4hFOUS/8oGIRwGsRRbgqTbFm9zmMuABGw4omt5OCmwX9sO15Mpc8HEE7
 dvGUNHAZ+k5cxAW0IjOtBiXA1epDcW4zsptwmibcMzqJKMW3cxrr9Na5g Q==;
X-CSE-ConnectionGUID: XH6nRAgVQkW3Bdbs7wbSeA==
X-CSE-MsgGUID: hURaOBrbTFepSzEpb8RbCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23723330"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23723330"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 12:34:04 -0700
X-CSE-ConnectionGUID: xQ0ak4nlRp+ZbppWfP8OGQ==
X-CSE-MsgGUID: 8yKkqvq2TBSAyzeHK+uGAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68576008"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.215.119.6])
 ([10.215.119.6])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 12:34:00 -0700
Message-ID: <d382978a-5b50-4afc-9e99-3350bef08576@intel.com>
Date: Fri, 30 Aug 2024 01:03:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_rmfb: Fix subtest description
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
References: <20240201004448.351926-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240201004448.351926-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 01-Feb-24 6:14 AM, Lucas De Marchi wrote:
> Kernel driver is responsible to do those actions. kms_rmfb is then
> checking if that was true in 2 cases: a) DRM_IOCTL_MODE_RMFB was called
> or b) the file descriptor was closed.
> 
> v2: Fix swapped description (Swati)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   tests/kms_rmfb.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index 39e8bbd55..0ea689d60 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -24,7 +24,7 @@
>   /**
>    * TEST: kms rmfb
>    * Category: Display
> - * Description: This tests rmfb and close-fd behavior. In these casesthe
> + * Description: This tests rmfb and close-fd behavior. In these cases the
>    *              framebuffers should be removed from the crtc.
>    * Driver requirement: i915, xe
>    * Functionality: kms_gem_interop
> @@ -42,12 +42,13 @@
>   
>   /**
>    * SUBTEST: close-fd
> - * Description: RMFB is supposed to free the framebuffers from any and all planes
> - *              so test this and make sure it works with fd close and reopen.
> + * Description: Kernel driver is supposed to free the framebuffers from any and all planes
> + *		when the fd is closed. Ensure that is the case by closing and re-opening
> + *		it.
>    *
>    * SUBTEST: rmfb-ioctl
> - * Description: RMFB is supposed to free the framebuffers from any and all planes
> - *              so test this and make sure it works.
> + * Description: Kernel driver is supposed to free the framebuffers from any and all planes
> + *              when DRM_IOCTL_MODE_RMFB ioctl is called. Ensure that is the case.
>    */
>   
>   #ifndef DRM_CAP_CURSOR_WIDTH
> @@ -57,7 +58,7 @@
>   #define DRM_CAP_CURSOR_HEIGHT 0x9
>   #endif
>   
> -IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases"
> +IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases "
>   		     "the framebuffers should be removed from the crtc.");
>   
>   struct rmfb_data {
> @@ -198,11 +199,11 @@ igt_main
>   		const char *name;
>   		const char *description;
>   	} tests[] = {
> -		{ false, "rmfb-ioctl", "RMFB is supposed to free the framebuffers from any and all "
> -				       "planes so test this and make sure it works."},
> -		{ true, "close-fd", "RMFB is supposed to free the framebuffers from any and all "
> -				    "planes so test this and make sure it works with fd close "
> -				    "and reopen."},
> +		{ false, "rmfb-ioctl", "Kernel driver is supposed to free the framebuffers from any and all planes "
> +				       "when DRM_IOCTL_MODE_RMFB ioctl is called. Ensure that is the case." },
> +		{ true, "close-fd", "Kernel driver is supposed to free the framebuffers from any and all planes "
> +				    "when the fd is closed. Ensure that is the case by closing and re-opening "
> +				    "it" },
>   	};
>   	struct rmfb_data data = {};
>   	int i;
