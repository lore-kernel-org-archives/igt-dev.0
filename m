Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200702123908.227124-1-chris@chris-wilson.co.uk>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <bd9a8aa0-d162-54c0-a116-f02e8711ae8e@intel.com>
Date: Thu, 2 Jul 2020 16:05:08 +0300
MIME-Version: 1.0
In-Reply-To: <20200702123908.227124-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Instantiate a local drm_fd
 for the unprivileged helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Could be a particularly slow PIPE_CONTROL instruction on TGL.
We assumed that in a sequence of instructions : PC0, MI_RPC0, PC1, MI_RPC1

The delta of time PC1 - PC0 would be with 500ns of MI_RPC1 - MI_RPC0.
That does sound a bit broken tbf...

Patch looks good :

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Thanks,

-Lionel

On 02/07/2020 15:39, Chris Wilson wrote:
> While the test is blocked, we keep trying the gen12_single_ctx_helper().
> As this is using the parent's drm_fd, all of our context allocations are
> persistent. Reopen the device in the child so that when we exit, our
> allocations are freed along with the process -- avoiding a total memory
> leak if the test is stuck.
>
> This does not explain why the test was stuck, it just prevents us from
> exacerbating the error condition. Hopefully leaving the system in a more
> debuggable state.
>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/2126
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   tests/i915/perf.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index d4ebae30d..dbf7e3497 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -3845,6 +3845,7 @@ static void gen12_single_ctx_helper(void)
>   		.format = test_set->perf_oa_format
>   	};
>   
> +	drm_fd = gem_reopen_driver(drm_fd);
>   	bufmgr = drm_intel_bufmgr_gem_init(drm_fd, 4096);
>   	drm_intel_bufmgr_gem_enable_reuse(bufmgr);
>   
> @@ -4107,6 +4108,7 @@ static void gen12_single_ctx_helper(void)
>   	drm_intel_gem_context_destroy(context1);
>   	drm_intel_bufmgr_destroy(bufmgr);
>   	__perf_close(stream_fd);
> +	close(drm_fd);
>   }
>   
>   static void


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
