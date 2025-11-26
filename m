Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0972FD10F5F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 14:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C8D10E654;
	Wed, 26 Nov 2025 14:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgqhrxLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7367310E654
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764169109; x=1795705109;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SpGUrpMlvujSr154RsEliob+ftDaQv8OMHHFVkAtlV4=;
 b=WgqhrxLmS9AGBLRV5jQbi/RgglQ/iYoV6W7T8YERQc2HX9yTOxiG+U/V
 WAYaGwIoF823qyIe7tNk92ahUuW4xhu2lDVZW6dtMzNJ7zMAGPlgDyqGW
 R1iasusKlu4rORHkp52VPP+FM0xoMTCajTjB/CYOP/pcmUUcOuLtdWa2i
 V7J0rdVbaa/KRm8+QexFLdhAGwrdNSTqPFt3+4V2jZhUlCearshSShb4a
 uV5ZY+rT/WMnQ+Y1lxIeC8MvVLyRB6bMKt+mKbr/93tfCpkjCrfSsHYm9
 KYkubsQBiW3yGKhZKFpmIOZ9wLiUF4p43vexQaeiTKuwLP1yBWb0fGQvD Q==;
X-CSE-ConnectionGUID: aeHPB0VhTPSSW51XAuIY7g==
X-CSE-MsgGUID: vCpIb3f0Rj++cK1olI56wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65211984"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="65211984"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:58:28 -0800
X-CSE-ConnectionGUID: OVV7keJkSY2zKZMpeLwbNA==
X-CSE-MsgGUID: pdVbhXHNQqePVr++vGm8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="193387638"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.143])
 ([10.245.245.143])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:58:27 -0800
Message-ID: <31fbe014-f133-49de-a84f-6e02ba88df18@intel.com>
Date: Wed, 26 Nov 2025 14:58:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_pat: Add subtest to validate
 NO_COMPRESSION flag
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, igt-dev@lists.freedesktop.org
References: <20251126141634.309190-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251126141634.309190-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/11/2025 14:16, Sanjay Yadav wrote:
> Add bo-comp-disable-bind subtest to verify that a BO created with
> DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION cannot be bind with a compressed
> PAT index on Xe2+ (bind should fail with -EINVAL).
> 
> This ensures the flag works as intended to skip CCS operations and
> related state management for such BOs.
> 
> v2: (Matt A)
> - Added has_no_compression_hint() helper to query device capability
> - Improved skip logic for unsupported platforms
> 
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   .../drm-uapi-experimental/intel_drm_local.h   |  3 +
>   tests/intel/xe_pat.c                          | 59 +++++++++++++++++++
>   2 files changed, 62 insertions(+)
> 
> diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
> index b48c9e219..9949d5350 100644
> --- a/include/drm-uapi-experimental/intel_drm_local.h
> +++ b/include/drm-uapi-experimental/intel_drm_local.h
> @@ -20,6 +20,9 @@ extern "C" {
>    * clean these up when kernel uapi headers are sync'd.
>    */
>   
> +#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION (1 << 3)
> +#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 59dfb6b11..fe4238529 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -753,6 +753,62 @@ static void prime_external_import_coh(void)
>   	drm_close_driver(fd2);
>   }
>   
> +static bool has_no_compression_hint(int fd)
> +{
> +	struct drm_xe_query_config *config = xe_config(fd);
> +
> +	return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
> +}
> +
> +/**
> + * SUBTEST: bo-comp-disable-bind
> + * Test category: functionality test
> + * Description: Validates that binding a BO created with
> + * the NO_COMPRESSION flag using a compressed PAT index fails
> + * with -EINVAL on Xe2+ platforms.
> + */
> +
> +static void bo_comp_disable_bind(int fd)
> +{
> +	size_t size = xe_get_default_alignment(fd);
> +	uint8_t comp_pat_index, uncomp_pat_index;
> +	bool supported;
> +	uint32_t vm, bo;
> +	int ret;
> +
> +	supported = has_no_compression_hint(fd);
> +	ret = __xe_bo_create_caching(fd, 0, size, vram_if_possible(fd, 0),
> +				     DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION,
> +				     DRM_XE_GEM_CPU_CACHING_WC, &bo);
> +
> +	if (!supported) {
> +		igt_assert_neq(ret, 0);
> +		igt_skip("Missing NO_COMPRESSION support, skipping.\n");
> +	}
> +
> +	igt_assert_eq(ret, 0);
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	comp_pat_index = intel_get_pat_idx_uc_comp(fd);
> +	uncomp_pat_index = intel_get_pat_idx_uc(fd);
> +
> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
> +				   size, 0, 0, NULL, 0,
> +				   0, comp_pat_index, 0),
> +		      -EINVAL);
> +
> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
> +				   size, 0, 0, NULL, 0,
> +				   0, uncomp_pat_index, 0),
> +		      0);
> +	xe_vm_unbind_sync(fd, vm, 0, 0x100000, size);
> +
> +	gem_close(fd, bo);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   /**
>    * SUBTEST: display-vs-wb-transient
>    * Test category: functionality test
> @@ -1185,6 +1241,9 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   	igt_subtest("prime-external-import-coh")
>   		prime_external_import_coh();
>   
> +	igt_subtest("bo-comp-disable-bind")
> +		bo_comp_disable_bind(fd);
> +
>   	igt_subtest_with_dynamic("pat-index-xelp") {
>   		igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
>   		subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,

