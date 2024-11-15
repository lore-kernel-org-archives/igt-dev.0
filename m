Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EA6D6DDF8
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 13:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C91A10E09D;
	Fri, 15 Nov 2024 13:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JSdJvcM1";
	dkim-atps=neutral
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1E310E09D
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 13:10:47 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2110a622d76so15894785ad.3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731676247; x=1732281047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+yGHuT2gj4/LtWD0hUW2JBfphKLPg82RVTYhfwlLIE=;
 b=JSdJvcM12Pi8gssaOrEaL10KNUCQrYrw+wxNWGuUOjok13jLMgsPPgef+40ovc0dNm
 AkjhXrvvWbir6BHiXmaFUMVGC3Xif8CJO+LZav2MMx5SfNbl8cU7OXS6bphWmy8Cif1p
 6MDbttg6ShJ1PQypgDx7Nxky3fmKTAHyzx6zEYdZqoPMNzBJuKPKT0g5o+P8rmY1onLn
 +Vv+wUmYMRlzAQ0L1vsXXgt4A6SsCSe7m4dCndQPiC3myjpYjBuNvx56OV0cLwqJF5h0
 fQ40gpYemomdTzXFqEt7qxGXmGM4LZ6+vDCv1yLkdhsO3sBukJc0JeoxFOyclnjlArQB
 HlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731676247; x=1732281047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+yGHuT2gj4/LtWD0hUW2JBfphKLPg82RVTYhfwlLIE=;
 b=iALuKp7Hgib4wAuyJQadrMh1MG6GtChPOqMcC/IC5QUpAeY5cRzcXU+XNxLIrEIaxS
 UN0CmWhVkAdJsgYsixkLcqXfzrML1a76c/38usiPRGUBMQnq8TbAq4L8Aiae1Ezr/+Ie
 bIAsVZCW9nB22+uKV+UwBzJFeFUNeK5/p3HNHKNh40yHYB4Wj+s3YXIZnTHWNezc4h3v
 mSJFiPSc77/QB+fspZGMjRBP7QQ34xNx8NuxdRD9NBJ8z4RsmYMTVNRyQ/hV436wyUvE
 TnI46VgyRRtPSU+PWxMowldpQq5C73b3pY2owq6HecEAeg1KyRBItB4j3drMcpM7Axxo
 xq+g==
X-Gm-Message-State: AOJu0Yzqw96Dlq+N6wbELhxsZK5TJSu8fCofSYkj0AUTHCcqTwn5GUZx
 ib3I2nCVSofINzDpbUe81GDUWdZMz9DZtp9P2egnUUIph9mxn2jACLO8/e0ZQxiyghDdNMizsfT
 hGbk2rs5LjAMK5/pTr4Q+r68vmnZviDcYl1ol/XS0
X-Google-Smtp-Source: AGHT+IGUElporQ1jq9ygLOFSitxgKXql8Ks2nz9oiLs3Ih1txV+p7SpldC9/+DxtZ10AkBCTnMB1yJc0m0/+Paj+Vz0=
X-Received: by 2002:a17:903:40c8:b0:206:aac4:b844 with SMTP id
 d9443c01a7336-211d0d4e400mr36802765ad.6.1731676247024; Fri, 15 Nov 2024
 05:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20241108064712.252927-1-zbigniew.kempczynski@intel.com>
 <20241108064712.252927-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241108064712.252927-2-zbigniew.kempczynski@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Fri, 15 Nov 2024 15:10:35 +0200
Message-ID: <CAJ=qYWSZLKyTp=MtH4m8kRsBEAwrFvdk7qSFKM-9HeQ--0LF4Q@mail.gmail.com>
Subject: Re: [PATCH i-g-t 1/3] lib/intel_blt: Handle multiple ctrl-surf-copy
 blits on big surface
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
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

All look ok to me, entire set is

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Fri, Nov 8, 2024 at 8:47=E2=80=AFAM Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> Copying ccs data for bigger surfaces requires couple of blits. This is
> caused by the limitation of 10-bit size (for Xe and Xe2+) of the
> ctrl-surf-copy operation. To handle bigger than 64MiB surfaces on Xe
> and 4MiB on Xe2+ we need to divide blits to fit in mentioned 10-bit
> size.
>
> Change introduces looping around big surface to produce batch with
> couple of ctrl-surf-copy blits.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/intel_blt.c | 121 ++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 86 insertions(+), 35 deletions(-)
>
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 1b0f279177..b2fb3151e0 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1115,7 +1115,13 @@ int blt_block_copy(int fd,
>         return ret;
>  }
>
> -static uint16_t __ccs_size(int fd, const struct blt_ctrl_surf_copy_data =
*surf)
> +/*
> + * Function calculates CCS bytes used for the surface. Size field in
> + * ctrl-surf-copy command struct is for Xe and Xe2 10-bit length, so cal=
ler
> + * has to divide ccs copy of bigger surfaces to couple of separate comma=
nds.
> + * This function returns total size of ccs data used for the surface.
> + */
> +static uint32_t __ccs_size(int fd, const struct blt_ctrl_surf_copy_data =
*surf)
>  {
>         uint32_t src_size, dst_size;
>         uint16_t ccsratio =3D CCS_RATIO(fd);
> @@ -1286,8 +1292,8 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
>         uint64_t dst_offset, src_offset, bb_offset, alignment;
>         uint32_t bbe =3D MI_BATCH_BUFFER_END;
>         uint32_t *bb;
> -       uint16_t num_ccs_blocks =3D (ip_ver >=3D IP_VER(20, 0)) ?
> -                               (xe_get_default_alignment(fd) / CCS_RATIO=
(fd)) : CCS_RATIO(fd);
> +       uint32_t ccs_per_page, max_blocks, src_step, dst_step;
> +       int32_t left_blocks;
>
>         igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
>         igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-=
copy blit\n");
> @@ -1299,51 +1305,108 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
>                                           alignment, surf->dst.pat_index)=
;
>         bb_offset =3D get_offset(ahnd, surf->bb.handle, surf->bb.size, al=
ignment);
>
> +       bb =3D bo_map(fd, surf->bb.handle, surf->bb.size, surf->driver);
> +
> +       /*
> +        * Copying in/out CCS data is limited by bitfield size_of_ctrl_co=
py size
> +        * what means operation on bigger surface needs to be handled on =
couple
> +        * of ctrl-surf-copy commands.
> +        *
> +        * Instead of hardcoding maximum number of blocks copied in singl=
e
> +        * command we may calculate it from bitfield size (Xe and Xe2 dif=
fers
> +        * in bitfield location [and in future platforms potentially size=
]).
> +        */
>         if (ip_ver >=3D IP_VER(20, 0)) {
> +               ccs_per_page =3D SZ_4K / CCS_RATIO(fd);
> +
>                 data.xe2.dw00.client =3D 0x2;
>                 data.xe2.dw00.opcode =3D 0x48;
>                 data.xe2.dw00.src_access_type =3D surf->src.access_type;
>                 data.xe2.dw00.dst_access_type =3D surf->dst.access_type;
> -
> -               /* Ensure dst has size capable to keep src ccs aux */
> -               data.xe2.dw00.size_of_ctrl_copy =3D __ccs_size(fd, surf) =
/ num_ccs_blocks - 1;
>                 data.xe2.dw00.length =3D 0x3;
>
> -               data.xe2.dw01.src_address_lo =3D src_offset;
> -               data.xe2.dw02.src_address_hi =3D src_offset >> 32;
> +               data.xe2.dw00.size_of_ctrl_copy =3D -1;
> +               max_blocks =3D data.xe2.dw00.size_of_ctrl_copy + 1;
> +
> +               /*
> +                * For Xe2+ each size_of_ctrl_copy increment covers 4K pa=
ge size
> +                * of surface, which in turn is covered by 8B of CCS data=
.
> +                */
> +               src_step =3D surf->src.access_type =3D=3D DIRECT_ACCESS ?=
 ccs_per_page : SZ_4K;
> +               src_step *=3D max_blocks;
> +               dst_step =3D surf->dst.access_type =3D=3D DIRECT_ACCESS ?=
 ccs_per_page : SZ_4K;
> +               dst_step *=3D max_blocks;
> +
>                 data.xe2.dw02.src_mocs_index =3D surf->src.mocs_index;
> -
> -               data.xe2.dw03.dst_address_lo =3D dst_offset;
> -               data.xe2.dw04.dst_address_hi =3D dst_offset >> 32;
>                 data.xe2.dw04.dst_mocs_index =3D surf->dst.mocs_index;
>
>                 data_sz =3D sizeof(data.xe2);
>         } else {
> +               ccs_per_page =3D SZ_64K / CCS_RATIO(fd);
> +
>                 data.gen12.dw00.client =3D 0x2;
>                 data.gen12.dw00.opcode =3D 0x48;
>                 data.gen12.dw00.src_access_type =3D surf->src.access_type=
;
>                 data.gen12.dw00.dst_access_type =3D surf->dst.access_type=
;
> -
> -               /* Ensure dst has size capable to keep src ccs aux */
> -               data.gen12.dw00.size_of_ctrl_copy =3D __ccs_size(fd, surf=
) / num_ccs_blocks - 1;
>                 data.gen12.dw00.length =3D 0x3;
>
> -               data.gen12.dw01.src_address_lo =3D src_offset;
> -               data.gen12.dw02.src_address_hi =3D src_offset >> 32;
> +               data.gen12.dw00.size_of_ctrl_copy =3D -1;
> +               max_blocks =3D data.gen12.dw00.size_of_ctrl_copy + 1;
> +
> +               /*
> +                * For Xe each size_of_ctrl_copy increment covers 64K pag=
e size
> +                * of surface, which in turn is covered by 256B of CCS da=
ta.
> +                */
> +               src_step =3D surf->src.access_type =3D=3D DIRECT_ACCESS ?=
 ccs_per_page : SZ_64K;
> +               src_step *=3D max_blocks;
> +               dst_step =3D surf->dst.access_type =3D=3D DIRECT_ACCESS ?=
 ccs_per_page : SZ_64K;
> +               dst_step *=3D max_blocks;
> +
>                 data.gen12.dw02.src_mocs_index =3D surf->src.mocs_index;
> -
> -               data.gen12.dw03.dst_address_lo =3D dst_offset;
> -               data.gen12.dw04.dst_address_hi =3D dst_offset >> 32;
>                 data.gen12.dw04.dst_mocs_index =3D surf->dst.mocs_index;
>
>                 data_sz =3D sizeof(data.gen12);
>         }
>
> -       bb =3D bo_map(fd, surf->bb.handle, surf->bb.size, surf->driver);
> +       left_blocks =3D __ccs_size(fd, surf) / ccs_per_page;
>
> -       igt_assert(bb_pos + data_sz < surf->bb.size);
> -       memcpy(bb + bb_pos, &data, data_sz);
> -       bb_pos +=3D data_sz;
> +       while (left_blocks > 0) {
> +               int32_t nblocks =3D min_t(int32_t, left_blocks, max_block=
s);
> +
> +               if (ip_ver >=3D IP_VER(20, 0)) {
> +                       data.xe2.dw00.size_of_ctrl_copy =3D nblocks - 1;
> +                       data.xe2.dw01.src_address_lo =3D src_offset;
> +                       data.xe2.dw02.src_address_hi =3D src_offset >> 32=
;
> +                       data.xe2.dw03.dst_address_lo =3D dst_offset;
> +                       data.xe2.dw04.dst_address_hi =3D dst_offset >> 32=
;
> +               } else {
> +                       data.gen12.dw00.size_of_ctrl_copy =3D nblocks - 1=
;
> +                       data.gen12.dw01.src_address_lo =3D src_offset;
> +                       data.gen12.dw02.src_address_hi =3D src_offset >> =
32;
> +                       data.gen12.dw03.dst_address_lo =3D dst_offset;
> +                       data.gen12.dw04.dst_address_hi =3D dst_offset >> =
32;
> +               }
> +
> +               left_blocks -=3D max_blocks;
> +               dst_offset +=3D dst_step;
> +               src_offset +=3D src_step;
> +
> +               igt_assert(bb_pos + data_sz < surf->bb.size);
> +               memcpy(bb + bb_pos, &data, data_sz);
> +               bb_pos +=3D data_sz;
> +
> +               if (surf->print_bb) {
> +                       igt_info("[CTRL SURF]:\n");
> +                       igt_info("src offset: 0x%" PRIx64 ", dst offset: =
0x%" PRIx64
> +                                ", bb offset: 0x%" PRIx64 ", copy nblock=
s: 0x%x\n",
> +                                src_offset, dst_offset, bb_offset, nbloc=
ks);
> +
> +                       if (ip_ver >=3D IP_VER(20, 0))
> +                               xe2_dump_bb_surf_ctrl_cmd(&data.xe2);
> +                       else
> +                               dump_bb_surf_ctrl_cmd(&data.gen12);
> +               }
> +       }
>
>         if (emit_bbe) {
>                 igt_assert(bb_pos + sizeof(uint32_t) < surf->bb.size);
> @@ -1351,18 +1414,6 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
>                 bb_pos +=3D sizeof(uint32_t);
>         }
>
> -       if (surf->print_bb) {
> -               igt_info("[CTRL SURF]:\n");
> -               igt_info("src offset: %" PRIx64 ", dst offset: %" PRIx64
> -                        ", bb offset: %" PRIx64 "\n",
> -                        src_offset, dst_offset, bb_offset);
> -
> -               if (ip_ver >=3D IP_VER(20, 0))
> -                       xe2_dump_bb_surf_ctrl_cmd(&data.xe2);
> -               else
> -                       dump_bb_surf_ctrl_cmd(&data.gen12);
> -       }
> -
>         munmap(bb, surf->bb.size);
>
>         return bb_pos;
> --
> 2.34.1
>
