Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC2210E41D
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 15:05:26 +0000 (UTC)
Date: Tue, 9 Jan 2024 16:05:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/msm: Add parallel recovery test
Message-ID: <20240109150501.skdd7mrjvao377bv@kamilkon-desk.igk.intel.com>
References: <20240108215906.170647-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240108215906.170647-1-robdclark@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rob,
On 2024-01-08 at 13:59:06 -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add parallel recovery test to validate that the kernel does actually
> manage to recover the gpu and successfully run unrelated (not hanging)
> submits.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/msm/msm_recovery.c | 53 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
> index 05c89948bf9a..6088368660f4 100644
> --- a/tests/msm/msm_recovery.c
> +++ b/tests/msm/msm_recovery.c
> @@ -148,6 +148,49 @@ do_hang_test(struct msm_pipe *pipe)
>  	read_and_clear_devcore();
>  }
>  
> +/**
> + * SUBTEST: gpu-fault-parallel
> + *
> + * Description: does a bunch of submits in parallel threads, a subset of
> + * which trigger GPU hangs.  For the submits which do not trigger hangs,
> + * validate that they executed properly by checking that they were able
> + * to write to the scratch buffer, so that we can see that the kernel
> + * properly re-plays the non-faulting submits.
> + */
> +static void
> +do_parallel_test(struct msm_pipe *pipe, int child)
> +{
> +	struct msm_cmd *cmd = igt_msm_cmd_new(pipe, 0x1000);
> +	bool hang = child == 5;
> +	int fence_fd;
> +
> +	msm_cmd_pkt7(cmd, CP_NOP, 0);
> +
> +	if (hang) {
> +		msm_cmd_emit(cmd, 0xdeaddead);
> +	} else {
> +		/* Each forked thread writes/reads offset of child idx dwords: */
> +		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> +		msm_cmd_bo  (cmd, scratch_bo, child * 4); /* ADDR_LO/HI */
> +		msm_cmd_emit(cmd, child + 1);             /* VAL */
> +	}
> +
> +	igt_until_timeout(15) {
> +		scratch[child] = 0;
> +		fence_fd = igt_msm_cmd_submit(cmd);
> +		igt_wait_and_close(fence_fd);
> +
> +		if (hang) {
> +			read_and_clear_devcore();
> +		} else {
> +			/* verify that non-crashing submits succeeded: */
> +			igt_assert_eq(scratch[child], child + 1);
> +		}
> +	}
> +
> +	igt_msm_cmd_free(cmd);
> +}
> +
>  /*
>   * Tests for drm/msm hangcheck, recovery, and fault handling
>   */
> @@ -183,6 +226,16 @@ igt_main
>  		do_hang_test(pipe);
>  	}
>  
> +	igt_describe("Parallel fault handling");
> +	igt_subtest("gpu-fault-parallel") {
> +		igt_require(dev->gen >= 6);
> +
> +		igt_fork(child, 20) {
> +			do_parallel_test(pipe, child);
> +		}
> +		igt_waitchildren();
> +	}
> +
>  	igt_describe("Test iova fault handling");
>  	igt_subtest("iova-fault") {
>  		struct msm_cmd *cmd;
> -- 
> 2.43.0
> 
