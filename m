Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079A2E9413E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 09:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD6B10E62B;
	Tue, 30 Dec 2025 09:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2EzYr8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451CC10E62B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767086725; x=1798622725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d54IKCGRfcNCZvqSy/cf8gkBpnvQYFo4+FQPmnGnhkE=;
 b=Y2EzYr8Qq33Mg4ojFRB/M+FnM2oI5OQyafT7IJ7j+Lrq+xeuDc6g3k/x
 x2xzbOdQplFe2MV+xaT2Aozj39z6bKWzwsWrqc48otJ/znyDjHJ1IMbzH
 Mzh4B6pO3eYyfPpM0ytNXiTZ0MFjfVFYfck2/2BCgnW2vQKmNELia9kfV
 lTbEFxkn5jSK1Q4fHDQOyyUtKGepMZsgSd063BMMflg0HEg8xFmU5msFc
 4iisUEWjmpDRGjf3K59VIdT5UNm3Q3Py0AnkiSRtf2nbenxlt72JNe/eH
 UdyPxShjGzwKkEVwqvsKrniAFzCD8PVOC8AAzIfA9did6Mp67N2laBdC3 Q==;
X-CSE-ConnectionGUID: 4elW2Sn4TzO4byvZ/ds8KQ==
X-CSE-MsgGUID: o6i+s86EQ3CKEIts1NWtOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67874795"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="67874795"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 01:25:25 -0800
X-CSE-ConnectionGUID: tvbrhyVuSLKUJn9fcPWgYg==
X-CSE-MsgGUID: 8vRwkCksTAyzscbq/MkaZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="201183534"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 01:25:24 -0800
Date: Tue, 30 Dec 2025 10:25:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jitta Vignan <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/msm: add MSM buffer object allocation tests
Message-ID: <20251230092521.tzroz3z5omiwmloj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jitta Vignan <jvignan@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org
References: <20251224102544.347540-1-jvignan@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224102544.347540-1-jvignan@qti.qualcomm.com>
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

Hi Jitta,
On 2025-12-24 at 15:55:44 +0530, Jitta Vignan wrote:
> This patch adds comprehensive test coverage for MSM buffer object
> allocation using the DRM_IOCTL_MSM_GEM_NEW ioctl.
> 
> Test coverage includes:
> 
> - Basic buffer allocation
> - Different cache modes (cached, write-combine, uncached)
> - Negative tests (zero size, invalid flags)
> - Unaligned size allocation
> 
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/msm/meson.build |  1 +
>  tests/msm/msm_bo.c    | 99 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 tests/msm/msm_bo.c
> 
> diff --git a/tests/msm/meson.build b/tests/msm/meson.build
> index 74169b5b2..2ba5b4db2 100644
> --- a/tests/msm/meson.build
> +++ b/tests/msm/meson.build
> @@ -1,4 +1,5 @@
>  msm_progs = [
> +	'msm_bo',
>  	'msm_mapping',
>  	'msm_recovery',
>  	'msm_shrink',
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> new file mode 100644
> index 000000000..131b43bfa
> --- /dev/null
> +++ b/tests/msm/msm_bo.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <errno.h>
> +
> +#include "igt.h"
> +#include "igt_msm.h"
> +
> +/*
> + * Tests for MSM buffer object allocation
> + * Tests DRM_IOCTL_MSM_GEM_NEW functionality
> + */
> +
> +#define DEFAULT_BUFFER_SIZE 4096
> +
> +int igt_main()
> +{
> +	struct msm_device *dev = NULL;
> +
> +	igt_fixture() {
> +		dev = igt_msm_dev_open();
> +	}
> +
> +	/* Buffer Allocation Tests */
> +	igt_describe("Test basic buffer object allocation");
> +	igt_subtest("bo-alloc-basic") {
> +		struct msm_bo *bo;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, 0);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
> +		igt_assert_f(bo->size == DEFAULT_BUFFER_SIZE,
> +			     "Buffer size mismatch: expected %d, got %u\n",
> +			     (unsigned int)DEFAULT_BUFFER_SIZE, (unsigned int)bo->size);
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Test write-combine buffer object allocation");
> +	igt_subtest("bo-alloc-writecombine") {
> +		struct msm_bo *bo;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate WC buffer object\n");
> +		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Test uncached buffer object allocation");
> +	igt_subtest("bo-alloc-uncached") {
> +		struct msm_bo *bo;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_UNCACHED);
> +		igt_assert_f(bo, "Failed to allocate uncached buffer object\n");
> +		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Test allocation with zero size (should fail)");
> +	igt_subtest("bo-alloc-zero-size") {
> +		struct drm_msm_gem_new req = { 0 };
> +
> +		req.size = 0;
> +
> +		igt_assert_eq(igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req), -1);
> +		igt_assert_eq(errno, EINVAL);
> +	}
> +
> +	igt_describe("Test allocation with invalid flags (should fail)");
> +	igt_subtest("bo-alloc-invalid-flags") {
> +		struct drm_msm_gem_new req = { 0 };
> +
> +		req.size = DEFAULT_BUFFER_SIZE;
> +		req.flags = ~0; /* Invalid flags */
> +
> +		igt_assert_eq(igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req), -1);
> +		igt_assert_eq(errno, EINVAL);
> +	}
> +
> +	igt_describe("Test allocation with unaligned size");
> +	igt_subtest("bo-alloc-unaligned-size") {
> +		struct msm_bo *bo;
> +		size_t size = DEFAULT_BUFFER_SIZE - 3; /* Unaligned size */
> +
> +		bo = igt_msm_bo_new(dev, size, 0);
> +		igt_assert_f(bo, "Failed to allocate buffer with unaligned size\n");
> +		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_fixture() {
> +		igt_msm_dev_close(dev);
> +	}
> +}
> -- 
> 2.34.1
> 
