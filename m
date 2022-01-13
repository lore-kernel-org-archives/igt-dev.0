Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 13 Jan 2022 13:06:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220113210617.GA31450@jons-linux-dev-box>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
 <20220113195947.1536897-13-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113195947.1536897-13-John.C.Harrison@Intel.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH v3 i-g-t 12/15]
 tests/i915/gem_exec_fence: Configure correct context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 11:59:44AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The update to use intel_ctx_t missed a line that configures the
> context to allow hanging. Fix that.
> 
> Fixes: 09c36188b23f83ef9a7b5414e2a10100adc4291f

Typically I thought the Fixes comment was the sha from "git log
--oneline" + first line of commit message from that surrounded by ("").

So:
Fixes: <small sha> ("<message>")

With that fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/i915/gem_exec_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index 196236b27..5e45d0518 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -3139,7 +3139,7 @@ igt_main
>  			igt_hang_t hang;
>  
>  			igt_fixture {
> -				hang = igt_allow_hang(i915, 0, 0);
> +				hang = igt_allow_hang(i915, ctx->id, 0);
>  				intel_allocator_multiprocess_start();
>  			}
>  
> -- 
> 2.25.1
> 
