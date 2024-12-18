Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1BDE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 15:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC28B10E0D4;
	Wed, 18 Dec 2024 15:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C5/Q+BRO";
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D79810E0D4
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 15:09:04 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ef8c012913so4770807a91.3
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734534543; x=1735139343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VrwgSCSkKyOTKQxRQ8gibOfIY/O4sVLwEHqfgR/Ph4=;
 b=C5/Q+BROo58eHiGQKk1hCwMC0hLoNp8kufwlGCbcIeGMjyhLvS27cWAmIl7lY34GEI
 no8mzulFPSqnF3Pd3sIuloRs41c2oZPLT9U92lwoeoCzbypW4E13TB8Yyi/5dv6vQ6dI
 xxBwoAdbi1k3KUi/Y7yhaqAvBmBJ/3CSCw67mkCSK9HCQ9U7TSXJwslxyVDdLG2Q1449
 tSIV+jIKzDX9NxAhhNQ7uDScsWM4Ti43o+9B5CQwaYVMo710nOD8IKtctti7EAM+ENCN
 pK9c3R+Po+ftUYqXbiQ2eKHy/MLScp7rPXkWSTRqn964f4+Ye4KTFEX2fM+dZvs0urfC
 L3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734534543; x=1735139343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VrwgSCSkKyOTKQxRQ8gibOfIY/O4sVLwEHqfgR/Ph4=;
 b=cGGaEGmDDQ7BLrIHRKavNFUKAJiejcpt7BDIImEFIAoDxZj9O1wUXxFRwb3CQGUuiB
 ZgG6TNmZ2X/pKAeHbah7ilLOWhNUmwJ9noaHCUcpuXgskfMhqskZYSfkjp++vPAu6aM7
 osiGq+nROg2S5YJyyIyCrZrmf49xCCDUL/1QMriX29ZjtHhhY1h9eORJNlYOsm0E5IQf
 rmJip0n2SLJthlKfaAd3ZuO2Y+Hxr0Xa96jCdKlojyzz8/v9Y0g9RQCdwgfC77DGeP22
 Zbp4PS/erT3YhVbQyzXNJgJ2dh/Th2eDhimtuovq+YJ1eqHyhka1Lxkk5F0TbVHuJP/N
 OBBQ==
X-Gm-Message-State: AOJu0YxSRvCBFIrDLHLmZ0xmYy59GHn7KSudx7YUKhB7gV7MsI7U0OOU
 +Y9Ow0ioAg8OvhHr31hFopNTbl5yaODioA1ZZpaLcIxDlqWxg5/ANawgulXnczob6elHruZlrBC
 GPechCQ+WZ6QeTBlRBeM6mH4oqkN7X2KDA3c=
X-Gm-Gg: ASbGnctfqS0Jn4yvD0aAAX6jR7FTKfgslDgzJlQpGwe8IvqUfFaAZcASs75cvNFEWd5
 8aR4mN83t4ZXsZowZn9UnhtJ67tG6vCsDMbbIyFJY
X-Google-Smtp-Source: AGHT+IHgbSFpa/+Tlu1SIASCen4lOHh+yzm/vYdfCCqJi8s5xL1T+oiloqzOTP/QPtJOo2Ncndj4ZglbwK96tsGQeB4=
X-Received: by 2002:a17:90b:2f0e:b0:2ee:ed07:d6d2 with SMTP id
 98e67ed59e1d1-2f2e938a7c0mr4746355a91.37.1734534543377; Wed, 18 Dec 2024
 07:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20241122084804.29669-1-ville.syrjala@linux.intel.com>
 <20241122084804.29669-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20241122084804.29669-3-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 18 Dec 2024 17:08:51 +0200
Message-ID: <CAJ=qYWT7NmG3wxUYGJ0QgOG4kUjsLUmhoTnKr0UVwyQv0CT=Zw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 2/4] lib/intel_bufops: Provide pread/pwrite based
 fallback when we don't have WC
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

On Fri, Nov 22, 2024 at 10:48=E2=80=AFAM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The linear<->tiled conversion code currently assume that we may
> be able to use either cpu or wc mmaps. That is not true on all
> systems. As a last resort provide a pread/pwrite based fallback.
>
> v2: Add missing *malloced=3Dtrue (Kamil)
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/intel_bufops.c | 68 ++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 56 insertions(+), 12 deletions(-)
>
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 619222019fd8..15f23d0e1375 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -549,10 +549,12 @@ static void __copy_ccs(struct buf_ops *bops, struct=
 intel_buf *buf,
>         munmap(map, size);
>  }
>
> -static void *mmap_write(int fd, struct intel_buf *buf)
> +static void *mmap_write(int fd, const struct intel_buf *buf, bool *mallo=
ced)
>  {
>         void *map =3D NULL;
>
> +       *malloced =3D false;
> +
>         if (buf->bops->driver =3D=3D INTEL_DRIVER_XE)
>                 return xe_bo_map(fd, buf->handle, buf->surface[0].size);
>
> @@ -580,7 +582,7 @@ static void *mmap_write(int fd, struct intel_buf *buf=
)
>                                        I915_GEM_DOMAIN_CPU);
>         }
>
> -       if (!map) {
> +       if (!map && gem_mmap__has_wc(fd)) {
>                 map =3D __gem_mmap_offset__wc(fd, buf->handle, 0, buf->su=
rface[0].size,
>                                             PROT_READ | PROT_WRITE);
>                 if (!map)
> @@ -591,13 +593,31 @@ static void *mmap_write(int fd, struct intel_buf *b=
uf)
>                                I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>         }
>
> +       if (!map) {
> +               map =3D malloc(buf->surface[0].size);
> +               igt_assert(map);
> +               *malloced =3D true;
> +       }
> +
>         return map;
>  }
>
> -static void *mmap_read(int fd, struct intel_buf *buf)
> +static void munmap_write(void *map, int fd, const struct intel_buf *buf,=
 bool malloced)
> +{
> +       if (malloced) {
> +               igt_assert(__gem_write(fd, buf->handle, 0, map, buf->surf=
ace[0].size) =3D=3D 0);
> +               free(map);
> +       } else {
> +               munmap(map, buf->surface[0].size);
> +       }
> +}
> +
> +static void *mmap_read(int fd, struct intel_buf *buf, bool *malloced)
>  {
>         void *map =3D NULL;
>
> +       *malloced =3D false;
> +
>         if (buf->bops->driver =3D=3D INTEL_DRIVER_XE)
>                 return xe_bo_map(fd, buf->handle, buf->surface[0].size);
>
> @@ -622,7 +642,7 @@ static void *mmap_read(int fd, struct intel_buf *buf)
>                         gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_C=
PU, 0);
>         }
>
> -       if (!map) {
> +       if (!map && gem_mmap__has_wc(fd)) {
>                 map =3D __gem_mmap_offset__wc(fd, buf->handle, 0, buf->su=
rface[0].size,
>                                             PROT_READ);
>                 if (!map)
> @@ -632,9 +652,25 @@ static void *mmap_read(int fd, struct intel_buf *buf=
)
>                 gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_WC, 0);
>         }
>
> +       if (!map) {
> +               map =3D malloc(buf->surface[0].size);
> +               igt_assert(map);
> +               *malloced =3D true;
> +
> +               igt_assert(__gem_read(fd, buf->handle, 0, map, buf->surfa=
ce[0].size) =3D=3D 0);
> +       }
> +
>         return map;
>  }
>
> +static void munmap_read(void *map, int fd, const struct intel_buf *buf, =
bool malloced)
> +{
> +       if (malloced)
> +               free(map);
> +       else
> +               munmap(map, buf->surface[0].size);
> +}
> +
>  static void __copy_linear_to(int fd, struct intel_buf *buf,
>                              const uint32_t *linear,
>                              int tiling, uint32_t swizzle)
> @@ -642,7 +678,10 @@ static void __copy_linear_to(int fd, struct intel_bu=
f *buf,
>         const tile_fn fn =3D __get_tile_fn_ptr(fd, tiling);
>         int height =3D intel_buf_height(buf);
>         int width =3D intel_buf_width(buf);
> -       void *map =3D mmap_write(fd, buf);
> +       bool malloced;
> +       void *map;
> +
> +       map =3D mmap_write(fd, buf, &malloced);
>
>         for (int y =3D 0; y < height; y++) {
>                 for (int x =3D 0; x < width; x++) {
> @@ -655,7 +694,7 @@ static void __copy_linear_to(int fd, struct intel_buf=
 *buf,
>                 }
>         }
>
> -       munmap(map, buf->surface[0].size);
> +       munmap_write(map, fd, buf, malloced);
>  }
>
>  static void copy_linear_to_none(struct buf_ops *bops, struct intel_buf *=
buf,
> @@ -706,7 +745,10 @@ static void __copy_to_linear(int fd, struct intel_bu=
f *buf,
>         const tile_fn fn =3D __get_tile_fn_ptr(fd, tiling);
>         int height =3D intel_buf_height(buf);
>         int width =3D intel_buf_width(buf);
> -       void *map =3D mmap_write(fd, buf);
> +       bool malloced;
> +       void *map;
> +
> +       map =3D mmap_write(fd, buf, &malloced);
>
>         for (int y =3D 0; y < height; y++) {
>                 for (int x =3D 0; x < width; x++) {
> @@ -719,7 +761,7 @@ static void __copy_to_linear(int fd, struct intel_buf=
 *buf,
>                 }
>         }
>
> -       munmap(map, buf->surface[0].size);
> +       munmap_write(map, fd, buf, malloced);
>  }
>
>  static void copy_none_to_linear(struct buf_ops *bops, struct intel_buf *=
buf,
> @@ -803,25 +845,27 @@ static void copy_gtt_to_linear(struct buf_ops *bops=
, struct intel_buf *buf,
>  static void copy_linear_to_wc(struct buf_ops *bops, struct intel_buf *bu=
f,
>                               uint32_t *linear)
>  {
> +       bool malloced;
>         void *map;
>
>         DEBUGFN();
>
> -       map =3D mmap_write(bops->fd, buf);
> +       map =3D mmap_write(bops->fd, buf, &malloced);
>         memcpy(map, linear, buf->surface[0].size);
> -       munmap(map, buf->surface[0].size);
> +       munmap_write(map, bops->fd, buf, malloced);
>  }
>
>  static void copy_wc_to_linear(struct buf_ops *bops, struct intel_buf *bu=
f,
>                               uint32_t *linear)
>  {
> +       bool malloced;
>         void *map;
>
>         DEBUGFN();
>
> -       map =3D mmap_read(bops->fd, buf);
> +       map =3D mmap_read(bops->fd, buf, &malloced);
>         igt_memcpy_from_wc(linear, map, buf->surface[0].size);
> -       munmap(map, buf->surface[0].size);
> +       munmap_read(map, bops->fd, buf, malloced);
>  }
>
>  void intel_buf_to_linear(struct buf_ops *bops, struct intel_buf *buf,
> --
> 2.45.2
>
