Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <1d7ed3c3-5cc9-88c0-83a5-4a8884631425@linux.intel.com>
Date: Wed, 6 Jul 2022 08:56:37 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20220705104945.118962-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220705104945.118962-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_exec_capture: adjust the pi
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 7/5/2022 12:49 PM, Matthew Auld wrote:
> This was broken by the kernel change: 71b1669ea9bd ("drm/i915/uapi:
> tweak error capture on recoverable contexts"). Update the test to use
> non-recoverable context if needed.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6350
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   tests/i915/gem_exec_capture.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index c2639082..a25f529b 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -721,6 +721,15 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
>   
>   		ctx2 = intel_ctx_create_all_physical(fd);
>   		igt_assert(ctx2);
> +		if (needs_recoverable_ctx(fd)) {
> +			struct drm_i915_gem_context_param param = {
> +				.ctx_id = ctx2->id,
> +				.param = I915_CONTEXT_PARAM_RECOVERABLE,
> +				.value = 0,
> +			};
> +
> +			gem_context_set_param(fd, &param);
> +		}
>   
>   		intel_allocator_init();
>   		/* Reopen the allocator in the new process. */
