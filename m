Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0300CD3B7EA
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 16:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A9310E152;
	Mon,  8 Dec 2025 16:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awAmZAe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9250210E056
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765212497; x=1796748497;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dtn8s1LdMrHujdalmRv6LsVe74CRno7Tbo/A41ucM1E=;
 b=awAmZAe4qGhuWLcQbYOSRpqLxb7wUHQPtJ2tTTjeHMV4GCg4NSS34vwG
 N73s8FosBAK83LcHa3t9eLc1uVMIQZrLY/kStkrboixJQuNR97l+AUjRL
 mEi67lW9xhy1O/KtaCUaKO/X7timi3CiI44fMAOnsgh/i9blxMEfONAQN
 YX0avrmFBHy2GoN5I7wHqImqqGrOV51mnv4s6sivfNG+9KOEBTrT4059A
 97jYrA93hTEi9aNBfibvzelpO+AzPLT7+B++E3U8mAlf2TqBxJ7DHbUUK
 rxBxQjew2Xk+hiGM7gXBRWMmSSGGr9UOQ3Nc0Fofna+1TvBnQlUqnEACf g==;
X-CSE-ConnectionGUID: 8f8DxD8/SEug9fLXEHHNBA==
X-CSE-MsgGUID: AZ9nll2MQe6bPD7YHHsvVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67088872"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67088872"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 08:48:17 -0800
X-CSE-ConnectionGUID: 84tkb7SIQFikrPSYYek0NQ==
X-CSE-MsgGUID: bzb8wgMaRymL9WiZroBtIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="195588005"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.44])
 ([10.245.245.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 08:48:15 -0800
Message-ID: <3a75364c-528c-4298-aed6-03965e29647e@intel.com>
Date: Mon, 8 Dec 2025 16:48:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tests/intel/xe_pat: sync with Xe PAT debugfs parser
To: Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com
References: <20251113070502.2148615-1-x.wang@intel.com>
 <20251206011241.67825-1-x.wang@intel.com>
 <20251206011241.67825-2-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251206011241.67825-2-x.wang@intel.com>
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

On 06/12/2025 01:12, Xin Wang wrote:
> Pull in the Xe PAT table parsed by lib/intel_pat so Gen20+ tests

Nit: s/Gen20/graphics vesion 20+/ or just xe2+. We stopped using the 
"gen" terminology on modern hw, and moved to the ip version stuff.

> use the driver-provided entries instead of hard-coded reservations.
> 
> CC: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   tests/intel/xe_pat.c | 38 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 59dfb6b11..b911e9cbf 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -77,6 +77,18 @@ static void userptr_coh_none(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +#define BITS_TO(n)		(n >= sizeof(long) * 8 ? ~0 : (1UL << (n)) - 1)
> +#define BITMASK(high, low)	(uint32_t)(BITS_TO(high+1) & ~BITS_TO(low))
> +#define FIELD_GET(val, high, low)	(((val) & (BITMASK(high, low))) >> (low))
> +#define FIELD_GET_BIT(val, n)		FIELD_GET(val, n, n)
> +
> +#define XE_NO_PROMOTE(val)	FIELD_GET_BIT(val, 10)
> +#define XE_COMP_EN(val)		FIELD_GET_BIT(val, 9)
> +#define XE_L3_CLOS(val)		FIELD_GET(val, 7, 6)
> +#define XE_L3_POLICY(val)	FIELD_GET(val, 5, 4)
> +#define XE_L4_POLICY(val)	FIELD_GET(val, 3, 2)
> +#define XE_COH_MODE(val)	FIELD_GET(val, 1, 0)
> +
>   /**
>    * SUBTEST: pat-index-all
>    * Test category: functionality test
> @@ -86,6 +98,7 @@ static void pat_index_all(int fd)
>   {
>   	uint16_t dev_id = intel_get_drm_devid(fd);
>   	size_t size = xe_get_default_alignment(fd);
> +	struct xe_pat_entry xe_pat_table[XE_PAT_MAX_ENTRIES] = {0};
>   	uint32_t vm, bo;
>   	uint8_t pat_index;
>   
> @@ -114,10 +127,31 @@ static void pat_index_all(int fd)
>   
>   	igt_assert(intel_get_max_pat_index(fd));
>   
> +	if (intel_gen(dev_id) >= 20) {

s/intel_gen/intel_graphics_ver/

> +		/* Get the Xe PAT entries from debugfs */
> +		uint8_t pat_entries = xe_get_pat_entries(fd, xe_pat_table);
> +
> +		for (int i = 0; i < pat_entries; i++) {
> +			uint32_t pat = xe_pat_table[i].pat;
> +			igt_debug("PAT[%2d] = [ %u, %u, %u, %u, %u, %u]  (%#8x)%s\n", i,
> +				  XE_NO_PROMOTE(pat),
> +				  XE_COMP_EN(pat),
> +				  XE_L3_CLOS(pat),
> +				  XE_L3_POLICY(pat),
> +				  XE_L4_POLICY(pat),
> +				  XE_COH_MODE(pat),
> +				  pat,
> +				  xe_pat_table[i].rsvd ? " *" : "");
> +		}
> +	}
> +
>   	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
>   	     pat_index++) {
> -		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
> -		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
> +
> +		bool hw_reserved = intel_gen(dev_id) >= 20 ?

intel_graphics_ver

Otherwise lgtm. This should make things easier to maintain going 
forward. Thanks for working on this,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +			      xe_pat_table[pat_index].rsvd : false;
> +
> +		if (hw_reserved) {
>   			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>   						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>   						   pat_index, 0),

