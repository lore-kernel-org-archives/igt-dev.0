Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0376AD16261
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 13:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22E610E481;
	Mon, 14 Oct 2024 13:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ctW5gbrZ";
	dkim-atps=neutral
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCDC10E481
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 13:39:22 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-837b92bd007so245624539f.2
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1728913161; x=1729517961;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYYQBZ4c3LvW4rrVvR6bdBWZmHrnFXvrR8o+hxaiEoE=;
 b=ctW5gbrZFuRHYd9QlTLicw+5ro/WJ1E0sXjqbg7llr85x9ODVjGuNT2KMlFKJRRCGz
 7RZZeyFwWpi+NIZaFLe1BdLnwZ7lA6+QhEhTi/eUcNsSL/dkl3Psnd+SuxxUbczD3NVA
 w772tIVdnS6+1Q1iYF3qB6895q6SL6m2X9KWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728913161; x=1729517961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xYYQBZ4c3LvW4rrVvR6bdBWZmHrnFXvrR8o+hxaiEoE=;
 b=agiVOykB8POvwJFm9rzw0ZZq6LkiSGD8FNydo5tcZlb7/FnkkMKGycc9l67pbOwD++
 d4QojQU/Ul5ks3zOLhIivxE5/i8PEjO0adq5SHJaN0tACZomxL8eEsp+pd0Y6NKsjBAF
 RBtGoLVoen3ASjuuP2TalSmYwp1ndUrL50/1ywxkmJ7t6O5+x/KFjxUt7xQaC9x6H+af
 l4VWuxIYVjuOsdQBx4z54P6ad4kPAgsfnUr08uByysi2kO6BbQW+wRIAIRKFMnw2GbSu
 Xa+jF/r4FSpHMpimKRvx32lVCe+c7uUToZqkLQWj4Qw+xJJUoiTNlcs7tlyZGUqmy8e7
 WfBQ==
X-Gm-Message-State: AOJu0YwOEmhWQ/kyvMmlkdqQTVFVzmZ1/AW5Ab7TCFCAP4xMqsv3U52y
 RtdpzkXDopT2kqlvrqQXvtwcQ1m5+9pN8FJLAskx4dvUMYqefAYgMoxU4tS1/o8RxornBUp6zaj
 hsVBtqvvMIIMYzgLl6jSlgd79tteCTevVvMT6
X-Google-Smtp-Source: AGHT+IECrjjBWn72EqFYjxiOWnGHki/Wr4EiGwuddFFkjUKP5KOoJWZG5LOUEUGaQDbUYYG5SZoe+wqeplvhSYiG+QI=
X-Received: by 2002:a05:6602:2c0c:b0:82b:49d4:2ad0 with SMTP id
 ca18e2360f4ac-83a64d10c20mr641873939f.9.1728913161364; Mon, 14 Oct 2024
 06:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241004223053.317136-1-maaz.mombasawala@broadcom.com>
In-Reply-To: <20241004223053.317136-1-maaz.mombasawala@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 14 Oct 2024 16:39:10 +0300
Message-ID: <CAKLwHdU_-Tu_myCU1TGjKb1M=pPOvJgj6f0aGnXMK7db2dmgzg@mail.gmail.com>
Subject: Re: [PATCH] tests/vmwgfx: Add test that draws triangle without using
 3d commands.
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: igt-dev@lists.freedesktop.org, ian.forbes@broadcom.com, 
 zack.rusin@broadcom.com
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

LGTM.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

On Sat, Oct 5, 2024 at 1:31=E2=80=AFAM Maaz Mombasawala
<maaz.mombasawala@broadcom.com> wrote:
>
> The vmwgfx driver can be used in VMs with 3d disabled, in which case 3d
> commands are not available, but buffers can still be created and used.
> Validate buffers on such vms with a test that uses cairo to draw a
> triangle on a vmwgfx mob and validate it with the same image in system
> memory.
>
> Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> ---
>  lib/igt_vmwgfx.c       | 78 ++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_vmwgfx.h       |  3 ++
>  tests/vmwgfx/vmw_tri.c | 30 +++++++++++++---
>  3 files changed, 107 insertions(+), 4 deletions(-)
>
> diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
> index b62d7a326..74c13b52b 100644
> --- a/lib/igt_vmwgfx.c
> +++ b/lib/igt_vmwgfx.c
> @@ -1348,3 +1348,81 @@ bool vmw_is_format_supported(int drm_fd, SVGA3dDev=
CapIndex dev_cap_index)
>         result =3D vmw_format_get_caps(drm_fd, dev_cap_index);
>         return result.u & SVGA3D_FORMAT_POSITIVE;
>  }
> +
> +static void draw_triangle_2d(cairo_t *cr, int width, int height)
> +{
> +       cairo_pattern_t *r_pat, *g_pat, *b_pat;
> +
> +       cairo_rectangle(cr, 0, 0, width, height);
> +       cairo_set_source_rgb(cr, 0.5, 0.5, 0.5);
> +       cairo_fill(cr);
> +
> +       cairo_scale(cr, width, height);
> +
> +       cairo_move_to(cr, 0.5, 0.125);
> +       cairo_line_to(cr, 0.125, 0.875);
> +       cairo_line_to(cr, 0.875, 0.875);
> +       cairo_close_path(cr);
> +
> +       r_pat =3D cairo_pattern_create_linear(0.125, 0.875, 0.675, 0.475)=
;
> +       cairo_pattern_add_color_stop_rgba(r_pat, 0, 1, 0, 0, 1);
> +       cairo_pattern_add_color_stop_rgba(r_pat, 1, 0, 0, 0, 0);
> +
> +       g_pat =3D cairo_pattern_create_linear(0.5, 0.125, 0.5, 0.875);
> +       cairo_pattern_add_color_stop_rgba(g_pat, 0, 0, 1, 0, 1);
> +       cairo_pattern_add_color_stop_rgba(g_pat, 1, 0, 0, 0, 0);
> +
> +       b_pat =3D cairo_pattern_create_linear(0.875, 0.875, 0.325, 0.475)=
;
> +       cairo_pattern_add_color_stop_rgba(b_pat, 0, 0, 0, 1, 1);
> +       cairo_pattern_add_color_stop_rgba(b_pat, 1, 0, 0, 0, 0);
> +
> +       cairo_set_source(cr, r_pat);
> +       cairo_fill_preserve(cr);
> +       cairo_set_source(cr, g_pat);
> +       cairo_fill_preserve(cr);
> +       cairo_set_source(cr, b_pat);
> +       cairo_fill(cr);
> +
> +       cairo_pattern_destroy(r_pat);
> +       cairo_pattern_destroy(g_pat);
> +       cairo_pattern_destroy(b_pat);
> +}
> +
> +
> +/**
> + * Tests if mob can be used without invoking 3d commands.
> + */
> +void vmw_triangle_test_2d(int fd, struct vmw_mob *mob, const uint32 widt=
h,
> +                         const uint32 height, const uint32 stride)
> +{
> +       cairo_surface_t *mob_cr_srf, *mem_cr_srf;
> +       cairo_t *cr_mob, *cr_mem;
> +       void *data, *mob_data, *mem_data;
> +       const uint32 size =3D height * stride;
> +
> +       data =3D vmw_ioctl_mob_map(fd, mob);
> +       mob_cr_srf =3D cairo_image_surface_create_for_data(data,
> +               CAIRO_FORMAT_ARGB32, width, height, stride);
> +       cr_mob =3D cairo_create(mob_cr_srf);
> +       draw_triangle_2d(cr_mob, width, height);
> +
> +       mem_cr_srf =3D cairo_image_surface_create(CAIRO_FORMAT_ARGB32, wi=
dth,
> +               height);
> +       cr_mem =3D cairo_create(mem_cr_srf);
> +       draw_triangle_2d(cr_mem, width, height);
> +
> +       mob_data =3D cairo_image_surface_get_data(mob_cr_srf);
> +       mem_data =3D cairo_image_surface_get_data(mem_cr_srf);
> +
> +       igt_assert_f(mob_data !=3D NULL, "No data in mob image.\n");
> +       igt_assert_f(mem_data !=3D NULL, "No data in system memory image.=
\n");
> +
> +       igt_assert_f(memcmp(mob_data, mem_data, size) =3D=3D 0,
> +                    "Mob and system memory images are not identical\n");
> +
> +       cairo_destroy(cr_mob);
> +       cairo_surface_destroy(mob_cr_srf);
> +       cairo_destroy(cr_mem);
> +       cairo_surface_destroy(mem_cr_srf);
> +       vmw_ioctl_mob_unmap(mob);
> +}
> diff --git a/lib/igt_vmwgfx.h b/lib/igt_vmwgfx.h
> index a630d201d..bfc591128 100644
> --- a/lib/igt_vmwgfx.h
> +++ b/lib/igt_vmwgfx.h
> @@ -257,4 +257,7 @@ SVGA3dDevCapResult vmw_format_get_caps(int drm_fd,
>
>  bool vmw_is_format_supported(int drm_fd, SVGA3dDevCapIndex dev_cap_index=
);
>
> +void vmw_triangle_test_2d(int fd, struct vmw_mob *mob, const uint32 widt=
h,
> +                         const uint32 height, const uint32 stride);
> +
>  #endif /* IGT_VMWGFX_H */
> diff --git a/tests/vmwgfx/vmw_tri.c b/tests/vmwgfx/vmw_tri.c
> index 61c4d5df8..1cb54707a 100644
> --- a/tests/vmwgfx/vmw_tri.c
> +++ b/tests/vmwgfx/vmw_tri.c
> @@ -189,15 +189,17 @@ igt_main
>         {
>                 vmw_svga_device_init(&device, vmw_svga_device_node_render=
);
>                 igt_require(device.drm_fd !=3D -1);
> -
> -               cid =3D vmw_ioctl_context_create(device.drm_fd);
> -               igt_require(cid !=3D SVGA3D_INVALID_ID);
>         }
>
>         igt_describe("Tests rendering of a trivial triangle.");
>         igt_subtest("tri")
>         {
> +               cid =3D vmw_ioctl_context_create(device.drm_fd);
> +               igt_require(cid !=3D SVGA3D_INVALID_ID);
> +
>                 draw_triangle(&device, cid);
> +
> +               vmw_ioctl_context_destroy(device.drm_fd, cid);
>         }
>
>         /*
> @@ -207,12 +209,32 @@ igt_main
>         igt_describe("Tests rendering of a triangle with coherency.");
>         igt_subtest("tri-no-sync-coherent")
>         {
> +               cid =3D vmw_ioctl_context_create(device.drm_fd);
> +               igt_require(cid !=3D SVGA3D_INVALID_ID);
> +
>                 draw_triangle_on_coherent_rt(&device, cid);
> +
> +               vmw_ioctl_context_destroy(device.drm_fd, cid);
> +       }
> +
> +       igt_describe("Tests drawing a triangle without 3d commands");
> +       igt_subtest("tri-2d")
> +       {
> +               struct vmw_mob *mob;
> +               const uint32 width =3D vmw_default_rect_size.width;
> +               const uint32 height =3D vmw_default_rect_size.height;
> +               const uint32 stride =3D width * 4;
> +               const uint32 size =3D height * stride;
> +
> +               mob =3D vmw_ioctl_mob_create(device.drm_fd, size);
> +
> +               vmw_triangle_test_2d(device.drm_fd, mob, width, height, s=
tride);
> +
> +               vmw_ioctl_mob_close_handle(device.drm_fd, mob);
>         }
>
>         igt_fixture
>         {
> -               vmw_ioctl_context_destroy(device.drm_fd, cid);
>                 vmw_svga_device_fini(&device);
>         }
>  }
> --
> 2.43.0
>
