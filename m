Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE57C282C1
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 14:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A1F10ECAF;
	Fri, 28 Feb 2025 14:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TfsHqXMA";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFB210EBCF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 01:49:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 07645612E1;
 Fri, 28 Feb 2025 01:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E553C4CEE6;
 Fri, 28 Feb 2025 01:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740707350;
 bh=n6vcuaZLhXncX3OLl+QN4XA8ocjRdWWRRKK2eTq7peU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TfsHqXMAJsdFFJ3W4vv5RZCuBdPQYz24EJey6ZjkSK3JpDzPZ798VdOBir4CItjct
 YxUls7OzuNu67JIUbpx71R/sMatkEHWpjq4oKaro4ZfbQIwG7F1ls8GQUQwvRVcnWO
 Zp9G+pDgUc0K2p01Ti9/1DKKsCQDBLQz685wqN/Q=
Date: Thu, 27 Feb 2025 17:47:59 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH i-g-t 20/39] tests/vkms_configfs: Test enablement without
 pipeline items
Message-ID: <2025022715-steadfast-captive-f171@gregkh>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
 <20250218165011.9123-21-jose.exposito89@gmail.com>
 <182edaeb-959a-42f2-bdfd-8fc860fbfe07@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <182edaeb-959a-42f2-bdfd-8fc860fbfe07@bootlin.com>
X-Mailman-Approved-At: Fri, 28 Feb 2025 14:01:37 +0000
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

On Thu, Feb 27, 2025 at 02:06:23PM +0100, Louis Chauvet wrote:
> 
> 
> Le 18/02/2025 à 17:49, José Expósito a écrit :
> > It shouldn't be possible to enable a device without creating and
> > attaching its pipeline items.
> > 
> > Test that the device is not enabled and also that no actual device was
> > created using libdrm.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >   tests/vkms/vkms_configfs.c | 60 ++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 60 insertions(+)
> > 
> > diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> > index dc3dbe80d..87d660fff 100644
> > --- a/tests/vkms/vkms_configfs.c
> > +++ b/tests/vkms/vkms_configfs.c
> > @@ -108,6 +108,42 @@ static bool attach(const char *src_path, const char *dst_path,
> >   	return ret == 0;
> >   }
> > +static drmDevicePtr find_device(const char *name, drmDevicePtr *devices,
> > +				int n_devices)
> > +{
> > +	drmDevicePtr dev;
> > +	const char *dev_name;
> > +
> > +	for (int i = 0; i < n_devices; i++) {
> > +		dev = devices[i];
> > +
> > +		if (!(dev->available_nodes & BIT(DRM_NODE_PRIMARY)))
> > +			continue;
> > +
> > +		if (dev->bustype != DRM_BUS_PLATFORM)
> > +			continue;
> 
> Hummm, I think this may have issues with the change proposed by Greg in [1],
> I don't know how the drmDevicePtr should look like with the new faux_device
> struct.
> 
> The declaration in xf86drm.h is:
> 
> typedef struct _drmDevice {
>     char **nodes; /* DRM_NODE_MAX sized array */
>     int available_nodes; /* DRM_NODE_* bitmask */
>     int bustype;
>     union {
>         drmPciBusInfoPtr pci;
>         drmUsbBusInfoPtr usb;
>         drmPlatformBusInfoPtr platform;
>         drmHost1xBusInfoPtr host1x;
>     } businfo;
>     union {
>         drmPciDeviceInfoPtr pci;
>         drmUsbDeviceInfoPtr usb;
>         drmPlatformDeviceInfoPtr platform;
>         drmHost1xDeviceInfoPtr host1x;
>     } deviceinfo;
> } drmDevice, *drmDevicePtr;

Why does a drm device care about what type of "bus" it lives on?  That's
not the user/kernel api to the drm device, the drm api is the way the
device is handled.

Why not just treat it like any other "new bus" that gets written?  What
happens if a bus type shows up in the kernel that no one has seen yet in
this userspace code, and exposes a drm device node?  Why would that not
"just work"?

thanks,

greg k-h
