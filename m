Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA36E77183
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 06:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C653710E673;
	Wed, 18 Dec 2024 06:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbwDjfMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0897310E673
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 06:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734502043; x=1766038043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NFX0NmM5gs5GmFw0RrG4LTZaB1Wjz3Fwg230B7H5K7Q=;
 b=PbwDjfMi3XvY4dtLXYJtbhxrJJ8AN/ID/qnG3kCMKnQwMUZxWVsR+vlb
 F1oLzRidXUsRWOYwAynDd/7NVllEJHuQW8Y9j65+7cjYMqPs9TSgLRGHJ
 a9tv5P9EnSWW7wvY7ynIJ/FWcO/SsqVCstp5QYb2ZMTp4z7KVtfpjQgmG
 qwjL0kd/NpsBpnpAMUFU/nqTASm6g/WxDdi7yipPZnuzedItSzLHQ+zS3
 dmNsnyl60JmsrkK/pSsQU4ooEUkfzoyP3Ar3zgcLGVzwoQAEA1WNC2qHw
 zAkphbwfvJxiCX8TfMVPv13C0ul05k9V9jL7gme7dzGBllz6+i6rubT5z w==;
X-CSE-ConnectionGUID: O4dDLiMmQm6ErVbBZ8c7IQ==
X-CSE-MsgGUID: iclCTXbrRbKqw8slqk+d8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34994809"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="34994809"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 22:07:12 -0800
X-CSE-ConnectionGUID: OO36OwFMQc+mTn6f7BWGNQ==
X-CSE-MsgGUID: sXEm4srwSP+ktWBSN+BUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98338539"
Received: from sshkruni-mobl2.ger.corp.intel.com (HELO [10.213.202.48])
 ([10.213.202.48])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 22:07:11 -0800
Message-ID: <f134a51b-c72b-459e-976b-2c26906b7efa@linux.intel.com>
Date: Wed, 18 Dec 2024 07:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] lib/igt_device_scan: Fix scan vs
 bind/unbind/reload
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
 <20241218051324.2696557-5-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20241218051324.2696557-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Lucas,

Please see my comment below.

On 18.12.2024 06:13, Lucas De Marchi wrote:
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

The comment needs love. What about:

	/*
	 * There are no guarantees about the association between device node and
	 * GPU. Force a rescan to prevent mismatch between device node and gpu.
	 */


> -	igt_devices_scan(false);
> +	igt_devices_scan(true);
>  
>  	if (igt_device_filter_apply(filter) == false)
>  		return false;

