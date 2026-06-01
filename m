Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9D5CD6E56
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 12:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D935E10E793;
	Mon,  1 Jun 2026 12:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fm+u8Sfq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089BF10E786
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780316114; x=1811852114;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XzEN1fvcXL6PkIhxYOvzh8OkqYksxkZ9r+W+AUQkUo8=;
 b=fm+u8SfqWyxk6fdto4SRJJT+tCWwuJIo05XOhD0FkMLTjxcBaIFWMVlS
 /785oReaAKkWJVyXBgX/RZ3eO6Ou6jRXZPXoSuzbWbcBgrV76+rLVSOnf
 mdWr5tLFCuFQ9C+wmPn0x+SdXMTrcRK58scfAL6bo9X4zhCl01KSuD7UY
 DSD/jxphGtdozqP9n2VEwbM78gz1ceF0wUT++VhLQk06V85AQE+r0VaV5
 OSwP5cK3ZvKrh52iEcf5S0PxJ0BwYaTlNrPC8Xiv6ZyJ/BBvZev7pjG6t
 r+1h0R6NGUpM0RStH/pe398XdzDvvwf+h9pIBPU/cmVZI/e6CEf1uymur Q==;
X-CSE-ConnectionGUID: RD+cmGpmTgG3+2U6ILuh4g==
X-CSE-MsgGUID: eboAMPQxRn2z/OKeKGqoCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="103741338"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="103741338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:15:13 -0700
X-CSE-ConnectionGUID: abjKDJtHQQChzKBpXzOMsQ==
X-CSE-MsgGUID: TQxftoJsQJaFy9LUQgVZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="245387425"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.103])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:15:12 -0700
Message-ID: <2665dd14e1341812cbef2c140e84cb0ddc514724.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel: Add current IGT PID to driver options
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Sebastian Brzezinka	
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Date: Mon, 01 Jun 2026 14:15:09 +0200
In-Reply-To: <20260528055957.2876648-1-krzysztof.karas@intel.com>
References: <20260528055957.2876648-1-krzysztof.karas@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
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

On Thu, 2026-05-28 at 05:59 +0000, Krzysztof Karas wrote:
> i915 mmap selftests lack trusted address space in userspace,
> so use a driver parameter to pass IGT process's PID to borrow
> memory from for mapping. This will help to restore test
> coverage, which was temporarily limited when following series
> on kernel side was merged:
> e8c3344765aa ("drm/i915/selftests: Prevent userspace mapping invalidation=
")
> 82eb94b1fa13 ("drm/i915/selftests: Run vma tests only if current->mm is p=
resent")
>=20
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>


> ---
>  tests/intel/i915_selftest.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index 6972de64c..1a8385883 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -649,8 +649,8 @@ int igt_main()
>  	igt_kselftests("i915", opts, NULL, "mock", NULL);
> =20
>  	igt_assert(snprintf(opts, sizeof(opts),
> -			    "live_selftests=3D-1 disable_display=3D1 st_filter=3D%s",
> -			    env) < sizeof(opts));
> +			    "live_selftests=3D-1 disable_display=3D1 st_filter=3D%s st_usersp=
ace_pid=3D%d",
> +			    env, getpid()) < sizeof(opts));
>  	igt_kselftests("i915", opts, "live_selftests", "live", NULL);
> =20
>  	igt_assert(snprintf(opts, sizeof(opts),
