Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB67C3DA59
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 07:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3083310E3B8;
	Mon, 22 Jul 2024 07:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="hCt5Mp3h";
	dkim-atps=neutral
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E904110EC29
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 13:29:54 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 88D673288FC
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 14:29:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1721395793; bh=PQktgT2WJOnKek2bS7LtQ1dryw5uSFabLbLj2S0kXdw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hCt5Mp3h9E3kHGlTDx12B5qmzkmVWrQ40BMcufmxQjxve0UaDV5uaS8V0HAHU6XXA
 FdN+nvPq4SE1YWwYoNK9kgBnJlwp/d8lL/NtVhgBToNwy1SO549uvgap7oFyCqXHiU
 VMABBiVK+w7ycJfeosg23WI2pm3ufbOCmQ5yMUCYmD/XuqUcX+k9R0HoDc0Kxkvddz
 tKQC1bJP45MKju+qnTBJGxO/KcFAi5mtP5I+jRk0gS9foRkEpyvKLzT4KIWukR5AUc
 D2G0ghs+sIT2qHfbEhjGpeLiuLDIABkcJCUITKfkIE6gJbMAHTpfWp6dHI230AxACD
 QCNHkpTw0J7eg==
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso1128675a12.1
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 06:29:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmGO2wVICq5HSbfIzw060LcfnUDlJca2I7Q6MIS0ydXow4Vw0yHravAMRrocY+6q0XVaehFcr3hXyLIYtmHOxJGqLrEK/MzFtqH4bNYA==
X-Gm-Message-State: AOJu0YwamdsC6BtvJDD/VzwZXyw97A8f4J8toU8ZPZBd6vlKpoouYePZ
 lS/NxlzGtZSOecQzG7Su4KyX0vgd7GkB0Uo6o72iH2fXo8T3OG9x2oJdRgHgcZzNrMyEcDRLGQG
 VffDRkI+OvEPBJACHCFjcctEQ2Cg=
X-Google-Smtp-Source: AGHT+IGD5iyaxIttKsSW4C7PjuFJowunNtY5ezLM6uPdq0KiYcPisptYfrvBiJrwAFNlRiziXNVoLft1pSQiq6oPiDw=
X-Received: by 2002:a17:906:b886:b0:a6f:1036:98cf with SMTP id
 a640c23a62f3a-a7a01337706mr499958366b.54.1721395792632; Fri, 19 Jul 2024
 06:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
 <Zpjn2dTHDrBBuTVH@phenom.ffwll.local>
 <CAPj87rM_5oKDcRa1sun4ErYXZFehv+1qFkO5Mx-2q-gfWO1jsg@mail.gmail.com>
 <CAFZQkGxOE3XhVcr6N89OReyPEDQnCrRLbvgb5x5UZPtuS7VGGg@mail.gmail.com>
 <CAA8EJpqw=v=OeGcuEk-TBBvhnRRDjjSp75007J_6HSSKSE+veQ@mail.gmail.com>
 <CAFZQkGz=VDjrKeHnWcv=WLxX6ZDYHvQ6agR+8zC2GT8XBpYQ6A@mail.gmail.com>
 <CAA8EJpopT+vEeo7mgUpH2B4dMN2n4qRzo_OyBbAeNAfXBmQv+Q@mail.gmail.com>
In-Reply-To: <CAA8EJpopT+vEeo7mgUpH2B4dMN2n4qRzo_OyBbAeNAfXBmQv+Q@mail.gmail.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Fri, 19 Jul 2024 15:29:41 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwMV_KLEHjRG=E0_xnsspiY5_n0h5SMq49f20_W+p=_OQ@mail.gmail.com>
Message-ID: <CAFZQkGwMV_KLEHjRG=E0_xnsspiY5_n0h5SMq49f20_W+p=_OQ@mail.gmail.com>
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

Am Fr., 19. Juli 2024 um 14:52 Uhr schrieb Dmitry Baryshkov
<dmitry.baryshkov@linaro.org>:
>
> On Fri, 19 Jul 2024 at 15:48, Xaver Hugl <xaver.hugl@kde.org> wrote:
> >
> > Am Fr., 19. Juli 2024 um 13:57 Uhr schrieb Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org>:
> > >
> > > On Fri, 19 Jul 2024 at 14:55, Xaver Hugl <xaver.hugl@kde.org> wrote:
> > > >
> > > > Am Fr., 19. Juli 2024 um 12:10 Uhr schrieb Daniel Stone <daniel@fooishbar.org>:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Thu, 18 Jul 2024 at 11:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > > On Wed, Jul 17, 2024 at 05:39:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > > Following the discussion on IRC, it is actually an error to require that
> > > > > > > properties that can not be chaged are marked as immutable.
> > > > > > >
> > > > > > > First of all, it creates inconsistent uAPI. Some drivers might have an
> > > > > > > immutable property, while others will have it mutable. Yes, there are
> > > > > > > known examples for such behaviour (e.g. zpos), but they are clearly
> > > > > > > documented in this way.
> > > > > > >
> > > > > > > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> > > > > > > more of the 'direction' of the property (whether it is set by the kernel
> > > > > > > or it is expected to be set by the userspace) rather than simply states
> > > > > > > that there is no way for the userspace to change the property.
> > > > > > >
> > > > > > > Drop the single-value-is-immutable tests.
> > > > > >
> > > > > > Makes sense, but we might drop some test coverage for the properties where
> > > > > > we _do_ want the single value to be immutable. Like zpos.
> > > > > >
> > > > > > So I think at least a cursory audit of existing properties would be good,
> > > > > > checking that the kerneldoc is accurate and then maybe limiting these
> > > > > > checks here to properties which are documented to have this behaviour?
> > > > > >
> > > > > > I know that's a bunch more work, but I fear if we just drop this we only
> > > > > > move from one a bit confusing state of the uapi to another one, without
> > > > > > real improvements.
> > > > > >
> > > > > > Ofc if all the compositor folks tell me that this doesn't matter anyway,
> > > > > > I'll shut up :-)
> > > > >
> > > > > Weston doesn't care - the effect is the same for us whether it's
> > > > > immutable or mutable-but-single-value.
> > > >
> > > > For KWin's current code it does matter that blob properties that are
> > > > only set from the kernel side and that the compositor should parse are
> > > > immutable; if EDID were to become mutable for example, that could
> > > > cause a regression for KWin.
> > > >
> > > > For properties like zpos, which the compositor is supposed to set on
> > > > some drivers, I'd prefer it if they were consistently never immutable.
> > >
> > > The zpos property is already sometimes immutable, e.g. for cursor planes.
> >
> > I know, I'm arguing that should be changed. It's just a weird quirk
> > that doesn't change anything for compositors.
>
> Maybe I'm missing something. For some of the Qualcomm devices we have
> generic planes which can have any zpos and in some cases a cursor
> plane which must be the last one. Currently this can be represented by
> using immutable zpos so we can make sure that the cursor plane is
> always on the top. If the zpos is always mutable, we have no way to
> tell userspace that this plane must be on top.

zpos is a range property, you tell userspace the possible values with
a min and a max value. If they're the same, there's only one value for
userspace to use.

> --
> With best wishes
> Dmitry
