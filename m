Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D7AC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 14:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0266310E757;
	Wed, 21 Feb 2024 14:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htLsyILQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CCC10E757
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 14:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708525018; x=1740061018;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ioZdo8AhyAPLb0B9f7uzr5YUrJmG0jg8QfG50P67Ay4=;
 b=htLsyILQ3e9hFerpIAOITyR3PnUQ6lBTq7pnrXfuWgTK8EMkKEO+m0ah
 a7vJY3LSWCErdTcPXtipUz0WSRPtCdU7aCOORkWCR+Eym0IrH7k81Myn0
 EG+DL70dwT/6CpxUlJtr4CzHR6Tl4zqBsl7ktZQLP6fkU+gIh54Hfcwhn
 X93ToNUg95dvNB8dVd3YLHMSXfkTNyOBXkJfAlzPhiaYRHIeVPTWxTSYz
 gzPbiY8fyIk3H9M0Xz3WT1miAtv6ddzUjwsdCmT5iQyNDbooQoU4Nx57a
 pc6ME6SoHP4mo43AbtM8qZMKgnWtSEVIhfLvcWYvJDD0s6U1V2E0eQssq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="25148812"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="25148812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:16:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="28298064"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 06:16:56 -0800
Date: Wed, 21 Feb 2024 15:16:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t, v4 1/2] drm-uapi/xe: Add test to query GuC
 firmware submission version
Message-ID: <20240221141653.kqwvqbmgkated33b@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 igt-dev@lists.freedesktop.org,
 John Harrison <John.C.Harrison@Intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240221135033.7-1-francois.dugast@intel.com>
 <20240221135033.7-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221135033.7-2-francois.dugast@intel.com>
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

Hi Francois,
On 2024-02-21 at 13:50:32 +0000, Francois Dugast wrote:
> This aligns with kernel commit ("drm/xe: Add uAPI to query GuC firmware
> submission version").
> 

Could you give link to lore.kernel.org with kernel patch?
Here and in second patch for HuC.

Regards,
Kamil

> v2: Print branch first, use memset to zero the query (John Harrison)
> 
> v3: Update header to match the KMD version with branch first (John Harrison)
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 31 +++++++++++++
>  tests/intel/xe_query.c    | 92 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 123 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index bacdca787..745637a04 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -574,6 +574,36 @@ struct drm_xe_query_engine_cycles {
>  	__u64 cpu_delta;
>  };
>  
> +/**
> + * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
> + *
> + * Given a uc_type this will return the branch, major, minor and patch version
> + * of the micro-controller firmware.
> + */
> +struct drm_xe_query_uc_fw_version {
> +	/** @uc_type: The micro-controller type to query firmware version */
> +#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
> +	__u16 uc_type;
> +
> +	/** @pad: MBZ */
> +	__u16 pad;
> +
> +	/** @branch_ver: branch uc fw version */
> +	__u32 branch_ver;
> +	/** @major_ver: major uc fw version */
> +	__u32 major_ver;
> +	/** @minor_ver: minor uc fw version */
> +	__u32 minor_ver;
> +	/** @patch_ver: patch uc fw version */
> +	__u32 patch_ver;
> +
> +	/** @pad2: MBZ */
> +	__u32 pad2;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved;
> +};
> +
>  /**
>   * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>   * structure to query device information
> @@ -643,6 +673,7 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
>  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
>  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> +#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>  	/** @query: The type of data to query */
>  	__u32 query;
>  
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 9a6799c84..bbe5955eb 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -730,6 +730,96 @@ static void test_engine_cycles_invalid(int fd)
>  	query_engine_cycles(fd, &ts);
>  }
>  
> +/**
> + * SUBTEST: query-uc-fw-version-guc
> + * Test category: functionality test
> + * Description: Display the GuC firmware submission version
> + *
> + * SUBTEST: multigpu-query-uc-fw-version-guc
> + * Test category: functionality test
> + * Sub-category: MultiGPU
> + * Description: Display GuC firmware submission version for all Xe devices.
> + */
> +static void
> +test_query_uc_fw_version_guc(int fd)
> +{
> +	struct drm_xe_query_uc_fw_version *uc_fw_version;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	uc_fw_version = malloc(query.size);
> +	igt_assert(uc_fw_version);
> +
> +	memset(uc_fw_version, 0, sizeof(*uc_fw_version));
> +	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
> +	query.data = to_user_pointer(uc_fw_version);
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
> +		 uc_fw_version->branch_ver,
> +		 uc_fw_version->major_ver,
> +		 uc_fw_version->minor_ver,
> +		 uc_fw_version->patch_ver);
> +	igt_assert(uc_fw_version->major_ver > 0 || uc_fw_version->minor_ver > 0);
> +
> +	free(uc_fw_version);
> +}
> +
> +/**
> + * SUBTEST: query-invalid-uc-fw-version-mbz
> + * Test category: functionality test
> + * Description: Check query with invalid arguments returns expected error code.
> + *
> + * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
> + * Test category: functionality test
> + * Sub-category: MultiGPU
> + * Description: Check query with invalid arguments for all Xe devices.
> + */
> +static void
> +test_query_uc_fw_version_invalid_mbz(int fd)
> +{
> +	struct drm_xe_query_uc_fw_version *uc_fw_version;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	uc_fw_version = malloc(query.size);
> +	igt_assert(uc_fw_version);
> +
> +	memset(uc_fw_version, 0, sizeof(*uc_fw_version));
> +	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
> +	query.data = to_user_pointer(uc_fw_version);
> +
> +	/* Make sure the baseline passes */
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	/* Make sure KMD rejects non-zero padding/reserved fields */
> +	uc_fw_version->pad = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	uc_fw_version->pad = 0;
> +
> +	uc_fw_version->pad2 = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	uc_fw_version->pad2 = 0;
> +
> +	uc_fw_version->reserved = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	uc_fw_version->reserved = 0;
> +
> +	free(uc_fw_version);
> +}
> +
>  igt_main
>  {
>  	const struct {
> @@ -743,10 +833,12 @@ igt_main
>  		{ "query-hwconfig", test_query_hwconfig },
>  		{ "query-topology", test_query_gt_topology },
>  		{ "query-cs-cycles", test_query_engine_cycles },
> +		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
>  		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
>  		{ "query-invalid-query", test_query_invalid_query },
>  		{ "query-invalid-size", test_query_invalid_size },
>  		{ "query-invalid-extension", test_query_invalid_extension },
> +		{ "query-invalid-uc-fw-version-mbz", test_query_uc_fw_version_invalid_mbz },
>  		{ }
>  	}, *f;
>  	int xe, gpu_count;
> -- 
> 2.34.1
> 
