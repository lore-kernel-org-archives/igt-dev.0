Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55F606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 11:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O+3FAZn2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FFF1121FD;
	Thu, 29 Oct 2026 11:16:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E011121FD
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 11:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793272542; x=1824808542;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T/DbKUtlwyFxZcoKoCA8gAd09LQfCQkj7Ze5rEpq5AM=;
 b=O+3FAZn2rFScIiutls9cD4GXHKsrwLcnh4lTYwtQivxJiI6dFB4zlx1O
 jq6R4YeVDpdnClFW+ekJnZj+ANttfLdWna0Yiqt6Op9vxyMqdrbt1X/bO
 ah02HW8bueEd1aj5+TbQqFLViHKE3zrocZxXpUbGumCo7A4mWQ/3SnBoD
 QSXUjBa3q8R9BMBPmbXTH9P4q4E1Q2nGI21vwxsQBbB8Eyf5Le3ehsKRA
 L5mMuJh25EFBdjUniQl2sJPtDEscHCf8RNJYYSR/NisKfvKJAOmFrfd/P
 v9EUEJ83Sov7ERPR5GYMIR97sYFvDK3zceAWbwZTCZdqhkd20y8LF9Qco A==;
X-CSE-ConnectionGUID: GgkQEdmXQO2KwwlZwFE7rg==
X-CSE-MsgGUID: FoWLKDtySI+BnK6FtvDFRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1918646"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1918646"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:15:42 -0700
X-CSE-ConnectionGUID: QHnDBuJ2Qom09s5OBcST6w==
X-CSE-MsgGUID: trqchbAiR62MX+OYww31Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5251617"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:15:41 -0700
Date: Thu, 29 Oct 2026 12:15:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t] tests/imagination: Add query Firmware information
 test
Message-ID: <20261029111525.w36iwhg3jdrue7we@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
References: <20261029-b4-fw_info-v1-1-0eb3c0969a7f@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029-b4-fw_info-v1-1-0eb3c0969a7f@imgtec.com>
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
On 2026-10-29 at 07:45:36 +0530, Brajesh Gupta wrote:
> Update pvr_dev_query test to include querying of Firmware
> information.
> 
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
> ---
> Add test for new Firmware information query subtype added to DEV_QUERY
> under upstream review https://patchwork.freedesktop.org/series/176800/.
> ---
>  include/drm-uapi/pvr_drm.h        | 21 +++++++++++++++++++++

Please split drm-uapi update to separate patch and give a commit
hash and description to which tree you are syncing, and if
it is not drm-next give also link at lore.kernel.org to change
in kernel.

Regards,
Kamil


>  tests/imagination/pvr_dev_query.c | 28 +++++++++++++++++++++++++---
>  2 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/pvr_drm.h b/include/drm-uapi/pvr_drm.h
> index ccf6c2112..1179c1e7d 100644
> --- a/include/drm-uapi/pvr_drm.h
> +++ b/include/drm-uapi/pvr_drm.h
> @@ -434,6 +434,21 @@ struct drm_pvr_dev_query_static_data_areas {
>  	struct drm_pvr_obj_array static_data_areas;
>  };
>  
> +/**
> + * struct drm_pvr_dev_query_fw_info - Container used to fetch information
> + * about the GPU Firmware like its version.
> + */
> +struct drm_pvr_dev_query_fw_info {
> +	/** @major_version: Major version of the Firmware. */
> +	__u16 major_version;
> +
> +	/** @minor_version: Minor version of the Firmware. */
> +	__u16 minor_version;
> +
> +	/** @_padding_4: Reserved. This field must be zeroed. */
> +	__u32 _padding_4;
> +};
> +
>  /**
>   * enum drm_pvr_dev_query - For use with &drm_pvr_ioctl_dev_query_args.type to
>   * indicate the type of the receiving container.
> @@ -476,6 +491,12 @@ enum drm_pvr_dev_query {
>  	 * a pointer to &struct drm_pvr_dev_query_static_data_areas.
>  	 */
>  	DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
> +
> +	/**
> +	 * @DRM_PVR_DEV_QUERY_FW_INFO_GET: The dev query args contain
> +	 * a pointer to &struct drm_pvr_dev_query_fw_info.
> +	 */
> +	DRM_PVR_DEV_QUERY_FW_INFO_GET,
>  };
>  
>  /**
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
> ---
> base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
> change-id: 20261029-b4-fw_info-269a74116374
> 
> Best regards,
> --  
> Brajesh Gupta <brajesh.gupta@imgtec.com>
> 
