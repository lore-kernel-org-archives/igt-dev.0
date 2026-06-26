Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1EACDE008
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jun 2026 10:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2B610E360;
	Fri, 26 Jun 2026 10:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uxmj+RXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7639D10E360
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782469718; x=1814005718;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T2gWmWLuS8o/7OWOF/coOVmbyS7meWNxKo8ma5fEIxQ=;
 b=Uxmj+RXNdLa2JbDs0RK/rISqYVe+HmV6Npv2mpNutWzRZMzunlOd6/9C
 zvKg1WehWfzwhvGpcskF7v/68C5/YhL6FNLjmpBLLxNHha9WsAPXgQofa
 ES9rfWeqxU4pxl/zGTxOCRv5ZmrRln4sWl1s3wQOQx6rroC+pPM66DhJj
 vPw0hZlTXXuZCAa9ELaJyk1U2m2AKz9eq39AuEvq4oeWBPwJkjRF6gVCR
 O3OH7Gr1F83lNSMXB/WyED9tDVXQDkwnvAX13zPRHiCiIybxW6ow1V1K0
 +yLoEIwbXWOzxkIeNSR0IBVcTYEO6ENMjqLK5n9lDzQal4Fyi6EHjatrD g==;
X-CSE-ConnectionGUID: oAmjSPAJS0ChVq2JWT6Bcw==
X-CSE-MsgGUID: HqPn67vLQWu9G4VVPRBRlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83141013"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="83141013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 03:28:37 -0700
X-CSE-ConnectionGUID: cVtgQZdrROSX4gp5TD1QIQ==
X-CSE-MsgGUID: rpjSkRQDTnyVE3nwYzZJCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="244900159"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.21])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 03:28:36 -0700
Message-ID: <fdc04285c77b28487c70dca208328df0795345ea.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/gpu_buddy: Rename the KUnit buddy
 allocator test
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Kamil Konieczny	
 <kamil.konieczny@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>,  Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Date: Fri, 26 Jun 2026 12:28:34 +0200
In-Reply-To: <20260625192850.56004-4-krzysztof.niemiec@intel.com>
References: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
 <20260625192850.56004-4-krzysztof.niemiec@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
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

On Thu, 2026-06-25 at 21:28 +0200, Krzysztof Niemiec wrote:
> The DRM buddy allocator has been moved one level up, and is now renamed
> to just the GPU buddy allocator. This means that the .ko object used to
> run the KUnit test has been renamed, so IGT tries to run a test that
> doesn't exist anymore.
>=20
> Rename the drm_buddy.c file to gpu_buddy.c to reflect the kernel change,
> and update the igt_kunit() call to invoke the proper tests.
>=20
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  tests/{drm_buddy.c =3D> gpu_buddy.c} | 4 ++--
>  tests/meson.build                  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename tests/{drm_buddy.c =3D> gpu_buddy.c} (51%)
>=20
> diff --git a/tests/drm_buddy.c b/tests/gpu_buddy.c
> similarity index 51%
> rename from tests/drm_buddy.c
> rename to tests/gpu_buddy.c
> index dbc7c957d..4cea2e124 100644
> --- a/tests/drm_buddy.c
> +++ b/tests/gpu_buddy.c
> @@ -6,9 +6,9 @@
>  #include "igt.h"
>  #include "igt_kmod.h"
> =20
> -IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struc=
t drm_buddy)");
> +IGT_TEST_DESCRIPTION("Basic sanity check of the GPU buddy allocator (str=
uct gpu_buddy)");
> =20
>  int igt_main()
>  {
> -	igt_kunit("drm_buddy_test", NULL, NULL);
> +	igt_kunit("gpu_buddy_tests", NULL, NULL);
>  }
> diff --git a/tests/meson.build b/tests/meson.build
> index 4c1a39e9e..0d9008bbd 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -12,11 +12,11 @@ test_progs =3D [
>  	'dmabuf_sync_file',
>  	'device_reset',
>  	'dumb_buffer',
> -	'drm_buddy',
>  	'drm_mm',
>  	'drm_read',
>  	'drm_virtgpu',
>  	'fbdev',
> +	'gpu_buddy',
>  	'kms_3d',
>  	'kms_addfb_basic',
>  	'kms_async_flips',
