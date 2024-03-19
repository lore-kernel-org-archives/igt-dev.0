Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE6C54E60
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 09:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A70510F909;
	Tue, 19 Mar 2024 09:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWGkcTd5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F8E10F2B6
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710841014; x=1742377014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B4IXsfKcfC/gcqgpFa2m7tqCnUESz3LicgvWe7kidrY=;
 b=PWGkcTd58YaRZMjUNULYFZVeN84g0dQ7kKvid85JHa3zlTSrNBrLNIp9
 cTiF7J94NO75AzdCkgTigfAPbfRBjwMcbEI4/cwmPUiWG/6GhJZuk8K4u
 QC+zZTNddsPKrtOHPwEnKa3XjE94PiXhuyc70S0VGlCx+TeUCzAhkn200
 t5v4DBYhvMMXDLjP3L0TLkpJ6XhO6yd2B79Lch+JS6JKz34/fBCZfR76B
 9xt5LPvJH9CupQm2nWScsOAVgrCSXkLSRW9m2B1zMeFY+fvfmyBQLfWM0
 t4d8jssoVKSeyUW7qRPag7U0wdoO3LOp9eQc04q7oHcCRQfv2RsQm27DK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5628043"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5628043"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="36889717"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.7.46])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:36:51 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t v13 5/5] tests/intel/gem_exec_gttfill: simplify
 multiGPU subtest
Date: Tue, 19 Mar 2024 10:36:49 +0100
Message-ID: <2212029.vXnMlVU4IS@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240318132624.110746-6-kamil.konieczny@linux.intel.com>
References: <20240318132624.110746-1-kamil.konieczny@linux.intel.com>
 <20240318132624.110746-6-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Hi Kamil,

The series now looks good to me, however, I still have one doubt.

On Monday, 18 March 2024 14:26:23 CET Kamil Konieczny wrote:
> Simplify multi-GPU subtest with the help of new multigpu library.
>=20
> v10: remove igt_require_multigpu() as it checks filters but we
>   want to use legacy opens (Kamil), correct Cc name (Zbigniew)
>=20
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Cc: "Dominik Karol Pi=C4=85tkowski" <dominik.karol.piatkowski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_exec_gttfill.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfil=
l.c
> index b1063437b..1eb7325bb 100644
> --- a/tests/intel/gem_exec_gttfill.c
> +++ b/tests/intel/gem_exec_gttfill.c
> @@ -24,8 +24,8 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> -#include "igt_device_scan.h"
>  #include "igt_rand.h"
> +#include "igt_multigpu.h"
>  /**
>   * TEST: gem exec gttfill
>   * Description: Fill the GTT with batches.
> @@ -251,7 +251,7 @@ igt_main
>  {
>  	const struct intel_execution_engine2 *e;
>  	const intel_ctx_t *ctx;
> -	int i915 =3D -1, gpu_count;
> +	int i915 =3D -1;
> =20
>  	igt_fixture {
>  		i915 =3D drm_open_driver(DRIVER_INTEL);
> @@ -285,17 +285,11 @@ igt_main
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(i915, ctx);
> -		// prepare multigpu tests
> -		gpu_count =3D igt_device_filter_count();
>  	}
> =20
>  	igt_subtest("multigpu-basic") { /* run on two or more discrete cards */
> -		igt_require(gpu_count > 1);
> -		igt_multi_fork(child, gpu_count) {
> -			int g_fd;
> +		igt_multi_fork_foreach_gpu(g_fd, gpu_idx, DRIVER_INTEL) {
>  			// prepare
> -			g_fd =3D __drm_open_driver_another(child, DRIVER_INTEL);
> -			igt_assert(g_fd >=3D 0);

Since igt_multi_fork_foreach_gpu() now calls multigpu_open_another() which=
=20
introduces igt_require_gem() into the processing path, you are effectively=
=20
changing prerequisites before calling intel_ctx_create_all_physical().  Two=
=20
questions arise:
1) Was that missing requirement for GEM on Intel intentional here, or was t=
hat=20
   a bug which you are now fixing while being at it?
2) Do we expect all future users of igt_multi_fork_foreach_gpu() to always=
=20
   require GEM on Intel?  If you think so then can you please explain why?

Wouldn't igt_multi_fork_foreach_gpu() be more versatile if it called=20
drm_open_driver_another() instead, without that skip on no GEM?  Wouldn't i=
t=20
be more clear if tests were explicitly taking care as needed of such scenar=
io=20
specific prerequisites?

If you still see benefits from using multigpu_open_another() here then coul=
d=20
we please plan for introducing two variants of igt_multi_fork_foreach_gpu()=
,=20
one that doesn't skip and the other that skips on no GEM, unless you are su=
re=20
we don't need the former?  Maybe the latter could be implemented as a wrapp=
er=20
around the former, while the opposite seems not doable.

Thanks,
Janusz

>  			ctx =3D intel_ctx_create_all_physical(g_fd);
>  			igt_fork_hang_detector(g_fd);
>  			// subtest
> @@ -303,7 +297,6 @@ igt_main
>  			// release resources
>  			igt_stop_hang_detector();
>  			intel_ctx_destroy(g_fd, ctx);
> -			drm_close_driver(g_fd);
>  		}
> =20
>  		igt_waitchildren();
>=20




