Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CD5CD5828
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 10:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E02710E589;
	Wed,  7 Jan 2026 10:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/2m+LkS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F2910E589
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 10:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767780063; x=1799316063;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=BzqCFcMnCEOscckPCWZNG5Wa7p2hGwHLluKxj89g+TE=;
 b=f/2m+LkSJvWFnbCY1cnYhdP/7OgRpV9Q5UXfNF2laHx9hdbTjVeYpFKR
 mEoAGZHy3cUSSxA5dhK7DteSS6gv0U6XavLOrjVE2ug2RWF2ifCaC8W+9
 ZUHcUo3YbzdshKi089gtnAYvP/wcza+6+D5IxDoHTzCcwmcH6TiDAAcH7
 Az0QXkxHrnCqBsfK2TbjB/MuPcqXh5Ft53N8C8753cdVYBBJ/rVrwnQ++
 B4Tbs3WRi4oFSu1/jECzf3Ry2dCeIHHmtTGlI1KRgDvReIDbWFThaZyXf
 HKTBK7D63R4DkcL9BHvyV3Aq4d4UCwfvoKrDqEbQiDJfaosOXlFdkXm2B A==;
X-CSE-ConnectionGUID: Lny6miabSveeBI8oDTLS1A==
X-CSE-MsgGUID: /VPLxcrSR+C5LAZDHJtxqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79865434"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="79865434"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:01:03 -0800
X-CSE-ConnectionGUID: vqAEOiKCRomvFqYDyG30lQ==
X-CSE-MsgGUID: otYe0M4eTrSG8+L75q90BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202944310"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.132])
 ([10.245.245.132])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:01:02 -0800
Message-ID: <75c0e673-8285-4447-accf-b5b4f7c049dc@intel.com>
Date: Wed, 7 Jan 2026 10:01:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] tests/xe_pat: add prime-external-import-comp PAT test
To: Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org
References: <20260107052406.21678-1-x.wang@intel.com>
 <20260107052406.21678-3-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260107052406.21678-3-x.wang@intel.com>
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
> Add a xe_pat subtest that imports a vgem dma-buf into Xe and
> verifies that binding it with any compression-enabled PAT index
> is rejected with -EINVAL.
> 
> Also keep a WB sanity bind to ensure imports still work with
> non-compressed caching.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Nit: I think commit title should usually have "intel" for intel specific 
tests. Ditto on the other patches.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_pat.c | 74 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 5ad4922dd..8af6ad174 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -831,6 +831,77 @@ static void prime_external_import_coh(void)
>   	drm_close_driver(fd2);
>   }
>   
> +/**
> + * SUBTEST: prime-external-import-comp
> + * Test category: functionality test
> + * Description: Validate that imported dma-bufs cannot be bound with a PAT index
> + * that enables compression (expected to fail with -EINVAL).
> + */
> +static void prime_external_import_comp(void)
> +{
> +	uint16_t dev_id;
> +	struct intel_pat_cache pat_sw_config = {};
> +	int32_t parsed;
> +	struct vgem_bo vgem_bo = {};
> +	int fd_vgem, fd_xe;
> +	int dma_buf_fd;
> +	uint32_t handle_import;
> +	uint32_t vm;
> +	int bpp = 32;
> +	int size;
> +
> +	fd_vgem = drm_open_driver(DRIVER_VGEM);
> +	fd_xe = drm_open_driver(DRIVER_XE);
> +
> +	dev_id = intel_get_drm_devid(fd_xe);
> +	igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
> +
> +	parsed = xe_fetch_pat_sw_config(fd_xe, &pat_sw_config);
> +
> +	vgem_bo.width = 1024;
> +	vgem_bo.height = 512;
> +	vgem_bo.bpp = bpp;
> +	vgem_create(fd_vgem, &vgem_bo);
> +
> +	size = vgem_bo.width * vgem_bo.height * bpp / 8;
> +
> +	dma_buf_fd = prime_handle_to_fd(fd_vgem, vgem_bo.handle);
> +	handle_import = prime_fd_to_handle(fd_xe, dma_buf_fd);
> +
> +	vm = xe_vm_create(fd_xe, 0, 0);
> +
> +	for (int i = 0; i < parsed; i++) {
> +		uint32_t pat;
> +		bool compressed;
> +		int ret;
> +
> +		if (pat_sw_config.entries[i].rsvd)
> +			continue;
> +		pat = pat_sw_config.entries[i].pat;
> +		compressed = !!(pat & XE2_COMP_EN);
> +		if (!compressed)
> +			continue;
> +		ret = __xe_vm_bind(fd_xe, vm, 0, handle_import, 0, 0x40000,
> +				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> +				   i, 0);
> +		xe_vm_unbind_sync(fd_xe, vm, 0, 0x40000, size);
> +		igt_assert_eq(ret, -EINVAL);
> +	}
> +
> +	/* Sanity: non-compressed WB should still be accepted for imports. */
> +	igt_assert_eq(__xe_vm_bind(fd_xe, vm, 0, handle_import, 0, 0x40000,
> +			   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> +			   intel_get_pat_idx_wb(fd_xe), 0),
> +		      0);
> +	xe_vm_unbind_sync(fd_xe, vm, 0, 0x40000, size);
> +
> +	xe_vm_destroy(fd_xe, vm);
> +	close(dma_buf_fd);
> +
> +	drm_close_driver(fd_vgem);
> +	drm_close_driver(fd_xe);
> +}
> +
>   static bool has_no_compression_hint(int fd)
>   {
>   	struct drm_xe_query_config *config = xe_config(fd);
> @@ -1384,6 +1455,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   	igt_subtest("prime-external-import-coh")
>   		prime_external_import_coh();
>   
> +	igt_subtest("prime-external-import-comp")
> +		prime_external_import_comp();
> +
>   	igt_subtest("bo-comp-disable-bind")
>   		bo_comp_disable_bind(fd);
>   

