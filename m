Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4A6E77183
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 06:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FBE10E1BA;
	Wed, 18 Dec 2024 06:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsfOcbGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4916610E1BA
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 06:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734502675; x=1766038675;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tjutucVojQTiIWSEAOpnkxncEGCw77aEypkLQzN+u4s=;
 b=PsfOcbGPIC/caeClmsDdWos3RzpOH1XlpdZUWGjLex1MBuK7AlKT3SeS
 yIOADF3wtVqCsywOECRtkeRwbcedpOViKCq+VgtDSPVAX0/1yMa1ft6OQ
 kFgWEVZ8oIjcXcOuUYmPqRlCxIS1nE6RBQhMtKLHWgoaqG5uwn8z+9jux
 c6q2VheoglRGsDGTi7f5hdvgee6En3udCtYOpWhWy3xGa+/2qZXcMud53
 OaWqe5rywURKnLW1+DeAjsuWeIuGl/XpC+dYCHvahe34aG4ZA4mA06lcz
 7zEWQX36iL0ni0/UwKkVSYnXaiZ2ESAkFA8AZodkrY3fj6pC/HTiXHPfy A==;
X-CSE-ConnectionGUID: OVj885H4STyUyzlr6eoJdQ==
X-CSE-MsgGUID: r/BBgQE7T5CDKYKKx2kqwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45445253"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="45445253"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 22:17:55 -0800
X-CSE-ConnectionGUID: QRN6n81dTFq8+1FuPmlWqA==
X-CSE-MsgGUID: MOc9VYdKSQS//OMus/vuxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="102762273"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 22:17:54 -0800
Date: Wed, 18 Dec 2024 07:17:48 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t 4/4] lib/igt_device_scan: Fix scan vs
 bind/unbind/reload
Message-ID: <20241218061748.5pc5ac7i3el477kp@zkempczy-mobl2>
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

Please don't. Check igt_device_filter_add() and for loop inside. This
would trigger a lot of rescans instead of one.

If whatever is causing changes from drm (udev) perspective it should be
targeted there, not in the library.

--
Zbigniew

>  
>  	if (igt_device_filter_apply(filter) == false)
>  		return false;
> -- 
> 2.47.0
> 
