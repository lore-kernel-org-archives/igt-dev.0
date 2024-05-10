Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F463C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 15:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EB810E550;
	Fri, 10 May 2024 15:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvMSuO64";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FD710EB30
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353650; x=1746889650;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=B/mWBb7iLcv9+AhqQQAWNe1W5phQfh6JkzSJoGGbGYo=;
 b=GvMSuO64kcOC3QFB5VAe10nBYcFIXAaxfL495nU7Sgv8ZE2jjduX6rK2
 4s0Kb9t9TYw0gepu6Azw9M5b5HebrSIB/rCKgQGMy3B1rNQfY8WO+LGt2
 6S/g+h1apJBa8S/7BSkU532FxWbUiYYChNlZOOOmQWC3Kzqw1dtL9mz6v
 OwSw/UTdRNb2oif/uHNvfzcVSmLrg0qzsintt0ay3wefneqVHecGmxCfb
 AVZu+1S3Z9l+kQUz2IdX6IkELMZFA3DLK7nIra60BYQpNeBFRpkL7xmfH
 2EbLsN+/83OvGcdzMdqqjCxVHSEijnksbAdA2CfS2Ml95tC5v63o6gJqM A==;
X-CSE-ConnectionGUID: ArtcZIGPTCyAurvg3n/Hgg==
X-CSE-MsgGUID: OTjKsuvLRfCfiEHjLVeFbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="14289004"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="14289004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:07:28 -0700
X-CSE-ConnectionGUID: AYVVYU6JRJmUFn/zaVRPFQ==
X-CSE-MsgGUID: 2GF43gTVQoKNwKG5wOSQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="67117934"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:07:27 -0700
Date: Fri, 10 May 2024 17:07:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH RFC i-g-t 2/2] tests/intel/xe_svm: basic xe_svm test
Message-ID: <20240510150723.dfg3bomnflebayin@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
 <20240430182747.589234-3-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430182747.589234-3-krishnaiah.bommu@intel.com>
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

Hi Bommu,
On 2024-04-30 at 23:57:47 +0530, Bommu Krishnaiah wrote:
> Add basic test to validate helper functions introduced in
> 'lib/xe/xe_util: helper function'. This test writes values
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Well, this should be other way around: Add basic test for svm

See few more nits (I skipped those pointed by Oak).

> to the destination buffer using GPU (MI_STORE_DWORD_IMM_GEN4).

Please provide link(s) to lore.kernel.org with proposed svm implementation
or proposition (docs or anything which clarify how to use it) in xe driver.

> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/intel/xe_svm.c | 99 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |  1 +
>  2 files changed, 100 insertions(+)
>  create mode 100644 tests/intel/xe_svm.c
> 
> diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
> new file mode 100644
> index 000000000..a954861bc
> --- /dev/null
> +++ b/tests/intel/xe_svm.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: MIT
> + /*
> +  * Copyright © 2023 Intel Corporation
> +  */
> +
> +/** @file xe_svm.c
> + *
> + * Test shared virtual memory.
> + *
> + * Shared virtual memory(svm in short) is a xe driver feature
---------------------------^
Add space before '('

> + * which provide shared virtual address space b/t CPU and GPU
> + * program. This means application writer can just malloc or mmap,
> + * and use the returned ptr for both CPU and GPU program.

Will it be completly transparent? Or user could give hints
and get only GPU memory?

> + *
> + * This test the shared virtual memory functions. This includes
------^^^^
imho this is TODO:

> + * basic malloc, mmap test, an invalid va tess, a mprotect test and a
-------------------------^^^^
imho you could drop repeating 'test' here
> + * random access test.

 * basic malloc, mmap, an invalid va, mprotect and
 * random access.

> + */
> +
> +/**
> + * TEST: xe_svm
> + * Description: Test shared virtual memory
> + * Sub-category: Memory management
> + * Functionality: svm
> + * Run type: FULL
> + *
> + * SUBTEST: svm-basic-malloc
> + */
> +
> +#include <fcntl.h>
> +
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +#include "lib/xe/xe_util.h"
> +#include "xe_drm.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include <string.h>
----------- ^^^^^^^^^
Move this after <fcntl.h>

> +
> +/**
> + * Use malloc or mmap memory for direct GPU submission
> + */
> +static void svm_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
> +{
> +	uint64_t gpu_va = 0x1a0000;
> +	uint32_t val = 0xc0ffee;
> +	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
> +
> +	struct xe_buffer dst_buf = {
> +           .fd = fd,
> +           .gpu_addr = (uint64_t)gpu_va,
> +	   .vm = vm,
> +	   .size = bo_size,
> +	   .placement = vram_if_possible(fd, eci->gt_id),
> +	   .flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +     };
> +
> +     struct xe_buffer cmd_buf = {
> +           .fd = fd,
> +           .gpu_addr = (uint64_t)gpu_va + bo_size,
> +	   .vm = vm,
> +	   .size = bo_size,
> +	   .placement = vram_if_possible(fd, eci->gt_id),
> +	   .flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +     };
> +
> +     xe_create_buffer(&dst_buf);
> +     xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst_buf.gpu_addr, val, eci);
> +     xe_submit_cmd(&cmd_buf);

Add newline here.

> +     igt_assert_eq(*(uint32_t *)dst_buf.cpu_addr, val);

Same here, add newline.

> +     xe_destroy_cmdbuf(&cmd_buf);
> +     xe_destroy_buffer(&dst_buf);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	uint32_t vm;
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(xe_supports_faults(fd));

See patch from Johnathan for coming changes:
https://patchwork.freedesktop.org/series/133343/
lib/xe/xe_query: Wait for xe_supports_faults


> +		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	}
> +
> +
> +	igt_subtest_f("svm-basic-malloc")
> +		xe_for_each_engine(fd, hwe)
> +			svm_basic(fd, vm, hwe);
> +
> +	igt_fixture {
> +		xe_vm_destroy(fd, vm);
> +		drm_close_driver(fd);
> +	}
> +}
> +
> diff --git a/tests/meson.build b/tests/meson.build
> index 65b8bf23b..6bdd76343 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -316,6 +316,7 @@ intel_xe_progs = [
>  	'xe_spin_batch',
>  	'xe_sysfs_defaults',
>  	'xe_sysfs_scheduler',
> +	'xe_svm',
--------^^^
This should be before xe_sysfs...

Regards,
Kamil

>  ]
>  
>  msm_progs = [
> -- 
> 2.25.1
> 
