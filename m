Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69E2C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 16:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E3610E9D3;
	Fri, 24 Jan 2025 16:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SD8gx5HA";
	dkim-atps=neutral
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB70810E0FD
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 16:02:18 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2ee76befe58so4098747a91.2
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 08:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737734538; x=1738339338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59Fx88ysSeHb7fbC8xVF/QxnzNjMCm3itbrfR8HHXk4=;
 b=SD8gx5HAb3PFhjfD/3ian7xoWMBVPFYtTnx+DqmwLVO7bzhOn2u/PYqza4b+urw8ce
 CCFP4ugCO5dMNifvFIBQhuQa73HJlsawxP5RLZcXJk/86MQHQgNSqW9Gz/vVbBz+yrAp
 qA+ekJ/V0P12OgGB+7KRlMysHNZpCSnLxvLoMo8qj4Pcag4mDwD0T6KdahIL7qbbvMvO
 e7VCtGaK2Zcz4Den31qa0HSnmYWUkK2y38Ja3zkcah6nnelUq8LT0nghQKFzo2P9ozsG
 eeS2D+PtKGrqrE2niqHburdvpD3AMOyc3gOurKNyj6tHN3LztzjdEdQTa3/jAXAfDIjJ
 7ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737734538; x=1738339338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59Fx88ysSeHb7fbC8xVF/QxnzNjMCm3itbrfR8HHXk4=;
 b=jf0jNiNzQs6U9YP8svjntmKfmeqnTT2J+wZQP/ZVOquuSQVQWy77Op2a+WrqIJJvSh
 FPJu0eJvbZ5r2UG20JOpMVqTIfc69O5Dsu8pwk18ZeXR9P8XzSYpRwzD5zrtgk0wyOiR
 ekIiiBXXWddmOsGTpiA35ZmbezAAzK36mqDlvZcn0Gbkb5FnaFXzWzXRDCVMIvlW/2Rp
 Ksl98j6zJyJd7AIyUvztkzwXmhY/wgnTDZkzv725tXyN90TyI3HnFsZyWVcSdfxw1pxz
 95h0aQC2xmwGVriwcIaeF6s8wb2OZqHKsfl0lmaHJ3VefSqcUI0l3RDRqzAjVEO8SbCk
 21xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT1FviA/PYGMTHLcLCkSWeyT4HzuzBMNEDrwWUGZ9WUkIrjpNyc15hv+ZOWssMBRPkBN1Q4IJf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyJLeI3XjBH/Te6fm4isGb7icUTV10yvNeRw+dALg9v+BoSMqc
 yLbRndZOdSBodOToODRhVO0y+qEyeizrA4z1fKKVeExS0bOJEszQZgSO/OxiZLhHuWx2Hrnlv/t
 nBxqgDDBfHYfEAbodDhX6jK4tYqk=
X-Gm-Gg: ASbGncuDqD0Aalm6dG6dD5P9xyOJ9uvcKk3wLAUtVucWrktiCBy7ubNKUPqPTmL56Cr
 2KF5eLTRrHXvefS+ilUfGt3q1sDMSTKkriTX5SHIzIq2GsXh6RMg2UdFGCkVZTs0=
X-Google-Smtp-Source: AGHT+IGPg7jdFzDrZoQdFy5KQyP9Ri6lnr3QbMLrr6ph+ZGALKrdQ+L+b6PH1wxwFVgOsugL6IWvQRCpj8dkeNMWLxg=
X-Received: by 2002:a17:90b:1f92:b0:2ee:8427:4b02 with SMTP id
 98e67ed59e1d1-2f782d4ee70mr46418494a91.28.1737734538248; Fri, 24 Jan 2025
 08:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20250123091546.3126819-1-jeevan.b@intel.com>
 <PH0PR11MB480690DB632E243000AEDFF2E4E02@PH0PR11MB4806.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB480690DB632E243000AEDFF2E4E02@PH0PR11MB4806.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Fri, 24 Jan 2025 18:02:06 +0200
X-Gm-Features: AWEUYZnlv2WFOglvmRc4sYPofQ7TshWF2xCSEvEX0afoANBk2sxGGA4IVFwtvzw
Message-ID: <CAJ=qYWR4xPua=qpOSzu9NPNHgOCqBKgT-mVZNwGJ8ypwy+8VkA@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_rpm: Update modifier to linear
 for display version 30+
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Cc: "B, Jeevan" <jeevan.b@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "Syrjala,
 Ville" <ville.syrjala@intel.com>
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

On Thu, Jan 23, 2025 at 5:03=E2=80=AFPM Thasleem, Mohammed
<mohammed.thasleem@intel.com> wrote:
>
> Hi,
>
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: Thursday, January 23, 2025 2:46 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>; B, Jeevan <jeev=
an.b@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Update modifier to linear =
for display version 30+
>
> On latest platform tile-X is no longer supported, So for display version =
30+ we can use linear tiling and tile-X for older platform.
> This change accounts for the limitations of gem_set_tiling, which no long=
er works on recent platforms and will not be supported on Xe drivers.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index 99=
0c50915..0f4da426b 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1188,6 +1188,12 @@ static void cursor_subtest(bool dpms)
>         int rc;
>         struct igt_fb cursor_fb1, cursor_fb2, cursor_fb3;
>         uint32_t crtc_id;
> +       uint64_t modifier;
> +
> +       if (intel_display_ver(intel_get_drm_devid(drm_fd)) >=3D 30)
> +               modifier =3D DRM_FORMAT_MOD_LINEAR;
> +       else
> +               modifier =3D I915_FORMAT_MOD_X_TILED;
>
>         disable_all_screens_and_wait(&ms_data);
>
> @@ -1199,7 +1205,7 @@ static void cursor_subtest(bool dpms)
>         igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
>                       DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
>         igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
> -                     I915_FORMAT_MOD_X_TILED, &cursor_fb3);
> +                     modifier, &cursor_fb3);
>  By adding this check for x tiled and liner it will check based on platfo=
rm but...
> the successor code which uses the cursor_fb3..
> ...
> /* Cursor 3 was created with tiling and painted with a GTT mmap, so
>          * hopefully it has some fences around it. */
>         rc =3D drmModeRmFB(drm_fd, cursor_fb3.fb_id);
>         igt_assert_eq(rc, 0);
>
> If modifier was DRM_FORMAT_MOD_LINEAR then below code __gem_set_tiling ca=
ll become no-op.
> As buffer already in linear layout operation below does nothing here.
> And if we add check to run on linear by skip blow line, we might miss ess=
ence of the test.
>       __gem_set_tiling(drm_fd, cursor_fb3.gem_handle, false, cursor_fb3.s=
trides[0]);
> @Heikkila, Juha-pekka/@Syrjala, Ville could you please share your thought=
s on it?
> igt_assert(wait_for_suspended());

I'm bit double sided on this. This test has not been running correctly
on any recent platform since removal of set/get tiling and it was just
not spotted because use of __gem_set_tiling() instead of
gem_set_tiling(). As with discussion with Jeevan earlier this test
does show some semi-interesting excessive logging at least on lnl
platform with Xe driver .. but those get/set tiling anyway just return
einval on Xe and that tiling probably is the special thing on this
test. I'm thinking this test was originally from Ville(?), maybe Ville
remember if there was something more to this test?

/Juha-Pekka

> ......
>         fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
>         fill_igt_fb(&cursor_fb2, 0xFF00FF00);
> --
> 2.25.1
>
