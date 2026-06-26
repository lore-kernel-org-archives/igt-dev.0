Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E781BCDE008
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jun 2026 09:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844F510F4BF;
	Fri, 26 Jun 2026 09:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgnQAjmz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B609210E347
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782465442; x=1814001442;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AsTE4UsLXPGekRHUVKooTqYAdIK7E7mobfXiKWyhRCo=;
 b=FgnQAjmzDPv8Rr5HMqReSfeAU9FmPNaAKV9MV+N3YcQpuM9tKK0Alnfr
 55OoJuAfttEeR32F0IJYKUMOdkIT9pdkLD1Lrixi+Pi5gnhQ2iP0Vqvrm
 q59PjoZzs56QEkZjm5xK/sZap0vnDp+VccnpN4TDkpgVauKpSW4mQatWT
 0LqbETk8fxqzwEFxl3YB2LcBKKKz8kWlmohMupnYhTLCPuqUToslD9D9I
 lsmhICr47hI78q6a71mCOW+gefAkCpru/e/wQ96TOXLHZkui/sgxlpSoN
 KezHtUD9Sqmu77FZ4iYsqmykDgbz5IHwQWnXWyVRJRWSFMyvuPZxC0w25 Q==;
X-CSE-ConnectionGUID: S3kanOLwRZ6+RgPbzhPGmQ==
X-CSE-MsgGUID: IkGmrsjAR/WBXL59tuH9xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="94743621"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="94743621"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:17:22 -0700
X-CSE-ConnectionGUID: s4jHRQYVQjCUDCziPTdMPQ==
X-CSE-MsgGUID: I3Xj9ctwQQ2SiEhQ9HTcYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="289380254"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:17:21 -0700
Message-ID: <0d62d104e73668fcb972a39b86b0879968f43e05.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/dmabuf: Port dmabuf tests to KUnit
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Kamil Konieczny	
 <kamil.konieczny@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>,  Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Date: Fri, 26 Jun 2026 11:17:18 +0200
In-Reply-To: <20260625192850.56004-3-krzysztof.niemiec@intel.com>
References: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
 <20260625192850.56004-3-krzysztof.niemiec@intel.com>
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
> The dmabuf tests have been moved out of the selftest mechanism into
> KUnit in these commits in the kernel:
>=20
> 126c50bc2fb6 dma-buf: Remove the old selftest
> 6055c9e333cf dma-buf: Change st-dma-fence-chain.c to use kunit
> 465f3934381c dma-buf: Change st-dma-fence-unwrap.c to use kunit
> 9baa35a39939 dma-buf: Change st-dma-fence.c to use kunit
> 15b9bde78bad dma-buf: Change st-dma-resv.c to use kunit
>=20
> Launch dmabuf tests as KUnit tests instead of selftests from IGT's side
> to reflect the kernel changes.
>=20
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  tests/dmabuf.c | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
>=20
> diff --git a/tests/dmabuf.c b/tests/dmabuf.c
> index 322981473..1baefb299 100644
> --- a/tests/dmabuf.c
> +++ b/tests/dmabuf.c
> @@ -25,7 +25,7 @@
>  #include "igt_kmod.h"
>  /**
>   * TEST: dmabuf
> - * Description: Kernel selftests for the dmabuf API
> + * Description: KUnit tests for the dmabuf API
>   * Category: Core
>   * Mega feature: General Core features
>   * Functionality: drm_mm
> @@ -33,14 +33,16 @@
>   * Feature: mapping, prime
>   * Test category: GEM_Legacy
>   *
> - * SUBTEST: all-tests
> + * SUBTEST: dma-buf-resv
>   *
> - * SUBTEST: all-tests@dma_fence
> + * SUBTEST: dma-buf-fence
>   *
> - * SUBTEST: all-tests@sanitycheck
> + * SUBTEST: dma-buf-fence-unwrap
> + *
> + * SUBTEST: dma-buf-fence-chain
>   */
> =20
> -IGT_TEST_DESCRIPTION("Kernel selftests for the dmabuf API");
> +IGT_TEST_DESCRIPTION("KUnit tests for the dmabuf API");
> =20
>  static unsigned int bogomips(void)
>  {
> @@ -76,23 +78,24 @@ static unsigned int bogomips(void)
>  	return igt_debug_on(!bogomips) ? UINT_MAX : ret;
>  }
> =20
> -static int wrapper(const char *dynamic_name,
> -		   struct igt_ktest *tst,
> -		   struct igt_kselftest_list *tl)
> +int igt_main()
>  {
> +	igt_kunit("dmabuf_kunit", "dma-buf-resv", NULL);
> +	igt_kunit("dmabuf_kunit", "dma-buf-fence", NULL);
> +
>  	/*
> -	 * Test case wait-backward of dma_fence_chain selftest can trigger soft
> +	 * Test case wait-backward of dma_fence_chain test can trigger soft
>  	 * lockups on slow machines.  Since that slowness is not recognized as
>  	 * a bug on the kernel side, the issue is not going to be fixed.  Based
> -	 * on analysis of CI results, skip that selftest on machines slower tha=
n
> +	 * on analysis of CI results, skip that test on machines slower than
>  	 * 25000 BogoMIPS to avoid ever returning CI reports on that failure.
>  	 */
> -	igt_skip_on(!strcmp(dynamic_name, "dma_fence_chain") && bogomips() < 25=
000);
> =20
> -	return igt_kselftest_execute(tst, tl, NULL, NULL);
> -}
> +	if (bogomips() >=3D 25000)
> +		igt_kunit("dmabuf_kunit", "dma-buf-fence-chain", NULL);
> +	else
> +		igt_subtest("dma-buf-fence-chain")
> +			igt_skip("BogoMips < 25000 - test is not supported\n");
> =20
> -int igt_main()
> -{
> -	igt_kselftests("dmabuf_selftests", NULL, NULL, NULL, wrapper);
> +	igt_kunit("dmabuf_kunit", "dma-buf-fence-unwrap", NULL);
>  }
