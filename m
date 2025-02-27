Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2A4C19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 11:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1219810EAA2;
	Thu, 27 Feb 2025 11:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgtZeZH3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7132510EA9F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740654858; x=1772190858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5u2AAJyEAoxI7vYLdXupXCwhcQz7VheV/vT0Xn3rXzY=;
 b=KgtZeZH3TRGmFysE/PnlO3kpMdIiTKYYsAYbrRb8YeMVohFXjTfsl7e5
 F/q8pFYiyYMIWl/6N+L8vPBzXFQ43Ste0hGFJM+JFhwLSYrponw91nP/A
 B2Hfe7SoUPeiqQoTn3Gd3gIzxliXBf0T2uHY2itM6RJKxb8GfvrtTTJUX
 ZwMJjOeJOWzhN6ASEal5APYT4wqs017zzZ757MCHUZ9bmiDBnGDyLo+Cp
 cgO1YukVAyH44ozEM+5HjXl3lb9JZ35nvtZxjxtaUPPjd0187To6hKWq/
 l3dn6pM+8lKCmvTdsnd8LKAzfvrm5cXS3zSGB8om0MUTKI3lTj/a/uknO w==;
X-CSE-ConnectionGUID: FBj6xSpuST6qll5pq9Jqvw==
X-CSE-MsgGUID: 1XdjrWdGSTyKdkEhkZQKZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52934378"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52934378"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:14:18 -0800
X-CSE-ConnectionGUID: 7qp/imxeR0mGCW1PqqHIQA==
X-CSE-MsgGUID: 6bQXELTjSEaYqh8DIXIiKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117023924"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:14:17 -0800
Date: Thu, 27 Feb 2025 12:14:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH i-g-t v4 6/7] tests/intel/xe_pxp: Termination tests
Message-ID: <20250227111414.njg4lrmmyxbobray@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20250225003140.2738645-1-daniele.ceraolospurio@intel.com>
 <20250225003140.2738645-7-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225003140.2738645-7-daniele.ceraolospurio@intel.com>
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

Hi Daniele,
On 2025-02-24 at 16:31:37 -0800, Daniele Ceraolo Spurio wrote:
> There are several events that can cause the PXP key to be invalidated
> and trigger a PXP termination (suspend, PXP termination irq). After a
> termination, we expect the key to be different and the raw encrypted
> data to change for the same source data.
> Additionally, all PXP objects are invalidated during a termination and
> can no longer be used in submission or kept mapped to VMs; we therefore
> need to test both the execution and bind ioctls to make sure they work
> as expected after a termination.

I have few nits, mainly for libs changes, see below.

> 
> v2: move igt_require calls inside the subtest
> v3: block rpm for tests trying a different type of termination, rework
> invalid bind test to try a new vm as well (Alan)
> v4: move file open and igt_require() inside the subtest (Kamil)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_batchbuffer.c |   8 +-
>  lib/intel_batchbuffer.h |   1 +
>  lib/xe/xe_ioctl.c       |  12 +-
>  lib/xe/xe_ioctl.h       |   2 +
>  tests/intel/xe_pxp.c    | 465 +++++++++++++++++++++++++++++++++++++++-
>  5 files changed, 475 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index ee499ee7f..68614ed6b 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2428,9 +2428,9 @@ static void update_offsets(struct intel_bb *ibb,
>  
>  #define LINELEN 76
>  

While you are here please add description to library function.

> -static int
> -__xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
> +int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>  {
> +	int ret = 0;
>  	uint32_t engine = flags & (I915_EXEC_BSD_MASK | I915_EXEC_RING_MASK);
>  	uint32_t engine_id;
>  	struct drm_xe_sync syncs[2] = {
> @@ -2507,12 +2507,12 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>  	ibb->engine_syncobj = syncobj_create(ibb->fd, 0);
>  	syncs[1].handle = ibb->engine_syncobj;
>  
> -	xe_exec_sync(ibb->fd, engine_id, ibb->batch_offset, syncs, 2);
> +	ret = xe_exec_sync_failable(ibb->fd, engine_id, ibb->batch_offset, syncs, 2);
>  
>  	if (sync)
>  		intel_bb_sync(ibb);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 178aaa9d8..6a7e8df4a 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -508,6 +508,7 @@ void intel_bb_dump_cache(struct intel_bb *ibb);
>  
>  void intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
>  		   uint64_t flags, bool sync);
> +int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync);
>  
>  uint64_t intel_bb_get_object_offset(struct intel_bb *ibb, uint32_t handle);
>  bool intel_bb_object_offset_to_buf(struct intel_bb *ibb, struct intel_buf *buf);
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 01ab7c758..cd7314eda 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -462,8 +462,8 @@ void xe_exec(int fd, struct drm_xe_exec *exec)
>  	igt_assert_eq(__xe_exec(fd, exec), 0);
>  }
>  

Same here, add description.

> -void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
> -		  struct drm_xe_sync *sync, uint32_t num_syncs)
> +int xe_exec_sync_failable(int fd, uint32_t exec_queue, uint64_t addr,
> +			  struct drm_xe_sync *sync, uint32_t num_syncs)
>  {
>  	struct drm_xe_exec exec = {
>  		.exec_queue_id = exec_queue,
> @@ -473,7 +473,13 @@ void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
>  		.num_batch_buffer = 1,
>  	};
>  
> -	igt_assert_eq(__xe_exec(fd, &exec), 0);
> +	return __xe_exec(fd, &exec);
> +}
> +

Same here.

> +void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	igt_assert_eq(xe_exec_sync_failable(fd, exec_queue, addr, sync, num_syncs), 0);
>  }
>  
>  void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index c8a2d81c5..9bdf73b2b 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -91,6 +91,8 @@ int __xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
>  		  struct drm_xe_sync *sync, uint32_t num_syncs);
> +int xe_exec_sync_failable(int fd, uint32_t exec_queue, uint64_t addr,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs);
>  void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr);
>  int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		     uint32_t exec_queue, int64_t *timeout);
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 2ab920d07..18f582370 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -3,7 +3,10 @@
>   * Copyright © 2024 Intel Corporation

Please extend year to 2024-2025

Regards,
Kamil

>   */
>  
> +#include <fcntl.h>
> +
>  #include "igt.h"
> +#include "igt_syncobj.h"
>  #include "intel_batchbuffer.h"
>  #include "intel_bufops.h"
>  #include "intel_mocs.h"
> @@ -81,6 +84,15 @@ static uint32_t create_pxp_rcs_queue(int fd, uint32_t vm)
>  	return q;
>  }
[...]
