Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F024DF8E4A1
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 04:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3BF10E288;
	Fri, 17 Apr 2026 04:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Qth5GlfT";
	dkim-atps=neutral
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CEF10E288
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 04:04:32 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-56d958880ecso66079e0c.2
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 21:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1776398671; x=1777003471;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQXGvMWjYysRNBQK/Rc8cgGyYiGoIR0x773C/FlzRHI=;
 b=Qth5GlfTfNolvXXR20LDc4/6uYqzuHFxHXOnGfcTVaqR1xXtsbeBJOQ+ANWS6pXgam
 nwzCAJbAStK1khX3WFs3oFMPKoCQEiFaLJRRL4qoUAHAc/crjTH2X07K0TjGczXHL2Nc
 g7O0PnVOcyCWjh15Y7iz6aqr/kw3dLwZdCEaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776398671; x=1777003471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xQXGvMWjYysRNBQK/Rc8cgGyYiGoIR0x773C/FlzRHI=;
 b=dZL10WHj5bjWFgB1e8/oGzdvECteixype8nCA+psz3QB7QWqVMIZ6+pb5dmDXMiMQP
 BsNDVeOqKrY1f2Zl9YkU6d78RxEJn593kB2GisyTBJhYvR5922VRewdzpS2lb83b0qaR
 oPWq5nimcZTTGFIX9WEXbKNv8mthW+UOngmhuK6Zdxm1L2jMYLL15eT7v6lTuuu/e+Qp
 cwqVppX0DwmT3eJAtaIhIC/pFKZUnbwUMJ2AAzQBsxJI3JrFYwS3AWcW9l9ccY2Pyqjt
 L0ee8Y4+oBFZQdmKpTCn0E65Q0lJDISydB7SCkNht6dLKgzsY5tLl07pFE06cMXJWn3C
 4tmg==
X-Gm-Message-State: AOJu0Yzu8lSnNrVRTV2r9lgvAJK1J9UfuPKBFZuuQrbMnTrjiulgrHLs
 TnxONbj+d95Rh5KgcKnW3dK1zYWalDbYicymQ5ozeD5epYGD7b06B3y26YNdaswi2JA8Py2RMWd
 xBIQ=
X-Gm-Gg: AeBDietsYCIh7Zb5tdXSgk+dZ0HRlj596RZxo2SvyspVQiV8gVBVBOSGWWnU12ptS1m
 7wmSnBTsi/oq00xzV3NO5xGXf6exyW9Vzr1PlF1MUBMfdgdvvtQML1ZjJbbLOfZx4YnKpf7Dj7m
 rLD2nfWTUiTFk/mYM3VTwjNWFvOc445aF++2PiEI6aGKo+aAYOrKuyUWiDcPuA2xyUE5pt/VMOh
 3VBm9EAqZnRPA2JzU+oll6Fm9Qul2QEaeKblgsZ/L6bBzYIr4GSFrTKiDI4Qs5KHPZr/9yYT6cC
 dkjFp53CnVsyz1u3hJx0No+Yyx47b2UBCOXUAIzkON2YzXGRTJvPScVOAjfWJzgTwuRANOHBB6X
 cKy7JZpEgCsEBcZkUOTYDBjv0xoICiTfBdMMYiGQ8Wu7gopE5KgKbkaeeabya3yTlb8juCmSg3k
 NPti0Hqu5+QtuYVCKl9m5popnQHvkAXK6F1s/OxKfOFJyBVjMfPDKoqXhU3EmRbNbfvxV+
X-Received: by 2002:a05:6122:8d3:b0:56e:eafe:3bdb with SMTP id
 71dfb90a1353d-56fa59844b5mr593611e0c.10.1776398670579; 
 Thu, 16 Apr 2026 21:04:30 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56fa92f2207sm204409e0c.10.2026.04.16.21.04.29
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 21:04:30 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-956995b5bb6so54071241.3
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 21:04:29 -0700 (PDT)
X-Received: by 2002:a05:6122:3413:b0:56f:1c32:bd07 with SMTP id
 71dfb90a1353d-56fa57dbb67mr630810e0c.2.1776398668797; Thu, 16 Apr 2026
 21:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260415015132.2297990-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260415015132.2297990-1-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 17 Apr 2026 12:03:51 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhr7DFMN-e794MGXp7Nv+LDTQcO4QqG-79XiotFVC7stQ@mail.gmail.com>
X-Gm-Features: AQROBzAYOT8EWRUhf_24daT19sqAsP87mZfviRyoyiUT2T3uXDrPjT1eri56618
Message-ID: <CAC=S1nhr7DFMN-e794MGXp7Nv+LDTQcO4QqG-79XiotFVC7stQ@mail.gmail.com>
Subject: Re: [PATCH v2] tests/kms_invalid_mode: Allow clock-too-high test on
 non-Intel platforms
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

On Wed, Apr 15, 2026 at 9:51=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> The clock-too-high subtest was being skipped on non-Intel platforms
> because igt_get_max_dotclock() returns 0 when reading from
> Intel-specific debugfs fails.
>
> This change allows the test to run on all platforms by using -1 as an
> invalid clock value when max_dotclock is unavailable. The -1 converts
> to UINT_MAX for unsigned int, which clearly exceeds any reasonable
> hardware limit and should be rejected by all drivers.
>
> This prevents the test from being marked as IGNORED/SKIP on non-Intel
> platforms while maintaining the original test intent of verifying that
> drivers properly reject modes with excessively high clock rates.
>
> Tested on MTK platforms where the test now properly executes
> and verifies clock validation.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Suggested-by: Jani Nikula<jani.nikula@intel.com>

Reviewed-by: Fei Shao <fshao@chromium.org>


> ---
>  tests/kms_invalid_mode.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 5edffb649ef4..78ab965ede91 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -126,7 +126,15 @@ adjust_mode_clock_too_high(data_t *data, drmModeMode=
InfoPtr mode)
>  {
>         int max_dotclock =3D data->max_dotclock;
>
> -       igt_require(max_dotclock !=3D 0);
> +       /*
> +        * If max_dotclock is unavailable (e.g., non-Intel platforms),
> +        * use -1 as an invalid clock value. This will be converted to
> +        * UINT_MAX, which clearly exceeds any reasonable hardware limit.
> +        */
> +       if (max_dotclock =3D=3D 0) {
> +               mode->clock =3D -1;
> +               return true;
> +       }
>
>         /*
>          * FIXME When we have a fixed mode, the kernel will ignore
> --
> 2.43.0
>
