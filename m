Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4B8EA3C5D
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 13:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D691110E7F0;
	Thu,  9 Apr 2026 13:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etJx55+2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7BD10E7F0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775741003; x=1807277003;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JLSSitV2hRO4/XT8L8uH0mGS5fBz2GHcyR9R+Vuu83U=;
 b=etJx55+2/9WAyWaArQYOdpAL9Yh2nfTk8oM5iAo6krAmG1EFXs4jhPmx
 sLos1GShfohCpwixP7wD1ndczeQSIoJjpveatsGQXyd0HT+jNYmRhMXD5
 uSIt5fJb+QOSXXpDD3H6j6Z1ExksUvvJsM//r2tzQ1kd3QWsKSOmeILgJ
 2biVtVPGtum6QBt0mHfuk2+90a+mR6BlpxnjKQlFdTNjvaEcQTMqIRrf2
 udiWmRPCtosDzZfQdgmOc1FM/NGQiCl7i4zsdUkUAxj4hOUsdq/jWv+Co
 xsOke43p9IUUEQclZOhPcVGu881IawYCVAD2YSweaQjfCtSnuc6wsClY8 g==;
X-CSE-ConnectionGUID: kNl68uCzTSeIKp/dZfJStg==
X-CSE-MsgGUID: tXRD2D1tTJCwnsE6JWkS6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87819797"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87819797"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 06:23:23 -0700
X-CSE-ConnectionGUID: t9MecuyCR4WzAHcVMhoAqA==
X-CSE-MsgGUID: pnnS241aQSunhcU+6Pp85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="230441098"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:23:21 -0700
Date: Thu, 9 Apr 2026 15:23:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org, Soham Purkait <soham.purkait@intel.com>
Subject: Re: [PATCH] tools/gputop: Fix zero output when stdout is not a
 terminal
Message-ID: <20260409132304.pchgqzvvrru2evfg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Vidya Srinivas <vidya.srinivas@intel.com>,
 igt-dev@lists.freedesktop.org,
 Soham Purkait <soham.purkait@intel.com>
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

I checked and

./gputop -n10 -d0.1 > out

works perfectly fine.

> (e.g., on Android), update_console_size() calls ioctl(0, TIOCGWINSZ)
> on stdin which may not be a terminal. If stdin is a pipe or
> redirected, the ioctl returns -1 and con_w/con_h remain at their
> initial value of -1.

Adding few more nits to what Soham wrote, it could be
shortened a little here to something like:

When gputop is run via adb shell on Android, it could have no
terminal, so calls ioctl(0, TIOCGWINSZ) will return -1 and
function update_console_size() will not fill con_w/con_h.

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

Please add to Cc developer which did a review.

> 
> v3: Initialize defaults in main() instead of adding fallback logic
>     in update_console_size() (Soham Purkait)
> 

So here:

Cc: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>

You could keep my r-b, so this will be:

Cc: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Please keep only one r-b, also imho when you change your code
from version 1, when you got r-b, to another version, and that
new one did major changes then imho you should remove r-b from
your patch. Here it was small change and rather trivial but
please keep that in mind for future development.

Imho you do not need to send new version, please just discuss
with Soham and agree on final description.

Regards,
Kamil

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
