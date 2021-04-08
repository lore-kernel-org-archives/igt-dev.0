Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207766E1E0
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 20:06:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a12so3366909wrq.13
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Apr 2021 13:06:05 -0700 (PDT)
Date: Thu, 8 Apr 2021 22:06:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YG9iKsPfNIbtSjcn@phenom.ffwll.local>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
 <20210401021243.4147604-5-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401021243.4147604-5-jason@jlekstrand.net>
Subject: Re: [igt-dev] [RFC 04/30] tests/i915/gem_exec_basic: Convert to
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

On Wed, Mar 31, 2021 at 09:12:17PM -0500, Jason Ekstrand wrote:
> This acts as a template for the rest of this patch series.  The rough
> idea is that we create a new context if the HW supports contexts and
> otherwise we use intel_ctx_0().  Once we have an intel_ctx_t, we can
> iterate over all of the engines in it in a consistent way.
> ---
>  tests/i915/gem_exec_basic.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 31f6a234..f50e4c3b 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -41,10 +41,17 @@ static uint32_t batch_create(int fd)
>  igt_main
>  {
>  	const struct intel_execution_engine2 *e;
> +	const intel_ctx_t *ctx = NULL;
>  	int fd = -1;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_INTEL);
> +
> +		if (gem_has_contexts(fd))
> +			ctx = intel_ctx_create_all_physical(fd);
> +		else
> +			ctx = intel_ctx_0(fd);

Can't we push this into the helper, at least by default?


> +
>  		/* igt_require_gem(fd); // test is mandatory */
>  		igt_fork_hang_detector(fd);
>  	}
> @@ -54,12 +61,13 @@ igt_main
>  			.handle = batch_create(fd),
>  		};
>  
> -		__for_each_physical_engine(fd, e) {
> +		for_each_ctx_engine(fd, ctx, e) {

Since we change them all anyway, what about also moving the engine index
into your ctx iterator?

And then explaining with some nice pseudocode the canonical example of how
to do a testcase over all physical engines on the box with ctx autocreate
and stuff. I think that's the main use case for this magic, and it would
give us a fairly clean interface.
-Daniel


>  			igt_dynamic_f("%s", e->name) {
>  				struct drm_i915_gem_execbuffer2 execbuf = {
>  					.buffers_ptr = to_user_pointer(&exec),
>  					.buffer_count = 1,
>  					.flags = e->flags,
> +					.rsvd1 = ctx->id,
>  				};
>  
>  				gem_execbuf(fd, &execbuf);
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
