Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C9DC87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAF810E0D6;
	Thu,  7 Aug 2025 07:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lzO2URmV";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689E410E0D6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:48:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so5543855e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552911; x=1755157711; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eqIQ9ijkwc/IKfxNUtMenja+nw/QXQ/qe8oK557j/ms=;
 b=lzO2URmVLjJXtw4D0s57YZuYKCTUcqLg8up5iLdoBjCIQcomBFqn9BRA5S89nYp9VD
 xadBn8sNqCsjQA3Y/trfxwAKdZR8m1bR201O7rg2eDDjyYpV8z1hztrxpwsnh3JRJzMT
 BwmyeXmjNkJ/NSsAv4jpoY9YTUXIJcw0IgdkTEL4iRMppTHA3OqgEuw3G7MEdUratWm3
 0TgEE95VGlPi0Ydn3qnAWEE35i+mHhJ8dyi0jY2qJ0IaLlS5XPtsFrxBmG2KZMFhR9ZL
 I9nEockYdaH39nmsixA3OozZhvtSffv9s2X3UwORbyv542xQmOLqy0HOEphJBm2L2+Y+
 yUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552911; x=1755157711;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eqIQ9ijkwc/IKfxNUtMenja+nw/QXQ/qe8oK557j/ms=;
 b=cGOuFe8bei+Woyd5SDKS6Zwf35XSAhX2F+/2c8FnaQGkfP99l5Gm5mk3P/hxQ2idjy
 A8rCB+VNe+B9mjOKkJausVUov/9UYGpOAwV+ka8tbyL39gCqDW2MIElvKkFGmGycHFNw
 vZDnSgCw5Kk9WhRcrn3p2rOlYjFw6oNxZLKR1mK6v6p+MG+reJuFb4PRxqqjRQIONSE8
 AymLtmBcEMWdl1U/IxIxL7jYRifgiGn3bo2MaEWdUkU6SVAY++jNG0987OWSXmXNURY5
 RuKsLVwl6egUYcpiPkHl3uJ+AYqnXADa884qdOUcb2NmSlhJbzcIJPrdjg1iKIxEHGUB
 kbGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs1nVEfaurJhugwZwx41PxIuFPmC2RjV1DmpoYDzdPOGlnkX/GyzmgEK9k9JSJbZokarCjr8/S@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOlqr9CLbP8jBfWwF5yZaifY5QoKkwxO/uK6+m3QMaY7hG9M7l
 ToZmr7vTRS0nHOAioYJsl6nCC0HLkBEaYlJXzpNuMS9wr6DWKSzhfdEz
X-Gm-Gg: ASbGncvuSNokyJ4vH8BrBNsu1TMnGnTfERQtMVU8FSBwYb0rVdvisiH0a0K9MfgaBab
 buGkZjxdf9QQatxdmHRsmWjs9LAra2rst29bbCMMO1PfSK6MOW6NeSNjGCsgBVS8/4kXQE4S7gH
 jWjH/rD+lMcvEXIQ7o3qA7nr1nRTR6yhU18lRnwqaLy5JPajn1ZwO2hODmWYSdl0vVCLKK1j6TB
 KBLao5w4XlEeMsU5SnUy74fJbuwhtPfncOSRLORUyvGNALsUZF2OLFiv66hki0+gUUMiq1lAl7/
 sYfbYwzvz9Md+511SFeTZ0BJ39W8gtQ2Y3fZtsoeyQqwbMr4fbrbggJjy4tzTYgs57Layb6KDbl
 1ikl1uXAEgMpibUuSLLo=
X-Google-Smtp-Source: AGHT+IHz7ee/XwHuLodODwbQVJ5uos7r/84Cn4SFt0gsPCFJ1Omu7Gdd/t7Vi3AW0D1XbMaL3504BQ==
X-Received: by 2002:adf:cc04:0:b0:3b8:f8d0:f75c with SMTP id
 ffacd0b85a97d-3b8f8d0f79amr2151046f8f.35.1754552910826; 
 Thu, 07 Aug 2025 00:48:30 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459eec47306sm19432295e9.28.2025.08.07.00.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:48:30 -0700 (PDT)
Date: Thu, 7 Aug 2025 09:48:28 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH i-g-t v3 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
Message-ID: <aJRaTBsiDcrzgA_R@fedora>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-3-jose.exposito89@gmail.com>
 <7d351560-2e44-47bb-a310-633a0f17469c@bootlin.com>
 <aJHMyZwbV4bV7zma@fedora>
 <20250805162944.vsk75aejhp5aeyjb@kamilkon-DESK.igk.intel.com>
 <75914ea6-0a33-4d3c-9ae7-7bd9096a7879@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75914ea6-0a33-4d3c-9ae7-7bd9096a7879@intel.com>
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

On Thu, Aug 07, 2025 at 10:10:17AM +0530, Karthik B S wrote:
> 
> On 8/5/2025 9:59 PM, Kamil Konieczny wrote:
> > Hi José,
> > On 2025-08-05 at 11:20:09 +0200, José Expósito wrote:
> > > Hi Louis,
> > > 
> > > On Wed, Jul 16, 2025 at 11:22:38AM +0200, Louis Chauvet wrote:
> > > > 
> > > > Le 15/07/2025 à 12:24, José Expósito a écrit :
> > > > > Create a library containing helpers for creating VKMS devices and
> > > > > configuring them dynamically using configfs.
> > > > > For the moment, add the minimal number of helpers to be able to start
> > > > > testing VKMS's configfs support: Create device, destroy device and
> > > > > destroy all devices.
> > > > > 
> > > > > Also, include the simplest possible test using those helpers (checking
> > > > > the device's default files) and the scaffolding required to generate
> > > > > the documentation.
> > > > > 
> > > > > Co-developed-by: Jim Shargo <jshargo@chromium.org>
> > > > > Signed-off-by: Jim Shargo <jshargo@chromium.org>
> > > > > Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> > > > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > > > ---
> > > > >    docs/testplan/meson.build        |   7 +-
> > > > >    lib/igt_vkms.c                   | 207 +++++++++++++++++++++++++++++++
> > > > >    lib/igt_vkms.h                   |  27 ++++
> > > > >    lib/meson.build                  |   1 +
> > > > >    meson.build                      |   8 ++
> > > > >    tests/meson.build                |   2 +
> > > > >    tests/vkms/meson.build           |  13 ++
> > > > >    tests/vkms/vkms_configfs.c       | 132 ++++++++++++++++++++
> > > > >    tests/vkms/vkms_test_config.json |  72 +++++++++++
> > > > >    9 files changed, 467 insertions(+), 2 deletions(-)
> > > > >    create mode 100644 lib/igt_vkms.c
> > > > >    create mode 100644 lib/igt_vkms.h
> > > > >    create mode 100644 tests/vkms/meson.build
> > > > >    create mode 100644 tests/vkms/vkms_configfs.c
> > > > >    create mode 100644 tests/vkms/vkms_test_config.json
> > > > > 
> > > > > [...]
> > > > > diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> > > > > new file mode 100644
> > > > > index 000000000..fa41f741e
> > > > > --- /dev/null
> > > > > +++ b/lib/igt_vkms.c
> > > > > [...]
> > > > > +static int detach_pipeline_items(const char *path, const struct stat *info,
> > > > > +				 const int typeflag, struct FTW *pathinfo)
> > > > As there will be a new "color pipeline" in DRM, can you rename this set of
> > > > functions to avoid confusion? I don't have preference for the name, what do
> > > > you think about "dc" for display controller?
> > Could you give a link to lore.kernel.org for this 'color pipeline'?
> > 
> > > > (ditto for the rest of the series)
> > > > 
> > > > With this modification:
> > > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > The "pipeline" here refers to the display pipeline as in the docs:
> > > https://docs.kernel.org/gpu/drm-kms.html#overview
> > > 
> > > Given that the VKMS driver is a display driver and that "enum vkms_pipeline_item"
> > > contains those entites, I find easy to understand what we are talking about.
> > > 
> > > What do you think about leaving the display pipeline as "pipeline" and, once we
> > > add the color pipeline, use "color_pipeline"?
> > These looks resonable. Karthik, could you comment on this?
> 
> Yes, this looks good.

Thanks for your feedback. I sent v4 with all the requested changes,
but at least for the moment, I didn't rename the pipeline:
https://lore.kernel.org/igt-dev/20250807074550.6543-1-jose.exposito89@gmail.com/

Thanks to everyone for their reviews!
Jose

> Thanks,
> Karthik.B.S
> > 
> > > I can rename all instances of "pipeline" to "display_pipeline" (with a lot of work,
> > > 100 occurences in igt_vkms.c in 41 patches), but I find it too verbose for little
> > > clarification.
> > Well, you can use sed script for this but I am afraid that there
> > are many other places in igt with 'pipeline' meaning
> > 'display pipeline', so it would be a lot more work to do.
> > 
> > Regards,
> > Kamil
> > 
> > > Jose
> > > 
> > > > > [...]
> > > > -- 
> > > > Louis Chauvet, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
