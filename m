Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA4DCCD1B0
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 08:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB9510E58F;
	Tue, 21 Oct 2025 08:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Fr2Wxvw4";
	dkim-atps=neutral
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6E110E390
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 09:43:46 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-54bbaca0ee5so1498837e0c.3
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1760953426; x=1761558226;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iyLVi+FoD/t/oxfqevd58ZLbWFO4BhZuCjYqGvCmG0Q=;
 b=Fr2Wxvw4s1I1wWe0Hny5nLT5B2mT0AanDn8Ix6PLEuZofGvmbea5l/KXR0UECfKhaR
 pC7QVflxP2bdkhZbgvhhvCfR3jlLxn1wRBqda9qy3yT2D5ZumhXIMYTs/5aYEL99CVxF
 /ndDwM6XLSm0X/gB/nHBdZFTSmGqE7jUSZI1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760953426; x=1761558226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iyLVi+FoD/t/oxfqevd58ZLbWFO4BhZuCjYqGvCmG0Q=;
 b=Kel1uWVpaicR5TDIlP43Zx0miyjWKEziqtFxGdbpQ8XTi+EOtMhe347TsPq2WvRK/b
 f3dQVI3qCTbuQ0ys93DH1EqFUHguHCb+fn37ClUCWwOIcD2G7wZzDJP1P2OQD2qMlke5
 TWJ2CfdZpgZIvd7AHracwBOr2hDiXN/QSbjsTvpa0sTd/m4vNyHB4twNKK2qVUkNzsd2
 HWepMbtXRIwuz6sv8TiOfIg3ZD/ty13bnzQEz+o5+46tCEDrnPKjHG1avA4P126MYvX0
 Yu4HMdOED7g0MQbNytQCnx2nZOHjhtJvaXlCy32Kd6Hw02eRL1EFK7ptOae9OImP9xju
 Jcmw==
X-Gm-Message-State: AOJu0YwRSAXbRpHyeIs4M/1/Wv4ZrEkicYFr8jMpOjbTK0//fYmUwx4H
 +PeA23t0mZwyEbRxKNAf/vs9cn1/3RhVHSQWH+BIee4x0XL0A+zhxv0IrZCwz30tPDft7TQRktA
 hBppB3wi3Q22s2JAu5RAQAMbUQ/Z1msCdrOx1cyci
X-Gm-Gg: ASbGncsn15fB6smx/Spw8I7TqhqgK1b72lhqP3KrDuCHK0FRVIQYkAtNs1NmXulMfsl
 gUsM2AMZiRv5ULT+yAVuzAoW2MfiBmRK2BFSbDekbfDPL9z/vIqdMtQA+NJEACuH57Ec67O+zzt
 8ybKXpDQ/DERiSilRZF/syJG3zqblhcxya/xDQXSh8mZzJDzaV8LNij6KGb1S5i8X88uPJaxF85
 O5a3UlDs96OJp27k7KnqlMn7Icws4xOPQGWXr3phsmbLbHY56cakg7wHvz7nGnHpoArE9FcEe6g
 0xhsN2ke45X9LWg=
X-Google-Smtp-Source: AGHT+IEQVL59xonLI4Lp+XcLuAw+dIJCT2XQTJZexjRwIAvu8h4EWYF2z8cwsEl9IDCznWmGt1HqdO5pijIxdEe5IeM=
X-Received: by 2002:a05:6122:ca2:b0:54b:d7b6:2f34 with SMTP id
 71dfb90a1353d-5564ecacb02mr3052991e0c.0.1760953425682; Mon, 20 Oct 2025
 02:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20251012171459.3773990-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 20 Oct 2025 17:43:09 +0800
X-Gm-Features: AS18NWBfCDbPhlpKPUN8EO0zBFffHjLW872s3LqXx6qhFb11SkBUUe7q_eeULdA
Message-ID: <CAJ66y9GMocS8DubrmUgc3QUM6Qj2KEficJTLOEM67Vk=bawWgg@mail.gmail.com>
Subject: Re: [PATCH i-g-t 3/6] tests/kms_pipe_crc_basic: Use
 SUSPEND_TEST_DEVICES for MediaTek devices
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
> Update suspend test logic to use SUSPEND_TEST_DEVICES instead of
> SUSPEND_TEST_NONE if running on MediaTek devices. This change
> avoids use of RTC suspend commands that are not supported by MediaTek
> platforms, improving test compatibility on MediaTek hardware.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_pipe_crc_basic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Fei Shao <fshao@chromium.org>
