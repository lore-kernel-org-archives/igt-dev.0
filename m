Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9C0E9A047
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 16:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E801B10E05A;
	Wed, 18 Feb 2026 16:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TAbBpZ+K";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C133710E05A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 16:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771431421;
 bh=Rw73oB5WW8gU/Pi/BvdQpptboagvGGguLIjnQno1JjQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TAbBpZ+KmyoTepIGnkFCdWmvYmEnDoPvpTGFe7R1Zk0pDkxvdYmqw930+9PI4A3ys
 sU2A9W1S2rYfBWyuCpP72my8fEb0rHRf2aJkmypUFehNkWwJLhnq4q+S+ubGU4B9sU
 9EhNfYW9D7rNHwVBKTnSOxrCDy7BDE/sP02UQPqJ6150JmlpaQYmEcJ5qc9HluJ9Sd
 W3Bmo24XmbqfycrDzMJkrbqb8lQZbrmO5TUal0Zuu74RD+NezMePcEe94wYkDnpK4t
 Fz6RQg5Jo7MEveecQoH9WS8CU5+UTJUGC4qEjgsp2+DDPIxZpQT5KCbvFDGaJsYPFq
 8jcdbLBBb+dSg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 48AD417E13D0;
 Wed, 18 Feb 2026 17:17:01 +0100 (CET)
Date: Wed, 18 Feb 2026 17:16:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Daniel Almeida
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH i-g-t] panthor: Enable compilation on big-endian arch
Message-ID: <20260218171657.6a4cd753@fedora>
In-Reply-To: <20260218153444.80754-1-kamil.konieczny@linux.intel.com>
References: <20260218153444.80754-1-kamil.konieczny@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 18 Feb 2026 16:34:44 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Compilation of Panthor was broken on big-endian due to a guard in
> pathor lib against such arch. Fix this and create and use a macro
> for skipping all panthor tests on such machines.
> 
> Also while at it, init fd so it could be safely used at last
> fixture.
> 
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/200
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_panthor.c             | 17 +++++++++++++++++
>  lib/igt_panthor.h             |  6 ++----
>  tests/panthor/panthor_gem.c   |  3 ++-
>  tests/panthor/panthor_group.c |  3 ++-
>  tests/panthor/panthor_query.c |  3 ++-
>  tests/panthor/panthor_vm.c    |  3 ++-
>  6 files changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 49b427d4f..cf065352d 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -6,6 +6,23 @@
>  #include "ioctl_wrappers.h"
>  #include "panthor_drm.h"
>  
> +/**
> + * igt_panthor_skip_on_big_endian:
> + *
> + * Skip Panthor test on bing-endian machines.

			   ^ big-endian

> + */
> +void igt_panthor_skip_on_big_endian(void)
> +{
> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> + #define IGT_PANTHOR_ON_BIG_ENDIAN 1
> +#else
> + #define IGT_PANTHOR_ON_BIG_ENDIAN 0
> +#endif
> +
> +	igt_skip_on_f(IGT_PANTHOR_ON_BIG_ENDIAN, "Panthor is unsupported on big-endian arch\n");
> +#undef IGT_PANTHOR_ON_BIG_ENDIAN

Can't we just go with

	igt_skip_on_f(__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__,
		      "Panthor is unsupported on big-endian arch\n");

and drop the IGT_PANTHOR_ON_BIG_ENDIAN definition?

> +}

The rest looks good to me.

Regards,

Boris
