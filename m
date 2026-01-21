Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A715CC4450D
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 12:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BF210E771;
	Wed, 21 Jan 2026 12:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YCi++AHJ";
	dkim-atps=neutral
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D84A10E771
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 12:00:57 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-81f4e136481so3075455b3a.3
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 04:00:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768996857; cv=none;
 d=google.com; s=arc-20240605;
 b=EgLQeqjsOKfEajj+UZ+Mgxx+YWpHDexyR41sYJBSxDbvO++4MMJgp412j1D9AW6DJT
 AYZLk4GYVJiD0Hs4mKCOdxjwQgoewkBP6mjjFO4x7nwkIPjPlnZ1wEaG5qaT5LPjjZ1g
 HgDYtcFol9KXPuXodZr7zgotmvVlk6Oxf+Odp06XLYWPkYm/v7pAldaikg3U7OevC1p+
 hvnD0KUCfMzR49wlRz7ZUqtrbpqW2OE87Rli1BdBodqWYJnCMi6IHcsVmyXGhsUcWJ45
 j5onpPA0eQ4YVxT77STVPSnocN+4Zb9J+4a3MWj872bu3/TFkS+gTaMy46dsUiil9IPm
 lLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=j6JvXg6Dkj3QaNmNNzWPGY3PzYa6Gg0s7vVR7VzqoRk=;
 fh=jiZtKjlARfrRM2yNEBasMo1wsZCckE6V/OhneC84kWQ=;
 b=J8ZjyuVez6RxuO6atj8yN31Ui6Lll91Y5e7NmGh5niMLNwkmdyfCU4eTofPnOribwX
 fJxCJQ+7dsxmTF2GROaPUcQxqK2FEq8HmxwDp2URNj0yKEsmZ11dDMGW3HjlXvouGQ6l
 E1/2YSWp3efWpp1l+0330HcqIKH+dxtp9yHwSVKk4hf4o8hbbMkh9Avr8PjNjtrVBgjN
 t7UM2SqlAsDLTiR/tVhD7lk5fc0G43AA19UJxYTYKQub08lCyjgX3/inMJD08PQkhBFp
 WslyWluvLFN+X0BJun9a3M4CiEWrJx/HtpaLpUTXxyb8N+NfFXkSd6gihZdLcGMxR8Ig
 0Kbw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768996857; x=1769601657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6JvXg6Dkj3QaNmNNzWPGY3PzYa6Gg0s7vVR7VzqoRk=;
 b=YCi++AHJztMPSO4UeJuDJfcXdWXLjW0/J7fiBna5yEvtF/2ePXpEkkpc+RoV4x9eSQ
 foQ4N3X/qjkFSfoCjE6eMn/xNjv+rumDu61uGnWqqwhalB9ZazXWURzMf8KVpIOhogaM
 uU3fvHX2Khdua5tw97T0t7xeBqe23jiHUEHNNQlF908oxdCiOtKVWUTbcsmUnBYTmiay
 lPNkOGT8bQbd7zZ2DTESRjnLw+9Eu9GQr7fhL0NgLqrS/qC5AWgtz23B7UFt+WqMhVGC
 t6c9Op5M05ksKPSLap7qlSjKyO8Ul3PHzqHngUY6G2gawnlQzlVZ470nCZB+8eij3W9/
 UICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768996857; x=1769601657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j6JvXg6Dkj3QaNmNNzWPGY3PzYa6Gg0s7vVR7VzqoRk=;
 b=X2x3pZU/tm+dFL3Pnq1dqZul2oBvrWuLweEtXtGD6UVhzP/8BNWe7vxy0YnUGAHyKq
 oSHSYLWwwYVom6K+5WkLdIE61p2IboHbOwx4BI0LzuEl0S0O63cbFJPiotMXFDLqJ9dY
 R0OM6F4kdv2MgguNj5eB2/lx0i4X0fJdQIGTPON0jbMBbW/QMmLSPukLvLZP6cA5JXGv
 gZIc8gtHUOyJecZjS7lJQOoD3LPL7jnY/R6d2zPwy2j3PUedyz29sW/kuqHQGl7XO6eV
 FitFX9zJMO7Od2LGv7GW7DCDu6JyzNnPsLnPRDCwd3L4ZqXeMkWrsrGD9kCF9oHeJdWH
 nfHw==
X-Gm-Message-State: AOJu0YxYR2dePIphsoI1jj93ne8KeXE85NxbG7ajo+JtYyQM47jNajpQ
 M4sKaiiN08p+ecRJsVCjsqxoLWEcLawyiB7HipguRdYI6r9YU2O+1exV5EnYcZPliXtK1jJM4sS
 yk2XUWITT6bHqJbTVovdFHtdk/jIlrcY=
X-Gm-Gg: AZuq6aIITxDO3ltA9mG825CwESeU/hx5PJYyopo5Dyb7lK6EPX+zRuyNd6Kijj6pGQA
 aXGa4/iBPBFSN03ILFV54HcAgWdxU5yWBwL9D8dUzNVpNlMLsq3tUDSVjz1zXkrIapVaX2/AHjl
 5zSXsRINrxcTsC4VV/DHbevkFHLzZS6yzJ2Q3+Cp51XmNO+Fq7maWQIu7jMzTPOd4Lb33bXYoiX
 vUTCwPp3S+tA4CbRTKeOvC/p0iAeuVZOMzM9uAJzB/jhu0j2JpuBpiT/KbmG8kcfp700umTgjgj
 6OnGT5iruZC05p436GF9v3M59vb06x1DrUNsDsCM
X-Received: by 2002:a05:6a21:a87:b0:38c:627f:872b with SMTP id
 adf61e73a8af0-38e00d47ca8mr15875814637.59.1768996856580; Wed, 21 Jan 2026
 04:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
 <20260120045545.102676-4-ramanaidu.naladala@intel.com>
In-Reply-To: <20260120045545.102676-4-ramanaidu.naladala@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 21 Jan 2026 14:00:45 +0200
X-Gm-Features: AZwV_QgX3fnHeDxkd3cjqRNQo4pDli6SQsIEPrQzeIlLDdyRp5rE1h32oQRp_9s
Message-ID: <CAJ=qYWS_hoAt9FkFfZp8jBBJDKR43-p2GeJ+mpQD+ZXKmOPp8A@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/kms_plane: skip cursor clamping to
 avoid false positives
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevan.b@intel.com, 
 juha-pekka.heikkila@intel.com
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Tue, Jan 20, 2026 at 7:02=E2=80=AFAM Naladala Ramanaidu
<ramanaidu.naladala@intel.com> wrote:
>
> Clamping subtest is not applicable to the cursor plane. Returning
> early caused the subtest to be reported as passed, which can
> mislead results when clamping is exercised elsewhere. Switch to
> igt_skip() with a clear reason so the outcome is reported correctly
> as =E2=80=9CSKIP=E2=80=9D.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index b71b3586f..396afce9a 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1094,7 +1094,7 @@ static void test_format_plane(data_t *data, enum pi=
pe pipe,
>          * No clamping test for cursor plane
>          */
>         if (data->crop !=3D 0 && plane->type =3D=3D DRM_PLANE_TYPE_CURSOR=
)
> -               return;
> +               igt_skip("Clamping is invalid for the cursor plane.\n");
>
>         for (int i =3D 0; i < plane->format_mod_count; i++) {
>                 if (data->mod =3D=3D plane->modifiers[i]) {
> @@ -1116,10 +1116,9 @@ static void test_format_plane(data_t *data, enum p=
ipe pipe,
>                 ref.format =3D DRM_FORMAT_XRGB8888;
>                 ref.modifier =3D DRM_FORMAT_MOD_LINEAR;
>         } else {
> -               if (!plane->drm_plane) {
> -                       igt_debug("Only legacy cursor ioctl supported, sk=
ipping cursor plane\n");
> -                       return;
> -               }
> +               if (!plane->drm_plane)
> +                       igt_skip("Only legacy cursor ioctl supported, ski=
pping cursor plane\n");
> +
>                 do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &=
width));
>                 do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, =
&height));
>                 ref.format =3D DRM_FORMAT_ARGB8888;
> --
> 2.43.0
>
