Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F82D2C122
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 15:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA6310E5D3;
	Tue,  5 Nov 2024 15:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="DdvIWKW3";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB70510E5CD
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 15:11:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730819480; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TyBxAW0AztFoYtHTa40UbZVWzJcp+VIaCeZNBSN0InNefe6lsoQQ2ios8KLccWxxC/LblD+tJKtqMKUlSkgZnVuPlioEHDIdb3m/P9QzP7mwyO1zOdzI0AkXN/TyJigRKldkOCEJdmL858tt4+WV4QbclUdp8TsCt8/UxZ3YQ9A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730819480;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=J5C0rU+gpkUsKjcNEcB1DR78gTpFkD7PbBWLlZ7IOsU=; 
 b=cuZMVY20/woSPuRH79X+M6ot96IYL3bOYg2yEU3JllvBy6opTbtJctDwEL7M5dRZnGCnixgOmG6vHvFTlAV4kBzSaBuw33+7oTFs10LPqlmfFmpkqGkwrmu1oRWeMSBuTXr7Oed0WVe2WMAiNrzv032vPIph/UpWnwQ2jNjr+kU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730819480; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=J5C0rU+gpkUsKjcNEcB1DR78gTpFkD7PbBWLlZ7IOsU=;
 b=DdvIWKW3gi7PM7LAoKjoJ6KAP75GZ3eRQrCManKY5jXhSvwz8Xq2ImXbDfoKp1vA
 jvShB+bRSsfrE3u8AsY63HAQVYGF+JX9l/S/+M6pTd6SWnp5NA2oSiFFKPfFZgPw+Qw
 XRDX4XHVKY8ak81aQL/1jO5nf4+BWVXEgpuuPkj0=
Received: by mx.zohomail.com with SMTPS id 1730819478425866.8616106594219;
 Tue, 5 Nov 2024 07:11:18 -0800 (PST)
Date: Tue, 5 Nov 2024 15:11:15 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_profiling: add include for PATH_MAX constant
Message-ID: <odzaaliyr2d7fuz4u7izrtw2yfw2uqp23uxyyqs6uq6zlb7rpg@52qx6p4bpsqn>
References: <20241103171806.10248-1-arkamar@atlas.cz>
 <202411583120-ZynX2Bpb672E8EEZ-arkamar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202411583120-ZynX2Bpb672E8EEZ-arkamar@atlas.cz>
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

On 05.11.2024 09:31, Petr Vaněk wrote:
> PATH_MAX constant is defined in limits.h header file. It needs to be
> explicitly included in musl environment as it is not transitively
> available for any of available includes.
> 
> Fixes: 9366bee04d16 ("lib: Add DRM driver sysfs profiling knob toggling functions")
> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> Signed-off-by: Petr Vaněk <arkamar@atlas.cz>

Reviewed-by: Adrian Larumbe <adrian.larumbe@collabora.com>

> ---
> Resending the patch as it seems it did not make it to the list last
> time.
> 
>  lib/igt_profiling.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> index b61506742..e1526ad98 100644
> --- a/lib/igt_profiling.c
> +++ b/lib/igt_profiling.c
> @@ -10,6 +10,7 @@
>  #include <assert.h>
>  #include <dirent.h>
>  #include <fcntl.h>
> +#include <limits.h>
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> -- 
> 2.45.2
