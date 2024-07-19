Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F19C3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 12:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F421510EC23;
	Fri, 19 Jul 2024 12:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wpQvlfAn";
	dkim-atps=neutral
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9080810EC25
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 12:52:40 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6634f0afe05so20292187b3.0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721393560; x=1721998360; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5sEBI5haG+dFc3COLTyCfxdUbqO0ireYo5OA3YpCj7E=;
 b=wpQvlfAnaILgqP2Y6lSh1IYU6kiRDm/K7r5ImLc0Ipm05K1/OUH+C8c17YnkulIygW
 C1r5RWOy7SDRtyjBrOXB+J0Kr/tIrTMQg5JZjyeQJCU+sXslqScUv+DcaKoO5vUIAejD
 MxX0yS0qE7Fs769DsCbwFc1ZRGFEexrXASDQCr+ce469xi6qLpQbzIcy1ZiGOdgCVgCX
 moiyrIp6uFna4ssxkoY5W+TBtriL2e9vcoXwsNBxqIH0/k+2drZlzSL2x5ar4FdI0kY2
 6B20HdUqfK2Wf6rFH0Y2oJ/oO8RVQwoMC8iEJuCVd97pkZ9IyYpHIefkFtLbhXL+2mLa
 ZP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721393560; x=1721998360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5sEBI5haG+dFc3COLTyCfxdUbqO0ireYo5OA3YpCj7E=;
 b=DJvWgMoGzEy+e5qe32W3qyZl8NRMThuv6Crf1Aw9vEMazlwi5w0X69kwQNaMnl2d2N
 tPCH1vycMblzOI0s6wu3hFrMVk+0gWwvVS+ZsFZNmxuTZJu7zUwy/wU6Hm7RvH0/DVUs
 BdDNwD3GzlCvyil3lCXTx/P+NtbDsRA0qtk0QHLR3J+zfXWbwsD5zrjN+y+LMArSGvmT
 g3uRkBVZN7+I6G2jFoxLo/ufVdfJzyGLUIMBsfREVNGKTqVISbuweunAU6P1149I4ZM2
 zx3Wr/d5azTHxmbIA1XWQ3rnKoTjZEbRHsvpuoppKlQe1VpKFbqvfieT5E7/cpQWdDZ+
 r0Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYlIbJHSaUwzuNEc747nj7kb9UFMBQjSFQoI0BFnbmqfhTOS5E5+g/Nj2r24QLc9iF1V12GCTGdCYC1HilQ45F+nwyXscJuNabYCEw4A==
X-Gm-Message-State: AOJu0YzAWPBzE9php3frjcu4XPn2rgQPqWbh+7ql/md6ShoEZXsAHgBo
 nPGmcnzouh3X0jVL5Dpw/SZplHUsSuTSkNRCY4EbcCyUGwZrf9k8aZaTA6BfD4Acyig1gckmwBH
 HPBFKJf47Lx0U38QioWkLYtIG4J80YKBGnSU/Cw==
X-Google-Smtp-Source: AGHT+IGziHpnB0e1hH2m4oni+DovgMWxAqt8IUEED0BO9c6MP/zWCqnJ7l8pRGhcnjbTgh3Yl6/QEZ0v+smRo+azIrM=
X-Received: by 2002:a05:690c:3013:b0:664:8646:4d02 with SMTP id
 00721157ae682-66601bd7afamr70277657b3.12.1721393560015; Fri, 19 Jul 2024
 05:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
 <Zpjn2dTHDrBBuTVH@phenom.ffwll.local>
 <CAPj87rM_5oKDcRa1sun4ErYXZFehv+1qFkO5Mx-2q-gfWO1jsg@mail.gmail.com>
 <CAFZQkGxOE3XhVcr6N89OReyPEDQnCrRLbvgb5x5UZPtuS7VGGg@mail.gmail.com>
 <CAA8EJpqw=v=OeGcuEk-TBBvhnRRDjjSp75007J_6HSSKSE+veQ@mail.gmail.com>
 <CAFZQkGz=VDjrKeHnWcv=WLxX6ZDYHvQ6agR+8zC2GT8XBpYQ6A@mail.gmail.com>
In-Reply-To: <CAFZQkGz=VDjrKeHnWcv=WLxX6ZDYHvQ6agR+8zC2GT8XBpYQ6A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jul 2024 15:52:28 +0300
Message-ID: <CAA8EJpopT+vEeo7mgUpH2B4dMN2n4qRzo_OyBbAeNAfXBmQv+Q@mail.gmail.com>
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

On Fri, 19 Jul 2024 at 15:48, Xaver Hugl <xaver.hugl@kde.org> wrote:
>
> Am Fr., 19. Juli 2024 um 13:57 Uhr schrieb Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org>:
> >
> > On Fri, 19 Jul 2024 at 14:55, Xaver Hugl <xaver.hugl@kde.org> wrote:
> > >
> > > Am Fr., 19. Juli 2024 um 12:10 Uhr schrieb Daniel Stone <daniel@fooishbar.org>:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, 18 Jul 2024 at 11:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > On Wed, Jul 17, 2024 at 05:39:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > Following the discussion on IRC, it is actually an error to require that
> > > > > > properties that can not be chaged are marked as immutable.
> > > > > >
> > > > > > First of all, it creates inconsistent uAPI. Some drivers might have an
> > > > > > immutable property, while others will have it mutable. Yes, there are
> > > > > > known examples for such behaviour (e.g. zpos), but they are clearly
> > > > > > documented in this way.
> > > > > >
> > > > > > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> > > > > > more of the 'direction' of the property (whether it is set by the kernel
> > > > > > or it is expected to be set by the userspace) rather than simply states
> > > > > > that there is no way for the userspace to change the property.
> > > > > >
> > > > > > Drop the single-value-is-immutable tests.
> > > > >
> > > > > Makes sense, but we might drop some test coverage for the properties where
> > > > > we _do_ want the single value to be immutable. Like zpos.
> > > > >
> > > > > So I think at least a cursory audit of existing properties would be good,
> > > > > checking that the kerneldoc is accurate and then maybe limiting these
> > > > > checks here to properties which are documented to have this behaviour?
> > > > >
> > > > > I know that's a bunch more work, but I fear if we just drop this we only
> > > > > move from one a bit confusing state of the uapi to another one, without
> > > > > real improvements.
> > > > >
> > > > > Ofc if all the compositor folks tell me that this doesn't matter anyway,
> > > > > I'll shut up :-)
> > > >
> > > > Weston doesn't care - the effect is the same for us whether it's
> > > > immutable or mutable-but-single-value.
> > >
> > > For KWin's current code it does matter that blob properties that are
> > > only set from the kernel side and that the compositor should parse are
> > > immutable; if EDID were to become mutable for example, that could
> > > cause a regression for KWin.
> > >
> > > For properties like zpos, which the compositor is supposed to set on
> > > some drivers, I'd prefer it if they were consistently never immutable.
> >
> > The zpos property is already sometimes immutable, e.g. for cursor planes.
>
> I know, I'm arguing that should be changed. It's just a weird quirk
> that doesn't change anything for compositors.

Maybe I'm missing something. For some of the Qualcomm devices we have
generic planes which can have any zpos and in some cases a cursor
plane which must be the last one. Currently this can be represented by
using immutable zpos so we can make sure that the cursor plane is
always on the top. If the zpos is always mutable, we have no way to
tell userspace that this plane must be on top.


-- 
With best wishes
Dmitry
