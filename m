Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E4DCCA468
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 14:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24AF10E2C2;
	Tue, 30 Sep 2025 14:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMoNeHH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438AD10E2C2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759244032; x=1790780032;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6Zlc7wMYa6qu+OEh1fgCznZnwK0eEIGw8LiqMwuMDLs=;
 b=WMoNeHH9atbqI7H7Ov/KiBjqjagxu/9P91yhHDMjwVL23/wqft8acXMv
 XJ/YMDfsLneZjgeSDy+pMcydp+LgHyxcYivmjhFTEmTHUmesqSkKwA6VF
 eLO99NFdSjfNqY/yD2aTApMzjk3DLbsXyBcc/qDP4DkJe2PzX7Cw2HFJW
 0/LuU1LC26U5WLXIhKkTPP7+ZK0KX/HZKpw0jDJ16to9/FH9Q5DW0eQhw
 14C/9qhxPg+8YlaDjchRvd4d3Hfrj2YtfbfMUZiE42I/aGEvswaOlJKeL
 jopfpsx5bwMGBlAtkzUOWn3JmbxYmvjf+sbxOcWqiXK+3+0HKLvP4ZSmX A==;
X-CSE-ConnectionGUID: NrbMXrWkQ9aN4Pzw/qNKoA==
X-CSE-MsgGUID: FwyfEF/ASwWbwh7MnJ0/CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65360033"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="65360033"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:53:52 -0700
X-CSE-ConnectionGUID: aW+eQ6vHTIeCoHqaOieziQ==
X-CSE-MsgGUID: Lip+osLDQ1Gr21hT6ZpHLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178119916"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.161])
 ([10.245.244.161])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:53:51 -0700
Message-ID: <f009b350-003c-4dde-b00c-3c0a9fa32671@intel.com>
Date: Tue, 30 Sep 2025 15:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/xe_pat: Use blitter to copy to uc-comp
 surface
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>
References: <20250930143130.186193-4-zbigniew.kempczynski@intel.com>
 <20250930143130.186193-6-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250930143130.186193-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 30/09/2025 15:31, Zbigniew Kempczyński wrote:
> Writing to uc-comp surface with cpu mapping is out-of-spec and might
> lead to weird effects like not decompressing previously compressed
> (during eviction) surface.
> 
> Specification requires to use blitter to write data to such compressed
> surface. Use bounce buffer and blit from it to uc-compressed source buffer
> used in render-copy.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5507
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_pat.c | 35 ++++++++++++++++++++++++++++++-----
>   1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 8bb0ac167d..59dfb6b111 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -23,8 +23,14 @@
>   #include "xe/xe_query.h"
>   #include "xe/xe_util.h"
>   
> +#define XE_COH_NONE          1
> +#define XE_COH_AT_LEAST_1WAY 2
> +
>   static bool do_slow_check;
>   
> +static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
> +			      bool force_cpu_wc);
> +
>   /**
>    * SUBTEST: userptr-coh-none
>    * Test category: functionality test
> @@ -419,8 +425,30 @@ static void pat_index_render(struct xe_pat_param *p)
>   	}
>   
>   	/* Write some values from the CPU, potentially dirtying the CPU cache */
> -	for (i = 0; i < size / sizeof(uint32_t); i++)
> -		p->r1_map[i] = i;
> +	if (p->r1_compressed) {
> +		uint32_t tmp_bo;
> +		uint32_t *tmp_map;
> +		uint32_t tmp_region = system_memory(fd);
> +		uint8_t tmp_pat_index = intel_get_pat_idx_wb(fd);
> +
> +		tmp_bo = create_object(fd, tmp_region, size,
> +				       XE_COH_AT_LEAST_1WAY, false);
> +		tmp_map = xe_bo_map(fd, tmp_bo, size);
> +
> +		for (i = 0; i < size / sizeof(uint32_t); i++)
> +			tmp_map[i] = i;
> +
> +		xe_fast_copy(fd,
> +			     tmp_bo, tmp_region, tmp_pat_index,
> +			     p->r1_bo, p->r1, p->r1_pat_index,
> +			     size);
> +
> +		munmap(tmp_map, size);
> +		gem_close(fd, tmp_bo);
> +	} else {
> +		for (i = 0; i < size / sizeof(uint32_t); i++)
> +			p->r1_map[i] = i;
> +	}
>   
>   	/* And finally ensure we always see the CPU written values */
>   	render_copy(ibb,
> @@ -867,9 +895,6 @@ static uint8_t get_pat_idx_wb(int fd, bool *compressed)
>   	return intel_get_pat_idx_wb(fd);
>   }
>   
> -#define XE_COH_NONE          1
> -#define XE_COH_AT_LEAST_1WAY 2
> -
>   struct pat_index_entry {
>   	uint8_t (*get_pat_index)(int fd, bool *compressed);
>   	uint8_t pat_index;

