Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682F6C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 12:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25BE10E77A;
	Wed, 12 Mar 2025 12:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jF8buMu3";
	dkim-atps=neutral
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CB710E77A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 12:13:26 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2feb867849fso10145168a91.3
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 05:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741781606; x=1742386406; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cEoKTRFDitgsACFLEbXISvdU44VYFQlG0Fo4vMl1uo=;
 b=jF8buMu3DP9zo4sX+rfyJDV4iZThXfmJF48Q0Muft/jL448zLpBkej1LljsEoIxlV3
 fcPrByKmwjy42ST4KShvasxDqvqY790QpPLMtkDYJsc1TCk+o+ZVc8bXqlHC0Y/0fl35
 JwvFpsmr5vLXJ1QZ/iFCZp3hBniru83E7u9Ijj4H8BL6qRFI0XHW/PPlgHDgJ7b4zR0y
 mPWrtrfWRXsA1TQuY3hxry2ukYQ/Z8Gsq3zVv1xProzAuWY8i9piMu7dLgcrOC14jxaB
 zRHm+ioyRkqn/aOMLp4wqdUbckvRR6Bl1r2YsTcwDpFoK2VjDUO5Kuh3g3MJlQWugAbw
 4gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741781606; x=1742386406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8cEoKTRFDitgsACFLEbXISvdU44VYFQlG0Fo4vMl1uo=;
 b=qoa7zeFr17TkZnUijyjNyk3KGzou1FjPLFessYOEs8xFXnV/lSFob9cVj9XW+atUfg
 C+3dky//Ro5QAltjwUahLDuBU9ZfM35Pc3f4giZMHTitZfGsoGyz6Wk0vPCoPMEZerby
 dclnYu8H+l9xILfkJxbYPZ6m+bd94X1uLy19byTMaQY+Ciertb7MyP5T+Sv7NH4P26xD
 yZKY/dbARh5WvuxDXN+kZ/j6eIVUp4PZ9O6icHXclvQHbjK4xx9oeVO5uWV82rRpKRZU
 SgDiEGjU5ZnQKKmNF9GqFT/q3xmyk0tsSLTUERNYmvzXGeU5kQLVd9xSMMpMgfzTeWsU
 KRfw==
X-Gm-Message-State: AOJu0YxhpLiOYSi8D+LZayjfQepeoFVLcI9BScb9RkBYeIZs0FebSKT6
 z4wHuEwd/VdKPF4pDbBwJYffMHcYWYdxLucc4IonBWlr/vOcLNHQVsoQD+kHoJTsCDv3p/Ogvmp
 1lWYX5TKTNOaK5b6hYr9CjrP+rmg=
X-Gm-Gg: ASbGncuZBOoJAT3bOKEMfzHjYyAq8MmeO5+V0GMb7IXo4CoB6sISFYViIJYpEhm4kWC
 eZEO4INbGjw/yGlCTOkIEszn0LxuXMn/1D4GdjhULbIZamvD3rxsl+pZTpaIxHrHgE39NdXg3S4
 kVexxZrWbYON9yJEOsZk7zQmzeaFtN
X-Google-Smtp-Source: AGHT+IEozwqJ88iacao9ICQtrUHXQO5QMyiccoxucgo3N/vWnraT6PTUpxBicmjdQQ8MiAiPEC/gs4qcSfS1TIMrRCs=
X-Received: by 2002:a17:90b:1b4d:b0:2ef:31a9:95c6 with SMTP id
 98e67ed59e1d1-2ff7ce90226mr33983592a91.14.1741781605772; Wed, 12 Mar 2025
 05:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250311195339.1206647-1-lucas.demarchi@intel.com>
In-Reply-To: <20250311195339.1206647-1-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 12 Mar 2025 14:13:18 +0200
X-Gm-Features: AQ5f1JrH9nySRCgh3TLUsytcpS8T6DcDlvvTf58JNTyf7SgfcGkNwTildu004pw
Message-ID: <CAJ=qYWQeWje-GF5b59kjBCJ5EqBQkjo8yyhE-k8BhPtyjziYdg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/intel/i915_module_load: Do not skip on snd
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
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

On Tue, Mar 11, 2025 at 9:54=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> The fact that snd_hda_* is loaded doesn't mean i915 is. It used to be
> the case that loading e.g. snd_hda_intel would load i915 because of a
> request_module("i915") in the kernel. However that changed in
> commit e6d0c13e9f46 ("ALSA: hda: i915: Remove extra argument from
> snd_hdac_i915_init").
>
> Drop the snd_* modules from unwanted_drivers.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/i915_module_load.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_loa=
d.c
> index b3752a19c..2047d1886 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -368,8 +368,6 @@ igt_main
>                 const char * unwanted_drivers[] =3D {
>                         "i915",
>                         "intel-gtt",
> -                       "snd_hda_intel",
> -                       "snd_hdmi_lpe_audio",
>                         NULL
>                 };
>
> --
> 2.48.1
>
