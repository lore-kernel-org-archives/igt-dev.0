Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79486E9B2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jul 2021 12:55:58 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w188so6416580oif.10
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jul 2021 05:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210720105652.996036-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210720105652.996036-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 22 Jul 2021 14:55:47 +0200
Message-ID: <CAKMK7uFnUoy5+XMK=ty+spx10O=a9nh_MF1ziCXVO9AUU+fqfA@mail.gmail.com>
Subject: Re: [igt-dev] [i-g-t V2] tests/kms_prime: Use 256B aligned width
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 1:05 PM Tejas Upadhyay
<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
>
> Having different alignment requirement by different drivers,
> 256B aligned should work for all drm drivers.
>
> amdgpu and radeon, amdgpu_align_pitch: 256B
> armada, armada_pitch: 128B
> exynos_drm_gem_dumb_create: No alignment required
> drm_gem_shmem_dumb_create: 8B
> drm_gem_vram_fill_create_dumb: 8B
>
> Thus 256B covers everything we see in the kernel drm drivers.
>
> Changes since V1:
>         - Edited commit message with driver compatible with 256B align-Daniel
>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  tests/kms_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 35f4b5b7..2e20c58b 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -101,7 +101,7 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>         scratch->bpp = 32;
>
>         scratch->handle = kmstest_dumb_create(exporter_fd,
> -                       scratch->width,
> +                       ALIGN(scratch->width, 256),
>                         scratch->height,
>                         scratch->bpp,
>                         &scratch->pitch,
> --
> 2.31.1
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
