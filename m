Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875E910E1E4
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 10:46:36 +0000 (UTC)
Date: Thu, 5 Oct 2023 12:46:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231005104631.ecmrkjpnup72hhz3@kamilkon-desk.igk.intel.com>
References: <20231002104846.21443-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231002104846.21443-1-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/gem_eio: Skip stress test
 on BCS0 for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,
On 2023-10-02 at 12:48:46 +0200, Nirmoy Das wrote:
> We do GGTT update on MTL using bcs engine, blocking that would
> fail the test so skip such subtests on bcs engine for MTL.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/gem_eio.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index 6d4b8f7df..99891ad15 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -1111,8 +1111,16 @@ static void test_reset_stress(int fd, unsigned int flags)
>  	const intel_ctx_t *ctx0 = context_create_safe(fd);
>  	uint64_t ahnd = get_reloc_ahnd(fd, ctx0->id);
>  
> -	for_each_ring(e, fd)
> +	for_each_ring(e, fd) {
> +		struct intel_execution_engine2 engine;
> +
> +		engine = gem_eb_flags_to_engine(eb_ring(e));
> +
> +		if (gem_engine_can_block_ggtt_binder(fd, &engine))
> +			continue;
> +
>  		reset_stress(fd, ahnd, ctx0, e->name, eb_ring(e), flags);
> +	}
>  
>  	intel_ctx_destroy(fd, ctx0);
>  	put_ahnd(ahnd);
> -- 
> 2.41.0
> 
