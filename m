Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A85E7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 21:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D6E10E189;
	Fri, 10 Jan 2025 21:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="RmjgEoq7";
	dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A4110E189
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 21:09:42 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-46677ef6910so24146741cf.2
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 13:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1736543372; x=1737148172;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ijbGaV0ThMOqSDeSp5bKWPVMoPcUozZtWi1672mB0j0=;
 b=RmjgEoq7Swe9S1lSypwxkG4jP5s/Av8bXT8+YxRn6DLSYD4t7d/JbFfPl3yNpBrqh9
 Pl4ZmBPJ1N5AMGdXernl9ggsRGfIqInWzsC3y4uR52d7JIDdI/jUVNbUbgUlE1jJkrix
 Up9TqIxvbHM6QwQUGYugFCTpHQoPHxdhIHsBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736543372; x=1737148172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ijbGaV0ThMOqSDeSp5bKWPVMoPcUozZtWi1672mB0j0=;
 b=R2sZR/bjE/kVVP2urVeUYlMf0j262yNeCXgyqaAB/LKtqUMeHipmd8jt8P6bl5EFJG
 d4V5729DyX462CUPPSfBkAEEDxRPtR7hTb3LmgV0b+mFccmAC1nH3jypVOGiWmbhrjqb
 YLZQDkehr4ScLLYaAdIenI/w3Tj6jLY69MruD2zrZoprk6koC5skN8sUwfYZfhvubXqz
 RfwK2+0JWOG/hm49RecJw1wrAnnEDPa4FLX3Tw7zA+99m6bS19su0/fB/Iq9GSLVTm1N
 A/qgJSPDdJnL2CoIlR1v04JOfCldnCwMLka47rm/gQV7MjRi8Kmi1c+CB3iUtaRLyWHS
 +0Cw==
X-Gm-Message-State: AOJu0YzR5gOqgOdqvzB9p2R9LCmvI27pqpYDgUkL0IuhcAXHOkOGhmgk
 R5d6OL+MQudyC8YbUAOXWOBi2FZM1qoZXd3GE9o49Mcxa2kQgg9qETXd5okoIKa+T0mmN0I5KXi
 h2Fc8+Qht4J1RbUZ+MVQ2yIdh7VFVN3b0dCDDyVyjEA9mDEo=
X-Gm-Gg: ASbGncsv5uzCF9FBt6LWC3jI5Yd4eWQmXlG1yKGHnCUMFLEsH3TGobEAVEU2AswDlPJ
 yZRAtEYMtsD3YVFe58ytARkof/3mBzMhmjM7kXjI=
X-Google-Smtp-Source: AGHT+IFqqCKuupjXXRN4BO4RRoRJ6Z1ttVu2L96MwWlopJn15enX1o1b5tX738gCzhIRHM3A8ym4KP3EuFNtKZzz97M=
X-Received: by 2002:a25:6ac4:0:b0:e46:e18:9e83 with SMTP id
 3f1490d57ef6-e54ee1eaeecmr8227681276.39.1736541892282; Fri, 10 Jan 2025
 12:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20250110201116.1485633-1-maaz.mombasawala@broadcom.com>
In-Reply-To: <20250110201116.1485633-1-maaz.mombasawala@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 10 Jan 2025 15:44:39 -0500
X-Gm-Features: AbW1kvZcG371Kz7pPeWdIkxUfwDcdDnVjhnJyE9r-_xU0FCuhqgnLi2lQ57pCik
Message-ID: <CABQX2QMub9XYZKO56G2GuVtxdttA0OXswePHB=jf24G_HnA5tw@mail.gmail.com>
Subject: Re: [PATCH] tests/vmwgfx: Check for 3d support on context and surface
 creation.
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: igt-dev@lists.freedesktop.org, ian.forbes@broadcom.com, 
 martin.krastev@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000da1d02062b60824e"
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

--000000000000da1d02062b60824e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 3:11=E2=80=AFPM Maaz Mombasawala
<maaz.mombasawala@broadcom.com> wrote:
>
> Creating a vmwgfx context or surface will fail on a vm without 3d support=
.
> Check for 3d support when creating them so that the tests which use them
> skip instead of crashing.
>
> Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> ---
>  lib/igt_vmwgfx.c                    | 12 +++++++++-
>  tests/vmwgfx/vmw_execution_buffer.c | 35 +++++++----------------------
>  2 files changed, 19 insertions(+), 28 deletions(-)
>
> diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
> index 74c13b52b..94d255655 100644
> --- a/lib/igt_vmwgfx.c
> +++ b/lib/igt_vmwgfx.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
> - * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
> + * Copyright (c) 2021-2025 Broadcom. All Rights Reserved. The term
>   * =E2=80=9CBroadcom=E2=80=9D refers to Broadcom Inc. and/or its subsidi=
aries.
>   */
>
> @@ -175,6 +175,11 @@ uint64 vmw_ioctl_get_param(int fd, uint32 param)
>         return arg.value;
>  }
>
> +static inline uint64 vmw_supports_3d(int fd)
> +{
> +       return vmw_ioctl_get_param(fd, DRM_VMW_PARAM_3D);
> +}
> +
>  void vmw_ioctl_get_3d_cap(int fd, uint64 buffer, uint32 max_size)
>  {
>         struct drm_vmw_get_3d_cap_arg arg =3D { 0 };
> @@ -445,6 +450,9 @@ struct vmw_surface *vmw_ioctl_create_surface_full(
>         int32 ret;
>         union drm_vmw_gb_surface_create_ext_arg arg =3D { 0 };
>
> +       /* Surface creation will fail if 3d is not supported. */
> +       igt_require(vmw_supports_3d(fd));
> +
>         surface =3D calloc(1, sizeof(struct vmw_surface));
>         if (!surface)
>                 goto out_err1;
> @@ -721,6 +729,8 @@ int32 vmw_ioctl_context_create(int drm_fd)
>         int ret;
>         union drm_vmw_extended_context_arg arg =3D { 0 };
>
> +       /* Context creation will fail if 3d is not supported. */
> +       igt_require(vmw_supports_3d(drm_fd));
>         arg.req =3D drm_vmw_context_dx;
>
>         do {
> diff --git a/tests/vmwgfx/vmw_execution_buffer.c b/tests/vmwgfx/vmw_execu=
tion_buffer.c
> index b89770b30..23c5f900d 100644
> --- a/tests/vmwgfx/vmw_execution_buffer.c
> +++ b/tests/vmwgfx/vmw_execution_buffer.c
> @@ -1,28 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
> -/**********************************************************
> - * Copyright 2021-2022 VMware, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person
> - * obtaining a copy of this software and associated documentation
> - * files (the "Software"), to deal in the Software without
> - * restriction, including without limitation the rights to use, copy,
> - * modify, merge, publish, distribute, sublicense, and/or sell copies
> - * of the Software, and to permit persons to whom the Software is
> - * furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be
> - * included in all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> - * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> - * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> - * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> - * SOFTWARE.
> - *
> - **********************************************************/
> +/*
> + * Copyright (c) 2021-2025 Broadcom. All Rights Reserved. The term
> + * =E2=80=9CBroadcom=E2=80=9D refers to Broadcom Inc. and/or its subsidi=
aries.
> + */
>
>  #include "igt_vmwgfx.h"
>
> @@ -271,12 +251,10 @@ static void execbuf_stress_test(int fd)
>  igt_main_args("st:", long_options, NULL, parse_options, NULL)
>  {
>         int fd;
> -       int32 cid;
>
>         igt_fixture
>         {
>                 fd =3D drm_open_driver_render(DRIVER_VMWGFX);
> -               cid =3D vmw_ioctl_context_create(fd);
>         }
>
>         igt_describe("Test creation/mapping of a basic mob.");
> @@ -294,7 +272,11 @@ igt_main_args("st:", long_options, NULL, parse_optio=
ns, NULL)
>         igt_describe("Test basic fencing on command buffers.");
>         igt_subtest("execution-buffer-submit-sync")
>         {
> +               int32 cid;
> +
> +               cid =3D vmw_ioctl_context_create(fd);
>                 check_execbuf_submit_fence(fd, cid);
> +               vmw_ioctl_context_destroy(fd, cid);
>         }
>
>         if (options.stress_test) {
> @@ -307,7 +289,6 @@ igt_main_args("st:", long_options, NULL, parse_option=
s, NULL)
>
>         igt_fixture
>         {
> -               vmw_ioctl_context_destroy(fd, cid);
>                 drm_close_driver(fd);
>         }
>  }
> --
> 2.43.0


Looks great.

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z

--000000000000da1d02062b60824e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJkMIICYAIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIEQc
lhAFzwlm3ynmDaC/Ewlint63nU6sxuUoIe4k/qgXMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDExMDIxMDkzMlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJ
KoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBo9Xgz6vjkY3Xj2tn/uRqf
FnGNEYHU6ssARYGmTt7w38PhiyI2i67Vlf3E3WMCh4LaEi2EzZOrNMo4xv7wz0iPPmcCygH1G4+4
a719MIDB6tpbgvDSLlncJQwnnunhnwwcujCe/pizgQpAI7piO8VgNWOTcqPylngtk8r/TW8QhrWr
OInj9A3bd/afV3m5SELMnXjg2IRkDf9qRpVELGBEqLz+yvoFNXPgLCzyhTXT247siusUuAmCzDAh
KSZYWtHBGbmR32yRfH4pDxOe6hoxovFFCOLiv9o35zfbnYNtLLnLge8K5qMzkblyZu+R7EvN1RlW
TQV5//Es6FcaK7I6
--000000000000da1d02062b60824e--
