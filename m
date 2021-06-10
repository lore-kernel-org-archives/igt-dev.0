Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0FD6E364
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 14:29:10 +0000 (UTC)
Date: Thu, 10 Jun 2021 16:29:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210610142904.GO3926@zkempczy-mobl2>
References: <20210609173632.248880-1-jason@jlekstrand.net>
 <20210609173632.248880-36-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609173632.248880-36-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 35/93] tests/prime_vgem: Convert to
 intel_ctx_t
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 12:36:18PM -0500, Jason Ekstrand wrote:
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  tests/prime_vgem.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index aeff282b..3023fd68 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -559,7 +559,7 @@ static bool prime_busy(int fd, bool excl)
>  	return poll(&pfd, 1, 0) == 0;
>  }
>  
> -static void work(int i915, int dmabuf, unsigned ring)
> +static void work(int i915, int dmabuf, const intel_ctx_t *ctx, unsigned ring)
>  {
>  	const int SCRATCH = 0;
>  	const int BATCH = 1;
> @@ -578,6 +578,7 @@ static void work(int i915, int dmabuf, unsigned ring)
>  	execbuf.flags = ring;
>  	if (gen < 6)
>  		execbuf.flags |= I915_EXEC_SECURE;
> +	execbuf.rsvd1 = ctx->id;

Likely:

execbuf.rsvd1 = ctx ? ctx->id : 0;  //see below

>  
>  	memset(obj, 0, sizeof(obj));
>  	obj[SCRATCH].handle = prime_fd_to_handle(i915, dmabuf);
> @@ -654,7 +655,7 @@ static void work(int i915, int dmabuf, unsigned ring)
>  	igt_assert(read_busy && write_busy);
>  }
>  
> -static void test_busy(int i915, int vgem, unsigned ring)
> +static void test_busy(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
>  {
>  	struct vgem_bo scratch;
>  	struct timespec tv;
> @@ -668,7 +669,7 @@ static void test_busy(int i915, int vgem, unsigned ring)
>  	vgem_create(vgem, &scratch);
>  	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
>  
> -	work(i915, dmabuf, ring);
> +	work(i915, dmabuf, ctx, ring);
>  
>  	/* Calling busy in a loop should be enough to flush the rendering */
>  	memset(&tv, 0, sizeof(tv));
> @@ -684,7 +685,7 @@ static void test_busy(int i915, int vgem, unsigned ring)
>  	close(dmabuf);
>  }
>  
> -static void test_wait(int i915, int vgem, unsigned ring)
> +static void test_wait(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
>  {
>  	struct vgem_bo scratch;
>  	struct pollfd pfd;
> @@ -697,7 +698,7 @@ static void test_wait(int i915, int vgem, unsigned ring)
>  	vgem_create(vgem, &scratch);
>  	pfd.fd = prime_handle_to_fd(vgem, scratch.handle);
>  
> -	work(i915, pfd.fd, ring);
> +	work(i915, pfd.fd, ctx, ring);
>  
>  	pfd.events = POLLIN;
>  	igt_assert_eq(poll(&pfd, 1, 10000), 1);
> @@ -711,7 +712,7 @@ static void test_wait(int i915, int vgem, unsigned ring)
>  	close(pfd.fd);
>  }
>  
> -static void test_sync(int i915, int vgem, unsigned ring)
> +static void test_sync(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
>  {
>  	struct vgem_bo scratch;
>  	uint32_t *ptr;
> @@ -728,7 +729,7 @@ static void test_sync(int i915, int vgem, unsigned ring)
>  	igt_assert(ptr != MAP_FAILED);
>  	gem_close(vgem, scratch.handle);
>  
> -	work(i915, dmabuf, ring);
> +	work(i915, dmabuf, ctx, ring);
>  
>  	prime_sync_start(dmabuf, false);
>  	for (i = 0; i < 1024; i++)
> @@ -739,7 +740,7 @@ static void test_sync(int i915, int vgem, unsigned ring)
>  	munmap(ptr, scratch.size);
>  }
>  
> -static void test_fence_wait(int i915, int vgem, unsigned ring)
> +static void test_fence_wait(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
>  {
>  	struct vgem_bo scratch;
>  	uint32_t fence;
> @@ -760,7 +761,7 @@ static void test_fence_wait(int i915, int vgem, unsigned ring)
>  	igt_assert(ptr != MAP_FAILED);
>  
>  	igt_fork(child, 1)
> -		work(i915, dmabuf, ring);
> +		work(i915, dmabuf, ctx, ring);
>  
>  	sleep(1);
>  
> @@ -800,7 +801,7 @@ static void test_fence_hang(int i915, int vgem, unsigned flags)
>  	igt_assert(ptr != MAP_FAILED);
>  	gem_close(vgem, scratch.handle);
>  
> -	work(i915, dmabuf, 0);
> +	work(i915, dmabuf, 0, 0);

Passing NULL ctx without above change will lead to catastrophic result. 

--
Zbigniew

>  
>  	/* The work should have been cancelled */
>  
> @@ -1042,12 +1043,15 @@ static void test_flip(int i915, int vgem, unsigned hang)
>  }
>  
>  static void test_each_engine(const char *name, int vgem, int i915,
> -			     void (*fn)(int i915, int vgem, unsigned int flags))
> +			     void (*fn)(int i915, int vgem,
> +					const intel_ctx_t *ctx,
> +					unsigned int flags))
>  {
>  	const struct intel_execution_engine2 *e;
> +	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
>  
>  	igt_subtest_with_dynamic(name) {
> -		__for_each_physical_engine(i915, e) {
> +		for_each_ctx_engine(i915, ctx, e) {
>  			if (!gem_class_can_store_dword(i915, e->class))
>  				continue;
>  
> @@ -1056,10 +1060,12 @@ static void test_each_engine(const char *name, int vgem, int i915,
>  
>  			igt_dynamic_f("%s", e->name) {
>  				gem_quiescent_gpu(i915);
> -				fn(i915, vgem, e->flags);
> +				fn(i915, vgem, ctx, e->flags);
>  			}
>  		}
>  	}
> +
> +	intel_ctx_destroy(i915, ctx);
>  }
>  
>  igt_main
> @@ -1110,7 +1116,8 @@ igt_main
>  	{
>  		static const struct {
>  			const char *name;
> -			void (*fn)(int i915, int vgem, unsigned int engine);
> +			void (*fn)(int i915, int vgem, const intel_ctx_t *ctx,
> +				   unsigned int engine);
>  		} tests[] = {
>  			{ "sync", test_sync },
>  			{ "busy", test_busy },
> -- 
> 2.31.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
