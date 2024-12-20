Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D400FE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 06:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CFD10E100;
	Fri, 20 Dec 2024 06:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRDrF9B7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD1610E100
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734677978; x=1766213978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4jM3AuLlQIvsK8q8mSNrBl92bPbRI0WpfGBXlgE4iqc=;
 b=NRDrF9B7Gyis/wZ0ATUOa/8as+DlCX7NYtkHIkhvgW8OjkibBWpvISfg
 5wf9/0UWD+LCXIdo0gDpBumpbIaqtRIkPXJJG1QUJC5H1Mj7VXoojRuKA
 4wJo6Dr9sdUJq/fyqerpPjg1373/51vmeNhtEHElZQqY+Xx+QFl6ZCAes
 4gUvJYKNRJqN+vFYeW8PaJZ2jPk7Gc0L7WFVtEYyKWfzff/CZEcnH0Lko
 UC1QHom7FkHANEcPpa/MruygryeVjdlXra7v5gpvuCnArS7o6ujYpjKvT
 SQqS1LoJyat+W3PuUNpHid6wY/Ima1/5jJRasD7wDEyyO51QGPDfWQ/CW g==;
X-CSE-ConnectionGUID: xvMujWJuShWu4LE9EHXCpA==
X-CSE-MsgGUID: PlfQD/Q0RxOupcQ+NVRzDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46227530"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="46227530"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 22:59:38 -0800
X-CSE-ConnectionGUID: mDII4Z4WS52LPP8rXNTksQ==
X-CSE-MsgGUID: GXicQ7JkQtWN4zPj9PJp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99251618"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.218])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 22:59:36 -0800
Date: Fri, 20 Dec 2024 07:59:33 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t 4/4] lib/igt_device_scan: Fix scan vs
 bind/unbind/reload
Message-ID: <20241220065933.k3outjjmfgvpuxjn@zkempczy-mobl2>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
 <20241218051324.2696557-5-lucas.demarchi@intel.com>
 <20241218063419.zqikqynzuvi5vake@zkempczy-mobl2>
 <rnw3q6mhthnwyvowvszr2gllyjtbb2mozk4em272xlmkvm7pyl@szbhtg3sd7d7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rnw3q6mhthnwyvowvszr2gllyjtbb2mozk4em272xlmkvm7pyl@szbhtg3sd7d7>
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

On Thu, Dec 19, 2024 at 10:35:00AM -0600, Lucas De Marchi wrote:
> On Wed, Dec 18, 2024 at 07:34:19AM +0100, Zbigniew Kempczyński wrote:
> > On Tue, Dec 17, 2024 at 09:13:24PM -0800, Lucas De Marchi wrote:
> > > There's no guarantee a card will end up with the same device node when
> > > modules are loaded/unloaded and drivers bound/unbound. There's some
> > > fundamental issue with the igt's the way it is and it's also puzzling
> > > from the logs it looks like the device vanished from the bus, when in
> > > reality is just the SW state out of sync with what the kernel is
> > > exporting.
> > > 
> > > Re-scanning when trying to match a device is not expensive compared to
> > > what most tests are doing, so simply force it to occur whenever trying
> > > to match a card.
> > 
> > I also should comment the above. It is generally true, but I've noticed
> > getting attributes might be expensive. Even it may take up to few
> > seconds, that's why I've added some attributes we don't fetch from udev
> > (see is_on_blacklist()). If I'm not wrong getting 'config' was a cause
> > to limit attributes we fetch.
> 
> why would we get all attributes and exclude some?  Shouldn't we get only
> the attributes we actually use? AFAIK this logic is basically used by
> --device/IGT_DEVICE, right? What filters we normally use?

At moment of developing I didn't know how this code might be used by others
to write filters. I had only in my mind sriov scenario and I assumed
more attributes might be useful in the meaning - lets see how it goes.

Currently we use three attributes: driver, sriov_numvfs and physfn.
I would rewrite this for support both - fetching all attributes without
excluding anything (for lsgpu -p) and second for normal use so we would
get only attributes we use in filters. We would achieve two goals - keep
lsgpu list of props/attrs almost intact (with exception we'll fetch them
all now) and have current state of drm device nodes in the test.

Question - will you write this or you want from me to do this? I can
do this on the beginning of the year. If you're wondering what for
-p in lsgpu - it is convinient for me to use it instead of udevadm.

> 
> I usually pass the pci slot (because I know that won't change
> dynamically and cause surprises). Apparently CI passes vendor/devid:
> 
> 	export IGT_DEVICE=pci:vendor=$1,device=$2
> 
> (but it seems to vary depending on pipeline)
> 
> Some devs pass the device node directly too as in a lot of places
> there's only ever card0 possible.
> 
> Are there other uses?

In Intel likely not, outside - I don't know.

BTW I've checked the problematic attribute 'config' and it seems it
is immediately fetched on nvidia card now. Still it is binary, so it
will require to be ignored (...) or ascii encoded.

--
Zbigniew

> 
> thanks
> Lucas De Marchi
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > Example for xe_wedged:
> > > 
> > > 	$ sudo ./build/tests/xe_wedged --device pci:0000:03:00.0 --r wedged-at-any-timeout
> > > 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
> > > 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD129
> > > 
> > > 	... [ wedge and rebind here ]
> > > 
> > > 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
> > > 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card2 | /dev/dri/renderD130
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  lib/igt_device_scan.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > > index 8e2297087..956719fba 100644
> > > --- a/lib/igt_device_scan.c
> > > +++ b/lib/igt_device_scan.c
> > > @@ -1983,7 +1983,7 @@ static bool __igt_device_card_match(const char *filter,
> > >  	 * Scan devices in case the user hasn't yet,
> > >  	 * but leave a decision on forced rescan on the user side.
> > >  	 */
> > > -	igt_devices_scan(false);
> > > +	igt_devices_scan(true);
> > > 
> > >  	if (igt_device_filter_apply(filter) == false)
> > >  		return false;
> > > --
> > > 2.47.0
> > > 
