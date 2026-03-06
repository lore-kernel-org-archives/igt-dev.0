Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4375F513F4
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 06:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6537310E374;
	Fri,  6 Mar 2026 06:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YuE7Dw3H";
	dkim-atps=neutral
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE1D10E374
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 06:04:03 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-5ffe7b6f751so156071137.2
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Mar 2026 22:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1772777041; x=1773381841;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+w7gw8YdvP9paYiEox6WhCUmD5ncH7DP9kLBptIoMo=;
 b=YuE7Dw3H70TPbWr6KWi4KQNpwWZZ53I6/o8MaLmBQqQtFtQiVqRGu4Rgw8lOj8pe9I
 qO0SElhdzB8Uue2Fmj2VwLCb5fYXqAWw5hhan5O6ULV0muFnlGjsXg75/htmEWcUVpNR
 JBBQpgSRBeZ2liaxR1zsnpJhTBfWZFYlQLgQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772777041; x=1773381841;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E+w7gw8YdvP9paYiEox6WhCUmD5ncH7DP9kLBptIoMo=;
 b=u4zqJ04ywWFw8qoeeB4vkmsmtzsP4W4imNb8ByYtusxO5WMDejxX5yu81SiFnZzhGZ
 nHbh1QNiMQRI6TRrzsHrEihTgTO/Ar3GtUB6YetZWWehpBB8VOKidW9z78HMVqGJVsIo
 N+lXAk8ByE0A6XUpL+A5mLKGdx7JKdUEEBglfx3fe6AtGSqFdZdM6y0cQhCe8wGefBM4
 WlubxEM3pfPcuKG2bCzRqVqYCuU23kow8+3AZK9M2CPsZ/g5eN7Gr5DdMUXpT1GJPZeP
 Z1RyC8jJ4sLZxH6ZuRl0JOTX2W1wi7w1y61X2oIbkZBE1Sg6G8QfV+w5QiXUKdxL3Fbf
 9ceg==
X-Gm-Message-State: AOJu0YzZ72Kv79Yl12RhTk3YOJKvWROvbLXCKrQ/jIvh+hyVE+3wVS6A
 we5iG3BCyPEIdrkVz0wVmFhKnaOKtFvZNshl/Kx7VIcGoQfQbmIbE5j1tGowAk4wj+GWmRbvRmX
 /DcA=
X-Gm-Gg: ATEYQzya5YiYCn5YsV1HuRwVcrZ8W/JWGOI1Bpi1caMAH0tb9GI2VSyAdxAYbos1AsP
 VoIC9kvHBxSzji3/pzEfOMk3vJejV1L5ufrQQWcpVqJnnKGZ86vuLLs49dBhrk0kSxZKA6SznOO
 2wSru10Rqk5dTLWZolEgORCyQC9CSdcKHNh4ApH0vSrNFy3Zi+Ccyj72HeNnRVHpORn1pTVc/Rd
 q/+AV1+QbzdZUTl+RSskUpfqSGATWxRWwcMwonTDxCy9SHxau7lc8Z2Ds6YTmN+NiNIfPdOcKqo
 LmOAF9ckxAPNYTFnaFKmYenDtKLwkhSH4fJFMgIojz123FsnA1E6Pa868p+uxREh7ZYpSyf3xtO
 Ik7PjoscpvjeLNG9lmL9vqilRY6yngvLjs0lkPe8ou6FqqCMxfo53SPZG+K30h4Vl2Rdu3K5H6X
 CNCqkXyUn4+45mxRhHs305inT4Yniw4F8KXhOipdwRWUNTA67s1YjF2TC+KEYNXg==
X-Received: by 2002:a05:6102:d8c:b0:5ff:a8d6:b810 with SMTP id
 ada2fe7eead31-5ffe5fdfdd8mr513585137.18.1772777041271; 
 Thu, 05 Mar 2026 22:04:01 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94e7b5208basm503870241.9.2026.03.05.22.04.00
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 22:04:00 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-56afafef7aeso1159516e0c.3
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Mar 2026 22:04:00 -0800 (PST)
X-Received: by 2002:a05:6122:1d4e:b0:563:6d01:a514 with SMTP id
 71dfb90a1353d-56b07ef9ec4mr383777e0c.17.1772777039291; Thu, 05 Mar 2026
 22:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20260225160428.4116800-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260225160428.4116800-1-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 6 Mar 2026 14:03:23 +0800
X-Gmail-Original-Message-ID: <CAC=S1nguWJMH=CeRxhvxooqf5XZFwOZSbLr0JUXC490kLNAcKw@mail.gmail.com>
X-Gm-Features: AaiRm52TNKBNcnCYSjACMR7k5dzXg29rID6JR3KJ89mBsen3H_S1shIpf3iuyCM
Message-ID: <CAC=S1nguWJMH=CeRxhvxooqf5XZFwOZSbLr0JUXC490kLNAcKw@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane: Add vblank waits for MediaTek CRC
 timing
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

On Thu, Feb 26, 2026 at 12:04=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> On MediaTek hardware, CRC generation requires additional time to
> stabilize after certain operations. This patch adds targeted vblank
> waits for two specific scenarios:
>
> 1. Pixel format changes: After a format change in
>    capture_format_crcs_single(), the CRC hardware needs at least one
>    vblank to generate valid CRC values for the new format. Without
>    this wait, tests may read stale or transitional CRC values.
>
> 2. Cursor plane updates: In test_plane_position_with_output(), cursor
>    plane updates are non-blocking on MediaTek hardware. A vblank wait
>    ensures the CRC reflects the updated plane configuration.
>
> These waits are guarded by is_mtk_device() checks to avoid affecting
> other platforms.
>
> Fixes failures in:
> - pixel-format: CRC mismatch due to reading before format stabilization
> - plane-position-hole: pipe-A-plane-3 failures with cursor plane
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_plane.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 8cef94a1f37e..e4539078c98e 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -351,6 +351,15 @@ test_plane_position_with_output(data_t *data, igt_cr=
tc_t *crtc,
>
>         igt_display_commit(&data->display);
>
> +       /*
> +        * On MediaTek hardware, cursor plane updates are non-blocking an=
d
> +        * CRC needs time to reflect the new plane configuration. Wait fo=
r
> +        * a vblank to ensure the update has taken effect.
> +        */
> +       if (is_mtk_device(data->drm_fd) && sprite->type =3D=3D DRM_PLANE_=
TYPE_CURSOR)
> +               igt_wait_for_vblank(data->drm_fd,
> +                                   data->display.pipes[pipe].crtc_offset=
);

Hmm, I suppose your codebase is a bit outdated?
Commit 18349d8bc1b2 ("lib/kms: Pass the entire igt_pipe_t to
igt_wait_for_vblank*()") [1] changed the function signature, so this
patch doesn't apply to the latest tree.

[1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/18349d8bc1b2=
5bcf953e1868666214829f75c442

But I get the concept, and I think that looks okay.

Regards,
Fei

> +
>         igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>         igt_assert_crc_equal(reference_crc, &crc);
>
> @@ -760,6 +769,15 @@ static void capture_format_crcs_single(data_t *data,=
 igt_crtc_t *crtc,
>
>         igt_remove_fb(data->drm_fd, &old_fb);
>
> +       /*
> +        * On MediaTek hardware, CRC generation needs time to stabilize a=
fter
> +        * a pixel format change. Wait for at least one vblank to ensure =
the
> +        * CRC hardware has updated for the new format.
> +        */
> +       if (is_mtk_device(data->drm_fd))
> +               igt_wait_for_vblank(data->drm_fd,
> +                                   data->display.pipes[pipe].crtc_offset=
);
> +
>         igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
>  }
>
> --
> 2.43.0
>
