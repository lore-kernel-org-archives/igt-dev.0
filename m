Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEFC89CAD
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 15:00:59 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id go30so8107751ejc.8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 08:00:59 -0700 (PDT)
Date: Mon, 12 Jul 2021 17:00:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YOxZJxlJnx8erM7R@phenom.ffwll.local>
References: <20210711035204.802908-1-jason@jlekstrand.net>
 <20210711035204.802908-7-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210711035204.802908-7-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] tests/i915/gem_exec_reloc: Don't
 attempt active relocations with the command parser
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

On Sat, Jul 10, 2021 at 10:52:04PM -0500, Jason Ekstrand wrote:
> The command parser stalls waiting for the batch to be idle.  If it's
> blocked by a spinner, execbuf will timeout.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

I think we should just ditch these tests as invalid. Can you pick the
right set of reverts from my series and just push them?

https://patchwork.freedesktop.org/series/91160/

Cheers, Daniel

> ---
>  tests/i915/gem_exec_reloc.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> index d54473341..0c2f389ea 100644
> --- a/tests/i915/gem_exec_reloc.c
> +++ b/tests/i915/gem_exec_reloc.c
> @@ -415,6 +415,11 @@ static void many_active(int i915, const intel_ctx_t *ctx, unsigned engine)
>  	const uint64_t max = 2048;
>  	unsigned long count = 256;
>  
> +	/* Relocating in an active batch buffer doesn't work with the
> +	 * command parser
> +	 */
> +	igt_require(!gem_engine_has_cmdparser(i915, &ctx->cfg, engine));
> +
>  	igt_until_timeout(2) {
>  		uint64_t required, total;
>  
> @@ -488,6 +493,11 @@ static void wide_active(int i915, const intel_ctx_t *ctx, unsigned engine)
>  	const uint64_t max = gem_aperture_size(i915) / 4096 / 2;
>  	unsigned long count = 256;
>  
> +	/* Relocating in an active batch buffer doesn't work with the
> +	 * command parser
> +	 */
> +	igt_require(!gem_engine_has_cmdparser(i915, &ctx->cfg, engine));
> +
>  	igt_until_timeout(2) {
>  		uint64_t required, total;
>  
> @@ -517,6 +527,11 @@ static void active_spin(int fd, const intel_ctx_t *ctx, unsigned engine)
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	igt_spin_t *spin;
>  
> +	/* Relocating in an active batch buffer doesn't work with the
> +	 * command parser
> +	 */
> +	igt_require(!gem_engine_has_cmdparser(fd, &ctx->cfg, engine));
> +
>  	spin = igt_spin_new(fd,
>  			    .ctx = ctx,
>  			    .engine = engine,
> -- 
> 2.31.1
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
