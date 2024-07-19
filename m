Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688DAC3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 07:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B53A10E3BA;
	Mon, 22 Jul 2024 07:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="GfJL/j/S";
	dkim-atps=neutral
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAB610E054
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 11:55:35 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 9582A328924
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 12:55:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1721390134; bh=eg12/iVrc+arVomdevNW+qW+eeGHU7gTYb8cvszeNMs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GfJL/j/SF2mqEjy7vDlnyvaNf1Sw+p6RdOYaya9z6jsUY2ocKwHvBao7iUfBwfRt+
 7U4wU6gKm1u3OgmtyS1jPY9O77G6uxoxIge7jTA9Nggd9wPP0HKa9jBXuf/Ft2gLva
 TuOCWQsR8GUZWQEyESXVUCLsD7KqHI0RFny2x+Je/GaRnLwE9M6ijYCUHsBnamAp8D
 KjrTusij5nZWjHSV3U+7R+D4SRiNwZA5N+OqIDjXU18a2hjloYa/Q6oWrzdHPUrdFd
 rGakd8XBE9T50XqZTarIyfVUVdvEkdfBKPi7pyxeLQl44VcWe2n9gjYXECjRfXWJ21
 4tPotZ2nlw0fg==
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a77e392f59fso197976566b.1
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 04:55:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVB5areSLdOo7InpFV6LyepV7Kkl4STou+Qzcmz0A36NohOf7mN2FQrxuC/H9pBLpUWea5Fz6P9B8X3gudph4ZMP4RAMa1hwjLwWnHm6A==
X-Gm-Message-State: AOJu0YzztRo7fZ5SOXBzRjTFQVfxNRDXhy2fYmTzYNV1AzatHQj+teNt
 BJIDfDe2ZkANtpm5QhsnQv7RbcV5rCN0/AQDx1GSYGz2pNkMBryQTKsJ3e4RXYiCF45m/z4eqLc
 tpFrmcgqWe1E3wBKP+Ae7sr64tTU=
X-Google-Smtp-Source: AGHT+IE2XQ1/rahRJhtyKK5LU6dA9Gl6g4A+0KDOpEqWDP+KMfFqR/EUoNOHrMS58fyHKchAqgsrYnX7yyQLccSCEhg=
X-Received: by 2002:a17:906:79b:b0:a77:d1ea:ab36 with SMTP id
 a640c23a62f3a-a7a0113146emr586973266b.6.1721390133560; Fri, 19 Jul 2024
 04:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
 <Zpjn2dTHDrBBuTVH@phenom.ffwll.local>
 <CAPj87rM_5oKDcRa1sun4ErYXZFehv+1qFkO5Mx-2q-gfWO1jsg@mail.gmail.com>
In-Reply-To: <CAPj87rM_5oKDcRa1sun4ErYXZFehv+1qFkO5Mx-2q-gfWO1jsg@mail.gmail.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Fri, 19 Jul 2024 13:55:22 +0200
X-Gmail-Original-Message-ID: <CAFZQkGxOE3XhVcr6N89OReyPEDQnCrRLbvgb5x5UZPtuS7VGGg@mail.gmail.com>
Message-ID: <CAFZQkGxOE3XhVcr6N89OReyPEDQnCrRLbvgb5x5UZPtuS7VGGg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_properties: drop immutability checks
To: Daniel Stone <daniel@fooishbar.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
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

Am Fr., 19. Juli 2024 um 12:10 Uhr schrieb Daniel Stone <daniel@fooishbar.org>:
>
> Hi,
>
> On Thu, 18 Jul 2024 at 11:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Wed, Jul 17, 2024 at 05:39:47PM +0300, Dmitry Baryshkov wrote:
> > > Following the discussion on IRC, it is actually an error to require that
> > > properties that can not be chaged are marked as immutable.
> > >
> > > First of all, it creates inconsistent uAPI. Some drivers might have an
> > > immutable property, while others will have it mutable. Yes, there are
> > > known examples for such behaviour (e.g. zpos), but they are clearly
> > > documented in this way.
> > >
> > > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> > > more of the 'direction' of the property (whether it is set by the kernel
> > > or it is expected to be set by the userspace) rather than simply states
> > > that there is no way for the userspace to change the property.
> > >
> > > Drop the single-value-is-immutable tests.
> >
> > Makes sense, but we might drop some test coverage for the properties where
> > we _do_ want the single value to be immutable. Like zpos.
> >
> > So I think at least a cursory audit of existing properties would be good,
> > checking that the kerneldoc is accurate and then maybe limiting these
> > checks here to properties which are documented to have this behaviour?
> >
> > I know that's a bunch more work, but I fear if we just drop this we only
> > move from one a bit confusing state of the uapi to another one, without
> > real improvements.
> >
> > Ofc if all the compositor folks tell me that this doesn't matter anyway,
> > I'll shut up :-)
>
> Weston doesn't care - the effect is the same for us whether it's
> immutable or mutable-but-single-value.

For KWin's current code it does matter that blob properties that are
only set from the kernel side and that the compositor should parse are
immutable; if EDID were to become mutable for example, that could
cause a regression for KWin.

For properties like zpos, which the compositor is supposed to set on
some drivers, I'd prefer it if they were consistently never immutable.

> CCed some other compositor people too.
>
> Cheers,
> Daniel
