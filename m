Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416BB10E0A6
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 17:37:39 +0000 (UTC)
Date: Thu, 17 Aug 2023 19:37:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230817173735.35r4xww7nrpxh4id@kamilkon-desk1>
References: <20230816182659.47460-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230816182659.47460-1-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH] tests/msm: Add submitoverhead benchmark
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
On 2023-08-16 at 11:26:57 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Something for profiling CPU overhead of submit ioctl.  Not really a
> functional test, but it is convenient to re-use the i-g-t infrastructure
> for this.
> 
> v2: SPDX license, fix meson.build whitespace
> v3: Nits
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/meson.build              |  3 +-
>  tests/msm/msm_submitoverhead.c | 87 ++++++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 tests/msm/msm_submitoverhead.c
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 58061dbc260b..4d325bed1e06 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -304,7 +304,8 @@ msm_progs = [
>  	'msm_mapping',
>  	'msm_recovery',
>  	'msm_shrink',
> -	'msm_submit'
> +	'msm_submit',
> +	'msm_submitoverhead',
>  ]
>  
>  chamelium_progs = [
> diff --git a/tests/msm/msm_submitoverhead.c b/tests/msm/msm_submitoverhead.c
> new file mode 100644
> index 000000000000..1b893e30ebe1
> --- /dev/null
> +++ b/tests/msm/msm_submitoverhead.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Google, Inc.
> + */
> +
> +#include "igt.h"
> +#include "igt_msm.h"
> +
> +/*
> + * Not as much a test, as a kernel submit overhead benchmark.  Generates lots
> + * of submit ioctls with various size #s of buffers attached for measuring
> + * and profiling kernel submit CPU overhead.
> + */
> +
> +#define MAX_BOS 1000
> +
> +igt_main
> +{
> +	struct msm_device *dev = NULL;
> +	struct msm_pipe *pipe = NULL;
> +	struct msm_bo *bos[MAX_BOS];
> +	struct drm_msm_gem_submit_bo bos_table[MAX_BOS];
> +	static const int sizes[] = {
> +		10, 100, 250, 500, 1000,
> +	};
> +
> +	igt_fixture {
> +		struct drm_msm_gem_submit req;
> +
> +		dev = igt_msm_dev_open();
> +		pipe = igt_msm_pipe_open(dev, 0);
> +		for (int i = 0; i < MAX_BOS; i++) {
> +			bos[i] = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> +			bos_table[i] = (struct drm_msm_gem_submit_bo) {
> +				.handle = bos[i]->handle,
> +				/*
> +				 * We don't bother testing BO_READ since
> +				 * mesa doesn't use that anymore
> +				 */
> +				.flags  = MSM_SUBMIT_BO_WRITE,
> +			};
> +		}
> +
> +		/*
> +		 * Prime the pump, so first submit doesn't take the overhead
> +		 * of allocating backing pages:
> +		 */
> +		req = (struct drm_msm_gem_submit) {
> +			.flags   = pipe->pipe | MSM_SUBMIT_FENCE_FD_OUT,
> +			.queueid = pipe->submitqueue_id,
> +			.nr_bos  = ARRAY_SIZE(bos_table),
> +			.bos     = VOID2U64(bos_table),
> +		};
> +		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
> +		igt_wait_and_close(req.fence_fd);
> +	}
> +
> +	for (int i = 0; i < ARRAY_SIZE(sizes); i++) {
> +		for (int mode = 0; mode < 2; mode++) {
> +			const char *modestr = mode ? "-no-implicit-sync" : "";
> +			const uint32_t modeflags = mode ? MSM_SUBMIT_NO_IMPLICIT : 0;
> +
> +			igt_subtest_f("submitbench-%u-bos%s", sizes[i], modestr) {
> +				struct drm_msm_gem_submit req = {
> +					.flags   = pipe->pipe | modeflags,
> +					.queueid = pipe->submitqueue_id,
> +					.nr_bos  = sizes[i],
> +					.bos     = VOID2U64(bos_table),
> +				};
> +				unsigned int iterations = 0;
> +
> +				igt_for_milliseconds(2000) {
> +					do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
> +					iterations++;
> +				}
> +				igt_info("%u-bos: %u iterations\n", sizes[i], iterations);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		for (int i = 0; i < MAX_BOS; i++)
> +			igt_msm_bo_free(bos[i]);
> +		igt_msm_pipe_close(pipe);
> +		igt_msm_dev_close(dev);
> +	}
> +}
> -- 
> 2.41.0
> 
