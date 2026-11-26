Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85166606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gpbQy7gh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB7D1125BD;
	Thu, 26 Nov 2026 16:36:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5595410EA07
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795710907; x=1827246907;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gWAufEkYV52gvKUeRGF1iPv27j25/9W9HwEmQKmIrpQ=;
 b=gpbQy7gh3ZsGC6Z/aacqEUwjOUIvUFSGeDYz5rMxMwycPZmfKkqKQ0Zx
 2hIPAyeX+dS9KgnQ+vxFBhRB8uxXuOTCP/rjaMlYDCFy6KAY1losuAoxe
 izTbU1PXYbTonxBLQ5I4v4fblG1j3ZHOjdP2fiRVpeUcF4notyuRFJJnf
 qSTu923NDUTP3mxQC9eRe0z3/GYs7v9peEPS5R2aQH+KvIjf6+dcBZo+E
 mmmIlpeCjvJW/qRQazwj9PKPAMpLbwOwKVH+GnTsxfpy2/NrJ6ahht3HD
 90OHa8c4r/sflHHCdnL/7P+V0xI7Zn8mW/aLPqwv9oJ2Sc86HohslS5AX Q==;
X-CSE-ConnectionGUID: giXrDPn0SG2OWkzqRxPK3g==
X-CSE-MsgGUID: 544F1pa+Q76XwnxFpH9l3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4714519"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4714519"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:35:06 -0800
X-CSE-ConnectionGUID: kX7WBXO/RUivqAfnl0K7bA==
X-CSE-MsgGUID: e/m7KX+JRkajYLQnaxfQ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12814835"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 08:35:04 -0800
Date: Thu, 26 Nov 2026 17:35:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: igt-dev@lists.freedesktop.org, ravi.kishore.koppuravuri@intel.com, 
 zbigniew.kempczynski@intel.com, maarten.lankhorst@intel.com,
 alexander.usyskin@intel.com, 
 anshuman.gupta@intel.com, soham.purkait@intel.com, riana.tauro@intel.com, 
 nishit.sharma@intel.com
Subject: Re: [PATCH i-g-t 3/6] drm-uapi/xe: Sync with DRM RAS uapi updates
Message-ID: <kt77lm75mcjungzzwkwy3ncbfl2xgyxdlgommvopqgkdxchode@yzhqgisrudor>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Harish Chegondi <harish.chegondi@intel.com>, igt-dev@lists.freedesktop.org, 
 ravi.kishore.koppuravuri@intel.com, zbigniew.kempczynski@intel.com,
 maarten.lankhorst@intel.com, 
 alexander.usyskin@intel.com, anshuman.gupta@intel.com, soham.purkait@intel.com,
 riana.tauro@intel.com, nishit.sharma@intel.com
References: <cover.1795677252.git.harish.chegondi@intel.com>
 <366be0c5c9a41173f9e3507de39e9a1a6fe28a95.1795677252.git.harish.chegondi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <366be0c5c9a41173f9e3507de39e9a1a6fe28a95.1795677252.git.harish.chegondi@intel.com>
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

Hi Harish,
On 2026-11-25 at 23:46:43 -0800, Harish Chegondi wrote:
> Align with kernel commit cdeb5e248de11537
> ("drm/xe/uapi: Add additional error components to xe drm_ras").
> 

Can you sync with latest drm-next? I checked today with

git log --oneline -- include/uapi/drm/xe_drm.h

69183b706206 drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
88064894bcce drm/xe/vm: Add srcid to xe_vm_get_property_ioctl fault report
3a8bfa1f2af7 drm/xe: Documentation: fix chars used for subsection
cdeb5e248de1 drm/xe/uapi: Add additional error components to xe drm_ras
5150b57dacf9 drm/xe/uapi: Fix doc formatting and completeness in xe_drm.h
96cc9d79df5f drm/xe/uapi: Fix code examples in xe_drm.h documentation
4bd87e7c4d46 drm/xe/uapi: Fix kernel-doc cross-reference syntax in xe_drm.h
ea842c235828 drm/xe/uapi: Fix wrong names and references in xe_drm.h
65d53c13d43b drm/xe/uapi: Fix grammar errors in xe_drm.h documentation
3233db7682e7 drm/xe/uapi: Fix typos and spelling errors in xe_drm.h documentation

For a way to write description please look into igt
commit a31c48a76e8849084afd70331484a019d55d82f8
("drm-uapi/xe: sync with kernel f99a05cc0b85")


Regards,
Kamil

> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 5a96a7910..b07f1ef4a 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -2589,6 +2589,12 @@ enum drm_xe_ras_error_component {
>  	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
>  	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
>  	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
> +	/** @DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY: Device Memory Error */
> +	DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY,
> +	/** @DRM_XE_RAS_ERR_COMP_PCIE: PCIe Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_PCIE,
> +	/** @DRM_XE_RAS_ERR_COMP_FABRIC: Fabric Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_FABRIC,
>  	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
>  	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
>  };
> @@ -2606,7 +2612,10 @@ enum drm_xe_ras_error_component {
>   */
>  #define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
>  	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
> -	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal",		\
> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY] = "device-memory",		\
> +	[DRM_XE_RAS_ERR_COMP_PCIE] = "pcie",				\
> +	[DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",			\
>  }
>  
>  #if defined(__cplusplus)
> -- 
> 2.43.0
> 
