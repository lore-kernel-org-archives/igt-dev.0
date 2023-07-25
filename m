Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD5B10E144
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 13:40:34 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fd2e59bc53so14791725e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 06:40:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Albert Esteve <aesteve@redhat.com>, igt-dev@lists.freedesktop.org
In-Reply-To: <20230721130458.64856-3-aesteve@redhat.com>
References: <20230721130458.64856-1-aesteve@redhat.com>
 <20230721130458.64856-3-aesteve@redhat.com>
Date: Tue, 25 Jul 2023 15:40:29 +0200
Message-ID: <87fs5cjeia.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [igt-dev] [PATCH 2/3] igt_kms: add hotspot plane property
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


Hello Albert,

Patch looks good to me. But I'm not really familiar with the IGT codebase.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

I've one question below though:

Albert Esteve <aesteve@redhat.com> writes:

[...]

> @@ -2679,6 +2686,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>  	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>  		display->is_atomic = 1;
> +	
> +	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1);
>

Should this capability be set unconditionally? 

Do we want to also test the case when user-space doesn't opt-in and does
not know how to handle the hostpost properties ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat
