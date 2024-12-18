Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73403E77183
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 06:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C683C10E1BA;
	Wed, 18 Dec 2024 06:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0ivvzwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7747C10E1BA
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734503666; x=1766039666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t0OwlzlGGj/3B/pNjo1mH3sW9VVzxRIpdjOsG8p0hak=;
 b=F0ivvzwIgEfU4MQ8+VRz8Q555+b5taywItqf5s6Y6q0dwc9d4S4n0lRt
 KFxnm5Xa8ACZeFcGgnYBhZpXFzFEZ4dpy2LzxpBfG2Lvuv02q8HYVfmNr
 kEjc35EFX/+kHbDt8TcaseJUTQyxn8Lnx+JaAiMqiMR3fjdJ2vMuNElgx
 x++ZT7UuXryT+LRyClXkWknyI9ZpdSrgAndIdDZ+8J30hxBbssk6qsJcO
 LHk2Y7zQbNhqefSKF5ZFXhP86bqHWQo+x3HTwJCQfSn6seQmqHKeRqFjz
 rlehMz0hWL3RLADUrp9y6NM3VafVolVujWTlE4nYTAKndo8Tk0RSZ2oXX g==;
X-CSE-ConnectionGUID: qnwqv46NT4Km4rJd2zzePg==
X-CSE-MsgGUID: lUL0zqx6Sw6Sg8WspjPh9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="46356380"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46356380"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 22:34:25 -0800
X-CSE-ConnectionGUID: 3D3Dv+yNTPOXtd0i0domjw==
X-CSE-MsgGUID: mW82Tm/vT0W/lqVMCZxjLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97555418"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 22:34:23 -0800
Date: Wed, 18 Dec 2024 07:34:19 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t 4/4] lib/igt_device_scan: Fix scan vs
 bind/unbind/reload
Message-ID: <20241218063419.zqikqynzuvi5vake@zkempczy-mobl2>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
 <20241218051324.2696557-5-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218051324.2696557-5-lucas.demarchi@intel.com>
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

On Tue, Dec 17, 2024 at 09:13:24PM -0800, Lucas De Marchi wrote:
> There's no guarantee a card will end up with the same device node when
> modules are loaded/unloaded and drivers bound/unbound. There's some
> fundamental issue with the igt's the way it is and it's also puzzling
> from the logs it looks like the device vanished from the bus, when in
> reality is just the SW state out of sync with what the kernel is
> exporting.
> 
> Re-scanning when trying to match a device is not expensive compared to
> what most tests are doing, so simply force it to occur whenever trying
> to match a card.

I also should comment the above. It is generally true, but I've noticed
getting attributes might be expensive. Even it may take up to few
seconds, that's why I've added some attributes we don't fetch from udev
(see is_on_blacklist()). If I'm not wrong getting 'config' was a cause
to limit attributes we fetch.

--
Zbigniew

> 
> Example for xe_wedged:
> 
> 	$ sudo ./build/tests/xe_wedged --device pci:0000:03:00.0 --r wedged-at-any-timeout
> 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
> 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD129
> 
> 	... [ wedge and rebind here ]
> 
> 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
> 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card2 | /dev/dri/renderD130
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_device_scan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 8e2297087..956719fba 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1983,7 +1983,7 @@ static bool __igt_device_card_match(const char *filter,
>  	 * Scan devices in case the user hasn't yet,
>  	 * but leave a decision on forced rescan on the user side.
>  	 */
> -	igt_devices_scan(false);
> +	igt_devices_scan(true);
>  
>  	if (igt_device_filter_apply(filter) == false)
>  		return false;
> -- 
> 2.47.0
> 
