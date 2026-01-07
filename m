Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A7ECD5822
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 10:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2567B10E081;
	Wed,  7 Jan 2026 10:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsmP2Qhu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C3110E081
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767781069; x=1799317069;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SRtgeH77ZkKZ3QdUsZ9Ri5e/maKpFUZKfT/T9z4ajGM=;
 b=ZsmP2QhupoyYs7YtMeeNwUQpGrtngJXUeRSTL5cydXAb2W7YwrFJAYfp
 Qv1nRmFBpYKDcyF/7NH6D2ipVVyuXriLt9ySma+4FFStt1cUHVZUEXWN3
 I5V4WcFnUmqy+l4VKh6tZqJc8Dakeo6Bc4j9Y5njk1rYCLsyggs8fR8oU
 qxT1QB2P8ekST9QsZ/aRgPfk/oUB2sRO7bNnUOgx9I9PkvPuU8WGaYjdR
 xGJyHmyBPkg66yU+mAa1fI0sgWhE4Kj0M8zbPoEOFqnWsjaoSjevdGZln
 jinOQKU4D2pC58q7SUGGuqD494kC9uHw76gYIF0NtxwjI5ua/Bio/gofk w==;
X-CSE-ConnectionGUID: tp4o6dSxTPmoVzt88uC0IQ==
X-CSE-MsgGUID: pblNhSUjQ/O7vqwXulUB2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69197647"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="69197647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:17:49 -0800
X-CSE-ConnectionGUID: QGxwOWOgSvu36PMm9rJSew==
X-CSE-MsgGUID: V4vX6whaRT2kTiapD+gu+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="240374844"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.132])
 ([10.245.245.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:17:48 -0800
Message-ID: <cacc459b-f946-4f8a-9c7a-4a152dc07284@intel.com>
Date: Wed, 7 Jan 2026 10:17:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/xe_pat: add bo-wb-comp-1way-bind PAT test
To: Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org
References: <20260107052406.21678-1-x.wang@intel.com>
 <20260107052406.21678-4-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260107052406.21678-4-x.wang@intel.com>
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

On 07/01/2026 05:24, Xin Wang wrote:
> Add a xe_pat subtest that looks up a WB+compression+1way PAT entry
> from the debugfs PAT table and validates that binding a WB-cached
> BO with that PAT index succeeds on Xe3+.
> 
> Skip the test when the platform doesn't expose a suitable PAT entry.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   tests/intel/xe_pat.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 8af6ad174..2c98acd2c 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -112,6 +112,43 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
>   	return parsed;
>   }
>   
> +static bool find_wb_comp_1way_pat_index(int fd, uint8_t *pat_index_out)
> +{
> +	struct intel_pat_cache pat_sw_config = {};
> +	int32_t parsed;
> +	int i;
> +
> +	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
> +
> +	for (i = 0; i < parsed; i++) {
> +		uint32_t pat = pat_sw_config.entries[i].pat;
> +
> +		if (pat_sw_config.entries[i].rsvd)
> +			continue;
> +
> +		if (!(pat & XE2_COMP_EN))
> +			continue;
> +
> +		if (REG_FIELD_GET(XE2_COH_MODE, pat) != COH_MODE_1WAY)
> +			continue;
> +
> +		if (REG_FIELD_GET(XE2_L3_POLICY, pat) != L3_CACHE_POLICY_WB)
> +			continue;
> +
> +		/*
> +		 * Matches Xe3 compressed+coherent entry (see kernel xe3_lpg_pat_table[16]).
> +		 * Note: L4 policy is UC in that entry.
> +		 */
> +		if (REG_FIELD_GET(XE2_L4_POLICY, pat) != L4_CACHE_POLICY_UC)
> +			continue;
> +
> +		*pat_index_out = i;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>   /**
>    * SUBTEST: pat-sanity
>    * Test category: functionality test
> @@ -958,6 +995,42 @@ static void bo_comp_disable_bind(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: bo-wb-comp-1way-bind
> + * Test category: functionality test
> + * Description: Validate binding a WB-cached BO using a WB+compression+1way PAT
> + * index (as advertised by the debugfs PAT table) succeeds. Skip if the
> + * platform doesn't expose such a PAT entry.
> + */
> +static void bo_wb_comp_1way_bind(int fd)
> +{
> +	size_t size = xe_get_default_alignment(fd);
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +	uint8_t wb_comp_pat_index;
> +	bool supported;
> +	uint32_t vm, bo;
> +	int ret;
> +
> +	igt_require(intel_get_device_info(dev_id)->graphics_ver >= 30);
> +
> +	supported = find_wb_comp_1way_pat_index(fd, &wb_comp_pat_index);
> +	igt_require_f(supported, "No WB+compression+1way PAT index found, skipping.\n");
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo = xe_bo_create_caching(fd, 0, size, system_memory(fd), 0,
> +				  DRM_XE_GEM_CPU_CACHING_WB);
> +
> +	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
> +			  size, 0, 0, NULL, 0,
> +			  0, wb_comp_pat_index, 0);

I think we also need something that actually uses and validates 
compression with cpu:wb from hw pov (which is a significant change), 
similar to what we do with other interesting PAT modes and adding them 
to pat_index_modes[], and then hitting them with blit, render-copy etc. 
Otherwise only testing the software bind interface is big test coverage 
gap IMO.

I think you were reworking the pat_index_modes stuff somewhere else, so 
it might change a bit but in the meantime I think we really need to have 
at least something trigger the hw flow with this new mode in this 
series. Or does that already exist and I missed it? What are your 
thoughts here?

> +
> +	igt_assert_eq(ret, 0);
> +	xe_vm_unbind_sync(fd, vm, 0, 0x100000, size);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   /**
>    * SUBTEST: userptr-comp
>    * Test category: functionality test
> @@ -1461,6 +1534,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   	igt_subtest("bo-comp-disable-bind")
>   		bo_comp_disable_bind(fd);
>   
> +	igt_subtest("bo-wb-comp-1way-bind")
> +		bo_wb_comp_1way_bind(fd);
> +
>   	igt_subtest_with_dynamic("pat-index-xelp") {
>   		igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
>   		subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,

