Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8AFCCD1AF
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 08:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1610E591;
	Tue, 21 Oct 2025 08:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QF3j5WEo";
	dkim-atps=neutral
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559FE10E390
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 09:44:19 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-554a7e98e19so3184613e0c.3
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1760953458; x=1761558258;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FT0NwrrdR2XLKYovM4CixdOK8iuZnxY2K/H5RA8w9dk=;
 b=QF3j5WEoZqhYLu8UJDX1HqqrM/nyEsn+vgUXTTVk7hvJfuf2boKyFkZIJ5oDGK5QMB
 OJNdLibpieK7B1mhaG5mW8mPO9k0VE5mBy1X3Nrm+W0xELh0/m2msqKyZth8yVm/7rH7
 1le7zBajKb5OC7aqjbW9tcntKpKkx4rJlcfYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760953458; x=1761558258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FT0NwrrdR2XLKYovM4CixdOK8iuZnxY2K/H5RA8w9dk=;
 b=qnj47t5Pd6Khm3nm9uld/zby2knen1dgXo+zAAg0Z/JXCidBcyHOb1HLf5JgFM88SJ
 KzLaaf/DiBZIQ9vXuMTiU9ekkOcyG82qBQGkpiTQ+2erKVg8wu3Hnhipuo3zmaa5Bmg/
 vM68SpTQk445MBWqaZyM9cOidy5szNbp/Wkb7cArepBZ4tlHL57KqCIHKonxN74cEAvA
 UwfRwzlkKQvp+ni9BcVZstWGTQG7KVh0oBtyA5Z2Rj7ABxH4mhHrZKu3nzGGTqjFgP5U
 ipKGKNL039Hv30tt3B9WQ0WB76sknevUhhYzCmch/d+6nX5ozNz8BKylygmpVATet0cL
 fQbg==
X-Gm-Message-State: AOJu0YyqvLeziUHAfZiP67RDiuUXTCos567hNEVzZlegbw2mBt77VnmE
 DC9BgR+ehvbfs7SUnw5SY+CjXzE4baZ/WbAsqGn8OyKkFzLqJlEeAKQK6JMOcQ7wxb4DMgvnoud
 P7g/iDcl7XNvJUiFMqhkBTL6V6PC50gLfFQYm16QKmzRvirIvFpZYED5N
X-Gm-Gg: ASbGncsUJAYhG6bSCeWNEdcjtXIwIDdKf5xArK3PUdPnlG57XJghAkPwo+QLLIh82zi
 iL4C8QCAzUVWBqblyuTeMNxDubhByNTpbb6HC0a4Uecl7TciA6s7G9twLmkpPeXMv8N2vAqVj0B
 Zujbd6pJ36jCBFw8THWfu2vQ7h25YZk8ZZS+Ts59rR9BN6DgFAg9xQIt3p6JsifYqIRbkeqwrMC
 k//nAM+44Ut6DT+07CifVikll2LXEKm8gJAzwqY0JrVpqA2CGHV/ILRunZe4NoWxD6/9cZPkqOp
 zdbmjSbwqFi6Kio=
X-Google-Smtp-Source: AGHT+IGfNzS8faNPRpanx/GCK1gBlqeeqXgRfoIxrsYmrGFjUmFt8hciF1GEPtNh3cwxJq7d7tvkwN/aGHsWDaj7TD8=
X-Received: by 2002:a05:6102:e08:b0:5d5:f6ae:38fb with SMTP id
 ada2fe7eead31-5d7dd62a439mr4125262137.40.1760953458397; Mon, 20 Oct 2025
 02:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20251012171459.3773990-5-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 20 Oct 2025 17:43:42 +0800
X-Gm-Features: AS18NWB0Nu9jJXzinqFUWNpz-coaAgoP2I0UivbBKirMGvV_vw5rooYH6xN-wvs
Message-ID: <CAJ66y9E4SE+8ot9w_+MfOY2W2zWDMHRNg-E=aSnGYn0yOghfag@mail.gmail.com>
Subject: Re: [PATCH i-g-t 4/6] lib/igt_kms: Add support for mtk_current_bpc
 debugfs in bpc-switch test
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 Oct 2025 08:12:55 +0000
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

On Mon, Oct 13, 2025 at 1:15=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add support for the "mtk_current_bpc" debugfs entry when detecting bpc
> on MediaTek devices. This allows bpc-switch tests to work properly with
> MTK platforms by reading the correct debugfs property.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  lib/igt_kms.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Fei Shao <fshao@chromium.org>
