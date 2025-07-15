Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD06C83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E942410E1F4;
	Tue, 15 Jul 2025 10:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TwLg8fb1";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4EC10E596
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:27:20 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3b45edf2303so4530489f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575238; x=1753180038; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=B4hZCe04I+4l7izVteL+ePjkVK9Jiw8kSitsrJZl9f4=;
 b=TwLg8fb1sqfzoLi8rnaPgLf1YOv3ndKg7hhYJZ0I/Z5FqGNJRr6iP/y4h9pFiaulpP
 gpejlktGeFaVmqNt1zQboBGyAhhmLbWXjdG0hFOB3RvZo12PMGDJVlrn1XpDgLBXktQs
 Me6a2x7+QmEOpLuYapjCmDhMJjOVNksSWIdhhoGV7XDHFDEMHpSDTTqMjAozfmf18HOp
 F0QsIlhzqppJFYdE7/GXgwhHf1MHjAK9WLKbFRBYgLQjM4SUOlhmzY+83naJMYEyUD3S
 qBkkBUNLC1u+byKteAgArtjrqWAhlHUopF21eesP9TZOr7L5ZqnoXtJ2RpTdI9FgnpeI
 7ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575238; x=1753180038;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B4hZCe04I+4l7izVteL+ePjkVK9Jiw8kSitsrJZl9f4=;
 b=AisFL4z2lX0PBHCdo+WzIf9bgfVz6SL1sVZeu5XZi7GVYR4IrUIzUnsmw3wVJfappG
 37HF0QiHMWb4hg0NmHqLsEciMFD3NeK0P06gGvRD2o7ueD/8x1OtMNC7MpXaycDW3Wus
 IpQfKk+bepbDZYKFvT5Vv7OknP2kGzLfNY0Oq9H4RbGLyhgq2wiOstE8/FIrgWIVyB7P
 3vn7ofauhns5FpyLSsKMKiIH9xrc7ThtEocnFXxJ8DJmKWb/iEYCxTuwbRai0/PWvfY9
 rI0zfN6E8SvD5k8/h8xJaigebpntofgOot6meDXnAm+SHjrWdEMpAQdztRLJxds/S3v3
 AEsg==
X-Gm-Message-State: AOJu0Yx4+TlNZYbJm1jGyz3JA8vRxN2+bdOIfBC+fG3r4yzw41JFTDnK
 iUlhQNO97Z6vGzY1yS6J7Pkqi6q1AO6v+6FpDJ8KIPgcP7aMA2d5jCYOAl+BUw==
X-Gm-Gg: ASbGncuEUTQmg7s4vpKa18FFw1+ynooQ0VhwkF/IAQHWEVIZVc5NLhDtnIRTLC5fNHD
 yHQrXvWS3zCC9qrymB7bz4pUug5fJgPjeBhYDT2PGN+6NK9aC22BzdN8+RSvOfXQzluuQFQbTL4
 FwPr9qbaAgs+MKtthvii+eT6fp/oKedsAH8bCFQ7f3Ab33tREfvIwFO3a0TJlbuM7yDYhr4uzCM
 rm4dDp4QrLI6ekpK5cFl+TgomfIlc0wqbCDCy6rtwV4wNLnebpNi5AdZN1Jy0ziqLhEocnT/H02
 RSMO/QQgaDh14stzPQ4rRBshe9/nISjRt01ET6JBYHMGTvkynz72e6b11H0I0AfzBtDz6QT85p2
 1EBV+sj1rkxpGlPflxA==
X-Google-Smtp-Source: AGHT+IEpVn5hSCC6ciISB520aKxHRxjo6EetPrmXLAhS/o2Im9LN+p7ocdo7AFYtr40nGXQ7D8/abw==
X-Received: by 2002:adf:f3c5:0:b0:3a5:8abe:a264 with SMTP id
 ffacd0b85a97d-3b60a195cb3mr1459873f8f.37.1752575238470; 
 Tue, 15 Jul 2025 03:27:18 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45613c2d84dsm74235285e9.5.2025.07.15.03.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:27:18 -0700 (PDT)
Date: Tue, 15 Jul 2025 12:27:16 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 23/43] lib/igt_device_scan: Allow to find device
 by sysname
Message-ID: <aHYtBE7aURplD4gV@fedora>
References: <20250313173318.5818-1-jose.exposito89@gmail.com>
 <20250313173318.5818-24-jose.exposito89@gmail.com>
 <20250611110916.ixunwvqyyxl6zp2m@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611110916.ixunwvqyyxl6zp2m@kamilkon-DESK.igk.intel.com>
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

Hi Kamil,

On Wed, Jun 11, 2025 at 01:09:16PM +0200, Kamil Konieczny wrote:
> Hi José,
> On 2025-03-13 at 18:32:58 +0100, José Expósito wrote:
> > The VKMS driver allows to create multiple devices handled by the same
> > driver but with a different sysname.
> > 
> > In order to differentiate between them, allow to find devices by
> > sysname.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> Please rebase your series as few of configfs changes got merged.
> 
> Also for this change +cc Zbigniew
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Thanks a lot for your interest on this series.

I rebased on top of the latest master code and sent v3 here:
https://lore.kernel.org/igt-dev/20250715102513.5636-1-jose.exposito89@gmail.com/T/

Best wishes,
José Expósito
 
> Regards,
> Kamil
> 
> > ---
> >  lib/igt_device_scan.c | 22 ++++++++++++++++++++++
> >  lib/igt_device_scan.h |  2 ++
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index 711bedc5c..5cbd347a3 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -231,6 +231,7 @@ struct igt_device {
> >  	char *subsystem;
> >  	char *syspath;
> >  	char *devnode;
> > +	char *sysname;
> >  
> >  	/* /dev/dri/... paths */
> >  	char *drm_card;
> > @@ -664,6 +665,7 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev,
> >  	idev->syspath = strdup_nullsafe(udev_device_get_syspath(dev));
> >  	idev->subsystem = strdup_nullsafe(udev_device_get_subsystem(dev));
> >  	idev->devnode = strdup_nullsafe(udev_device_get_devnode(dev));
> > +	idev->sysname = strdup_nullsafe(udev_device_get_sysname(dev));
> >  
> >  	if (idev->devnode && strstr(idev->devnode, "/dev/dri/card"))
> >  		idev->drm_card = strdup(idev->devnode);
> > @@ -2059,6 +2061,26 @@ bool igt_device_card_match_pci(const char *filter,
> >         return __igt_device_card_match(filter, card, true);
> >  }
> >  
> > +bool igt_device_find_card_by_sysname(const char *sysname,
> > +				     struct igt_device_card *card)
> > +{
> > +	struct igt_device *dev;
> > +
> > +	igt_assert(card);
> > +	igt_assert(sysname);
> > +
> > +	memset(card, 0, sizeof(*card));
> > +
> > +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> > +		if (strcmp(dev->sysname, sysname) == 0) {
> > +			__copy_dev_to_card(dev, card);
> > +			return true;
> > +		}
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  /**
> >   * igt_device_get_pretty_name
> >   * @card: pointer to igt_device_card struct
> > diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> > index 92741fe3c..2a61777b0 100644
> > --- a/lib/igt_device_scan.h
> > +++ b/lib/igt_device_scan.h
> > @@ -92,6 +92,8 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
> >  bool igt_device_find_integrated_card(struct igt_device_card *card);
> >  bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
> >  bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
> > +bool igt_device_find_card_by_sysname(const char *sysname,
> > +				     struct igt_device_card *card);
> >  char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
> >  int igt_open_card(struct igt_device_card *card);
> >  int igt_open_render(struct igt_device_card *card);
> > -- 
> > 2.48.1
> > 
