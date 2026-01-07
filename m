Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3757CD5822
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 09:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9464910E589;
	Wed,  7 Jan 2026 09:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A04BQRxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC3F10E589
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767779836; x=1799315836;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=P2CeOzbm6yutTKUAYFZZWI4P/VtmG8Rya82HODFbI/s=;
 b=A04BQRxhqNQF8ru8MDMta6t5sLQjVzYB15BRuPTxSDjrX+RnQJPfFTDe
 yohGHKyszV8Jy9cKQQUuiKwA9tEToIPGHgzlKnEbJYHUPiLYDpKJdOk1m
 vssCax1p16lE9lbZb/ihtRwq03+mH0LlZTOlONPhOIy12iSdScoENu7YW
 DIBKFiUBAtOqNfI4U8sSWx92/kQlCgGbiEBRxzuwhdPFqK/1OTxz2wPmk
 TIpmtP0zJtJbtKl/Vmq1pIJg1YoIhXO0/cXUjJlWe3GYSSNqYlFkTtjP4
 hP83s7nRzcyBkRq5VG7/O1fJH+4DSsErpzZkX2pVAkQeoPkIG9M27SBcq A==;
X-CSE-ConnectionGUID: N1MOuFJeSza1XNtG3B7dtw==
X-CSE-MsgGUID: 9jqrzwukTbK70g7ktGrAAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79449874"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="79449874"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:57:15 -0800
X-CSE-ConnectionGUID: Xx0Pv2vuTiySIdP5PmsAug==
X-CSE-MsgGUID: W1LzwXduQWSTkX/WhcLW8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202943931"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.132])
 ([10.245.245.132])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:57:14 -0800
Message-ID: <d4b4ac09-591e-4a7b-8f79-78a20129034f@intel.com>
Date: Wed, 7 Jan 2026 09:57:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] tests/xe_pat: add userptr-comp PAT test
To: Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org
References: <20260107052406.21678-1-x.wang@intel.com>
 <20260107052406.21678-2-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260107052406.21678-2-x.wang@intel.com>
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
> Add a new xe_pat subtest that iterates the debugfs PAT table and
> validates that userptr bindings are rejected for PAT entries
> enabling compression and for COH_MODE_NONE entries.
> 
> Expected failures return -EINVAL.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Nit: I think commit title should be "tests/intel/xe_pat:"

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_pat.c | 61 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index a7f8ab088..5ad4922dd 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -887,6 +887,64 @@ static void bo_comp_disable_bind(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: userptr-comp
> + * Test category: functionality test
> + * Description: Validate that userptr mappings cannot be bound with a PAT index
> + * that enables compression (expected to fail with -EINVAL).
> + */
> +static void userptr_comp(int fd)
> +{
> +	size_t size = xe_get_default_alignment(fd);
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +	struct intel_pat_cache pat_sw_config = {};
> +	int32_t parsed;
> +	uint32_t vm;
> +	void *data;
> +
> +	igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
> +
> +	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
> +
> +	data = mmap(0, size, PROT_READ | PROT_WRITE,
> +		    MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(data != MAP_FAILED);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	for (int i = 0; i < parsed; i++) {
> +		uint32_t pat;
> +		uint32_t coh_mode;
> +		bool compressed;
> +		uint64_t va;
> +		int expected;
> +		int ret;
> +
> +		if (pat_sw_config.entries[i].rsvd)
> +			continue;
> +		pat = pat_sw_config.entries[i].pat;
> +		compressed = !!(pat & XE2_COMP_EN);
> +		coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat);
> +
> +		/* Spread VAs to keep each attempt independent. */
> +		va = 0x40000ull + (uint64_t)i * 0x200000ull;
> +
> +		if (compressed || coh_mode == COH_MODE_NONE)
> +			expected = -EINVAL;
> +		else
> +			expected = 0;
> +		ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), va,
> +				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
> +				   i, 0);
> +		igt_assert_eq(ret, expected);
> +		if (!ret)
> +			xe_vm_unbind_sync(fd, vm, 0, va, size);
> +	}
> +
> +	munmap(data, size);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   /**
>    * SUBTEST: display-vs-wb-transient
>    * Test category: functionality test
> @@ -1317,6 +1375,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   	igt_subtest("userptr-coh-none")
>   		userptr_coh_none(fd);
>   
> +	igt_subtest("userptr-comp")
> +		userptr_comp(fd);
> +
>   	igt_subtest("prime-self-import-coh")
>   		prime_self_import_coh();
>   

