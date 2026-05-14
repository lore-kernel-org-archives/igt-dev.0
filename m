Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD975CD4F25
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 14:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D30510E166;
	Thu, 14 May 2026 14:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L77M6esk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4189810E166
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770578; x=1810306578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CjP2x4rtP5INOGPgZXqobURI7/Zt7o90NlxVk/ypinE=;
 b=L77M6esk7LYR+JbiPR3jIx2NfJCor0sWcSHshf8jBZvhXdmvbP39e5IL
 2AYheGvRXrj48n/lQqu2hEgvCH25OsAXTu826yHezF5epil+1wySYRn03
 jBq6GinRlskF7twiBIF/bUMRPsp9FcjMswidZRNe0QTuZG9p3yP1oK7a1
 niHZEBaX/mQY72p1jRla1HJD3byqWeoCCO4WXAM36ZEP1YnsXkCX5ycS2
 a8ftawcZYtYaPSySoXOhchVftdLXK/mss9PPnSSpZd59rMgKl9PXf/+yc
 zIp47Pm8oSi/p7faWZfKS9X+3Ir97WVWIAaJ7bYzRy2lVxA/1iVL7ZfSh w==;
X-CSE-ConnectionGUID: 10PEFXoVR7m3oAg08x5byA==
X-CSE-MsgGUID: KEKM0hmxQRO2SqekveZO7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79669742"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="79669742"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 07:56:18 -0700
X-CSE-ConnectionGUID: 4G50a+OrTwOzSGQ/UI5+zQ==
X-CSE-MsgGUID: A1NBC8BUSMOaoblKJJaLlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="238294848"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:56:17 -0700
Date: Thu, 14 May 2026 16:56:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: "Purkait, Soham" <soham.purkait@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tools/gputop: Fix zero output when stdout is not a
 terminal
Message-ID: <20260514145614.t3nrjqyyi2t2oxcz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Vidya Srinivas <vidya.srinivas@intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260402134522.108322-1-vidya.srinivas@intel.com>
 <20260407133940.134931-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407133940.134931-1-vidya.srinivas@intel.com>
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

Hi Vidya,
On 2026-04-07 at 19:09:40 +0530, Vidya Srinivas wrote:
> When gputop output is redirected to a file or run via adb shell
> (e.g., on Android), update_console_size() calls ioctl(0, TIOCGWINSZ)
> on stdin which may not be a terminal. If stdin is a pipe or
> redirected, the ioctl returns -1 and con_w/con_h remain at their
> initial value of -1.
> 
> This causes the main display loop to immediately break since
> lines >= con_h evaluates to true (0 >= -1), resulting in zero
> output being produced.
> 
> Fix this by initializing con_w and con_h to default values of
> 80 and 50 respectively, so that when ioctl fails the display
> loop still produces output with sensible dimensions.
> 
> v2: Try stdout, stdin, and stderr for terminal size before falling
>     back to defaults (Soham Purkait)
> 
> v3: Initialize defaults in main() instead of adding fallback logic
>     in update_console_size() (Soham Purkait)

Thank you all on working on this, I merged this with reworded
description.

Regards,
Kamil

> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tools/gputop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 9b2e8cb6f..0ed5af456 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -609,7 +609,7 @@ int main(int argc, char **argv)
>  	unsigned int period_us;
>  	struct igt_profiled_device *profiled_devices = NULL;
>  	struct igt_drm_clients *clients = NULL;
> -	int con_w = -1, con_h = -1;
> +	int con_w = 80, con_h = 50;
>  	int ret;
>  	long n;
>  
> -- 
> 2.45.2
> 
