Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB789C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 18:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673F311277C;
	Mon, 15 Apr 2024 18:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RLsLXHpT";
	dkim-atps=neutral
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4977E11277C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 18:31:25 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so3573493a12.0
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 11:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713205883; x=1713810683; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUiMvNjy0BKUA0oN4KcD1ok82oTTUeKLDD/c3CZw1Ok=;
 b=RLsLXHpTnSy+tgInAwELEjwTIKeL/9C3JcUyd98YShAMRiq4HjG7hRJ1VuD1fHUYOa
 9WNLQGVuZhsbVt4WlD873uDpaaGAaRD+GO3oJxPYV3gFCl7EvmQzFZ9Yc0skCovRJEQm
 OWwT063e8c1OgtGKB4Oj+7bvhVnefs1F1L1fuFFksSeiA4KLwX1F+BkmyXgkVmy3NiSJ
 f5+Nr2xPSSp499hCnDl9b7t7lSx5aezY/yC+CnfrTq7NrhruLpjdRGbB7kDNjut2RaLF
 fY12+AGSLh4zQGgCYAto2uePMcX1WPe67lFcS78jdQ/TVc5dJJ7nrxjguHvxVPQ3sijN
 jaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713205883; x=1713810683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUiMvNjy0BKUA0oN4KcD1ok82oTTUeKLDD/c3CZw1Ok=;
 b=pstzzEOIyTylsktbh6AueZvuymd2Qvw+R62tL4lESUFflYTFWvd5f+Y8duV4fwT6Z+
 avDfWDR35hA1FR/RrYwyQMIWl6sG/t5M3+BvyPWjrhnCGwbkq8TmIMeCYrL8uxndyHFJ
 B30HtYtyJwpBee+XOxudcCwupN78l8BvpdvIp9V/DNjDqV5b9FUi2Fs52hmQ+BUdsWWY
 sPhQTNFpySz3AmtPHpOL5e9xEDdlrqU5uWWuLyTJzNdSFwSH12YUm9TZ5qnRhEZ9YlJC
 HwNqYGPFIz9bjb86nxqb+roz6lAcXyhemDmjcBytWeoUAhTk45azXJvxz+mlfJosFA2G
 hx1A==
X-Gm-Message-State: AOJu0YzFgcD5yT3vDKT4kxlUVyf8kll4xYF76RvODKvWdQBtC7x3JJqM
 +oGI3HGI48FdBS1FJMcWYdm6YoPmlD1N7WyHTpEXDTPUojt4zIDYr1n6aYaqO9eMhQOU7DJqqhr
 cwqz7+8jFsfU48JejsfQhGJos98M=
X-Google-Smtp-Source: AGHT+IEMcLoKG0L5XkWO1n9IzQ+ry4E7ftIeRZLBNuiTpYW5J3EKf3YUoVowQhZ543CdUb/6BcRdoXD2G1Lc3R5VYLY=
X-Received: by 2002:a50:a69e:0:b0:56d:b687:5a45 with SMTP id
 e30-20020a50a69e000000b0056db6875a45mr7239247edc.1.1713205882939; Mon, 15 Apr
 2024 11:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240403013302.2277902-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240403013302.2277902-1-quic_abhinavk@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 15 Apr 2024 11:31:10 -0700
Message-ID: <CAF6AEGuUeHW-FJp7hnnToocWBGd1yBPJJZZPC+Fu_uBnBF9r=A@mail.gmail.com>
Subject: Re: [RFC PATCH i-g-t] lib/igt_kms: move setting
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: igt-dev@lists.freedesktop.org, dmitry.baryshkov@linaro.org, 
 quic_jesszhan@quicinc.com, petri.latvala@intel.com, markyacoub@chromium.org
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

On Tue, Apr 2, 2024 at 6:33=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
> Currently DRM_CLIENT_CAP_WRITEBACK_CONNECTORS is set in the igt_display_r=
equire()
> which is invoked for all IGT tests irrespective of whether the rest of th=
e
> writeback connector properties such as the FB_ID are set.
>
> This results in all IGT tests running even on writeback connector
> which certainly fails many tests on MSM hardware because tests such as CT=
M
> rely on CRC being collected post CTM in the display pipeline but for MSM =
hardware
> there is no CRC collection point post CTM for writeback connectors.
>
> It is unclear whether this is intentional to be able to run all IGT tests=
 even
> with writeback connector or it is only kms_writeback which is supposed to
> be the one.
>
> Lets try with the latter approach by setting DRM_CLIENT_CAP_WRITEBACK_CON=
NECTORS
> only within kms_writeback.

Makes sense to me.. trying to use writeback as an output for
non-writeback tests seems like the sort of mistake that the
DRM_CLIENT_CAP_WRITEBACK_CONNECTORS cap was intended to prevent.

Reviewed-by: Rob Clark <robdclark@gmail.com>

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  lib/igt_kms.c         | 2 --
>  tests/kms_writeback.c | 5 +++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c38021dd7f74..c03eabdf1d6e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2750,8 +2750,6 @@ void igt_display_require(igt_display_t *display, in=
t drm_fd)
>         if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
>                 display->is_atomic =3D 1;
>
> -       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> -
>         resources =3D drmModeGetResources(display->drm_fd);
>         if (!resources)
>                 goto out;
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 6cd685b37af2..3448dc06f891 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -558,6 +558,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt=
_handler, NULL)
>         igt_fb_t input_fb, input_fb_10bit;
>         drmModeModeInfo mode;
>         unsigned int fb_id;
> +       int ret;
>
>         memset(&display, 0, sizeof(display));
>
> @@ -570,6 +571,10 @@ igt_main_args("b:c:f:dl", long_options, help_str, op=
t_handler, NULL)
>
>                 igt_require(display.is_atomic);
>
> +               ret =3D drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WR=
ITEBACK_CONNECTORS, 1);
> +
> +               igt_require(!ret);
> +
>                 output =3D kms_writeback_get_output(&display);
>                 igt_require(output);
>
> --
> 2.44.0
>
