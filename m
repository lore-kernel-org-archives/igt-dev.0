Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD0606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y50umfc0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624FB10FBE8;
	Wed, 28 Oct 2026 12:26:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A02810FBE5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793190357; x=1824726357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9pY2Uuh0th7niKSFbiDswaabnaV3qNL6xBBm6vgZ69s=;
 b=Y50umfc0nE3KPVbzxWQtov8/P+6eDvIVufOshFt+1hNLDOhG1PrHitAa
 C23kCAYQ/p1wuQBswmnpmuwR3Yh4ySmf+BJ++3THYtFBiF62F+ZYmkk3S
 dvLUokOePqM5UxCn2E1kc5TKTMnM7Hx17XsBik7/ZVZqx2rRFmkEcsiQW
 1L/F+bASUqqfobCcXdbGVZfAmNheqYU/uJC9yvZQzoW277gZj2OmANNZ3
 zQzCL71/647VeGoGiW9Q473eraChqka6hcB71x3TXCHQaFAjG7wrCsBRt
 SZV1okyOtz2OrfTrV0l1d3Imp1JLZR9UWU1WNjFEVDeoUR9HSm0gdbsF9 g==;
X-CSE-ConnectionGUID: d0GBOS+5RJSK1sxZL9YqFw==
X-CSE-MsgGUID: Lr91cQTCS2SjNNPGOHBumA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1800858"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1800858"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:25:56 -0700
X-CSE-ConnectionGUID: I9n6YGiDTju6xbzARhUhwA==
X-CSE-MsgGUID: jYRIKCh3Rv2QlH4+6zbidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6645728"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:25:55 -0700
Date: Wed, 28 Oct 2026 13:25:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, arvind.yadav@intel.com,
 kamil.konieczny@intel.com, Jia Yao <jia.yao@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Skip unsupported
 PAT madvise indices
Message-ID: <20261028122535.the7nobqbeotvnei@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 arvind.yadav@intel.com, kamil.konieczny@intel.com,
 Jia Yao <jia.yao@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20261026052051.1472943-1-nishit.sharma@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026052051.1472943-1-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-10-26 at 05:20:51 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Skip PAT-index madvise subtests when the selected 2-way coherent index is
> rejected by the workaround, avoiding an assertion failure on
> affected platforms.
> 

+cc
Jia Yao <jia.yao@intel.com>
Gustavo Sousa <gustavo.sousa@intel.com>

> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 45ec62813..2519b9e62 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1216,6 +1216,22 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
>  }
>  
> +static bool pat_idx_unsupported_by_wa(int fd, uint8_t pat_idx)
> +{
> +	struct intel_pat_cache pat = {};
> +	int32_t n;
> +
> +	if (intel_graphics_ver(intel_get_drm_devid(fd)) < IP_VER(35, 0) ||
> +	    xe_has_vram(fd))
> +		return false;
> +
> +	n = xe_get_pat_sw_config(fd, &pat, 0);
> +	if (n <= pat_idx)
> +		return false;
> +
> +	return (pat.entries[pat_idx].pat & 0x3) == 3;
> +}
> +
>  static void
>  xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  			  int mem_attr)
> @@ -2887,6 +2903,9 @@ int igt_main()
>  			if (IS_PONTEVECCHIO(dev_id) &&
>  			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
>  				igt_skip("Skipping compression-related PAT index on PVC\n");
> +
> +			igt_skip_on_f(pat_idx_unsupported_by_wa(fd, s->fn(fd)),
> +				      "2-way coherent PAT index not allowed\n");
>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>  		}
> -- 
> 2.43.0
> 
