Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EC3C0218B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 14:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1B310E5CC;
	Tue, 21 Jan 2025 14:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifooe5wH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B91410E5CC
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 14:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737469952; x=1769005952;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XZx9avlECdyFbRDzsD0IEWByR1ln+X2Ov1HLsdo/WBI=;
 b=ifooe5wHfuDb9UmAjCBwkzN2p0JJ1TLDmpUIVHRCCHDCeeBRpVlM/E3t
 5LgX1fglbpg+sLoKq206rYvF7QrwfC4ono4zFvmFhgYERypBLXdzVqZCU
 7WTcze4F8YKbP+pmc9/WGaAZwFkSSkelTMUpshMTkE9odDysB86f6kj8v
 dvkDzUW4SEqOLnN5Wdoc/VFDoPQULC9wNgK0KorPaxev+ctOwk7YMAd/y
 +NMbsiuGg+kTG+9XCL7lp74XagHAhhtnRdHCB95czz9Ub0ryz1sNe83tf
 Mtwge4nwCK9QejE/G+ZlJXEXedr9M9X9gMAPpYD4G/ArU9L7Z/ERzSGzh w==;
X-CSE-ConnectionGUID: UC/U2NtoRF+FT4R3J1bn5w==
X-CSE-MsgGUID: bDxBgxxxRe+GOXLS3d96uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48549943"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="48549943"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 06:32:32 -0800
X-CSE-ConnectionGUID: cDD11xsnTf2JcRwuLfns+Q==
X-CSE-MsgGUID: 9qiDmfryS7+xWk2wxp//Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107719612"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 06:32:31 -0800
Date: Tue, 21 Jan 2025 15:32:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nakshtra.goyal@intel.com, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 ramadevi.gandi@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_create: Check negative cases for
 exec_queue create/destroy ioctl
Message-ID: <20250121143228.eb2yshwa3nhef5lk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, nakshtra.goyal@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 ramadevi.gandi@intel.com, pravalika.gurram@intel.com
References: <20250117205319.3359797-1-nakshtra.goyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250117205319.3359797-1-nakshtra.goyal@intel.com>
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

Hi Nakshtra,
On 2025-01-18 at 02:23:19 +0530, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Negetive test cases to check expected errors using invalid
> flags, width, pad, reserved bits, num_placements, extensions, exec_queue_id
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_create.c | 141 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 07e11036d..edc2a6178 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -59,6 +59,123 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
>  	return ret;
>  }
>  
> +/**
> + * TEST: Negative test for exec-queue create/destroy ioctl
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Synchronization
> + * Functionality: exec-queue create
> + * Test category: negative test
> + */

Remove this, do _not_ add a second 'TEST: ' section, there is one
at beginning of this test.

> +
> +/**
> + * SUBTEST: invalid-flag
> + * Description: Check ioctl with invalid flag returns expected error code

Add here:
 * Functionality: ioctl_input_validation

And use this in other subtests below.

Regards,
Kamil

> + *
> + * SUBTEST: exec-queue-create-invalid-reserved
> + * Description: Send query with invalid reserved value for exec_queue_destroy ioctl
> + *
> + * SUBTEST: invalid-width
> + * Description: Check query with invalid width returns expected error code
> + *
> + * SUBTEST: invalid-num-placements
> + * Description: Check query with invalid num-placements returns expected error code
> + *
> + * SUBTEST: invalid-extensions
> + * Description: Check query with invalid extensions returns expected error code
> + */
> +
> +static void invalid_flag(int fd)
> +{
> +	struct drm_xe_exec_queue_create create = {
> +		.flags = -1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void exec_queue_create_invalid_reserved(int fd)
> +{
> +	struct drm_xe_exec_queue_create create = {
> +		.reserved[0] = 0xffff,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +
> +	create.reserved[0] = 0;
> +	create.reserved[1] = 0xffff;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void invalid_width(int fd)
> +{
> +	struct drm_xe_exec_queue_create create = {
> +		.width = 1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void invalid_num_placements(int fd)
> +{
> +	struct drm_xe_exec_queue_create create = {
> +		.num_placements = 1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void invalid_extensions(int fd)
> +{
> +	struct drm_xe_exec_queue_create create = {
> +		.extensions = -1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +/**
> + * SUBTEST: invalid-pad
> + * Description: Check query with invalid pad returns expected error code
> + *
> + * SUBTEST: exec-queue-destroy-invalid-reserved
> + * Description: Send query with invalid reserved value for exec_queue_destroy ioctl
> + *
> + * SUBTEST: invalid-exec-queue-id
> + * Description: Check query with invalid exec_queue_id returns expected error code
> + */
> +
> +static void invalid_pad(int fd)
> +{
> +	struct drm_xe_exec_queue_destroy destroy = {
> +		.pad = 1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
> +}
> +
> +static void exec_queue_destroy_invalid_reserved(int fd)
> +{
> +	struct drm_xe_exec_queue_destroy destroy = {
> +		.reserved[0] = 0xffff,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
> +
> +	destroy.reserved[0] = 0;
> +	destroy.reserved[1] = 0xffff;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
> +}
> +
> +static void invalid_exec_queue_id(int xe)
> +{
> +	struct drm_xe_exec_queue_destroy args = {
> +		.exec_queue_id = 0xffff,
> +	};
> +
> +	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &args, ENOENT);
> +}
> +
>  /**
>   * SUBTEST: create-invalid-size
>   * Functionality: ioctl
> @@ -392,6 +509,30 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
>  	igt_fixture
>  		xe = drm_open_driver(DRIVER_XE);
>  
> +	igt_subtest("invalid-flag")
> +		invalid_flag(xe);
> +
> +	igt_subtest("exec-queue-create-invalid-reserved")
> +		exec_queue_create_invalid_reserved(xe);
> +
> +	igt_subtest("invalid-width")
> +		invalid_width(xe);
> +
> +	igt_subtest("invalid-num-placements")
> +		invalid_num_placements(xe);
> +
> +	igt_subtest("invalid-extensions")
> +		invalid_extensions(xe);
> +
> +	igt_subtest("invalid-pad")
> +		invalid_pad(xe);
> +
> +	igt_subtest("exec-queue-destroy-invalid-reserved")
> +		exec_queue_destroy_invalid_reserved(xe);
> +
> +	igt_subtest("invalid-exec-queue-id")
> +		invalid_exec_queue_id(xe);
> +
>  	igt_subtest("create-invalid-mbz")
>  		create_invalid_mbz(xe);
>  
> -- 
> 2.34.1
> 
