Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F900E77170
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 11:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C950C10E3B6;
	Thu,  5 Dec 2024 11:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nW2QUyo0";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B13E10E3B6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 11:35:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2155157c31fso6120455ad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Dec 2024 03:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733398543; x=1734003343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JlbSIlHOxiu6Ygqoo61gX+LcBkwQ2m0QugdzuuVKPDI=;
 b=nW2QUyo0IKWdEWGEK8tj/9MVRwQheg/RJn228OFDRrtr28DRJO98uWGgdZwc/BOkUo
 iFkzIE+G3cU3/wfYyi6b+qmygY2PQhBAgRKDqrrjimq/Eb8cvWbSoPDwK7vd3Aub19e0
 ZchJtZpW8izgwnZ7HOo9Rt8Uk/pJDYwzJOPDU579hpZdXwvjx+BsXRo8zjBZbbGit2Qt
 nWOELx6unRJPNNVUJsgIAIbqcTj25w3yF1l9Vejp6vTx0X+mCl39Un+9IPZnqUWZGmEF
 mI3MAl55mpOXyeSwfqPfM4t4BCDrsrZfIAE946MmawtOicxnb8R72KO2XcHaM4bw4/QN
 t5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733398543; x=1734003343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JlbSIlHOxiu6Ygqoo61gX+LcBkwQ2m0QugdzuuVKPDI=;
 b=bijeeLqFeFyuM8+72JxIUZd0YEJKSN5uSUh/jaUe0TyDz6Z/LsqX5RJQzTm6EQBnqr
 CAaboW+XYKpzas8D5Xa/RSizwQ/V8CEAv4GIOWmZhs8z6AM+1HVaV5wkHxb4iebbedw2
 HWB0xQfiL0G2ukePX5k2tJ1hxnAormf40FLLmGkmjWxKJk/tgN2nmaOcFlRWdnAJLPhY
 M452yS2P8sGufQQJLY5DBaD0oN/Wd2dQdTzojCwERWmSR67YdG09RbTJC9PwYNloeM3X
 pag1DuynljNqDAnrAYgrA9uH9+oFltgv2bm8m37qipsKsy1Y208Nd4/ywkPG+aRytnaa
 JUMg==
X-Gm-Message-State: AOJu0YzASSFyDuCYjufaV5gUQr/F9Eq05qSkWCo1OuasS3+t93+fZa+U
 xxqXcU6n3tLNFDmV46nfEiZw058tTDHY05OOZpFw1Bs8/nSwfRvEl3dZdLma/jxjDbQoMcsiV0H
 GzY81Z2dXaMGTkGw92xPieXbYzf4=
X-Gm-Gg: ASbGncusSA09nFblWSC7jDvLp3/loYwl70dCOBQTPMwCtySJ8QRBL7OiEIXKhjJJajS
 s1mXfAfzi84GW+elzq1kl7RRyIFQZkCqOgw==
X-Google-Smtp-Source: AGHT+IGeaf2PGLRSexhZkuIhN58m3xyddd0xcEOfJQEGwpqxi/4KAIqk9GJvT11kPnAKPxpZcKdgYm+OnuDTS0A48iw=
X-Received: by 2002:a17:902:f688:b0:215:8fd3:d1b6 with SMTP id
 d9443c01a7336-215f3cbb3f6mr38419245ad.23.1733398542580; Thu, 05 Dec 2024
 03:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20241205060049.1236277-1-jeevan.b@intel.com>
In-Reply-To: <20241205060049.1236277-1-jeevan.b@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 5 Dec 2024 13:35:31 +0200
Message-ID: <CAJ=qYWSEbGHHebGeJYFrAGsLKipHV0rbD9kqOfemuQJ0bACSTg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_rpm: Update cursor_fb3
 framebuffer creation format
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com, 
 rodrigo.vivi@intel.com
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

On Thu, Dec 5, 2024 at 7:45=E2=80=AFAM Jeevan B <jeevan.b@intel.com> wrote:
>
> Updated the cursor_fb3 framebuffer creation in the cursor subtest
> function to use a supported tiling format, either X-tile or linear,
> for supported platforms.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 990c50915..283911afb 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1198,8 +1198,13 @@ static void cursor_subtest(bool dpms)
>                       DRM_FORMAT_MOD_LINEAR, &cursor_fb1);
>         igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
>                       DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
> -       igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
> -                     I915_FORMAT_MOD_X_TILED, &cursor_fb3);
> +       if (igt_display_has_format_mod(&ms_data.display, DRM_FORMAT_XRGB8=
888,
> +                                     I915_FORMAT_MOD_X_TILED))
> +               igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
> +                             I915_FORMAT_MOD_X_TILED, &cursor_fb3);
> +       else
> +               igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
> +                             DRM_FORMAT_MOD_LINEAR, &cursor_fb3);

How does this change align with that few lines below is this:

        /* Cursor 3 was created with tiling and painted with a GTT mmap, so
         * hopefully it has some fences around it. */
        rc =3D drmModeRmFB(drm_fd, cursor_fb3.fb_id);
        igt_assert_eq(rc, 0);
        __gem_set_tiling(drm_fd, cursor_fb3.gem_handle, false,
cursor_fb3.strides[0]);

?

Regardless if here would be tried to set linear tile mode to linear
tile mode that __gem_set_tiling is going to say in any case it's not
supported on the same platforms as where x-tile is not available, see
here https://patchwork.freedesktop.org/patch/325343/

>
>         fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
>         fill_igt_fb(&cursor_fb2, 0xFF00FF00);
> --
> 2.25.1
>
