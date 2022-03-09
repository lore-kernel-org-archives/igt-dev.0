Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7E610E392
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 17:15:07 +0000 (UTC)
Date: Wed, 9 Mar 2022 18:08:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YijfKCADll+2Q2jp@kamilkon-DESK1>
References: <20220308144914.29185-1-anshuman.gupta@intel.com>
 <20220308144914.29185-2-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220308144914.29185-2-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] i915/gem_eio: Exercise object
 creation while wedged
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: CQ Tang <cq.tang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

Dnia 2022-03-08 at 20:19:13 +0530, Anshuman Gupta napisał(a):
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Make sure that we can continue to create buffers, primarily to service as
> frameuffers for scanout, even while the device is wedged.
-------^
framebuffers

> 
> v2:
> - Deleted gem_memory_topology.[ch] and moved it's content
>   to intel_memory_region.[ch]. [Ashutosh]
> - Fixed checkpatch.pl wanring.
> 
> Cc: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  lib/i915/intel_memory_region.c | 51 ++++++++++++++++++++++++++++++++++
>  lib/i915/intel_memory_region.h | 14 ++++++++++
>  tests/i915/gem_eio.c           | 39 ++++++++++++++++++++++++++
>  3 files changed, 104 insertions(+)
> 

<cut>

>  static void test_context_create(int fd)
>  {
>  	uint32_t ctx;
> @@ -997,6 +1030,12 @@ igt_main
>  	igt_subtest("throttle")
>  		test_throttle(fd);
>  

Please add description before test with igt_describe().

> +	igt_subtest("create")
> +		test_create(fd);
> +

Same here.

> +	igt_subtest("create-ext")
> +		test_create_ext(fd);
> +
>  	igt_subtest("context-create")
>  		test_context_create(fd);
>  
> -- 
> 2.26.2
>
Regards,
Kamil
 
