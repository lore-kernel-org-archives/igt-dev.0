Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48440CCA462
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 09:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35C21126DB;
	Fri, 16 Oct 2026 09:07:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 49F081126DF
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 09:06:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28E651477
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 02:06:55 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 00AA23F673
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1792141618; bh=r/NE1VSZvHCF3kZJTIDcIhbYW7wd3ON2vUXUQXSyTCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uXChN4tym4t+9zAFHYlgm9fjRvpr27lceRbrmesP1qy1VjSI+ltTzt6Em18swkU4/
 fOccyOY89tK5V9U7e0wc1PT+kvX8L+u9AOFEZV8j2DByJgjGK3Ohys3SIDBQyfxFgn
 +kboK87LJG7hcmtvhjMeAscM88MQZJPd+e+bbebc=
Date: Fri, 16 Oct 2026 10:06:54 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, steven.price@arm.com,
 daniel.almeida@collabora.com, kamil.konieczny@linux.intel.com
Subject: Re: [PATCH i-g-t 2/2] panthor: test dev_query buffer size variations
Message-ID: <atHpLtAzeOw8042v@e142607>
References: <20261015-b4-dev_query-v1-0-70ffafa4131e@collabora.com>
 <20261015-b4-dev_query-v1-2-70ffafa4131e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015-b4-dev_query-v1-2-70ffafa4131e@collabora.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2026 at 04:44:58PM -0700, Deborah Brouwer wrote:
> Add tests to check that the kernel driver will gracefully handle userspace
> buffers that are smaller or larger than the kernel driver expected.
> 
> Also, add a test to ensure that the kernel driver is enforcing the
> minimum buffer size and that the kernel driver will provide the size
> when the userpointer is null.
> 
> This ensures UAPI compliance for DRM_IOCTL_PANTHOR_DEV_QUERY.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  tests/panthor/panthor_query.c | 64 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
> index afd58a5bd..8ff2e9652 100644
> --- a/tests/panthor/panthor_query.c
> +++ b/tests/panthor/panthor_query.c
> @@ -7,6 +7,10 @@
>  #include "panthor_drm.h"
>  #include <stdint.h>
>  
> +#define GPU_INFO_MIN_SIZE \
> +	(offsetof(struct drm_panthor_gpu_info, tiler_present) + \
> +	 sizeof(((struct drm_panthor_gpu_info *)0)->tiler_present))
> +
>  int igt_main() {
>  	int fd = -1;
>  
> @@ -20,10 +24,70 @@ int igt_main() {
>  		struct drm_panthor_gpu_info gpu = {};
>  
>  		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu, sizeof(gpu), 0);
> +		igt_assert_neq(gpu.gpu_id, 0);
> +	}
> +
> +	igt_describe("Ensure kernel returns a GPU_INFO size.");
> +	igt_subtest("query-size-null-pointer") {
> +		uint32_t size;
> +
> +		size = igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, NULL, 0, 0);
> +
> +		/*
> +		 * The kernel returns its output structure size, which may be out
> +		 * of sync with the header used to build these tests, so don't expect
> +		 * that the sizes will match necessarily.
> +		 */
> +		igt_assert(size >= GPU_INFO_MIN_SIZE);
> +	}
> +
> +	igt_describe("Ensure kernel enforces GPU_INFO minimum size.");
> +	igt_subtest("query-size-too-small") {
> +		struct drm_panthor_gpu_info gpu = {};
> +
> +		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> +				  &gpu, GPU_INFO_MIN_SIZE - 1, EINVAL);
> +	}
> +
> +	igt_describe("Ensure kernel accepts GPU_INFO minimum size.");
> +	igt_subtest("query-min-size") {
> +		struct drm_panthor_gpu_info gpu = {};
> +
> +		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> +				  &gpu, GPU_INFO_MIN_SIZE, 0);

This last test feels redundant. We've checked that the kernel expects a struct of
at least GPU_INFO_MIN_SIZE and we've checked that smaller sizes are rejected. If
GPU_INFO_MIN_SIZE is rejected that means we are no longer supporting that size
and user space should be upgraded, not necessarily that the kernel has a bug.


Best regards,
Liviu

>  
>  		igt_assert_neq(gpu.gpu_id, 0);
>  	}
>  
> +	igt_describe("Ensure kernel zeros out unused part of buffer.");
> +	igt_subtest("query-too-big") {
> +		uint32_t size;
> +		size_t buf_size;
> +		uint8_t *buf;
> +
> +		/*
> +		 * Create a buffer that is larger than necessary.
> +		 * Start with the size returned by the kernel in case it is out of
> +		 * sync with these tests. Then add an extra 16 bytes and initialize
> +		 * the entire buffer to non-zero values.
> +		 */
> +		size = igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> +					 NULL, 0, 0);
> +		buf_size = (size_t)size + 16;
> +		buf = malloc(buf_size);
> +		igt_assert(buf);
> +		memset(buf, 0xff, buf_size);
> +
> +		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> +				  buf, buf_size, 0);
> +
> +		/* Check that the extra bytes were zeroed. */
> +		for (size_t i = size; i < buf_size; i++)
> +			igt_assert_eq(buf[i], 0);
> +
> +		free(buf);
> +	}
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> 
> -- 
> 2.56.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
