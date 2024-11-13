Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCCAD462AF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 14:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187AA10E717;
	Wed, 13 Nov 2024 14:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvfpJEU8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A1110E717
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731508445; x=1763044445;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zXn1d+HoF6XOgyDX77pV9I7wzB9CKEMajVJ6X5I+sLw=;
 b=DvfpJEU8L9EvnpfnLyPnccjRln1l8CCOI9c7qKhXWk7udK8ec4FsuZgz
 4DojJmcz8sVCy9LoGiHk/iP/QI1JQyqxBoUV0lKtbXMT4pNVvYRS4Cw1l
 iZnRMUJXTUZFfbSHCfQc3H2HYeOPSkvDf8oxCFnk7Y5IL6cO/xlXG8zYm
 lIJRV7iHAwond15GkpiAUV/+XG3YV6EU578XINrJ/XqtHBfZkZ0W5UhmU
 P7ecMkmvWaqff/BRTtWDQQbHJ1uh4JeJE9Kovkyxkis0KVuoAGXiL9ada
 +klYRVGx0mzwwcpIbwH9joRjbX+hY0N7v95qlYmYIdmEj3nAWzmhBGqhF w==;
X-CSE-ConnectionGUID: iLyI/UYNRCC+R0er5Ugj/g==
X-CSE-MsgGUID: aaKLd+EuTROlDRyakZi+QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42793084"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="42793084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:34:04 -0800
X-CSE-ConnectionGUID: J5T4n7hnRjKtCIF+z+xwqw==
X-CSE-MsgGUID: n1IelfksROewabTbim80fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="88313611"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.168])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:34:03 -0800
Date: Wed, 13 Nov 2024 15:34:00 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org, christoph.manszewski@intel.com
Subject: Re: [PATCH i-g-t 3/3] tests/xe_eudebug: Validate exec queue placements
Message-ID: <20241113143400.nobazvlszskdwcd3@zkempczy-mobl2>
References: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
 <20241113085155.209198-3-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113085155.209198-3-dominik.grzegorzek@intel.com>
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

On Wed, Nov 13, 2024 at 09:51:55AM +0100, Dominik Grzegorzek wrote:
> Add test which validates exec_queue_placement uAPI. It requires
> ccs_mode, which is present only on platforms with multiple ccs engines.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 123 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 122 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 8d45d59f3..39db16457 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -20,6 +20,7 @@
>  #include <sys/prctl.h>
>  
>  #include "igt.h"
> +#include "igt_sysfs.h"
>  #include "intel_pat.h"
>  #include "lib/igt_syncobj.h"
>  #include "xe/xe_eudebug.h"
> @@ -61,6 +62,7 @@ static void test_sysfs_toggle(int fd)
>  #define VM_METADATA		(1 << 5)
>  #define VM_BIND_METADATA	(1 << 6)
>  #define VM_BIND_OP_MAP_USERPTR	(1 << 7)
> +#define EXEC_QUEUES_PLACEMENTS	(1 << 8)
>  #define TEST_DISCOVERY		(1 << 31)
>  
>  #define PAGE_SIZE SZ_4K
> @@ -420,6 +422,80 @@ static void vm_bind_client(int fd, struct xe_eudebug_client *c)
>  	xe_eudebug_client_vm_destroy(c, fd, vm);
>  }
>  
> +static void placements_client(int fd, struct xe_eudebug_client *c)
> +{
> +	struct drm_xe_ext_set_property eq_ext = {
> +		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG,
> +		.value = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
> +	};
> +	struct drm_xe_exec_queue_create create = {
> +		.extensions = to_user_pointer(&eq_ext),
> +	};
> +	struct drm_xe_engine_class_instance *eci;
> +	bool at_least_4_ccs = false;
> +	uint32_t vm;
> +	int i, gt;
> +
> +	xe_for_each_gt(fd, gt) {
> +		int count = 0;
> +
> +		xe_for_each_engine(fd, eci)
> +			if (eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE &&
> +			    eci->gt_id == gt)
> +				count++;
> +
> +		if (count < 4)
> +			continue;
> +
> +		at_least_4_ccs = true;
> +
> +		vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +
> +		eci = calloc(count * count - 2, sizeof(*eci));
> +
> +		for (i = 0; i < count * count - 2; i++) {
> +			eci[i].engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> +			eci[i].gt_id = gt;
> +		}
> +
> +		for (i = 0; i < count; i++)
> +			eci[i].engine_instance = i;
> +
> +		create.instances = to_user_pointer(eci);
> +		create.vm_id = vm;
> +		create.width = 1;
> +		create.num_placements = count;
> +		xe_eudebug_client_exec_queue_create(c, fd, &create);
> +		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
> +
> +		create.width = count;
> +		create.num_placements = 1;
> +		xe_eudebug_client_exec_queue_create(c, fd, &create);
> +		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
> +
> +		// every other instance (logical_mask ~ 1010, 0101)

Minor nit - please use C-style comments.

--
Zbigniew

> +		create.width = 2;
> +		create.num_placements = count/2;
> +		xe_eudebug_client_exec_queue_create(c, fd, &create);
> +		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
> +
> +		// logically contigous placement (logical_mask ~ 1100, 0110, 0011)
> +		for (i = 0; i < count * count - 2; i++)
> +			eci[i].engine_instance = i / 2 + i % 2;
> +
> +		create.width = 2;
> +		create.num_placements = count - 1;
> +		xe_eudebug_client_exec_queue_create(c, fd, &create);
> +		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
> +
> +		xe_eudebug_client_vm_destroy(c, fd, vm);
> +		free(eci);
> +	}
> +
> +	igt_require(at_least_4_ccs);
> +}
> +
>  static void run_basic_client(struct xe_eudebug_client *c)
>  {
>  	int fd, i;
> @@ -470,6 +546,9 @@ static void run_basic_client(struct xe_eudebug_client *c)
>  		xe_eudebug_client_vm_destroy(c, fd, vm);
>  	}
>  
> +	if (c->flags & EXEC_QUEUES_PLACEMENTS)
> +		placements_client(fd, c);
> +
>  	if (c->flags & VM_BIND || c->flags & VM_BIND_METADATA)
>  		basic_vm_bind_client(fd, c);
>  
> @@ -908,6 +987,11 @@ static void test_read_event(int fd)
>   *	Attach the debugger to a process that performs bind, bind array, rebind,
>   *	partial unbind, unbind and unbind all operations.
>   *
> + * SUBTEST: exec-queue-placements
> + * Description:
> + *	Create compute exec_queues with various placements and compare them against
> + *	event sent to the debugger.
> + *
>   * SUBTEST: multigpu-basic-client
>   * Description:
>   *	Attach the debugger to process which opens and closes xe drm client on all Xe devices.
> @@ -2644,14 +2728,40 @@ static void test_basic_exec_queues_enable(int fd)
>  	xe_vm_destroy(fd, vm_non_lr);
>  }
>  
> +static void ccs_mode_all_engines(int num_gt)
> +{
> +	int fd, gt, gt_fd, num_slices, ccs_mode;
> +	int num_gts_with_ccs_mode = 0;
> +
> +	for (gt = 0; gt < num_gt; gt++) {
> +		fd = drm_open_driver(DRIVER_XE);
> +		gt_fd = xe_sysfs_gt_open(fd, gt);
> +		close(fd);
> +
> +		if (igt_sysfs_scanf(gt_fd, "num_cslices", "%u", &num_slices) <= 0)
> +			continue;
> +
> +		num_gts_with_ccs_mode++;
> +
> +		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
> +		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
> +		igt_assert(num_slices == ccs_mode);
> +		close(gt_fd);
> +	}
> +
> +	errno = 0;
> +	igt_require(num_gts_with_ccs_mode > 0);
> +}
> +
>  igt_main
>  {
>  	bool was_enabled;
>  	bool *multigpu_was_enabled;
> -	int fd, gpu_count;
> +	int fd, gpu_count, gt_count;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> +		gt_count = xe_number_gt(fd);
>  		was_enabled = xe_eudebug_enable(fd, true);
>  	}
>  
> @@ -2745,6 +2855,17 @@ igt_main
>  	igt_subtest("discovery-empty-clients")
>  		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
>  
> +	igt_subtest_group {
> +		igt_fixture {
> +			drm_close_driver(fd);
> +			ccs_mode_all_engines(gt_count);
> +			fd = drm_open_driver(DRIVER_XE);
> +		}
> +
> +		igt_subtest("exec-queue-placements")
> +			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
> +	}
> +
>  	igt_fixture {
>  		xe_eudebug_enable(fd, was_enabled);
>  		drm_close_driver(fd);
> -- 
> 2.34.1
> 
