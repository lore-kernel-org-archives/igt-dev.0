Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F5310E105
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 14:26:53 +0000 (UTC)
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4fb89482c48so4839453e87.3
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 07:26:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Albert Esteve <aesteve@redhat.com>, igt-dev@lists.freedesktop.org
In-Reply-To: <20230721130458.64856-4-aesteve@redhat.com>
References: <20230721130458.64856-1-aesteve@redhat.com>
 <20230721130458.64856-4-aesteve@redhat.com>
Date: Tue, 25 Jul 2023 16:26:45 +0200
Message-ID: <87cz0gjcd6.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [igt-dev] [PATCH 3/3] kms_cursor_legacy:
 modeset-atomic-cursor-hotspot
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: belmouss@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Albert Esteve <aesteve@redhat.com> writes:

The patch looks good to me as well.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Some comments below though:

> Add a test for modesetting an atomic cursor plane
> hotspot property. The test first checks if the
> plane is atomic and has the hotspot property.
> and if it does, it sets different random hot_x
> and hot_y values and checks that it is updated
> correctly after an atomic commit.
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  tests/kms_cursor_legacy.c | 75 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 1ebac9d31..38258ed8d 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c

This file is called kms_cursor_legacy.c but it seems there are tests for
both legacy KMS and atomic KMS? That confused me :)

> @@ -1607,6 +1607,70 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>  	put_ahnd(ahnd);
>  }
>  
> +static void modeset_atomic_cursot_hotspot(igt_display_t *display)
> +{

I think you meant this to be "cursor_hotspot" instead ?

[...]

> +
> +	width = height = 64;

maybe you can rename these to cursor_{width,height} ?

Also, there's https://docs.kernel.org/gpu/drm-uapi.html#c.DRM_CAP_CURSOR_WIDTH
and DRM_CAP_CURSOR_HEIGHT to query the hardware cursor size. Maybe you should
use that instead of assume a 64x64 cursor size ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat
