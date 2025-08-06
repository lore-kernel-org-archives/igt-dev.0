Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D543AC87FD1
	for <igt-dev@archiver.kernel.org>; Wed,  6 Aug 2025 08:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A4710E3C5;
	Wed,  6 Aug 2025 08:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hj+K19mZ";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4E910E3C5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Aug 2025 08:38:50 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so30747235e9.1
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Aug 2025 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754469528; x=1755074328; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kK6JtHoadsXYU+kWD797vPT3zlYcdxVNuOVJ2EXXcW8=;
 b=hj+K19mZjHW+tido7wnc83hqyNnSyWhR7kbd/eKk+kRL+hpQ7f3YEY7Ga66JTS0lJe
 MDJ3jwxbgyW4PwU6Bmc+rFMxqhCvtLZeChWAskszij2gvVfe4gRpfpkpelEu1znk+im+
 W7t1tmgTakB9cJkWIY61X6JmwTfviH79l7S7SaJ3LucJB69cvH/SEsFYyWg/ZT62iTOG
 kb7sLhCIEvSKkBFqr4TjxIqDSKiVPYFix5m61/vXDESJ0d2rr2+zs/Cku/1xeNY0uhKy
 aY63ijlbDp8lxh6rrb0mkBiTAEwDF+MGvBRwevjZgBDDlEPza8Pmc85XSZ7USpwfIzqj
 cvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754469528; x=1755074328;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kK6JtHoadsXYU+kWD797vPT3zlYcdxVNuOVJ2EXXcW8=;
 b=dk8swCJK2IP8pC1gxYqv2JPRQL9yyKv6IJdUjafdJgNmNqWaJIUzR+0CBb+iYg1nbn
 alCAPv3ZIN/oHT8fmLOtZ0WUs6nz2jQ9hI4KTW1ZqqJMDUsBWbeqzcnsU+o7UG3hNQ+Y
 eiGeozAmz4r+GfXc674G3HTQtfUMftWUXh7XWr8SW7IhMvh1yGZo+5guZZZ31wZ6LVyH
 rzHm9oyn4FtACX+2sNySrvLAln4gqo/VkHRPKUglkf0L7NjTUZLaY7U5Tv1mzCpHatVK
 CTkMIwdFH4bEyWVNbLpTz6Evgx0Nui2Fi9RWTs3cr6BdfBNGha4AyR+mdo/BiKl96GWa
 desQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI07c0idjnb1znJAUpdH8wRm9DfGSXk7p+JO+QgKgsvduIjs5d32YaC2SU1FeTLYRIyVcO13WP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHUlhTese6mFBbzkJBo6/3hJEoC1zOmZ3p9SLEY290dZAX5rwv
 q97Na97fOCM67CydqhE/QZJWv5/ATYWOCaZgUrJPA92LUsuVBHhLOp1m
X-Gm-Gg: ASbGncvgaE5m0xCRkjeW7yaX4M5BZ7DUWdIg9lNYy29OEKgWdKHWIHmLxBM1uOCk0Bf
 5nr/d78ZU7IOBTP+4AzO74ONIU8JAm39ZjtUk1YxgSpkeTy2gjvqSZVjuo360Gm47e3Pm015wuz
 +jZGDowWu88mPenwU/Wsrpi4+7inlwLsIA1fOUinrUdEnRuAwEE3lCxu5SmeDxYiLifFx4DHvBv
 zClnB03s+KOTsXyZRy1I9QaZlsJJbw/dyYOoj/8z+XmLtlX1Y+Fh1O9p3kIIPmtBwqKyEVXhWDD
 S3GT+ZUs8B9aOHXZApCE0ZSf9mcKgVnK+TuDKgM2N8/RC9defF1aB18Uzl/VApOA7VByUaV/zzJ
 K5Klgdz07WeenV22wzSk=
X-Google-Smtp-Source: AGHT+IG3jna/12SzLLNZfXgWpdFdVjD4QqhLOxwCknridyTv1lWSls6MpdDOo1E/h17cQncHRLxW0Q==
X-Received: by 2002:a05:600c:1c1b:b0:455:f187:6203 with SMTP id
 5b1f17b1804b1-459e711add2mr14798535e9.27.1754469528343; 
 Wed, 06 Aug 2025 01:38:48 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459ded356b9sm97933725e9.12.2025.08.06.01.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 01:38:47 -0700 (PDT)
Date: Wed, 6 Aug 2025 10:38:46 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>, karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t v3 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
Message-ID: <aJMUlsAjj5u8WH9H@fedora>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-3-jose.exposito89@gmail.com>
 <7d351560-2e44-47bb-a310-633a0f17469c@bootlin.com>
 <aJHMyZwbV4bV7zma@fedora>
 <20250805162944.vsk75aejhp5aeyjb@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250805162944.vsk75aejhp5aeyjb@kamilkon-DESK.igk.intel.com>
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

On Tue, Aug 05, 2025 at 06:29:44PM +0200, Kamil Konieczny wrote:
> Hi José,
> On 2025-08-05 at 11:20:09 +0200, José Expósito wrote:
> > Hi Louis,
> > 
> > On Wed, Jul 16, 2025 at 11:22:38AM +0200, Louis Chauvet wrote:
> > > 
> > > 
> > > Le 15/07/2025 à 12:24, José Expósito a écrit :
> > > > Create a library containing helpers for creating VKMS devices and
> > > > configuring them dynamically using configfs.
> > > > For the moment, add the minimal number of helpers to be able to start
> > > > testing VKMS's configfs support: Create device, destroy device and
> > > > destroy all devices.
> > > > 
> > > > Also, include the simplest possible test using those helpers (checking
> > > > the device's default files) and the scaffolding required to generate
> > > > the documentation.
> > > > 
> > > > Co-developed-by: Jim Shargo <jshargo@chromium.org>
> > > > Signed-off-by: Jim Shargo <jshargo@chromium.org>
> > > > Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> > > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > > ---
> > > >   docs/testplan/meson.build        |   7 +-
> > > >   lib/igt_vkms.c                   | 207 +++++++++++++++++++++++++++++++
> > > >   lib/igt_vkms.h                   |  27 ++++
> > > >   lib/meson.build                  |   1 +
> > > >   meson.build                      |   8 ++
> > > >   tests/meson.build                |   2 +
> > > >   tests/vkms/meson.build           |  13 ++
> > > >   tests/vkms/vkms_configfs.c       | 132 ++++++++++++++++++++
> > > >   tests/vkms/vkms_test_config.json |  72 +++++++++++
> > > >   9 files changed, 467 insertions(+), 2 deletions(-)
> > > >   create mode 100644 lib/igt_vkms.c
> > > >   create mode 100644 lib/igt_vkms.h
> > > >   create mode 100644 tests/vkms/meson.build
> > > >   create mode 100644 tests/vkms/vkms_configfs.c
> > > >   create mode 100644 tests/vkms/vkms_test_config.json
> > > > 
> > > > [...]
> > > > diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> > > > new file mode 100644
> > > > index 000000000..fa41f741e
> > > > --- /dev/null
> > > > +++ b/lib/igt_vkms.c
> > > > [...]
> > > > +static int detach_pipeline_items(const char *path, const struct stat *info,
> > > > +				 const int typeflag, struct FTW *pathinfo)
> > > 
> > > As there will be a new "color pipeline" in DRM, can you rename this set of
> > > functions to avoid confusion? I don't have preference for the name, what do
> > > you think about "dc" for display controller?
> 
> Could you give a link to lore.kernel.org for this 'color pipeline'?

Here is a nice article by Melissa with links to the patches
as well as to some other improved tooling:
https://melissawen.github.io/blog/2025/05/19/drm-info-with-kms-color-api

I hope it helps,
Jose

> > > 
> > > (ditto for the rest of the series)
> > > 
> > > With this modification:
> > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > 
> > The "pipeline" here refers to the display pipeline as in the docs:
> > https://docs.kernel.org/gpu/drm-kms.html#overview
> > 
> > Given that the VKMS driver is a display driver and that "enum vkms_pipeline_item"
> > contains those entites, I find easy to understand what we are talking about.
> > 
> > What do you think about leaving the display pipeline as "pipeline" and, once we
> > add the color pipeline, use "color_pipeline"?
> 
> These looks resonable. Karthik, could you comment on this?
> 
> > 
> > I can rename all instances of "pipeline" to "display_pipeline" (with a lot of work,
> > 100 occurences in igt_vkms.c in 41 patches), but I find it too verbose for little
> > clarification.
> 
> Well, you can use sed script for this but I am afraid that there
> are many other places in igt with 'pipeline' meaning
> 'display pipeline', so it would be a lot more work to do.
> 
> Regards,
> Kamil
> 
> > 
> > Jose
> > 
> > > > [...]
> > > 
> > > -- 
> > > Louis Chauvet, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
