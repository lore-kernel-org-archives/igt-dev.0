Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0752AE9A04C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 15:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B077710E6F3;
	Thu, 19 Feb 2026 15:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LjI3h5m1";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE0F10E6F3
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771514598;
 bh=4ndvfjI70+ggyfu1xksmjnylrNT1qOAVz12vL5vexcc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LjI3h5m1bf1S7l2byvONIa9kk8IihcFWuxdouX92g9YQeECNGrMYYfO0CfyTGI0vp
 8mE4cKBWQpA+q45iVhP49qAdh0EhACqkQPse4IycyGWsD4x9/Z8G+FvTV8lA/bZsAb
 9zFUd3tg71fAkh7//C8KhsF0SBD0IvRYGyFrfl63VhX25XDs1e3JaJj1G5StL1NZjr
 uuIEFcUM912kkv1V8ds+yHj6eqxM7Scn0yM2gjODQdXznQxjCa9L4HPcgFlwLdbtgV
 j+XZBc0g/K1ZO1cPJGTUI1XDLbKxQS1lbiDBY4PYS39y0Apd+sDenvFCGWj4S2BOU/
 6AFl2vKB8aklQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DF79917E00AC;
 Thu, 19 Feb 2026 16:23:17 +0100 (CET)
Date: Thu, 19 Feb 2026 16:23:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Daniel Almeida
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH i-g-t v2] panthor: Enable compilation on big-endian arch
Message-ID: <20260219162313.1b10a51e@fedora>
In-Reply-To: <20260219150524.92665-1-kamil.konieczny@linux.intel.com>
References: <20260219150524.92665-1-kamil.konieczny@linux.intel.com>
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

On Thu, 19 Feb 2026 16:05:24 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Compilation of Panthor was broken on big-endian due to a guard in
> pathor lib against such arch. Fix this and create and use
> function for skipping all panthor tests on such machines.
> 
> Also while at it, init fd so it could be safely used at last
> fixture.
> 
> v2: simplify test for big-endian, fix typo (Boris)
> 
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/200
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Thanks!

Boris

> ---
>  lib/igt_panthor.c             | 11 +++++++++++
>  lib/igt_panthor.h             |  6 ++----
>  tests/panthor/panthor_gem.c   |  3 ++-
>  tests/panthor/panthor_group.c |  3 ++-
>  tests/panthor/panthor_query.c |  3 ++-
>  tests/panthor/panthor_vm.c    |  3 ++-
>  6 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 49b427d4f..7ffb61eb3 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -6,6 +6,17 @@
>  #include "ioctl_wrappers.h"
>  #include "panthor_drm.h"
>  
> +/**
> + * igt_panthor_skip_on_big_endian:
> + *
> + * Skip Panthor test on big-endian machines.
> + */
> +void igt_panthor_skip_on_big_endian(void)
> +{
> +	igt_skip_on_f(__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__,
> +		      "Panthor is unsupported on big-endian arch\n");
> +}
> +
>  /**
>   * igt_panthor_group_create:
>   * @fd: device file descriptor
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index 97a2b7497..be8490840 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -61,11 +61,9 @@ enum cs_flush_mode {
>  };
>  
>  /* There's no plan to support big endian in the UMD, so keep
> - * things simple and don't bother supporting it here either.
> + * things simple and don't bother supporting it.
>   */
> -#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> -#error "big endian not supported"
> -#endif
> +void igt_panthor_skip_on_big_endian(void);
>  
>  struct cs_instr {
>  	union {
> diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
> index 57ba4bc82..6388addb0 100644
> --- a/tests/panthor/panthor_gem.c
> +++ b/tests/panthor/panthor_gem.c
> @@ -8,9 +8,10 @@
>  #include "igt_panthor.h"
>  
>  int igt_main() {
> -	int fd;
> +	int fd = -1;
>  
>  	igt_fixture() {
> +		igt_panthor_skip_on_big_endian();
>  		fd = drm_open_driver(DRIVER_PANTHOR);
>  	}
>  
> diff --git a/tests/panthor/panthor_group.c b/tests/panthor/panthor_group.c
> index 13636e60c..c79f8d629 100644
> --- a/tests/panthor/panthor_group.c
> +++ b/tests/panthor/panthor_group.c
> @@ -41,9 +41,10 @@ issue_store_multiple(uint8_t *cs, uint64_t kernel_va, uint32_t constant)
>  }
>  
>  int igt_main() {
> -	int fd;
> +	int fd = -1;
>  
>  	igt_fixture() {
> +		igt_panthor_skip_on_big_endian();
>  		fd = drm_open_driver(DRIVER_PANTHOR);
>  	}
>  
> diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
> index fa4f8ef26..afd58a5bd 100644
> --- a/tests/panthor/panthor_query.c
> +++ b/tests/panthor/panthor_query.c
> @@ -8,9 +8,10 @@
>  #include <stdint.h>
>  
>  int igt_main() {
> -	int fd;
> +	int fd = -1;
>  
>  	igt_fixture() {
> +		igt_panthor_skip_on_big_endian();
>  		fd = drm_open_driver(DRIVER_PANTHOR);
>  	}
>  
> diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> index 76a669843..92b105b9e 100644
> --- a/tests/panthor/panthor_vm.c
> +++ b/tests/panthor/panthor_vm.c
> @@ -7,9 +7,10 @@
>  #include "panthor_drm.h"
>  
>  int igt_main() {
> -	int fd;
> +	int fd = -1;
>  
>  	igt_fixture() {
> +		igt_panthor_skip_on_big_endian();
>  		fd = drm_open_driver(DRIVER_PANTHOR);
>  	}
>  

