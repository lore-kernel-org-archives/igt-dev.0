Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B565DC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF3C10E214;
	Thu, 13 Mar 2025 17:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SLZs08zN";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F0610E8FD
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:22:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4394a823036so11689805e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741886570; x=1742491370; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UP9yoM42coaZXT68rWiVK3DHcKqNepQ7NcLYntYJrGc=;
 b=SLZs08zNOCuyimiZx4RXMBBcjwYWJ3pBiuZjvJV0czGDo2d1lKCJ0Y6LdJwlf0UcL5
 Q8w3d3l95A4T8cz6i8Xs7VNJuln1tXrV2E4QVrZRPqjsbgAR4KuuJ1gjS4nFwIttHWto
 joJgOLmRY+E5nh5L6v66tneQSDJT1gXzDC1uwOwHdnCPceqf6eAwDbXREARaM470c/7b
 WqlDPAn0+9Nx/HcqsuAZrZCBLy2SYabof2DdSVQq3ihGVqOnBJ/ChzDdOFuOUizuyQpn
 sv2zIczSR1UJr2h8Umuj0AngprUJTZa8XGHxjZ+tMANZvRzT2F9aVq4SR+4ps5f+1yTq
 qpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741886570; x=1742491370;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UP9yoM42coaZXT68rWiVK3DHcKqNepQ7NcLYntYJrGc=;
 b=raTIQ4zEuhMv5vCX5guv7ucYY/Wfk+GOKgxZ7ya9KGXkTYHO6VQzbZjFmq4ChAgGE9
 AzJpt8X8ZOS7bEpDkpTZdzGRAKegalZkMYXt83SOwOOqVLQ7C4/ZLw8L41oZuKJt8L4d
 JpAbOEC+uACYCIJpTcvrPJU+Wclnj/FVn6joM2twCg0X+g6xdP1ZoSLuTUkl3u7//kj+
 XUp+xnYpTzDmVst9Gk4jIDAkexbccIu0AF80+3tRW0eNp4YO6w+rzKFrsL7a3rTGy6ca
 e60blHIDOxXDN/ztLg/fz9XZXo4aGCEHl7nLwc1G5/OjK+w4O2zmYfF9/kKzibxtfl15
 h/yw==
X-Gm-Message-State: AOJu0YyGMz8GTJACeZhHhi0K5nkLpWiGrEXVfvtTh+35NyqCONjF3AET
 1GIVCGR1ld91emOdRQZ8gCW4jtxx8HxN8nSTkmKF9IMMMFtTUn6fbuJ+n7hK
X-Gm-Gg: ASbGnctXY82wkjQ8ciC1q/KUWS4QpCqqE2QW/260BifCe7WsMMKcFjkdqrSjFy/Cwgb
 EC8rLAn3C5EcRJysMUgw+GL7RmYSRrxK/FQTXmASv1dsMfYRN2ywqcx/5maSRbttip3t7eTsJlx
 XNx47vjjgtHoBgr+hwvqvbvxbxA79JpcmEzmGdV6niU5rWAp8o31NwkTa4cdpxNUbpELkjBClqS
 1IR9WEsgznYO5Xng+blBMq0iINx9t3aVgBsKu4QGf07sub0YNBUOlmD0THynvdynqtDg45sPX2I
 TVeWdB9QaE52SsJJR1Xw/rRQQNLthSrzmRu5Kx6S0A==
X-Google-Smtp-Source: AGHT+IG14rSW7y5mODTUB5Q4Ow2IJFZLvxBjkq7biQYwRwPrLi96rejKZQKFdrLNTYvLr/UStgFeOA==
X-Received: by 2002:a05:600c:35c7:b0:43b:cbe2:ec03 with SMTP id
 5b1f17b1804b1-43d01c22600mr113998855e9.27.1741886569646; 
 Thu, 13 Mar 2025 10:22:49 -0700 (PDT)
Received: from fedora ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a74d4bbsm59654375e9.13.2025.03.13.10.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:22:49 -0700 (PDT)
Date: Thu, 13 Mar 2025 18:22:47 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH i-g-t 01/39] lib/drmtest: Add VKMS as a known driver type
Message-ID: <Z9MUZxblyxdMVl2t@fedora>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
 <20250218165011.9123-2-jose.exposito89@gmail.com>
 <5a65a7b8-269f-4017-bf2f-5e1601336a1b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a65a7b8-269f-4017-bf2f-5e1601336a1b@bootlin.com>
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

On Thu, Feb 27, 2025 at 02:12:13PM +0100, Louis Chauvet wrote:
> 
> 
> Le 18/02/2025 à 17:49, José Expósito a écrit :
> > As we are going to add VKMS specific tests, allow to check if it is
> > available.
> > 
> > Co-developed-by: Jim Shargo <jshargo@chromium.org>
> > Signed-off-by: Jim Shargo <jshargo@chromium.org>
> > Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >   lib/drmtest.c | 18 ++++++++++++++++++
> >   lib/drmtest.h |  8 ++++++--
> >   2 files changed, 24 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 436b6de78..2cc6e0c29 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -971,3 +971,21 @@ void igt_require_xe(int fd)
> >   {
> >   	igt_require(is_xe_device(fd));
> >   }
> > +
> > +void igt_require_vkms(void)
> > +{
> > +	/*
> > +	 * Since VKMS can create and destroy virtual drivers at will, instead
> > +	 * look to make sure the driver is installed.
> > +	 */
> > +	struct stat s = {};
> > +	int ret;
> > +	const char *vkms_module_dir = "/sys/module/vkms";
> > +
> > +	ret = stat(vkms_module_dir, &s);
> > +
> > +	igt_require_f(ret == 0, "VKMS stat of %s returned %d (%s)\n",
> > +		      vkms_module_dir, ret, strerror(ret));
> > +	igt_require_f(S_ISDIR(s.st_mode),
> > +		      "VKMS stat of %s was not a directory\n", vkms_module_dir);
> > +}
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index 27e5a18e2..1b57e49ec 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -54,15 +54,18 @@ int __get_drm_device_name(int fd, char *name, int name_size);
> >   #define DRIVER_PANFROST	(1 << 5)
> >   #define DRIVER_MSM	(1 << 6)
> >   #define DRIVER_XE	(1 << 7)
> > -#define DRIVER_VMWGFX   (1 << 8)
> > +#define DRIVER_VKMS	(1 << 8)
> > +#define DRIVER_VMWGFX	(1 << 9)
> 
> Is it normal to change the DRIVER_VMWGFX value?

Ugh, not at all. This looks like poor conflict resolution by me during one of
the multiple rebases.

Thanks for noticing!

> I also found the `module` list in drmtest.c that use this value, I think
> this list is used to do the proper `modprobe` during a open_driver().
> 
> Maybe you can use it, so you will be able to do:
> 
> 	drm_load_module(DRIVER_VKMS); // (If I understand correctly, this fails
> silently)
> 	igt_require_vkms();
> 
> And future tests requiring a vkms device will be able to do:
> 
> 	open_driver(DRIVER_VKMS);

Good point, added the missing bits to drmtest.c and the call to
"drm_load_module(DRIVER_VKMS);" in "igt_fixture".

Sending v2 in a bit with this and other changes :)

Jose

> >   /*
> >    * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> >    * with vgem as well as a supported driver, you can end up with a
> >    * near-100% skip rate if you don't explicitly specify the device,
> >    * depending on device-load ordering.
> > + *
> > + * Exclude VKMS to prefer hardware drivers.
> >    */
> > -#define DRIVER_ANY 	~(DRIVER_VGEM)
> > +#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS)
> >   /*
> >    * Compile friendly enum for i915/xe.
> > @@ -135,6 +138,7 @@ void igt_require_i915(int fd);
> >   void igt_require_nouveau(int fd);
> >   void igt_require_vc4(int fd);
> >   void igt_require_xe(int fd);
> > +void igt_require_vkms(void);
> >   bool is_amdgpu_device(int fd);
> >   bool is_i915_device(int fd);
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> 
