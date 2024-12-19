Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64EDE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 16:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCB610E4A9;
	Thu, 19 Dec 2024 16:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nARsWfwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4531010E4A9
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734626112; x=1766162112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=keLfomevb0UjkOCH0kCESk4aufpM5ESJlkYQ+eDSKmI=;
 b=nARsWfwdGzA9JFKGQ/1qx7wQ9d2fvjOH2/bUbYNy3KIVB8AcKw7K/uZ7
 Rhtw7aA/s63Ep71U/pPc0jQdeh2lPR5eHDLD+vzutMfJ6NEIU68vvc1kE
 Ih3vV/rbJnZJpx5B0DtoxKCCuRkx1RGAOd6bbOCjpbX2vfrHbwDvJB1VI
 qxY53CG3AdYCEgQG0WVwnZjzpEueDCUFpTszlkoz2IaMRbPjz6ICJDomY
 Q2lpaHDwp3QrRH7RY3PXzqKf3Pd3CBanx4DpB7lUmkPpiG6bNo6jAtoY6
 SkptaRIFektt4gvKcvjo+L9pOVLHcsqfOoXs0meunWR7by6kg41zc0q8k w==;
X-CSE-ConnectionGUID: aoXQ4mRmSliHSXwmAm9XeQ==
X-CSE-MsgGUID: ACR39pNdTR+1TtBDVSd2sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34471620"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="34471620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 08:35:06 -0800
X-CSE-ConnectionGUID: 0w4TcVeVTRCdXRjU36u1rQ==
X-CSE-MsgGUID: kpX1SWJGQam6P9dZKNoFSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98077737"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.41])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 08:35:06 -0800
Date: Thu, 19 Dec 2024 10:35:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t 4/4] lib/igt_device_scan: Fix scan vs
 bind/unbind/reload
Message-ID: <rnw3q6mhthnwyvowvszr2gllyjtbb2mozk4em272xlmkvm7pyl@szbhtg3sd7d7>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
 <20241218051324.2696557-5-lucas.demarchi@intel.com>
 <20241218063419.zqikqynzuvi5vake@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218063419.zqikqynzuvi5vake@zkempczy-mobl2>
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

On Wed, Dec 18, 2024 at 07:34:19AM +0100, Zbigniew Kempczyński wrote:
>On Tue, Dec 17, 2024 at 09:13:24PM -0800, Lucas De Marchi wrote:
>> There's no guarantee a card will end up with the same device node when
>> modules are loaded/unloaded and drivers bound/unbound. There's some
>> fundamental issue with the igt's the way it is and it's also puzzling
>> from the logs it looks like the device vanished from the bus, when in
>> reality is just the SW state out of sync with what the kernel is
>> exporting.
>>
>> Re-scanning when trying to match a device is not expensive compared to
>> what most tests are doing, so simply force it to occur whenever trying
>> to match a card.
>
>I also should comment the above. It is generally true, but I've noticed
>getting attributes might be expensive. Even it may take up to few
>seconds, that's why I've added some attributes we don't fetch from udev
>(see is_on_blacklist()). If I'm not wrong getting 'config' was a cause
>to limit attributes we fetch.

why would we get all attributes and exclude some?  Shouldn't we get only
the attributes we actually use? AFAIK this logic is basically used by
--device/IGT_DEVICE, right? What filters we normally use?

I usually pass the pci slot (because I know that won't change
dynamically and cause surprises). Apparently CI passes vendor/devid:

	export IGT_DEVICE=pci:vendor=$1,device=$2

(but it seems to vary depending on pipeline)

Some devs pass the device node directly too as in a lot of places
there's only ever card0 possible.

Are there other uses?

thanks
Lucas De Marchi

>
>--
>Zbigniew
>
>>
>> Example for xe_wedged:
>>
>> 	$ sudo ./build/tests/xe_wedged --device pci:0000:03:00.0 --r wedged-at-any-timeout
>> 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
>> 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD129
>>
>> 	... [ wedge and rebind here ]
>>
>> 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
>> 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card2 | /dev/dri/renderD130
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_device_scan.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>> index 8e2297087..956719fba 100644
>> --- a/lib/igt_device_scan.c
>> +++ b/lib/igt_device_scan.c
>> @@ -1983,7 +1983,7 @@ static bool __igt_device_card_match(const char *filter,
>>  	 * Scan devices in case the user hasn't yet,
>>  	 * but leave a decision on forced rescan on the user side.
>>  	 */
>> -	igt_devices_scan(false);
>> +	igt_devices_scan(true);
>>
>>  	if (igt_device_filter_apply(filter) == false)
>>  		return false;
>> --
>> 2.47.0
>>
