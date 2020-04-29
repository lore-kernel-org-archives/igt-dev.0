Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20200429145113.588577-1-chris@chris-wilson.co.uk>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <c989a6dc-152c-7a6f-5ca4-7732c5f66c61@intel.com>
Date: Wed, 29 Apr 2020 17:57:41 +0300
MIME-Version: 1.0
In-Reply-To: <20200429145113.588577-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t] perf: Flush the work between rounds
 of gen8-unprivileged-single-ctx-counter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Oh... Is that on a low end platform?

Looks alright :

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Thanks,

-Lionel

On 29/04/2020 17:51, Chris Wilson wrote:
> Wait until the GPU is idle before starting a fresh round of probing
> gen8-unprivileged-single-ctx-counter. This avoids building up a huge
> backlog of render copies, hogging buffers and stale contexts, and
> invoking the oomkiller.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   tests/perf.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/perf.c b/tests/perf.c
> index 74fc8fd87..2d23a02c6 100644
> --- a/tests/perf.c
> +++ b/tests/perf.c
> @@ -3787,6 +3787,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
>   			drm_intel_gem_context_destroy(context1);
>   			drm_intel_bufmgr_destroy(bufmgr);
>   			__perf_close(stream_fd);
> +			gem_quiescent_gpu(drm_fd);
>   		}
>   
>   		child_ret = igt_wait_helper(&child);


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
