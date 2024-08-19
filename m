Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CACC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 18:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A5E10E2A4;
	Mon, 19 Aug 2024 18:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QGvc4TX6";
	dkim-atps=neutral
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A70D10E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 18:52:06 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5becc379f3fso3267815a12.3
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724093524; x=1724698324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yewPRnZxdu1JkV5oi0hou/M7czzKGFNY0ldY10WWXO0=;
 b=QGvc4TX6FW64fORfHFTp+qYvuYqzSAQQpD7Q8KlLFkpVbRMrWstUPTXi8Nm1aa1Vc6
 80jG5tO/6lQZAyomEMDVTZJVyBrbM2unVMbj79So/XjFTVBupXvD1AE45Shfa2TKiGOh
 XSrylRs4LyvD1obPDIn39RCWK9wqdfwi+0+6mvCdCjMl9zOlRRWDhmYH8UyFCjDikALG
 IqEjUUP5KfVWB4t4IXT81I95C86wFgh/ZIa4qOKVi80n/Hyc6F/VwQh8nLNz1DlROphg
 DpPlddQy5exCzRlQ2CBwSt/Db9pp8x69FYCR0clupvbS0t0Ug6+4vrO/iRF7VPCKDCjc
 QcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724093524; x=1724698324;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yewPRnZxdu1JkV5oi0hou/M7czzKGFNY0ldY10WWXO0=;
 b=CLxOUBlmWjJl6rKKAefM6sYqmTAcy/smrhFYIZ/krS9XMUfL7ex2WcO5kWCIoCaF+e
 YDOjYc+2vG5ulFcgEe5rBVhMOTSRA38cw2bon6ye5zzWtDCDXtJ1cYEb9k9vEFfWlcoE
 OWNTqHdVHm1lhNuRbcbRPAeC3lNOwHsKJ3H4eVb0b2k/irwjplvxTMWyY5Mqwo5U6HLY
 IUlmf0w31/5i3Y4jV1+L72JgcAsJzx67ZgejTwJW/tyCFmE+TCAXvTjdo3Ld75oOQKXN
 fwf5lu+Sp2BdmRhH3bmmUPaCo8sfURTft/HWRzRi5CcKrmOVLQkN6kKlEHEkRuXDOnnI
 BGGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVwp7kVpxx6UBcLHrHz4HAYvTCaeUVHcGtsrBO5T6MdLeIgMnDeM6+5jEM9ltbbzh5JleLsP8mfswQIV4LrYzDURdOsyE8hxf9MSRrhg==
X-Gm-Message-State: AOJu0Yw1mh/qrjtuyJWg3HHWnkM6vf1LCtGBMEw+siH0XXvoyR+wh7La
 qdGuofzZWvc1GSGER0ZJmo7nd+iDGvurslFhpTkYEc/SwddRH+hMkLTiFv+IZl6UTX+iJt3soao
 l+SPs3srPSNWDonIe1nwxt2KoXwU=
X-Google-Smtp-Source: AGHT+IFoxO8Fn+NxgdfmoABFeG5QjlKzzFmAMJ0fzeoen/Oi4XOsMdVHWudCwgxkmm11rFt/iOGmYtvsPHp9Y+sNogQ=
X-Received: by 2002:a05:6402:1e8f:b0:5a1:faf:e5ac with SMTP id
 4fb4d7f45d1cf-5beca7b03e1mr8763326a12.26.1724093524051; Mon, 19 Aug 2024
 11:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240814185426.70418-1-robdclark@gmail.com>
 <20240814185426.70418-2-robdclark@gmail.com>
 <20240819173652.t4ctowxlkzwkvjzc@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240819173652.t4ctowxlkzwkvjzc@kamilkon-DESK.igk.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 Aug 2024 11:51:51 -0700
Message-ID: <CAF6AEGtEkf4Mzo6iXCcdCUwhXxePKU_RZE8VrVUJwav6GQxhvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] device_reset: Require a PCI device
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 19, 2024 at 10:37=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2024-08-14 at 11:54:26 -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
>
> One nit about subject, please use 'tests/' prefix:
>
> [PATCH 2/2] device_reset: Require a PCI device
>
> should be:
>
> [PATCH 2/2] tests/device_reset: Require a PCI device
>
> >
> > Too much baked in assumptions that the drm device is a PCI device.
>
> Do you have examples where it is not true (e.g. not a PCI device)
> and reset is possible? Just curious.

maybe usb devices?

Platform devices cannot be reset at the bus level, since there is no bus.

BR,
-R

> Regards,
> Kamil
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  tests/device_reset.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/device_reset.c b/tests/device_reset.c
> > index 8ed3ef5220fc..c49f94e2faed 100644
> > --- a/tests/device_reset.c
> > +++ b/tests/device_reset.c
> > @@ -200,6 +200,7 @@ static void init_device_fds(struct device_fds *dev)
> >               igt_require_gem(dev->fds.dev);
> >
> >       igt_assert(device_sysfs_path(dev->fds.dev, dev_path));
> > +     igt_require(strstr(dev_path, "/sys/devices/pci") =3D=3D dev_path)=
;
> >       addr_pos =3D strrchr(dev_path, '/');
> >       igt_assert(addr_pos);
> >       igt_assert_eq(sizeof(dev->dev_bus_addr) - 1,
> > --
> > 2.46.0
> >
