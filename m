Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56DAC3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 11:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D7E10E054;
	Fri, 19 Jul 2024 11:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R9qqJOgV";
	dkim-atps=neutral
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB3B10E054
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 11:57:18 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-65f9708c50dso18041917b3.2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721390237; x=1721995037; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hUUJKl0k3277ZMnwVFTmf8AGd/eYJDnLJtBU3R5tKks=;
 b=R9qqJOgVws4mwDYT4lu1XbaJbLQjyTS9AS8O8V712DDzdSig81SaSs/f123Avgmpxk
 oj9USSDIMCiwNnev5jPhFFOmxLqOrSnywAgZPo7I6cDNr5725m5ZYltx1MhMGbrWhkNX
 UUZ+O/otYkTKYHISI7/I5e8SPIgddKSK0shUve/IiD8hmyNy1WV/c4bRTu2KiiIV4dVN
 YWhFWHRZTY0Gunk2/32Fsujd3dh26RucNkPQnQB7NKfts0pRRvF36y704T1IWyjrGiFD
 bw0nbIoBavZiCSw7OvhbnAL4TB37swqHE2gJMmyoC6tsTykLYOMLcLD49ukoUY9MoPYm
 4pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721390237; x=1721995037;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hUUJKl0k3277ZMnwVFTmf8AGd/eYJDnLJtBU3R5tKks=;
 b=QrgAFvT51V1bLYvDzIZ09ceRlqoGF8w9BxACDbCDvPDTFWV0igxEohdHgXs8GsIlow
 w60CnYKSyZPotvI8PxPv//tk+N+BQLSegXlIsQRfIsw039ShSVXiTV+ufYk1HMTyGq+2
 6MkENDA452YpO0zdvdjw1y0KxoqekBjG7HJuhguVn8Yi9OzhHzzk7xsa4E5qgbIRQ1TJ
 BTuRobrrYjuW5Q5Jx0SbCXWAl65vN9ZR3hUDVKsUTFS1HgeStCQg4jxrkWjMGwOlYfpY
 T4+CEmVQPIYAVLhrzJOomtPOI30NVuAn87EIIbHsUDxzbhhk0zwSBHk9lxgDMlP6SsfK
 29eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlQK4EVlLXW8pVpsjkYAitVJ0qAxv/27qAP5v0EEKxuOLwqizR4lN3Xxvp6aXVN66ioDTBcp4KtiekYz0CjiEE+NW423yoUR+p4kHvcw==
X-Gm-Message-State: AOJu0Ywn9seIgIGupHpfwALN2YS9/M1ahkJbmNZhHiFv2JtHOenpa9gx
 tVghtz2AuppxYcw5NJn4ul9f96eutOk6OnTjFC7QOTvNEI61wJwAQsvXeu2eMyrYRIB/wAxIGwA
 SyRPI53dPxlddmv1RbtEqSM2iZt9rC6GD/Cc9Xg==
X-Google-Smtp-Source: AGHT+IES1HrjxIYk1XbZCgeguW8C/2e0e4P7GRZmpW3an+32JD2cy7Qg07Nz0HRWy/2zg0ZeyVl62VuwYXZdNJDC7SY=
X-Received: by 2002:a81:8986:0:b0:646:fe8e:f03b with SMTP id
 00721157ae682-664fe35cb83mr92994197b3.2.1721390237652; Fri, 19 Jul 2024
 04:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
 <Zpjn2dTHDrBBuTVH@phenom.ffwll.local>
 <CAPj87rM_5oKDcRa1sun4ErYXZFehv+1qFkO5Mx-2q-gfWO1jsg@mail.gmail.com>
 <CAFZQkGxOE3XhVcr6N89OReyPEDQnCrRLbvgb5x5UZPtuS7VGGg@mail.gmail.com>
In-Reply-To: <CAFZQkGxOE3XhVcr6N89OReyPEDQnCrRLbvgb5x5UZPtuS7VGGg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jul 2024 14:57:06 +0300
Message-ID: <CAA8EJpqw=v=OeGcuEk-TBBvhnRRDjjSp75007J_6HSSKSE+veQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_properties: drop immutability checks
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: Daniel Stone <daniel@fooishbar.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 igt-dev@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 emersion <contact@emersion.fr>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>, victoria@system76.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 19 Jul 2024 at 14:55, Xaver Hugl <xaver.hugl@kde.org> wrote:
>
> Am Fr., 19. Juli 2024 um 12:10 Uhr schrieb Daniel Stone <daniel@fooishbar.org>:
> >
> > Hi,
> >
> > On Thu, 18 Jul 2024 at 11:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > On Wed, Jul 17, 2024 at 05:39:47PM +0300, Dmitry Baryshkov wrote:
> > > > Following the discussion on IRC, it is actually an error to require that
> > > > properties that can not be chaged are marked as immutable.
> > > >
> > > > First of all, it creates inconsistent uAPI. Some drivers might have an
> > > > immutable property, while others will have it mutable. Yes, there are
> > > > known examples for such behaviour (e.g. zpos), but they are clearly
> > > > documented in this way.
> > > >
> > > > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> > > > more of the 'direction' of the property (whether it is set by the kernel
> > > > or it is expected to be set by the userspace) rather than simply states
> > > > that there is no way for the userspace to change the property.
> > > >
> > > > Drop the single-value-is-immutable tests.
> > >
> > > Makes sense, but we might drop some test coverage for the properties where
> > > we _do_ want the single value to be immutable. Like zpos.
> > >
> > > So I think at least a cursory audit of existing properties would be good,
> > > checking that the kerneldoc is accurate and then maybe limiting these
> > > checks here to properties which are documented to have this behaviour?
> > >
> > > I know that's a bunch more work, but I fear if we just drop this we only
> > > move from one a bit confusing state of the uapi to another one, without
> > > real improvements.
> > >
> > > Ofc if all the compositor folks tell me that this doesn't matter anyway,
> > > I'll shut up :-)
> >
> > Weston doesn't care - the effect is the same for us whether it's
> > immutable or mutable-but-single-value.
>
> For KWin's current code it does matter that blob properties that are
> only set from the kernel side and that the compositor should parse are
> immutable; if EDID were to become mutable for example, that could
> cause a regression for KWin.
>
> For properties like zpos, which the compositor is supposed to set on
> some drivers, I'd prefer it if they were consistently never immutable.

The zpos property is already sometimes immutable, e.g. for cursor planes.

-- 
With best wishes
Dmitry
