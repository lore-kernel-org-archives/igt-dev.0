Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9990D606A323
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DZKj+Njk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA9611231F;
	Thu, 29 Oct 2026 13:58:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696A510E11B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793282233; x=1824818233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qBy+QTmm5pVLkkIa+5Ez23VRetlAEn6vEZ1V6NJnUaw=;
 b=DZKj+Njky6IrDNGCr1acFz1PuZ9PQLf1a7BGxa0Fy5OZyXaGs97FeFNR
 3Nt3TbkEWKRxyoNtp+ZURtQGrq3K8iYcluV+yrVtl0p99TCNp0dF7RcM5
 P31fd/KGM+INBxIR6otbP63Cf+FTAjiahjwMancDwGcJ4bZ7UehB/UiJq
 0uymO5cdRmMc4S7nTdOhAWzFvFE8z6a4ODxidwVS1P3w2Enbz0asc5bDG
 nqG2lme8ixWoI7e7D3bt/sef0Vrc/XTa6ox9oIpbEB1qZ8MQSVfeJW8rd
 2TLZOvu+5bVV+qxWFSirze/S59tojZnVS7bRn9ueaOSkFje1BdxhPLIc6 w==;
X-CSE-ConnectionGUID: daMVj2aoQuutdmO4I58jkA==
X-CSE-MsgGUID: BLJE+T3OR92lINMzYttfqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2029929"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2029929"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:57:12 -0700
X-CSE-ConnectionGUID: bGKUZr47TgOocFa7AjX86g==
X-CSE-MsgGUID: 725glfZXQDaZbI26P0mjvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6916870"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:52:50 -0700
Date: Thu, 29 Oct 2026 14:52:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jitta Vignan <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com
Subject: Re: [PATCH i-g-t v2 2/2] tests/msm/msm_bo: Add CACHED_COHERENT
 allocation test
Message-ID: <20261029135246.dhx2andem6wygtfb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jitta Vignan <jvignan@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com
References: <20261028151559.4069953-1-jvignan@qti.qualcomm.com>
 <20261028151559.4069953-3-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028151559.4069953-3-jvignan@qti.qualcomm.com>
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

Hi Jitta,
On 2026-10-28 at 20:45:59 +0530, Jitta Vignan wrote:
> Add coverage for MSM_BO_CACHED_COHERENT buffer allocation on
> supported A6xx and newer GPUs. Verify the reported cache mode using
> MSM_INFO_GET_FLAGS and handle unsupported configurations gracefully.
> 
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/msm/msm_bo.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

All applied, thanks!


Regards,
Kamil

> 
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 94714dfc7..3257697f5 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -95,6 +95,45 @@ int igt_main()
>  		igt_msm_bo_free(bo);
>  	}
>  
> +	igt_describe("Test MSM_BO_CACHED_COHERENT on A6xx+ GPUs");
> +	igt_subtest("bo-alloc-cached-coherent") {
> +		struct drm_msm_gem_new req = { 0 };
> +		int ret;
> +
> +		/* MSM_BO_CACHED_COHERENT is only supported on A6xx and newer GPUs */
> +		igt_require(dev->gen >= 6);
> +
> +		req.size = DEFAULT_BUFFER_SIZE;
> +		req.flags = MSM_BO_CACHED_COHERENT;
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
> +
> +		if (ret == 0) {
> +			struct drm_msm_gem_info info_req = { 0 };
> +
> +			igt_info("MSM_BO_CACHED_COHERENT supported on A%dxx GPU\n", dev->gen);
> +
> +			/* Verify flags */
> +			info_req.handle = req.handle;
> +			info_req.info = MSM_INFO_GET_FLAGS;
> +			ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &info_req);
> +			igt_assert_eq(ret, 0);
> +
> +			igt_assert_f((info_req.value & MSM_BO_CACHE_MASK) == MSM_BO_CACHED_COHERENT,
> +				     "Cache mode mismatch for CACHED_COHERENT\n");
> +
> +			igt_info("CACHED_COHERENT BO flags: 0x%llx (expected 0x%x)\n",
> +				 (unsigned long long)info_req.value,
> +				 MSM_BO_CACHED_COHERENT);
> +
> +			gem_close(dev->fd, req.handle);
> +		} else {
> +			igt_assert_eq(errno, EINVAL);
> +			igt_info("MSM_BO_CACHED_COHERENT not supported on A%dxx GPU "
> +				 "(EINVAL)\n", dev->gen);
> +		}
> +	}
> +
>  	/* Buffer Information Tests - Positive Cases */
>  	igt_describe("Get offset for valid BO");
>  	igt_subtest("bo-get-offset-valid") {
> -- 
> 2.34.1
> 
