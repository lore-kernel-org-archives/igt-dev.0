Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698E7C7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 14:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA1610E739;
	Wed, 25 Jun 2025 14:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AGWONXII";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400D510E739
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 14:06:31 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-237d849253fso10766375ad.1
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750860391; x=1751465191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSjYpyXyQBnyawZoo+4BXjvO8RA/8Rvx3F8b5sBzzaY=;
 b=AGWONXIIUkbWw989z3WLR49wnbwtjk0Wx3kCxUqYP/Z2ShRSZfu3SO4bYb8ATz7/5a
 YxB9A4sS4VVOYdGhjulHg0rr/S0uiDXi/VINtXZB7BVzolZiWNeWeTpUs1gjTlnx4xzG
 MOHE+DovZONClJRb4VgBSpPIn+zfbz84L5xaHeLCTEisNdtRX10vxqB+0K+1zkm+8Jl+
 laI9d+lmNwaE2PY5QR2x9uZqlvpPVuk13nptD49zcu2aKT/czUpnOgoPI75e3+a/htrE
 F3ruWOuigbBXZh+BupTsvPFEuwCWYak8YrcnsTTVC6Yp18sVLdmcrXPpBJBp+Sen35G8
 vyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750860391; x=1751465191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSjYpyXyQBnyawZoo+4BXjvO8RA/8Rvx3F8b5sBzzaY=;
 b=gDP7g7ZtQEIi1z3wuKkSRf7mMpG7RpvEBaX4Y3OJmJeQEt/nwKqaNLy4tu4vrpLvPp
 6001LLLYHJ8Whz9LpddxbmzFiKl0Akm2dTOwUuV4kdllJp5z0N5qc6Dssw0M57blgKjA
 nOZwyuZZF+GVcyRSAmKa1GQPX/2cN9z5UOfE9vEp7fboQGxjAuJdoS8TxtPu5aXIE2Id
 nsi7Ak9hF0ePrvaC5e0l6U1ec5U/I14qaKZJVgNh3b7LX+sgr9y1q6rBNWgmOEdAfvNg
 i9aVgTNNj0qadLN8PG3EnZz6uozLEPEyu3+Gbn6c0whQyokCXy6axZuhoUQNEGd3OKPj
 MNyA==
X-Gm-Message-State: AOJu0YwLit5j5utHOu/WDFpZ5wQUk4kohyB6SEVjLIdvIU32duqekS/a
 YjOFJMAfi95ztNv3bVqWtvXLmVyBS8oLjDF5ijy/sRJ+lAx4EQU3cqotvYHur8cbW1mSLAPbo5d
 EZkB9beV/Ia6PxwnFeeJhuP8u6DC04gk=
X-Gm-Gg: ASbGncs78JCBqIVXzZtfxpvd5XfPkf9sbHmB3GNtWTVd8x1oO6QKjXsA4sbiFhRt0d8
 WFUD8QhDdK5q4NFodAiGfbsk/yMFfxHnHkOHAPyxPfgyUIAhyRsNtOHJbgFyLY9U8a5JwVcUVvt
 K5Ml70IUw3WCwHJhL8BWwF78YxBQ9asJ4A4HeVJIoQv/gw
X-Google-Smtp-Source: AGHT+IEAZpE5rR82ccErp5ZgLMCk+VGGuQDmNU3nOMpU9QYDrpaACyRcS0tEndkjB7ljQznALJFE+hOTVwGFRhA/Shk=
X-Received: by 2002:a17:902:ce85:b0:234:a734:4abe with SMTP id
 d9443c01a7336-238240f37ccmr20664565ad.1.1750860390586; Wed, 25 Jun 2025
 07:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250625042133.6609-1-alexander.deucher@amd.com>
In-Reply-To: <20250625042133.6609-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Jun 2025 10:06:16 -0400
X-Gm-Features: AX0GCFtJNmZnFj3sKyDsqa_oYk472b96VTl6PsD5eVhD6IiJst2BNOK9F7k0zeM
Message-ID: <CADnq5_O2AsV9dWPam_qLYXzQy4V+y6U0knjSFYZhNiWK2-DpOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/amdgpu: fix SDMA packet contents for deadlock
 helper
To: Alex Deucher <alexander.deucher@amd.com>, "Zhang,
 Jesse(Jie)" <Jesse.Zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
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

+ Vitalty, Jesse

On Wed, Jun 25, 2025 at 12:28=E2=80=AFAM Alex Deucher <alexander.deucher@am=
d.com> wrote:
>
> Use the right NOP packet for SDMA and set the retry
> to infinite.  If it's set to 0, the engine gives up
> after the first try.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_=
helpers.c
> index 3b4822ca0..0cd83f061 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -101,8 +101,14 @@ amdgpu_wait_memory(amdgpu_device_handle device_handl=
e, unsigned int ip_type, uin
>
>         base_cmd->emit(base_cmd, 0);/* reference value */
>         base_cmd->emit(base_cmd, 0xffffffff); /* and mask */
> -       base_cmd->emit(base_cmd, 0x00000004);/* poll interval */
> -       base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - base_cmd->c=
dw);
> +
> +       if (ip_type =3D=3D AMDGPU_HW_IP_DMA) {
> +               base_cmd->emit(base_cmd, 0x0fff0004);/* poll interval and=
 infinite retry */
> +               base_cmd->emit_repeat(base_cmd, SDMA_NOP, 16 - base_cmd->=
cdw);
> +       } else {
> +               base_cmd->emit(base_cmd, 0x00000004);/* poll interval */
> +               base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - bas=
e_cmd->cdw);
> +       }
>
>         ib_result_cpu2 =3D ib_result_cpu;
>         ib_result_cpu2[MEMORY_OFFSET] =3D 0x0; /* the memory we wait on t=
o change */
> --
> 2.49.0
>
