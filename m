Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053B0D2595A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 07:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8722310E28B;
	Tue, 27 Jan 2026 07:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i9yUI/3k";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32F810E28B
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 07:40:53 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-352ccc61658so2410881a91.0
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 23:40:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769499653; cv=none;
 d=google.com; s=arc-20240605;
 b=BErfdpOuVFlzcUkKgmWot8Nl6t4VOmRH7ej9Fgrle49gxXDO3rb6jatAeAEaY/kNSL
 7NHlEhXQIk9L42uO7VNqo8VwGnB1qwLFvWGXoBwSFyX3YMLjxALL673yfx0+GrRF2pOK
 ncnGcKyIotEy0O47Zn+g9nIJKvFMykcsphN0CK6KQg/GKven95jxW1IDUlyviUkyww0Z
 mxxESzJokhxz7/8O0esM/RDSQn6HfTCzADD1RUnuFL1uhZd0W6mThwfnNoAkLFO8zjSb
 in2NywiP8KLJBqoxG/DsSCOL8eEE3cly9uKdnqAyryDaA8FW5u/qEk4T65z3EIYtFrvf
 DRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iUEdvxRac6yB7w1i/taUN/u/BM1Zxy0Ci7D7DHHn4lQ=;
 fh=5S6VrpWvm5OMsEJ4XwJixVH2V+8paS79qBluDcNmc4U=;
 b=TJVUto7sYZ9p48dUrDCdsr50NWotP3jc32lhwcDb8km4K7OUf05eAH3HzmmwWZEn8z
 UP6QHYbw8ZMbBPH3FeBEsOdZDGgqZ6C2EDHH8AKjbOc6uUEhkoJUpV7gL8cMv/SpOa61
 pxDnAJplguqZIDRQrM5/C7htC6nGOaUW16m5YR1xv2LmahHDdZei9Zco/+QB01QfP6ys
 T8SWKT5JFKjw5JDTNEzH8Ycbs26It05lC923zFzB0erPJqcay37FojGPUTO9SJLbwd7G
 9mxMbwv8qKxsadI+05/uDQUZMWvkXpW+sRcDB1hRQ1XeP1FeVroMAYpQVZJsn9I8twxM
 cj5g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769499653; x=1770104453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUEdvxRac6yB7w1i/taUN/u/BM1Zxy0Ci7D7DHHn4lQ=;
 b=i9yUI/3k3PnvWFmmvGq4SNF2cfOhpgD3m3ekfGneIuRZchNZUkGFMIdqeT48yzkiwg
 S6dyCbAdyT1dwCSbzItb9pLlzy9qSMc6PoCXnfNvQAfciax5Yoa0v6vnnKLwb+q/kArY
 yJmKMQkaSqaSL2mCH2wk+EnFC0dBw9DK7QQKeu7/Hph+e4hWNI+HkaK6lzRE/nKF3DGS
 PVLmAEUYYpkKxLAGR8+R8p+x8Wd/1xvUcnv4/KIhamLj8ZpN5NgIEtY6ulXNNifwmTal
 zkyOa0LJTDJwpJDUfhPm9bYK6Zj0KuDVf7D3uixdYd02kuURQIlxh0GkvV2PpI8WYk6p
 /Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769499653; x=1770104453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iUEdvxRac6yB7w1i/taUN/u/BM1Zxy0Ci7D7DHHn4lQ=;
 b=ILyN0gFFw+Mzhf7iuQsU3o+3Gwf1OEA9Jk2gRpbcMjuJ91iydXI4oboCOTUNp5L3n9
 pErENTblw8IH5flG+zkdZRNU7JTFIeyyjeUB/cFn2BcH5SsQlcIv1zJuR6xdVOJf0MU3
 f1tuHAF2fzo6cjvBHJqCHsSBI2WTWCscYyiyHFHcDaFn8t+71lOzsSkuqby+EEe4tlWe
 RlQ+5R93FbnK/o/OGVbVlTZ0I6NRGAgDIETuibAWdvq4IktIGXDhBYStl927ABL4MXq3
 epX2K8AIjrXhTJuWfapJtJTNzg+8PhxibXeZNQWs4b75Wro74r3tkD5Cq1AG5G+tzxgU
 Tu4w==
X-Gm-Message-State: AOJu0YxUsD6rYmruzq9nN/F75AmPwrxthkyInuk2PFm77MXN1hEQFFw7
 onXG1lOX08vWJf+ssHcG6dOzvvQaINYTlcyGvy3EuIaGWvq3hnd8KJDDxxy2shGkdLYvRyi8pwZ
 99GD3vQj2Rs98IhvZhBGsKqz67esMjGg=
X-Gm-Gg: AZuq6aI2gvjykxEZhevHPu1In/QUt6aiD3pcc+1jQ455JYClMNAaXmNLunBHouvTrkO
 2SEh1omP/h+ihftV5yaRTmQLCCm/tkvaLM4coKF+E/uG2MTDi7yZA7ty6PAz2u5S9/JcGUfhPS7
 vLaodFnlGvEPIhm9u+hnCNKGO4KshnthdKh3lPH4MzARuFvUGP2Yztl7uiYwcUlyW3+dY5hBuBo
 +oxdmYpqM2/hI+FU5lFTDaWyptatN7l6JfUxfr/4CdwwfQHVyvP/+KSPZGxQmMJLL5/KsrwaTAq
 Q59AeSz5LuMF5s89WtkNpx9cfqJKhji/Sq8zO6ez
X-Received: by 2002:a17:90b:2b4f:b0:340:bde5:c9e3 with SMTP id
 98e67ed59e1d1-353fed8114cmr916829a91.23.1769499653171; Mon, 26 Jan 2026
 23:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20260126121535.336206-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260126121535.336206-2-zbigniew.kempczynski@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 27 Jan 2026 09:40:40 +0200
X-Gm-Features: AZwV_QiTR1h7trMRbaJwiHYRdVidE1R37KEIl8T7WvSN29vQwe5o1mErR227iqM
Message-ID: <CAJ=qYWTq1AxoUxLbTNvYx4N9a2CUmHSLn6ZqJiwg53OfpHyDxQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t] Revert "tests/xe_render_copy: Skip if platform
 doesn't support flatccs"
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Jan_Ma=C5=9Blak?= <jan.maslak@intel.com>
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

On Mon, Jan 26, 2026 at 2:15=E2=80=AFPM Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> This reverts commit 071bf8edb91dcdf6b8bbe0c5d301477a39c5ccb8.
>
> Xe platforms even if doesn't support flatccs still can handle
> compression with aux-ccs tables. Rollback change which limits
> the test to flatccs only.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Jan Ma=C5=9Blak <jan.maslak@intel.com>
> ---
>  tests/intel/xe_render_copy.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index 861daec971..e2e752e28b 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -710,8 +710,6 @@ int igt_main_args("dpiW:H:", NULL, help_str, opt_hand=
ler, NULL)
>         for (int id =3D 0; id <=3D COPY_FULL_COMPRESSED; id++) {
>                 igt_subtest_with_dynamic_f("render-%s", testname[id]) {
>                         igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE=
_CLASS_RENDER));
> -                       if (id =3D=3D COPY_FULL_COMPRESSED)
> -                               igt_require(HAS_FLATCCS(buf_ops_get_devid=
(bops)));
>
>                         for_each_tiling(tiling) {
>                                 if (!render_supports_tiling(xe, tiling,
> --
> 2.43.0
>
