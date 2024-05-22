Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC944C25B7A
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6563310E1D4;
	Wed, 22 May 2024 14:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bAynS4ss";
	dkim-atps=neutral
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BB110E53C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 14:53:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-523b017a5c6so9845859e87.1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716389601; x=1716994401;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHdX0ZqB8MgH4hxTEAcCtiBeXNnJGWlbGokNqXjsDho=;
 b=bAynS4ssDII855abFVTZIKPBHKFr0TOHi3OZH5vhw06r5z3rr7RYhuQI8RBwsMbU7L
 7FrAK7Peh4ATgOR/hmIjpUyAMs6nkfUlZK2ToLXxGfdl3Unyi/w1DH9ypblEFy+Fh/gw
 +VzPwH7bFNK+QweMbRibMV6RYAPsJzQuz7FeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716389601; x=1716994401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aHdX0ZqB8MgH4hxTEAcCtiBeXNnJGWlbGokNqXjsDho=;
 b=C70/la+qGGcmRSpna2vSYYP1IXmkmtA/BGHnRiNrhPMc3eAp5sXdmqfhVeA5zWBiZY
 qnfFd0ufa8w+gid1LWokhIgy/X1IoigTF69wr1Bhus3GQ1nXI6j6b5ZIVTCNyjAw1onq
 A24AcANOlUNsOaM8QGlkTPS491ezYXsF0X0d53fAijgfdmLez9eoQOSlhPR57W7coOI2
 Zd44pr2VujBd8QEVm3swvuAiIZVy+DnjkeLokgkk98D36aSjiL+Iy3zJIOLocCsIeLjs
 Fp+fHTKT0YfUgahNLRzydUKTSPHU8igrruSHychdqI8GsKWjKAYuulRf4vfKkY3zyIXM
 8xwg==
X-Gm-Message-State: AOJu0YygWx2RIrQJVW95HWuP5/Va1FeDkyFHsztScUlLsqJHIPT+zRtM
 W6HdFsBdSaMwDIUHjODD3FWPLIDJEnbOobwhJpJC4m07msySJamDd+gaa0QImC9sgs/CbVR45ui
 vEx9TywCI5LWkXgV3Txc1eqrrmYA3lWk66ih/
X-Google-Smtp-Source: AGHT+IGDN9m8l85dix9uUNHIE37Mx8FdEQ5GU72XxE1DovMnUvKL40k9P5DAveq0ME7iig8gSD0AAyXbZ4ws0/1LR/E=
X-Received: by 2002:a05:6512:3ba:b0:523:892c:9e0 with SMTP id
 2adb3069b0e04-526bfc007dcmr1962650e87.41.1716389601196; Wed, 22 May 2024
 07:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240518003345.203255-1-khaled.almahallawy@intel.com>
In-Reply-To: <20240518003345.203255-1-khaled.almahallawy@intel.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Wed, 22 May 2024 07:53:09 -0700
Message-ID: <CAE72mNmxxJKm1UhLz+1Riq4PYBhUOnW_UYDHPSGJKQGkW3K26A@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_sysfs_edid_timing: Skip the first detect
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>, 
 Mark Yacoub <markyacoub@chromium.org>, Shawn Lee <shawn.c.lee@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

Thanks for the patch Khaled.

On Fri, May 17, 2024 at 5:33=E2=80=AFPM Khaled Almahallawy
<khaled.almahallawy@intel.com> wrote:
>
> It is observed in some chrome devices that the first detect take a
> long time due to PPS. In another device it was found the eDP panel
> misbehaving and keep sending multiple long HPD during PPS which
> trigger HPD storm warning. This first detect will always exceeds the
> THRESHOLD_PER_CONNECTOR and will cause the test to fail.
>
> Avoid that by skipping the measurement for the first detect.
> Also adding more debug logs in the test and kernel to be able to
> correlate the results.
>
> Fixes: VLK-52052, VLK-56861
>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Shawn Lee <shawn.c.lee@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  tests/kms_sysfs_edid_timing.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.=
c
> index dbc66c876..b7832dd83 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -50,7 +50,7 @@
>  #define THRESHOLD_PER_CONNECTOR                150
>  #define THRESHOLD_PER_CONNECTOR_MEAN   140
>  #define THRESHOLD_ALL_CONNECTORS_MEAN  100
> -#define CHECK_TIMES                    15
> +#define CHECK_TIMES                    16
>
>  IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each=
 "
>                      "connector and fails if either the time it takes for=
 "
> @@ -89,15 +89,25 @@ igt_simple_main
>                 for (i =3D 0; i < CHECK_TIMES; i++) {
>                         struct timespec ts =3D {};
>                         int fd;
> +                       uint64_t current;
>
>                         if ((fd =3D open(path, O_WRONLY)) < 0)
>                                 continue;
>
> +                       igt_kmsg(KMSG_DEBUG "%s: start detect\n", path);
>                         igt_nsec_elapsed(&ts);
>                         igt_ignore_warn(write(fd, "detect\n", 7));
> -                       igt_mean_add(&mean, igt_nsec_elapsed(&ts));
> -
> +                       current =3D igt_nsec_elapsed(&ts);
> +                       igt_kmsg(KMSG_DEBUG "%s: end detect\n", path);
>                         close(fd);
> +
> +                       /* Skip first detect */

Could we add a comment that summarizes why we skip first detect for readabi=
lity.
Also please double check the CI failures and make sure not related to
this change.

Everything else looks good

Reviewed-by: Manasi Navare <navaremanasi@chromium.org>

Manasi

> +                       if(i =3D=3D 0)
> +                               continue;
> +
> +                       igt_mean_add(&mean, current);
> +                       igt_debug("%s: i=3D%d current=3D%02fdms mean.max=
=3D%02fms mean.min=3D%02fms\n",
> +                               de->d_name, i, current/1e6,  mean.max/1e6=
, mean.min/1e6);
>                 }
>
>                 igt_debug("%s: mean.max %.2fns, %.2fus, %.2fms, "
> --
> 2.34.1
>
