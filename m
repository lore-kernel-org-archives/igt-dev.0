Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34148C3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 07:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D805010E3BB;
	Mon, 22 Jul 2024 07:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="IPFIIFU/";
	dkim-atps=neutral
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C77110EC1E
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 12:48:50 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 46363328782
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 13:48:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1721393329; bh=gFf1yCuSUDTpdi0cNqGN14JneCj9i4D3hmFtVWYpjPQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IPFIIFU/C4YSYtsegbBXx2SbBNNaZcYf0dZYz9eG0Gbb2ExRKkI0WCqMsbZ0UYSLm
 qBKl5N1EPDOEIu97E8aWFaXKNqOBOPQDCkJUHB01c8jzL7q8gOQ4UBzcz5IlJa0TDp
 IFlR5Fi8J4l4j8vzkfTXMoTqCO5hQDje2C2YiJrGiESf1DTicH0X97VY4zsegBzd5H
 4II2IVsc+A7OAp+aEouUnJpVXQdLV2AVer9gxOkqY2GUvlHkC7JFo3DSfP6O2OfrQd
 AsSZnKCQdIxfxLDl8XAU6eIAUGIlAUTUmvzCIWf93zIeobmOUpy+2WTCQ91dte50Gx
 qxY9k32qorsxw==
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so1087918a12.3
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 05:48:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXJMXcZ538Vv7vguelGFBjFt5dFlUJr7kLqbclDH5eKtShrhnKlp5GXtuIJDS28Xjrv2Q0wA+M4ne70RQtbX0HJzhU7eVup/vy0aF26rQ==
X-Gm-Message-State: AOJu0Yz57ip1cU90FQDdVthl/vkcspvl34k8vqfjGHN2hEJPKACtsOZx
 r+cq4ODxzpMTALyBRhrcrhWYFyi9O220MTWrFJrYjGl6bpNbj2VV6lWj7Kv1A6P3GO6wgOWLJbc
 rHCfSzRXOcD3/V58XYkJAu91+Quw=
X-Google-Smtp-Source: AGHT+IFvE2tLEN+SD6zXUpoHOZ/6G/CXOMNM5F4PHtVFM4z7VXBMWkNeIbw9idVwb3FffUYb1T56ZTutAvPHRfHfTP8=
X-Received: by 2002:a17:906:cc89:b0:a77:d0a0:ea74 with SMTP id
 a640c23a62f3a-a7a01120ffbmr535001466b.3.1721393328888; Fri, 19 Jul 2024
 05:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
 <Zpjn2dTHDrBBuTVH@phenom.ffwll.local>
 <CAPj87rM_5oKDcRa1sun4ErYXZFehv+1qFkO5Mx-2q-gfWO1jsg@mail.gmail.com>
 <CAFZQkGxOE3XhVcr6N89OReyPEDQnCrRLbvgb5x5UZPtuS7VGGg@mail.gmail.com>
 <CAA8EJpqw=v=OeGcuEk-TBBvhnRRDjjSp75007J_6HSSKSE+veQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqw=v=OeGcuEk-TBBvhnRRDjjSp75007J_6HSSKSE+veQ@mail.gmail.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Fri, 19 Jul 2024 14:48:37 +0200
X-Gmail-Original-Message-ID: <CAFZQkGz=VDjrKeHnWcv=WLxX6ZDYHvQ6agR+8zC2GT8XBpYQ6A@mail.gmail.com>
Message-ID: <CAFZQkGz=VDjrKeHnWcv=WLxX6ZDYHvQ6agR+8zC2GT8XBpYQ6A@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_properties: drop immutability checks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Daniel Stone <daniel@fooishbar.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 igt-dev@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 emersion <contact@emersion.fr>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>, victoria@system76.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 Jul 2024 07:48:25 +0000
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

Am Fr., 19. Juli 2024 um 13:57 Uhr schrieb Dmitry Baryshkov
<dmitry.baryshkov@linaro.org>:
>
> On Fri, 19 Jul 2024 at 14:55, Xaver Hugl <xaver.hugl@kde.org> wrote:
> >
> > Am Fr., 19. Juli 2024 um 12:10 Uhr schrieb Daniel Stone <daniel@fooishbar.org>:
> > >
> > > Hi,
> > >
> > > On Thu, 18 Jul 2024 at 11:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > On Wed, Jul 17, 2024 at 05:39:47PM +0300, Dmitry Baryshkov wrote:
> > > > > Following the discussion on IRC, it is actually an error to require that
> > > > > properties that can not be chaged are marked as immutable.
> > > > >
> > > > > First of all, it creates inconsistent uAPI. Some drivers might have an
> > > > > immutable property, while others will have it mutable. Yes, there are
> > > > > known examples for such behaviour (e.g. zpos), but they are clearly
> > > > > documented in this way.
> > > > >
> > > > > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> > > > > more of the 'direction' of the property (whether it is set by the kernel
> > > > > or it is expected to be set by the userspace) rather than simply states
> > > > > that there is no way for the userspace to change the property.
> > > > >
> > > > > Drop the single-value-is-immutable tests.
> > > >
> > > > Makes sense, but we might drop some test coverage for the properties where
> > > > we _do_ want the single value to be immutable. Like zpos.
> > > >
> > > > So I think at least a cursory audit of existing properties would be good,
> > > > checking that the kerneldoc is accurate and then maybe limiting these
> > > > checks here to properties which are documented to have this behaviour?
> > > >
> > > > I know that's a bunch more work, but I fear if we just drop this we only
> > > > move from one a bit confusing state of the uapi to another one, without
> > > > real improvements.
> > > >
> > > > Ofc if all the compositor folks tell me that this doesn't matter anyway,
> > > > I'll shut up :-)
> > >
> > > Weston doesn't care - the effect is the same for us whether it's
> > > immutable or mutable-but-single-value.
> >
> > For KWin's current code it does matter that blob properties that are
> > only set from the kernel side and that the compositor should parse are
> > immutable; if EDID were to become mutable for example, that could
> > cause a regression for KWin.
> >
> > For properties like zpos, which the compositor is supposed to set on
> > some drivers, I'd prefer it if they were consistently never immutable.
>
> The zpos property is already sometimes immutable, e.g. for cursor planes.

I know, I'm arguing that should be changed. It's just a weird quirk
that doesn't change anything for compositors.

> --
> With best wishes
> Dmitry
