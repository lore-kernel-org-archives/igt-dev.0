Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 13 Jan 2022 12:00:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220113200050.GA12059@jons-linux-dev-box>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
 <20220113195947.1536897-7-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113195947.1536897-7-John.C.Harrison@Intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH v3 i-g-t 06/15]
 tests/i915/i915_hangman: Use the correct context in hangcheck_unterminated
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 11:59:38AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The hangman framework sets up a context that is valid for all engines
> and has things like banning disabled. The 'unterminated' test then
> ignores it and uses the default context. Fix that.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/i915/i915_hangman.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index 354769f39..6656b3fcd 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -347,6 +347,7 @@ static void hangcheck_unterminated(const intel_ctx_t *ctx)
>  	memset(&execbuf, 0, sizeof(execbuf));
>  	execbuf.buffers_ptr = (uintptr_t)&gem_exec;
>  	execbuf.buffer_count = 1;
> +	execbuf.rsvd1 = ctx->id;
>  
>  	gem_execbuf(device, &execbuf);
>  	if (gem_wait(device, handle, &timeout_ns) != 0) {
> -- 
> 2.25.1
> 
