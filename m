Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F21606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 11:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OROHncpd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEEF10E115;
	Fri, 30 Oct 2026 11:58:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAE810E115
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 11:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361426; x=1824897426;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P2ej4qsGnPuYEhMASwvTSZoCndgbicIuMBC78qhzB6s=;
 b=OROHncpdDzQDVg6H84UKDmVmCvTzGi9DQZJVYgv6idxeM8pKEGWGRb+8
 DibRAZVoJfikkkxE/N/DCu+RmIyNf6exQGuACrUXAj0459DXRy64NMj3J
 /UqIJ6nHXNs+dCn5D21TLx9C5UiFivzAeKNfParirw5zjHWWrB0KDrH/S
 IeBpQGvV6PY3v/OSHd/XKamA9/lAgHF7dSzAbj8v42N/7mDmLY6e/+9+V
 pbaSHFF+UVV35KTN4WTHx11zjowYHGIW1BwdY/BauPSKSfdYeqm4qt9ce
 6ScnH9zdR+xWn0Z+KnMBMS9ni092K/GpZ23sGWIuIQIJQ9q3YetH0AakG g==;
X-CSE-ConnectionGUID: M2ViUYgySti788L5/LZcrw==
X-CSE-MsgGUID: /ZiHvFfCT32OytKgutP9GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2125707"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2125707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:57:06 -0700
X-CSE-ConnectionGUID: +nClNxcERbWtcj/IjiPvPA==
X-CSE-MsgGUID: u3/AHUp4SFKF3eMZaKAi/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5310471"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:57:03 -0700
Date: Fri, 30 Oct 2026 12:57:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, jvignan@qti.qualcomm.com,
 robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com
Subject: Re: [PATCH i-g-t] tests/msm/msm_bo: Add memory advice tests
Message-ID: <20261030115700.gqeyuk33hjady7jf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sri Vidya Patrayani <spatraya@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org, jvignan@qti.qualcomm.com,
 robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com
References: <20261030060638.2849895-1-spatraya@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030060638.2849895-1-spatraya@qti.qualcomm.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sri,
On 2026-10-30 at 11:36:38 +0530, Sri Vidya Patrayani wrote:
> Add positive and negative coverage for MSM buffer object memory advice.
> 
> Exercise WILLNEED and DONTNEED advice across write-combine, cached,
> mapped, large, and multiple buffer objects, including CPU access
> transitions.
> 
> Verify invalid handles, invalid advice values, and advice requests
> after buffer release are rejected as expected.
> 
> Signed-off-by: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>

I forgot to add an ask for devs on Cc: please provide a tested-by
and/or r-b to this patch, thanks in advance!


Regards,
Kamil

> ---
>  tests/msm/msm_bo.c | 238 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 238 insertions(+)
> 
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 3257697f5..906f801ef 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -414,6 +414,244 @@ int igt_main()
>  		igt_msm_bo_free(bo);
>  	}
>  
> +	/* Memory Advice Tests - Positive Cases */
> +	igt_describe("Set WILLNEED advice and verify that the buffer is retained");
> +	igt_subtest("bo-madvise-willneed") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +		struct msm_bo *bo;
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.madv = MSM_MADV_WILLNEED;
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
> +		igt_assert_eq(ret, 0);
> +		igt_assert_eq(req.retained, 1);
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Set DONTNEED advice on a buffer object");
> +	igt_subtest("bo-madvise-dontneed") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +		struct msm_bo *bo;
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.madv = MSM_MADV_DONTNEED;
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
> +		igt_assert_eq(ret, 0);
> +
> +		igt_info("Buffer retained status after DONTNEED: %d\n", req.retained);
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Apply WILLNEED and DONTNEED advice to the same buffer");
> +	igt_subtest("bo-madvise-multiple-calls") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +		struct msm_bo *bo;
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.madv = MSM_MADV_WILLNEED;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
> +		igt_assert_eq(ret, 0);
> +		igt_assert_eq(req.retained, 1);
> +
> +		req.madv = MSM_MADV_DONTNEED;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
> +		igt_assert_eq(ret, 0);
> +
> +		igt_info("Buffer retained status after DONTNEED: %d\n", req.retained);
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Apply DONTNEED advice to a mapped buffer object");
> +	igt_subtest("bo-madvise-mapped-buffer") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +		struct msm_bo *bo;
> +		void *map;
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		map = igt_msm_bo_map(bo);
> +		igt_assert_f(map, "Failed to map buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.madv = MSM_MADV_DONTNEED;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
> +		igt_assert_eq(ret, 0);
> +
> +		igt_info("Mapped buffer retained status: %d\n", req.retained);
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Apply WILLNEED advice to a cached buffer object");
> +	igt_subtest("bo-madvise-cached-buffer") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +		struct msm_bo *bo;
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_CACHED);
> +		igt_assert_f(bo, "Failed to allocate cached buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.madv = MSM_MADV_WILLNEED;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
> +		igt_assert_eq(ret, 0);
> +		igt_assert_eq(req.retained, 1);
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Apply DONTNEED advice to a large buffer object");
> +	igt_subtest("bo-madvise-large-buffer") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +		const size_t large_size = 64 * 1024 * 1024;
> +		struct msm_bo *bo;
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, large_size, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate large buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.madv = MSM_MADV_DONTNEED;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
> +		igt_assert_eq(ret, 0);
> +
> +		igt_info("Large buffer retained status: %d\n", req.retained);
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Apply memory advice to multiple buffer objects");
> +	igt_subtest("bo-madvise-multiple-buffers") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +		struct msm_bo *bo1, *bo2;
> +		int ret;
> +
> +		bo1 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		bo2 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO_CACHED);
> +		igt_assert_f(bo1 && bo2, "Failed to allocate buffer objects\n");
> +
> +		req.handle = bo1->handle;
> +		req.madv = MSM_MADV_WILLNEED;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
> +		igt_assert_eq(ret, 0);
> +		igt_assert_eq(req.retained, 1);
> +
> +		req.handle = bo2->handle;
> +		req.madv = MSM_MADV_DONTNEED;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
> +		igt_assert_eq(ret, 0);
> +
> +		igt_info("Second buffer retained status: %d\n", req.retained);
> +		igt_msm_bo_free(bo1);
> +		igt_msm_bo_free(bo2);
> +	}
> +
> +	igt_describe("Apply DONTNEED advice after balanced CPU access");
> +	igt_subtest("bo-madvise-after-cpu-prep") {
> +		struct drm_msm_gem_cpu_prep prep_req = { 0 };
> +		struct drm_msm_gem_cpu_fini fini_req = { 0 };
> +		struct drm_msm_gem_madvise madv_req = { 0 };
> +		struct msm_bo *bo;
> +		uint32_t *ptr;
> +		void *map;
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		map = igt_msm_bo_map(bo);
> +		igt_assert_f(map, "Failed to map buffer object\n");
> +		ptr = map;
> +
> +		prep_req.handle = bo->handle;
> +		prep_req.op = MSM_PREP_READ | MSM_PREP_WRITE | MSM_PREP_NOSYNC;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_CPU_PREP, &prep_req);
> +		igt_assert_eq(ret, 0);
> +
> +		ptr[0] = 0xDEADBEEF;
> +
> +		fini_req.handle = bo->handle;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_CPU_FINI, &fini_req);
> +		igt_assert_eq(ret, 0);
> +
> +		madv_req.handle = bo->handle;
> +		madv_req.madv = MSM_MADV_DONTNEED;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &madv_req);
> +		igt_assert_eq(ret, 0);
> +
> +		igt_info("Buffer retained status: %d\n", madv_req.retained);
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	/* Memory Advice Tests - Negative Cases */
> +	igt_describe("Reject memory advice for an invalid buffer handle");
> +	igt_subtest("bo-madvise-invalid-bo") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +
> +		req.handle = 0xDEADBEEF;
> +		req.madv = MSM_MADV_WILLNEED;
> +
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOENT);
> +	}
> +
> +	igt_describe("Reject memory advice for handle zero");
> +	igt_subtest("bo-madvise-zero-handle") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +
> +		req.handle = 0;
> +		req.madv = MSM_MADV_WILLNEED;
> +
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOENT);
> +	}
> +
> +	igt_describe("Reject an invalid memory advice value");
> +	igt_subtest("bo-madvise-invalid-advice") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +		struct msm_bo *bo;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.madv = 0xDEADBEEF;
> +
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, EINVAL);
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Reject memory advice after a buffer has been freed");
> +	igt_subtest("bo-madvise-after-free") {
> +		struct drm_msm_gem_madvise req = { 0 };
> +		struct msm_bo *bo;
> +		uint32_t handle;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +		handle = bo->handle;
> +
> +		igt_msm_bo_free(bo);
> +
> +		req.handle = handle;
> +		req.madv = MSM_MADV_WILLNEED;
> +
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOENT);
> +	}
> +
>  	igt_fixture() {
>  		igt_msm_dev_close(dev);
>  	}
> -- 
> 2.34.1
> 
