Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D500E10E2A3
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 13:25:56 +0000 (UTC)
Date: Mon, 19 Dec 2022 14:25:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y6BmYJY/XKUoxwkE@kamilkon-desk1>
References: <20221219115834.55838-1-zbigniew.kempczynski@intel.com>
 <20221219115834.55838-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221219115834.55838-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/gem_exec_whisper: Fix
 offsets handling and separate allocators
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-12-19 at 12:58:34 +0100, Zbigniew Kempczyński wrote:
> For multiprocess scenarios where drm fds are reopened new contexts
> created will have same ctx id. Since reloc allocator started
> tracking allocations we have ensure it will be opened on separate
> <fd, ctx> pair. Previously reloc simply incremented offsets (even in
> multiprocess scenarios) so there were no risk to reuse/rebind offsets
> from another process. Also fix bug in offset release - put_offset()
> should contain handle, not offset.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_exec_whisper.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> index c3fc5ba804..616231aa96 100644
> --- a/tests/i915/gem_exec_whisper.c
> +++ b/tests/i915/gem_exec_whisper.c
> @@ -106,10 +106,10 @@ static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
>  	if (gem_has_contexts(fd)) {
>  		h->ctx = intel_ctx_create(h->fd, cfg);
>  		h->execbuf.rsvd1 = h->ctx->id;
> -		h->ahnd = get_reloc_ahnd(fd, h->ctx->id);
> +		h->ahnd = get_reloc_ahnd(h->fd, h->ctx->id);
>  	} else {
>  		h->ctx = NULL;
> -		h->ahnd = get_reloc_ahnd(fd, 0);
> +		h->ahnd = get_reloc_ahnd(h->fd, 0);
>  	}
>  
>  	memset(&h->execbuf, 0, sizeof(h->execbuf));
> @@ -174,7 +174,8 @@ static void submit_hang(struct hang *h, unsigned *engines, int nengine, unsigned
>  
>  static void fini_hang(struct hang *h)
>  {
> -	put_offset(h->ahnd, h->bb_offset);
> +	gem_close(h->fd, h->obj.handle);
> +	put_offset(h->ahnd, h->obj.handle);
>  	put_ahnd(h->ahnd);
>  	intel_ctx_destroy(h->fd, h->ctx);
>  	close(h->fd);
> -- 
> 2.34.1
> 
