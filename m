Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B87D1D47E
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A234610E783;
	Thu,  8 Jan 2026 15:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lTNZ88fE";
	dkim-atps=neutral
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2887110E783
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:32:10 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c0224fd2a92so1712800a12.2
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Jan 2026 07:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767886330; x=1768491130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3EOgckItxBW+RLyEeJ0IuSXjfqps1Es9WdheYhk7aI=;
 b=lTNZ88fEiIxakvqRcssdQSN5ja3+41fMt/CYFZaPU1mEDVcPlDkJdW5Tyxtw9xay96
 88+fz5Ldtj/0EWfv1BJp0yA9WoyY3sOpTGYbwT2k1msVaRE0hge20qC0SeZUdDVMRDQ9
 FRf15xsTaZo0pn1mrbW8lh37rRnVU+oSDj4GQSAvcrfvtvqFzBKU6znGatNaN+SgYNUr
 f6FGou0FzatoSNXImBlkIQMtXt5RFIX+1Irq62FKImUdD1XgyzJ5tgbaF4oZhmtZ00jj
 aICgN1kBNOm/G1KZav1YsDIqIhem8D6zi3idQezdkV3UD3EcpraLd4qr+AcE+337MELf
 n+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767886330; x=1768491130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/3EOgckItxBW+RLyEeJ0IuSXjfqps1Es9WdheYhk7aI=;
 b=iK+HtYaGKtjJ656NLITYbDPAiPF1BHRGcYQ1L9kISMtOSW+GISE2InR8Ku8j0YYorR
 HPDPhk24xxR7WnCpJ37T9wuB41PpneBfXkI5jvdu28I1H9AOnAb029FwH5hZJ4ROwVwp
 tUkEQyok+gZnyInwzV0MnRH3LRyMxEjroF/9d4pFpgzACphtmfdlYI0Zcqxj57Ogyauy
 WQ5m++FQh4YUwI2MwFjSYVBXhan5/ZUqYl5N8h5z58VL1yZ/+IUCHjTW4Pmmd4zu0qV6
 sU0e4xQg/ztbp8Wkpwqo/umtBZ6/M9iaC7A09+n0WBBtCbLig9Pa+hiPgxzyvtEK0mjN
 RBpg==
X-Gm-Message-State: AOJu0YyPrHSJv4PmNT4+CnqAjXdpxHrxDE/uEZcYAeQC3Aa5yMDUpS2e
 IZSS8D98xXF1AhZOwCTiGYQiCSWyzxh8A0AJUpIRhF4z7W+cNyBaecqFeFP8XIEttJ6+IYtEmSe
 ZqRxwVHc23jHA7mA5/l1qZdsFuD7rrVPPgptGALc=
X-Gm-Gg: AY/fxX7ACqRRy7f/3i3yERvIVUEnbFrwdoPiIjT3MIkGa4ZTMKtDAbvllGnmBVVQHz4
 SnmnCdQMzaAI0zv/DSqZgYwjbMzi+nswX4AGO/+cCzBunaGgrcWriqQoa/ol45iAhQ2+kBrj7pk
 FiGvLeanyfc7vrL/bH23+DgxZDlDjeLQsAC9KqYBK18XqiL290OUKPmcr3MuR1FSMVqjLHp5Nh0
 lS7F1UBIIE3nFo05kZGVzlw0ssn5QjtfbEYZhJiIwnrtrL4ziGUHNB+OI1vXgL9UkVU6Kte/Ge4
 Vx7GkBWVFrnjj/IoRspdTqta/ivp/A==
X-Google-Smtp-Source: AGHT+IHSw9MTgTHc6nCVOxdeQ1Qg0Th/+WKKWKb9K6rGRArixjAFlpfbS2L7z5iXUaq9VxpcfTrAbAbH/Q3lI5F2fYY=
X-Received: by 2002:a17:90b:2783:b0:340:c179:3666 with SMTP id
 98e67ed59e1d1-34f68c023dfmr6106683a91.8.1767886329478; Thu, 08 Jan 2026
 07:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20260107093535.70116-1-swati2.sharma@intel.com>
 <20260107093535.70116-5-swati2.sharma@intel.com>
In-Reply-To: <20260107093535.70116-5-swati2.sharma@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 8 Jan 2026 17:31:57 +0200
X-Gm-Features: AQt7F2qBlLcF4m2CV6t6J78KkAo9CWDm0RrUqCaoFU_xMlHSdoNcy4iRtr2Pwho
Message-ID: <CAJ=qYWSg12rF4tMW8-QPnmYZ+_Na9akFdBLhU4a1Eio7CgEJGA@mail.gmail.com>
Subject: Re: [PATCH i-g-t, v2 4/7] tests/kms_plane: modify the condition for
 odd pan
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, Nemesa Garg <nemesa.garg@intel.com>
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

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Wed, Jan 7, 2026 at 11:27=E2=80=AFAM Swati Sharma <swati2.sharma@intel.c=
om> wrote:
>
> From: Nemesa Garg <nemesa.garg@intel.com>
>
> NVL onwards there is support for odd horizontal
> panning so add a platform check so that expected
> return value is 0 instead of EINVAL.
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  tests/kms_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index cbc006d7e..ec3245c9f 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1322,6 +1322,9 @@ static void test_planar_settings(data_t *data)
>                                      DRM_FORMAT_MOD_LINEAR)) {
>                 int expected_rval =3D -EINVAL;
>
> +               if (display_ver >=3D 35)
> +                       expected_rval =3D 0;
> +
>                 igt_create_fb(data->drm_fd, 810, 590,
>                               DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb=
);
>                 igt_plane_set_fb(primary, &fb);
> --
> 2.25.1
>
