Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF604CCD1AB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 08:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6944B10E023;
	Wed, 22 Oct 2025 08:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EuNSSNMB";
	dkim-atps=neutral
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091F10E023
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 08:34:05 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-54bd3158f7bso4673238e0c.0
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 01:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761122044; x=1761726844;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PaQwp9yiUrQkZWRrfQEaieTdp3VJVckCuVtC9hCW7fo=;
 b=EuNSSNMBTaZ2AT762CrsWd80SLQ2ShpP7gqwrlXVqV0L49bHB7TqARH1ap7tDByVQl
 na1QF9W1q+LAk+UOLvsrbvqI0BaAyg9OFgLa2BO3uJCeY4G7mJQuxkPsrOlL7jXs6JZV
 lRSYVu/uzJTYH/aAeDXd61zbxyzBVBXjNdstE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761122044; x=1761726844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PaQwp9yiUrQkZWRrfQEaieTdp3VJVckCuVtC9hCW7fo=;
 b=fxOCswSU6oclO/FwJ1iQ2ZQGnrsUlfl6BBO1LQukwOoBQbFpWs8vPGHKzlpKeTlsvY
 rYi8mU6ITA3VkqPVicpM1GvHzhjbX2Z638XJmMBJicGGe6SJoN+buM2UaZq3ILOOYrS9
 ZwvDIID6WF5h0ge27DCrJao4M+XngHAc8KLuazOLLA9iNtxSxxNzcVhoMzndOGI2DHOf
 Ad9tDvS41GfYZQIXhO3xObuPolKfv3y+eq7wVIMBW7S5aHWnXz+a+qDPoz7hsE3gQn5c
 9KhGZEQBjWd0wcrrQTAjWEBMEODtG3rUc+MzJgYfeFkiF6LfbO/6mKQ0yMEHmhEP3Opd
 Nb6Q==
X-Gm-Message-State: AOJu0YxXlehNyjyc33dbduoGx5pIL65EYEGE9Hr2sjhnBpIwrWv9XAC+
 GVJNxxihJ6Pp+DPxVa0r3L2re1RJFjfPBT4Qmuzs+ngo5jViudVkSGouV7L+oKjVBAyUNi0vgJE
 HZAM=
X-Gm-Gg: ASbGncvjgN5PlSqAn5B1Jy9gaxnikp5RxYW61rrv/RHTjvpMJPMuO/g3l1qwsHp1RMW
 cUyvPU60l2+OkxINM9CwVQo061bxWiNbLRW2WLQ6JetCwlRx+iRwxJjqUHDBDAjPtwXO8avF6Ph
 +qUjKqw44Vxlph0HXy3FqAepIpDzjBiLrQvHRllqci6OQADt4YU81wy93lXTOfsJ1zo19s8ckGT
 bAm6cAfj0QS77gg38c9Cqy3OfkgEkxT/zaq3z1LoXuh0cjHQotQWJ2J7BYYxWCV/hAhADhhUFWq
 Q6fw/vX3FKb97VQLIceARQ4X7ZJUaFijrGKvx9InF+xv+dPnmVWQCLGv/PP1UQb8hq+xow/FG29
 wA2amF2mbcrxv7bNF0jA2IaAQfOo5HRYXYjzxUq5WWUQRvm+g0zUSbY/2gyTXFacrmj60EcgrEC
 FluEBiE3uVmCg8v66RqSYV/vhyJxYanbtKh3k=
X-Google-Smtp-Source: AGHT+IEyYoWYD5WejG583z3gbYsxh9jSOg6pl1q9T9362G8z0DWLIoXxpiCKjUMhQfnFUjMu+e8pnQ==
X-Received: by 2002:a05:6122:92a:b0:549:f04a:6e9e with SMTP id
 71dfb90a1353d-5564ef4a1a3mr6325297e0c.13.1761122044133; 
 Wed, 22 Oct 2025 01:34:04 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55661fc8608sm4283857e0c.11.2025.10.22.01.34.03
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 01:34:03 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-930ae1b2627so4077563241.2
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 01:34:03 -0700 (PDT)
X-Received: by 2002:a05:6102:3f52:b0:5be:d04d:d2c6 with SMTP id
 ada2fe7eead31-5d7dd423a07mr6286182137.9.1761122043074; Wed, 22 Oct 2025
 01:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20251021173912.4050926-3-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 22 Oct 2025 16:33:27 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni8gxFJC9Qu6UUx9BtOZUPLgm1vuwHcDe5ZdOw3kO89vQ@mail.gmail.com>
X-Gm-Features: AS18NWDnEY51bYIXUY2q2c6yfd9mtccBz305OhKqP0sWwnC0bub9S02zwJs009s
Message-ID: <CAC=S1ni8gxFJC9Qu6UUx9BtOZUPLgm1vuwHcDe5ZdOw3kO89vQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 2/5] tests/kms_content_protection: Add "SDC" to
 HDCP panel blocklist
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>, 
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

On Wed, Oct 22, 2025 at 1:39=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add "SDC" to the HDCP blocklist to improve compatibility with panels
> that do not support HDCP.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_content_protection.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index fcc0023e365f..e056951c92f4 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -141,6 +141,7 @@ __u8 facsimile_srm[] =3D {
>   */
>  static const char *const hdcp_blocklist[] =3D {
>         "DPF90435", /* Example monitor name */
> +       "SDC",
>         /* Add more monitor names here as needed */
>  };

A plain "SDC" without additional model identifier looks slightly odd,
but I guess it is what it is from that monitor's EDID.

Reviewed-by: Fei Shao <fshao@chromium.org>
