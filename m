Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2B2C19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 14:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3295310ECB3;
	Fri, 28 Feb 2025 14:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EyWOIHH6";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A58E10E08F
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 11:58:32 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so2366706f8f.0
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 03:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740743910; x=1741348710; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7P5EEFn6YnXor0cw1WzYlFBFjBKkHUlyAH6xMAQiStQ=;
 b=EyWOIHH69zN0qrZC7HJ4GSjkuDdS6rk6YohJTGH8zf8XECTrJYvEuiB91StEXKvohj
 Wr9r+rnRrMCHpi1C3d6Hu7ISclEeVSYU2rSzCs4J56/3AlC2JaACq6HDz2YrQnMayH9o
 JC8WWycBzsEE+5xVeqc4pwBGCs4eqFZl28uemhcvb5ioxZJ+Th3VNrBp+g1vj0iCswYc
 hps1+ivcuwG2HScTMxnUIU+el0ocnY9U/Fd6cNdLtmaL98/0FOYeCgj40Fe6jI4U89ps
 vxIq2WQ7Z9lvPx3AftNULbozQ8bVbCCw5FVSMp0lcLl7Poyk6DiC4e7CN+Es7+IHIY4m
 RFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740743910; x=1741348710;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7P5EEFn6YnXor0cw1WzYlFBFjBKkHUlyAH6xMAQiStQ=;
 b=hxeqPwcxjZwzVfF7Mff+DGyN5rwIIj0d/tJxg3c2Qt8giChHEXeUNFhs2kw05dbFML
 VLwvJEXHi1GvrjLhQ8wWbRjZTBHx8nr5/kC6VzaXIj9a9Qy9zJ66gzJCGJl7l78Rw0HX
 gHTAvHN3/OioQdrwKQ2MmdJ8SYeW8ne7w9fi84CRMOdhuRYD1z6rTUTTi/twVRtJ6fnm
 a63Jz2YEtuBbOT43egDLXIJ+X2e56o6mvG1pq2U89Db9HaqinsI98zuHu/bC/UlVPd3l
 1s1uREOkN1ad3O3KkoA9TSA+9xq2DQpxj+xwpM3RkedLvpoIguMLO/yDiNhdcnUR77fb
 G4yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaklO+jt+81GH1PXWGSCR5d6iJl9mhBONV6ciRNlRQrhRN+kQbNqRwZWbyZ76Ghe1vyThymZGD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcWSHgAZVYUe4+/zBDSmCdQk3mif5W1Ma5IL1CBFUAffEvWmo9
 p5uN5hmRFHprM985fBAFgzWYlkkK60GJg1JnV/CyyQF9dYJJdee7
X-Gm-Gg: ASbGncu63iWDa2B1vZvwwfc6PbTDdnf67GDUiUgHSnof/U8msxAyfiLBtR62PerXNxo
 dvbLIYRFlXJKaXizOJEsHGAdqVrgG+bY8r8qUHLYvkhtDbgzbYFVCrO93/QMr4/mo4Awv0uQnEU
 PkNhgYDB7pmlXyZGLoyrEaTSstdbMEWxbbCicIa2ECACfMmU51KuBbnzgq1QmMOKvPVOh2OcvdA
 TGJIwzPmEim11SH8/L3VUyrIzhr/Y5LPXK5SF/mt/h3LLv0FSQdrxjU9dYAMJgp1JVR5b6AfYlJ
 jtkOQSM/WRyLbbavWZmakiFHTA==
X-Google-Smtp-Source: AGHT+IH1/OVy9IiwGpzm3FvKQ+S91nCdaPBtZNWhyUdIoIlXL+wOR9s4EWZ8CgqhHGTUwKbNHRN/yA==
X-Received: by 2002:a5d:5989:0:b0:390:ee34:228b with SMTP id
 ffacd0b85a97d-390ee3424aamr1824921f8f.24.1740743910228; 
 Fri, 28 Feb 2025 03:58:30 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844a38sm5035575f8f.75.2025.02.28.03.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 03:58:29 -0800 (PST)
Date: Fri, 28 Feb 2025 12:58:28 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH i-g-t 20/39] tests/vkms_configfs: Test enablement without
 pipeline items
Message-ID: <Z8Gk5K_1d-sZDjgh@fedora>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
 <20250218165011.9123-21-jose.exposito89@gmail.com>
 <182edaeb-959a-42f2-bdfd-8fc860fbfe07@bootlin.com>
 <2025022715-steadfast-captive-f171@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025022715-steadfast-captive-f171@gregkh>
X-Mailman-Approved-At: Fri, 28 Feb 2025 14:02:15 +0000
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

Hi everyone,

On Thu, Feb 27, 2025 at 05:47:59PM -0800, Greg Kroah-Hartman wrote:
> On Thu, Feb 27, 2025 at 02:06:23PM +0100, Louis Chauvet wrote:
> > 
> > 
> > Le 18/02/2025 à 17:49, José Expósito a écrit :
> > > It shouldn't be possible to enable a device without creating and
> > > attaching its pipeline items.
> > > 
> > > Test that the device is not enabled and also that no actual device was
> > > created using libdrm.
> > > 
> > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > ---
> > >   tests/vkms/vkms_configfs.c | 60 ++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 60 insertions(+)
> > > 
> > > diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> > > index dc3dbe80d..87d660fff 100644
> > > --- a/tests/vkms/vkms_configfs.c
> > > +++ b/tests/vkms/vkms_configfs.c
> > > @@ -108,6 +108,42 @@ static bool attach(const char *src_path, const char *dst_path,
> > >   	return ret == 0;
> > >   }
> > > +static drmDevicePtr find_device(const char *name, drmDevicePtr *devices,
> > > +				int n_devices)
> > > +{
> > > +	drmDevicePtr dev;
> > > +	const char *dev_name;
> > > +
> > > +	for (int i = 0; i < n_devices; i++) {
> > > +		dev = devices[i];
> > > +
> > > +		if (!(dev->available_nodes & BIT(DRM_NODE_PRIMARY)))
> > > +			continue;
> > > +
> > > +		if (dev->bustype != DRM_BUS_PLATFORM)
> > > +			continue;
> > 
> > Hummm, I think this may have issues with the change proposed by Greg in [1],
> > I don't know how the drmDevicePtr should look like with the new faux_device
> > struct.
> > 
> > The declaration in xf86drm.h is:
> > 
> > typedef struct _drmDevice {
> >     char **nodes; /* DRM_NODE_MAX sized array */
> >     int available_nodes; /* DRM_NODE_* bitmask */
> >     int bustype;
> >     union {
> >         drmPciBusInfoPtr pci;
> >         drmUsbBusInfoPtr usb;
> >         drmPlatformBusInfoPtr platform;
> >         drmHost1xBusInfoPtr host1x;
> >     } businfo;
> >     union {
> >         drmPciDeviceInfoPtr pci;
> >         drmUsbDeviceInfoPtr usb;
> >         drmPlatformDeviceInfoPtr platform;
> >         drmHost1xDeviceInfoPtr host1x;
> >     } deviceinfo;
> > } drmDevice, *drmDevicePtr;
> 
> Why does a drm device care about what type of "bus" it lives on?  That's
> not the user/kernel api to the drm device, the drm api is the way the
> device is handled.
> 
> Why not just treat it like any other "new bus" that gets written?  What
> happens if a bus type shows up in the kernel that no one has seen yet in
> this userspace code, and exposes a drm device node?  Why would that not
> "just work"?
> 
> thanks,
> 
> greg k-h

I already commented in the kernel ML [1], but I'm dropping a comment
here as well in case someone is following this thread.

drmGetDevices() doesn't return the devices in the faux bus, and libdrm
would need to be updated to handle the new bus.

To avoid blocking this series, I'll try to get the VKMS device using
udev in v2, following the approach taken by Mutter.

Let me know if you known a better API to solve this issue, please.

Thanks,
Jose

[1] https://lore.kernel.org/all/Z8Gduj1cDdCYzaBY@fedora/T/#m3fa9b60d5f637ebb0352366c605b94822fc45788
