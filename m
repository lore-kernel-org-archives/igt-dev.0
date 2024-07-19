Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6508FC3DA59
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 10:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A3C10EBAD;
	Fri, 19 Jul 2024 10:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="wFasWLHg";
	dkim-atps=neutral
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E48710EBAD
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 10:10:23 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-79f19f19070so63145785a.0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721383822; x=1721988622;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IQauPP/W1MmwPSI2r9EpR8lJiYdy6KyElP+cJCuRCYw=;
 b=wFasWLHgqVvdn0TlI57xAmB3sLpmw606UUxAHPeWIBrygCkR8AtvO7xqxmXAILgH5V
 YoDydKka25k2aU2eAy1zyn/gqMf9ZDvmZbDB1+dZ5Pq4QUjQa5EuowmOvnkb4GheigIn
 GSXwVk3weikmHYkAvRlCGyhgAFBNt4VbTZv8ibjp7k7ptW6dRB3cpC4cR6Ls44r9SL/C
 UPcZMX8UbeOXpgxlec3RhJKEowcZrXlgB7I5zXfv36BBLE0YXWQTWppmNCc6qWKx5vXF
 c6IuMQrnV0m7f/PktAxm/ICJbe0VaHU1drC7m+Z3xF2bw03YbKrGhkNarkSB2MSdDM3f
 pPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721383822; x=1721988622;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IQauPP/W1MmwPSI2r9EpR8lJiYdy6KyElP+cJCuRCYw=;
 b=TZ0nNqFpJXbX+tq0dhwpl7Hima1kOOosdFk4GwFdIFRhic6SoNceHfZ3Ffvinbkx88
 NEY+KgcyfEdY4wJtHEjJfWJHnpIfpamo8zHg1ZpL6z7ds5nnkrpIb98MBSh5x/ZcwGPp
 0nyw1SUjrK1mgr4kH7N4snsc9i/Aq+CPcX8bYn6FMvphUhAdDGSWYcufRY/woUuGxkVE
 Pjc1Mtc+TfcVRc/fzPOCfptubAF4ipOFQwY57aTHxztfOkHPTP1kveu7Xbe3vbGgbhN2
 LwEJPx+2d1hlxCZMYV5unTjsrkGEJPykS93JtV/yaFS2ce81A0lzOnCaU8ErWb8HzRWV
 llgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULqfRsZhhVV/+ZezQGyhti97A8/h/qLAvtoDoGKylP0TH6RCAg10ALGGr5S3Vhp64qNd++CP7+XwcFKUHDO9jPDKENuOZNLfxhAUf3hg==
X-Gm-Message-State: AOJu0YzO+z7I26heWj3qepIzcyNmfU16l2HBmV0C6W1XC5DVKb7yj4UV
 jeYGItR0htjDxqupAvNlVpLB9T8kDtfu4OOab+jOWXJkqmdD8dwBgnXHZM0Scy3qnvqp84Bu3Ej
 HpdeokJMh4h4Q6s71CWutN9atAjIOTMRXOUo8cQ==
X-Google-Smtp-Source: AGHT+IG1gkwcUDrx+feHP5ExvczJC+OKwnczAFqj4AcHWCYAkGul/HD0YAC4SUdlWrJvxK7EsuKSfT6b9MNc14jdHsk=
X-Received: by 2002:a05:620a:40c5:b0:79d:59bb:639f with SMTP id
 af79cd13be357-7a1875162abmr853870985a.65.1721383822218; Fri, 19 Jul 2024
 03:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
 <Zpjn2dTHDrBBuTVH@phenom.ffwll.local>
In-Reply-To: <Zpjn2dTHDrBBuTVH@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 19 Jul 2024 11:10:10 +0100
Message-ID: <CAPj87rM_5oKDcRa1sun4ErYXZFehv+1qFkO5Mx-2q-gfWO1jsg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_properties: drop immutability checks
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 igt-dev@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 emersion <contact@emersion.fr>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>, 
 victoria@system76.com, xaver.hugl@kde.org
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

Hi,

On Thu, 18 Jul 2024 at 11:01, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Wed, Jul 17, 2024 at 05:39:47PM +0300, Dmitry Baryshkov wrote:
> > Following the discussion on IRC, it is actually an error to require that
> > properties that can not be chaged are marked as immutable.
> >
> > First of all, it creates inconsistent uAPI. Some drivers might have an
> > immutable property, while others will have it mutable. Yes, there are
> > known examples for such behaviour (e.g. zpos), but they are clearly
> > documented in this way.
> >
> > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> > more of the 'direction' of the property (whether it is set by the kernel
> > or it is expected to be set by the userspace) rather than simply states
> > that there is no way for the userspace to change the property.
> >
> > Drop the single-value-is-immutable tests.
>
> Makes sense, but we might drop some test coverage for the properties where
> we _do_ want the single value to be immutable. Like zpos.
>
> So I think at least a cursory audit of existing properties would be good,
> checking that the kerneldoc is accurate and then maybe limiting these
> checks here to properties which are documented to have this behaviour?
>
> I know that's a bunch more work, but I fear if we just drop this we only
> move from one a bit confusing state of the uapi to another one, without
> real improvements.
>
> Ofc if all the compositor folks tell me that this doesn't matter anyway,
> I'll shut up :-)

Weston doesn't care - the effect is the same for us whether it's
immutable or mutable-but-single-value.

CCed some other compositor people too.

Cheers,
Daniel
