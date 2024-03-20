Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C58C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 19:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C94010FF2C;
	Wed, 20 Mar 2024 19:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNWQXwC7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683AD10FF30
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 19:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710964242; x=1742500242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eAQlQSNNLdF2HJewa/KUhtgY6r+KGT1gnriOA7QjYCI=;
 b=dNWQXwC7d7l/k2ottcb1mNF5D25Xnw0Q4YZK8LH9etiwdlkkda9tv29f
 VY8nhi7XVOR8v1ACYj3sUIPr79z61sOMBvXWhNxZedA8wsPJ2nAY6q0+s
 vYKwSCa7YH5LNa+/Vq/4vZXZ/3RYK3vZnAokMFFUv0ldVIDEJ+Y50KvWG
 XUOJrVC7kdxJU8PIf8+F+c5bJlD7kekgA+nfZLu3ZcOy0XnURfymjSSEY
 grl3T/6G2N5+Ljjcq/QEZFq2RFMoEAKZmIz1uLklwc01zDdN2SbFqmbHz
 4/0igHws9qLmc4oinoPoEonjCngCeDefCnqP7WqOXJ310HQwBnc8hUZyz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="23372091"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="23372091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14164501"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.7.80])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:50:40 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t v14 5/5] tests/intel/gem_exec_gttfill: simplify
 multiGPU subtest
Date: Wed, 20 Mar 2024 20:50:36 +0100
Message-ID: <5829781.peFUeoqG7q@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240320155659.33518-6-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
 <20240320155659.33518-6-kamil.konieczny@linux.intel.com>
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

On Wednesday, 20 March 2024 16:56:59 CET Kamil Konieczny wrote:
> Simplify multi-GPU subtest with the help of new multigpu library.
>=20
> v10: remove igt_require_multigpu() as it checks filters but we
>   want to use legacy opens (Kamil), correct Cc name (Zbigniew)
> v14: add missing igt_require_gem() in multigpu-basic (Janusz)
>=20
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Cc: "Dominik Karol Pi=C4=85tkowski" <dominik.karol.piatkowski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_exec_gttfill.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfil=
l.c
> index b1063437b..d79a6ffd5 100644
> --- a/tests/intel/gem_exec_gttfill.c
> +++ b/tests/intel/gem_exec_gttfill.c
> @@ -24,8 +24,8 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> -#include "igt_device_scan.h"
>  #include "igt_rand.h"
> +#include "igt_multigpu.h"

NIT: Don't we want to follow alphabetic ordering of headers?

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
> @@ -285,17 +285,12 @@ igt_main
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
> +			igt_require_gem(g_fd);

NIT: Not needed -- as you stated, it is already called, for any subtest, fr=
om=20
initial igt_fixture section.

Anyway,
Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

>  			ctx =3D intel_ctx_create_all_physical(g_fd);
>  			igt_fork_hang_detector(g_fd);
>  			// subtest
> @@ -303,7 +298,6 @@ igt_main
>  			// release resources
>  			igt_stop_hang_detector();
>  			intel_ctx_destroy(g_fd, ctx);
> -			drm_close_driver(g_fd);
>  		}
> =20
>  		igt_waitchildren();
>=20




