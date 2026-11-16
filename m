Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1284B606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZJOo5kWd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B7310EA24;
	Mon, 16 Nov 2026 15:39:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E590710E517
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794843476; x=1826379476;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yJZAl1CVMIK00JbiwLXyZQuKdgqF0D0v+6+gIu4Irn8=;
 b=ZJOo5kWdNWcf3cdtPHnU6qa9qBnfBgXA1ppzwROW/TBokxPClvd+RgJp
 LTam+Zo0FQAh1M0Ltrxl0pR3J2jRd7mf58yC8kN77L4fxVsY85tQhW628
 VnhVrPpi8rr58k9v7i4ApypBf6XvM5r7AAvaWfGU4Djen5f9HYaO2UqWL
 jPkJ4L60+5K4y6IfOMxxdhvSkfA762xIvXrUoiL5+1dZhYYbu2g20eV4Z
 4vN3xiIy+WtHS9trRuHigilIVNAVPIudIUS70jIPJ/whqZzNf0EJTQ6Bj
 jxvosmFmm3yGpV2NDkurpLp9QBgDX7uHx1X6/Puc/kHGrA5xEO5oWWrkk g==;
X-CSE-ConnectionGUID: tr0jqpDWQfuYD+M9bZWulA==
X-CSE-MsgGUID: C4MkdqD7RWOskKIdQeRFOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3458962"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3458962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 07:37:56 -0800
X-CSE-ConnectionGUID: DujfQvXhRi6+m+76ZAhRuA==
X-CSE-MsgGUID: KcxeYQB/RMmYsBaYn5QuTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9422153"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 07:37:55 -0800
Date: Mon, 16 Nov 2026 16:37:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t v3 2/2] tests/imagination: Add query Firmware
 information test
Message-ID: <rk24rcy43gwmka2avfczm2zgzjtqbdkucgvr34gz3oppag3xxj@2egn3l2m5c2z>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>
References: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
 <20261112-b4-fw_info-v3-2-70d20bd7bc28@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-b4-fw_info-v3-2-70d20bd7bc28@imgtec.com>
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

Hi Brajesh,
On 2026-11-12 at 11:53:51 +0530, Brajesh Gupta wrote:
> Update pvr_dev_query test to include querying of Firmware
> information.
> 
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
> ---
>  tests/imagination/pvr_dev_query.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)

Applied, thanks!

Regards,
Kamil

> 
> diff --git a/tests/imagination/pvr_dev_query.c b/tests/imagination/pvr_dev_query.c
> index 29c7eb550..8995ea777 100644
> --- a/tests/imagination/pvr_dev_query.c
> +++ b/tests/imagination/pvr_dev_query.c
> @@ -19,6 +19,7 @@ int igt_main()
>  		DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
>  		DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
>  		DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
> +		DRM_PVR_DEV_QUERY_FW_INFO_GET,
>  	};
>  
>  	const uint64_t sizes[] = {
> @@ -34,6 +35,8 @@ int igt_main()
>  			sizeof(struct drm_pvr_dev_query_heap_info),
>  		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] =
>  			sizeof(struct drm_pvr_dev_query_static_data_areas),
> +		[DRM_PVR_DEV_QUERY_FW_INFO_GET] =
> +			sizeof(struct drm_pvr_dev_query_fw_info),
>  	};
>  
>  	struct drm_pvr_dev_query_gpu_info gpu_info = {0};
> @@ -42,6 +45,7 @@ int igt_main()
>  	struct drm_pvr_dev_query_enhancements enhancements = {0};
>  	struct drm_pvr_dev_query_heap_info heap_info = {0};
>  	struct drm_pvr_dev_query_static_data_areas static_data_areas = {0};
> +	struct drm_pvr_dev_query_fw_info fw_info = {0};
>  
>  	void *const containers[] = {
>  		[DRM_PVR_DEV_QUERY_GPU_INFO_GET] = &gpu_info,
> @@ -50,19 +54,26 @@ int igt_main()
>  		[DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET] = &enhancements,
>  		[DRM_PVR_DEV_QUERY_HEAP_INFO_GET] = &heap_info,
>  		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] = &static_data_areas,
> +		[DRM_PVR_DEV_QUERY_FW_INFO_GET] = &fw_info,
>  	};
>  
> -	int fd;
> +	int fd, version_major, version_minor;
>  
>  	static_assert(ARRAY_SIZE(types) == ARRAY_SIZE(sizes));
>  	static_assert(ARRAY_SIZE(types) == ARRAY_SIZE(containers));
>  
>  	igt_fixture()
>  	{
> +		drmVersionPtr version;
>  		fd = drm_open_driver(DRIVER_POWERVR);
>  
>  		for (int i = 0; i < ARRAY_SIZE(types); i++)
>  			memset(containers[i], 0, sizes[i]);
> +
> +		version = drmGetVersion(fd);
> +		version_major = version->version_major;
> +		version_minor = version->version_minor;
> +		drmFreeVersion(version);
>  	}
>  
>  	igt_describe("Test invalid dev query");
> @@ -73,9 +84,20 @@ int igt_main()
>  
>  	igt_describe("Test valid dev query");
>  	igt_subtest("dev-query-success-all") {
> +		struct drm_pvr_ioctl_dev_query_args args;
>  		for (int i = 0; i < ARRAY_SIZE(types); i++) {
> -			struct drm_pvr_ioctl_dev_query_args args =
> -				igt_pvr_ioctl_dev_query(fd, types[i], 0, NULL, 0);
> +
> +			/* DRM_PVR_DEV_QUERY_FW_INFO_GET only supported
> +			 * from major version 1 and minor version 1 onwards.
> +			 * Skip query on older version.
> +			 */
> +			if (types[i] == DRM_PVR_DEV_QUERY_FW_INFO_GET &&
> +				version_major == 1 && version_minor < 1) {
> +				igt_log("igt-pvr", IGT_LOG_INFO, "Skipping FW_INFO_GET query due to no support\n");
> +				continue;
> +			}
> +
> +			args = igt_pvr_ioctl_dev_query(fd, types[i], 0, NULL, 0);
>  
>  			igt_assert(args.size);
>  			igt_assert(args.size <= sizes[i]);
> 
> -- 
> 2.43.0
> 
