Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C424E63C8B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 10:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FAF10E2F0;
	Mon, 23 Feb 2026 10:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O75Q6s0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0FB10E2F0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771843783; x=1803379783;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1g6+D3hpVbUI6tR0l4NLeQUinu/pyZsjrfPX8ykHlnk=;
 b=O75Q6s0GIJn8dcE/0UdqOUNPTQYr9Cg5KKZmOgUZCNwDtviiq4cDZt/o
 MwTjU1LDFxEaJLzyD0FpzZFLe+h+pG/g2ZAFhKa+NX7/55PHVy1Tk7UzT
 FXNO6dzW9Oio/7rpdMgTIXcJQz2SE1+GoTUYAw9UiZ3lMdBnpl+JRK6qE
 ieeIMDYS8VhorgTM2rVVgvJh+yDwgNsqmkx1x9FdKoaCuDDnT3nVEHbtq
 7+RMWClAhprBEf5QlDwvS1afO9xBn9XIIxLA2dir9dSh+sEXnMoTt4n5T
 26+RwNEicBpLJBKNae5rXzn5AgyPbQPBxlQk4cbXW2oSew2atIWMkC6gj g==;
X-CSE-ConnectionGUID: 953piPn0TNukoDIik/5BGw==
X-CSE-MsgGUID: hCzVAQ4HRr6UdNe9QrdiCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90420126"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90420126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 02:49:43 -0800
X-CSE-ConnectionGUID: wM072CZwTymIAICfmg+Khw==
X-CSE-MsgGUID: xePUEYVPTRaCL3QfhZ+CCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212929276"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 02:49:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH i-g-t v2] panthor: Enable compilation on big-endian arch
In-Reply-To: <20260219150524.92665-1-kamil.konieczny@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260219150524.92665-1-kamil.konieczny@linux.intel.com>
Date: Mon, 23 Feb 2026 12:49:38 +0200
Message-ID: <e863d999b0bc37aba10242c707320aabb6cffd4e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 19 Feb 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Compilation of Panthor was broken on big-endian due to a guard in
> pathor lib against such arch. Fix this and create and use
> function for skipping all panthor tests on such machines.
>
> Also while at it, init fd so it could be safely used at last
> fixture.

What about DRIVER_ANY tests?

Seems like the cleaner option would be to amend drm_open_driver() with
something like:

	if (chipset & DRIVER_PANTHOR)
		skip on big endian

instead of sprinkling the skips everywhere.

>
> v2: simplify test for big-endian, fix typo (Boris)
>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/200
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

Why does this have to encode Panthor in the name, when it in fact does
not check anything about Panthor? What the function *does* is skip on
big endian, regardless of GPU, so the function name is misleading.

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

-- 
Jani Nikula, Intel
