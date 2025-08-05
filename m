Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A2DC87FCB
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 09:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA1210E642;
	Tue,  5 Aug 2025 09:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cqOcGeKY";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318AF10E63B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 09:20:13 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3b8de6f7556so1177316f8f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 05 Aug 2025 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754385612; x=1754990412; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Cn304dQNqNLOqA+su3s3RtWbtnUehYnIe2vAE4n9qQ8=;
 b=cqOcGeKYrJZjalf53ZhBFP1itWfXlt/6pLY7OZwVCiczhc7gcMqxjvMVifGQp4pksf
 otKWgEtFRL/BkxOYIODpKdrbdT/9Hflj9SZLWyDjd4f6NRyP6OiwDiKvWEhjezuK04jG
 8bVVxP29QNnkGxI2QqLYKdgrzPDCrlsM+dFuSr85BkYOO7iRKmawFFqHYDkg12hiOzLW
 3rqJOILafCZ+mCMxzCXOqa3TyHucI7dM1rX28/bzZL1edhiZdPSQbi8lvWfccUDzdvq7
 givqv4AL8SIqxZXDQFx9NJDRIuGs3XUqfXZ4kPlJxbkNbbOp4fjf2etDAfc4GEahIB4D
 fkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754385612; x=1754990412;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cn304dQNqNLOqA+su3s3RtWbtnUehYnIe2vAE4n9qQ8=;
 b=Hr4HGSfw/BWvWHO8ijmeMWdrCH/3hUrUHD3tC2zvMNUZ7eoWe+hbzNU/dGiBr0c1ey
 yEux5ZBSbFLLzCwYHyWSORHxcGz4RIdSQBWGqVVTIvdJ2dukIVLOY9YyDd6D6uXL/SrX
 ezQ5u1HialO3Lim3uVycgaohEsUTvEH4EAMaYYjIqWYx+YgxOPLUsVYPmjcQFqixAwxi
 Yndz1npyx50WMdyTBAPZPbvuRFspY+t4LalqHG28dJhh7ubfTLOqOVHI98mS+2GFt+8x
 OnRg95IpPULREKslf0gZ89UExrz6+pXYoDdNCm9/4yqJuIGnPtG0qZ1IV5JnJW41XGLU
 y4vQ==
X-Gm-Message-State: AOJu0YzNXiPPChylJIWJkURffjFCxRpKpdwbZtEdcxHenahqcx+y+ydY
 lW+aaWe/4TBQyjBM8HRQgIIoXrZJ57pXNaXwTDaS9M4ZZLlILGvXrKrX
X-Gm-Gg: ASbGncsOJrgF0yqyVg9p6OT9Sh5gebW3XYLvM4mvRKoXA20gJ0PlHLn9PKQFD18KEpj
 dTZ/h/KRLne9QApJUG6bceNcukhE/+7YSuYTjUuPscDuD068i2LMIKmODCt7Jw/EdqU8oHMKae9
 2PEkc/oe10cJGwhtjSIEgAp7QZjY+g6lAdbQOoZXksV7DGVtXHMNtWvoIl6O0OS90a/esT6os6B
 +BLTFKpT7/pOHYvnqvIt5iUy7hS7pUbYSpKNNUqHNOWi00UD8e13xQ0T5ATKh6tVPKvr9ZhecPc
 x3rSplx6KwsmQRjMFUE1X3xYwQLFgKFO/P3NClqPc0zUSccYnyNBQBqXg9CaCr9q1Hu6+/GCQd+
 bsOEZR0HVgN0lFP6Cgg4=
X-Google-Smtp-Source: AGHT+IHRwQ3PTagCuHiKU+4gvqSGcUwN0J1wnZ/ccOpZg0Lu6MqjDRqWKcG6/JyA9jAkFLPw42FzbA==
X-Received: by 2002:a05:6000:2083:b0:3b4:990b:9ee7 with SMTP id
 ffacd0b85a97d-3b8d9472877mr9914142f8f.22.1754385611388; 
 Tue, 05 Aug 2025 02:20:11 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c466838sm19316008f8f.49.2025.08.05.02.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:20:10 -0700 (PDT)
Date: Tue, 5 Aug 2025 11:20:09 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t v3 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
Message-ID: <aJHMyZwbV4bV7zma@fedora>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-3-jose.exposito89@gmail.com>
 <7d351560-2e44-47bb-a310-633a0f17469c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d351560-2e44-47bb-a310-633a0f17469c@bootlin.com>
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

Hi Louis,

On Wed, Jul 16, 2025 at 11:22:38AM +0200, Louis Chauvet wrote:
> 
> 
> Le 15/07/2025 à 12:24, José Expósito a écrit :
> > Create a library containing helpers for creating VKMS devices and
> > configuring them dynamically using configfs.
> > For the moment, add the minimal number of helpers to be able to start
> > testing VKMS's configfs support: Create device, destroy device and
> > destroy all devices.
> > 
> > Also, include the simplest possible test using those helpers (checking
> > the device's default files) and the scaffolding required to generate
> > the documentation.
> > 
> > Co-developed-by: Jim Shargo <jshargo@chromium.org>
> > Signed-off-by: Jim Shargo <jshargo@chromium.org>
> > Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >   docs/testplan/meson.build        |   7 +-
> >   lib/igt_vkms.c                   | 207 +++++++++++++++++++++++++++++++
> >   lib/igt_vkms.h                   |  27 ++++
> >   lib/meson.build                  |   1 +
> >   meson.build                      |   8 ++
> >   tests/meson.build                |   2 +
> >   tests/vkms/meson.build           |  13 ++
> >   tests/vkms/vkms_configfs.c       | 132 ++++++++++++++++++++
> >   tests/vkms/vkms_test_config.json |  72 +++++++++++
> >   9 files changed, 467 insertions(+), 2 deletions(-)
> >   create mode 100644 lib/igt_vkms.c
> >   create mode 100644 lib/igt_vkms.h
> >   create mode 100644 tests/vkms/meson.build
> >   create mode 100644 tests/vkms/vkms_configfs.c
> >   create mode 100644 tests/vkms/vkms_test_config.json
> > 
> > [...]
> > diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> > new file mode 100644
> > index 000000000..fa41f741e
> > --- /dev/null
> > +++ b/lib/igt_vkms.c
> > [...]
> > +static int detach_pipeline_items(const char *path, const struct stat *info,
> > +				 const int typeflag, struct FTW *pathinfo)
> 
> As there will be a new "color pipeline" in DRM, can you rename this set of
> functions to avoid confusion? I don't have preference for the name, what do
> you think about "dc" for display controller?
> 
> (ditto for the rest of the series)
> 
> With this modification:
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

The "pipeline" here refers to the display pipeline as in the docs:
https://docs.kernel.org/gpu/drm-kms.html#overview

Given that the VKMS driver is a display driver and that "enum vkms_pipeline_item"
contains those entites, I find easy to understand what we are talking about.

What do you think about leaving the display pipeline as "pipeline" and, once we
add the color pipeline, use "color_pipeline"?

I can rename all instances of "pipeline" to "display_pipeline" (with a lot of work,
100 occurences in igt_vkms.c in 41 patches), but I find it too verbose for little
clarification.

Jose

> > [...]
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
