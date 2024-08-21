Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406E8C52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F354B10E61A;
	Wed, 21 Aug 2024 14:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2HLvmup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEBD10E61D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724250180; x=1755786180;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cFgVlcPJc5dIvU0zyJ7vmMEEPjfULN7+0IvYa+8qCVE=;
 b=Y2HLvmupNGCbbjfz1+ArWeW4bLWJ3YqxIAWmKJfiQfF+z4X33DyPp9TP
 MGrf0SveaF4iDaiqGhA91De7e1vCZNrOOgO2MqHtd4hcnhW3tQJWjTOWa
 CpIoXJp4m8WlGLEqO32b0iGB5zYEr6dT/SxxZHZWvOTFyEmPHi7IxABlf
 Ha+Mic2+igXIHTc7Z41lwlpWnpj5PSjmUwKk2JD04C+ghgfEG6ZFkl5gn
 TC9nh+oURbwDSlvO6ggeAWGnN9nXe3DtwtbTu4sG3+c9mZHZKuvXsQb40
 QTSnpJuqsgvJU9lIOG2QBSNIgr8c6Zb4vQ9/9lvc+PqaV0vST9qVx+k7b g==;
X-CSE-ConnectionGUID: 55Dr+pCwQrC0m1gqdWx6PQ==
X-CSE-MsgGUID: 75SHatPDSc6IRxHofNNBuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40073315"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="40073315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:22:59 -0700
X-CSE-ConnectionGUID: NKPUU/+ISOOcRRMmzfN0tw==
X-CSE-MsgGUID: KpUEKyoDRp24ibHiYbXy3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61242250"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:22:56 -0700
Date: Wed, 21 Aug 2024 16:22:52 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel/gem_mmap_offset: Introduce
 mmap-boundaries test
Message-ID: <ZsX4PDQockKH0q3A@ashyti-mobl2.lan>
References: <20240821135943.31340-1-krzysztof.niemiec@intel.com>
 <20240821135943.31340-3-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821135943.31340-3-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,

few nitpicks.

On Wed, Aug 21, 2024 at 03:59:42PM +0200, Krzysztof Niemiec wrote:
> Introduce the mmap-boundaries test, which checks if mmap() correctly
> calculates memory boundaries during the mapping.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/intel/gem_mmap_offset.c | 37 +++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
> index 80ac8dc01..73adaaa98 100644
> --- a/tests/intel/gem_mmap_offset.c
> +++ b/tests/intel/gem_mmap_offset.c
> @@ -63,6 +63,7 @@
>   * SUBTEST: perf
>   * SUBTEST: pf-nonblock
>   * SUBTEST: ptrace
> + * SUBTEST: mmap-boundaries

I think these are sorted alphabetically.

>   *
>   */
>  
> @@ -989,6 +990,34 @@ static void partial_remap(int i915, struct gem_memory_region *r)
>  	gem_close(i915, handle);
>  }
>  
> +/* This test's failure is detected by checking the dmesg. */
> +

please remove this blank line.

> +static void test_mmap_boundaries(int i915, struct gem_memory_region *r)
> +{
> +	const uint64_t map_size = SZ_128M - SZ_512K;
> +	uint32_t handle;
> +
> +	handle = gem_create_in_memory_region_list(i915, SZ_2G, 0, &r->ci, 1);
> +	make_resident(i915, 0, handle);
> +
> +	for_each_mmap_offset_type(i915, t) {
> +		uint8_t *map;
> +
> +		map = __mmap_offset(i915, handle, 0, map_size,
> +				    PROT_READ | PROT_WRITE, t->type);
> +

Please, remove this blank line.

Rest is good. With the above:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi


> +		if (!map)
> +			continue;
> +
> +		memset(map + map_size - SZ_1K, 0xab, SZ_1K);
> +		for (uint64_t i = 0; i < SZ_1K; i++)
> +			igt_assert_eq(map[map_size - SZ_1K + i], 0xab);
> +
> +		munmap(map, map_size);
> +	}
> +	gem_close(i915, handle);
> +}
> +
>  static int mmap_gtt_version(int i915)
>  {
>  	int gtt_version = -1;
> @@ -1082,6 +1111,14 @@ igt_main
>  	igt_subtest_f("blt-coherency")
>  		blt_coherency(i915);
>  
> +	igt_describe("Check for proper boundary calculation during mmap");
> +	igt_subtest_with_dynamic("mmap-boundaries") {
> +		for_each_memory_region(r, i915) {
> +			igt_dynamic_f("%s", r->name)
> +				test_mmap_boundaries(i915, r);
> +		}
> +	}
> +
>  	igt_fixture {
>  		drm_close_driver(i915);
>  	}
> -- 
> 2.45.2
