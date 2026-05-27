Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4314CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 16:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F0110E26B;
	Wed, 27 May 2026 16:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hus9bXBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3A410E26B
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 16:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779898232; x=1811434232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/dqNsPW4PWzDG/fDtIPN5/TY86OzpiZ14Jd6pyCOBCg=;
 b=Hus9bXBQczHd13qWFceWb+aVVEPaZ3YcCAbsqfqJk0ImZmRAkmwyXAh0
 pVuQb3IdQU90vRD/x4LU6RT5gUR7DhWQTyCNYNeUFAZN//VBL3Ot8CKrO
 PgKecCDOPWYtHpEH3slpucz6tOwesmUwhGDy8ZKWqS2qahn7eAJfzEKLL
 VtoyQA6pwf0FwE50b81TsLOIYCBPtkaGoBCP5QliNUhp5vZ3bhjxHIWeW
 2vcgxWCLJvUArZ1a+lSkRprL9wulz7LyxiOJPp1xLAD1qx2GOutKGtwuO
 Q9jXNhWI1KdS4fRYA1WbUkO4xA4jViugUBYemXdtms66fZ8z1lqP7OU5Z Q==;
X-CSE-ConnectionGUID: wAh9OzXvQpKsmsvPr+yv5A==
X-CSE-MsgGUID: gOY4d3ASRLa0ErFG5tkHCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91038958"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="91038958"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 09:10:32 -0700
X-CSE-ConnectionGUID: FO8z6BoOSEmm3heuK/zLWw==
X-CSE-MsgGUID: 3bodoQtHSeGTounfHPuDpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="241242613"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 09:10:31 -0700
Date: Wed, 27 May 2026 18:10:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org, jia.yao@intel.com, x.wang@intel.com
Subject: Re: [PATCH v2 3/3] tests/intel/xe_pat: Add dynamic PAT index
 selection for pat-index-auto
Message-ID: <20260527161028.bvdctzar4dco3g6n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>, igt-dev@lists.freedesktop.org,
 jia.yao@intel.com, x.wang@intel.com
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
 <20260526223655.81924-1-zongyao.bai@intel.com>
 <20260526223655.81924-4-zongyao.bai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526223655.81924-4-zongyao.bai@intel.com>
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

Hi Zongyao,
On 2026-05-26 at 22:36:54 +0000, Zongyao Bai wrote:
> Introduce the `pat-index-auto` dynamic subtest to iteratively test
> PAT indices based on the hardware configuration, improving test
> coverage beyond hardcoded arrays.
> 
> Build the test mode set by:
>     selecting a small common set first (WT, coherent, non-coherent)
>     adding all remaining valid entries (shuffled)
> 
> Add pat-index-auto to xe.fast-feedback.testlist.
> 
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  tests/intel-ci/xe.fast-feedback.testlist |   1 +
>  tests/intel/xe_pat.c                     | 159 ++++++++++++++++++++++-
>  2 files changed, 159 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..6851c1f49 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist

We usually separete CI changes from test ones. Could you split
this into

intel-ci: Add pat-index-auto to Xe BAT testlist

Regards,
Kamil

> @@ -211,6 +211,7 @@ igt@xe_pat@pat-index-xelp
>  igt@xe_pat@pat-index-xehpc
>  igt@xe_pat@pat-index-xelpg
>  igt@xe_pat@pat-index-xe2
> +igt@xe_pat@pat-index-auto
>  igt@xe_waitfence@abstime
>  igt@xe_waitfence@engine
>  igt@xe_waitfence@reltime
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 79f9a87aa..cff40d6b6 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -35,6 +35,7 @@
>  
>  #define XE_COH_NONE          1
>  #define XE_COH_AT_LEAST_1WAY 2
> +#define PAT_NAME_MAX_LEN     64
>  
>  /*
>   * PAT index 18: XA (eXclusive Access) + UC (Uncached).
> @@ -113,6 +114,7 @@ static void userptr_coh_none(int fd)
>  
>  #define L3_CACHE_POLICY_WB	0
>  #define L3_CACHE_POLICY_XD	1
> +#define L3_CACHE_POLICY_XA	2
>  #define L3_CACHE_POLICY_UC	3
>  
>  #define L4_CACHE_POLICY_WB	0
> @@ -448,7 +450,7 @@ static void xe2_blt_decompress_dst(int fd,
>  	memcpy(&blt->src, &blt->dst, sizeof(blt->dst));
>  	blt_set_object(&blt->dst, alias_handle, size, 0,
>  		       intel_get_uc_mocs_index(fd),
> -		       intel_get_pat_idx_uc(fd), /* compression disabled */
> +		       intel_get_pat_idx_wb(fd), /* compression disabled */
>  		       T_LINEAR, 0, 0);
>  	blt_fast_copy(fd, ctx, NULL, ahnd, blt);
>  	memcpy(&blt->dst, &blt->src, sizeof(blt->dst));
> @@ -1345,6 +1347,146 @@ const struct pat_index_entry bmg_g21_pat_index_modes[] = {
>  	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
>  };
>  
> +static void add_pat_mode(struct pat_index_entry *modes_arr, int idx,
> +			 uint32_t pat, bool has_comp_en, int pat_idx, bool cpu_wc)
> +{
> +	modes_arr[idx].get_pat_index = NULL;
> +	modes_arr[idx].pat_index = pat_idx;
> +	modes_arr[idx].compressed = has_comp_en && !!(pat & XE2_COMP_EN);
> +	modes_arr[idx].name = NULL;
> +	modes_arr[idx].coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat) >= COH_MODE_1WAY ?
> +				  XE_COH_AT_LEAST_1WAY : XE_COH_NONE;
> +	modes_arr[idx].force_cpu_wc = cpu_wc;
> +}
> +
> +/*
> + * Build pat_index_modes[] test table dynamically from hardware PAT table:
> + * 1. Read PAT entries from hardware
> + * 2. Pick common modes first (WT, Coherent, Non-coherent)
> + * 3. Pick random modes (shuffled remaining entries)
> + * 4. Return the modes array and count through output parameters
> + */
> +static int init_pat_index_modes(int fd, struct pat_index_entry **modes)
> +{
> +	const int TEST_COMMON_MODE_MAX = 4;
> +
> +	/* Static storage for results - persists after function returns */
> +	static struct pat_index_entry pat_index_modes[XE_PAT_MAX_ENTRIES * 2];
> +	static struct intel_pat_cache pat_sw_config;
> +	static char name_storage[XE_PAT_MAX_ENTRIES * 2][PAT_NAME_MAX_LEN];
> +
> +	int n_entries;
> +	bool has_comp_en;
> +
> +	int test_cnt = igt_run_in_simulation() ? 5 : 16;
> +	struct pat_index_entry common_modes[TEST_COMMON_MODE_MAX];
> +	struct pat_index_entry random_modes[XE_PAT_MAX_ENTRIES * 2];
> +	struct pat_index_entry tmp;
> +	int n_common = 0;
> +	int n_random = 0;
> +	int n_picked = 0;
> +	int i, j;
> +
> +	bool ensure_picked_wt = true;
> +	bool ensure_picked_coh = true;
> +	bool ensure_picked_noncoh = true;
> +
> +	/* Fetch PAT config from hardware */
> +	n_entries = xe_fetch_pat_sw_config(fd, &pat_sw_config);
> +	has_comp_en = HAS_FLATCCS(intel_get_drm_devid(fd));
> +
> +	igt_assert(n_entries > 0);
> +
> +	/* Step 1: Split entries into common_modes and random_modes */
> +	for (i = 0; i < n_entries; i++) {
> +		uint32_t pat = pat_sw_config.entries[i].pat;
> +		uint8_t pat_clos = REG_FIELD_GET(XE2_L3_CLOS, pat);
> +		uint8_t l3_policy = REG_FIELD_GET(XE2_L3_POLICY, pat);
> +		uint8_t l4_policy = REG_FIELD_GET(XE2_L4_POLICY, pat);
> +		uint8_t coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat);
> +
> +		if (pat_sw_config.entries[i].rsvd)
> +			continue;
> +
> +		/* Common pat index type 1: WT mode (l3=xd, l4=wt, coh=0) */
> +		if (ensure_picked_wt &&
> +		    pat_clos == 0 &&
> +		    l3_policy == L3_CACHE_POLICY_XD &&
> +		    l4_policy == L4_CACHE_POLICY_WT &&
> +		    coh_mode == 0) {
> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
> +			n_common++;
> +			ensure_picked_wt = false;
> +			continue;
> +		}
> +		/* Common pat index type 2: Coherent mode (l3=wb, l4=uc, coh>=1way) */
> +		if (ensure_picked_coh &&
> +		    pat_clos == 0 &&
> +		    l3_policy == L3_CACHE_POLICY_WB &&
> +		    l4_policy == L4_CACHE_POLICY_UC &&
> +		    coh_mode >= COH_MODE_1WAY) {
> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
> +			n_common++;
> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, true);
> +			n_common++;
> +			ensure_picked_coh = false;
> +			continue;
> +		}
> +		/* Common pat index type 3: Non-coherent mode (l3=uc, l4=uc, coh=0) */
> +		if (ensure_picked_noncoh &&
> +		    pat_clos == 0 &&
> +		    l3_policy == L3_CACHE_POLICY_UC &&
> +		    l4_policy == L4_CACHE_POLICY_UC &&
> +		    coh_mode == 0) {
> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
> +			n_common++;
> +			ensure_picked_noncoh = false;
> +			continue;
> +		}
> +
> +		/* Add to random_modes */
> +		add_pat_mode(random_modes, n_random, pat, has_comp_en, i, false);
> +		n_random++;
> +		if (coh_mode >= COH_MODE_1WAY) {
> +			add_pat_mode(random_modes, n_random, pat, has_comp_en, i, true);
> +			n_random++;
> +		}
> +	}
> +	igt_assert(n_common + n_random > 0);
> +
> +	/* Step 2: Fisher-Yates shuffle on random_modes */
> +	for (i = n_random - 1; i > 0; i--) {
> +		j = random() % (i + 1);
> +		tmp = random_modes[i];
> +		random_modes[i] = random_modes[j];
> +		random_modes[j] = tmp;
> +	}
> +
> +	/* Step 3: Merge common_modes and random_modes into pat_index_modes (up to test_cnt) */
> +	for (i = 0; i < n_common && n_picked < test_cnt; i++)
> +		pat_index_modes[n_picked++] = common_modes[i];
> +	for (i = 0; i < n_random && n_picked < test_cnt; i++)
> +		pat_index_modes[n_picked++] = random_modes[i];
> +
> +	/* Step 4: Assign simple numeric names and print debug info */
> +	for (i = 0; i < n_picked; i++) {
> +		snprintf(name_storage[i], PAT_NAME_MAX_LEN, "PAT_INDEX_%u%s",
> +			 pat_index_modes[i].pat_index,
> +			 pat_index_modes[i].force_cpu_wc ? "-force_cpu_wc" : "");
> +
> +		pat_index_modes[i].name = name_storage[i];
> +
> +		igt_debug("  [%d] idx=%2u comp=%d coh=%u cpu_wc=%d name=%s%s\n",
> +			  i, pat_index_modes[i].pat_index, pat_index_modes[i].compressed,
> +			  pat_index_modes[i].coh_mode, pat_index_modes[i].force_cpu_wc,
> +			  pat_index_modes[i].name,
> +			  (i < n_common) ? " (common)" : " (random)");
> +	}
> +
> +	*modes = pat_index_modes;
> +	return n_picked;
> +}
> +
>  const struct pat_index_entry xe3p_lpg_coherency_pat_index_modes[] = {
>  	{ NULL, 18, false, "xa-l3-uc",	 XE_COH_NONE          },
>  	{ NULL, 19, false, "xa-l3-1way", XE_COH_AT_LEAST_1WAY },
> @@ -1414,6 +1556,12 @@ static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
>   * Description: Check some of the xe2 pat_index modes.
>   */
>  
> +/**
> + * SUBTEST: pat-index-auto
> + * Test category: functionality test
> + * Description: Dynamically generate and test PAT index modes from platform PAT configuration.
> + */
> +
>  /**
>   * SUBTEST: xa-app-transient-media-off
>   * Test category: functionality test
> @@ -2275,6 +2423,15 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>  							     ARRAY_SIZE(xe2_pat_index_modes));
>  	}
>  
> +	igt_subtest_with_dynamic("pat-index-auto") {
> +		struct pat_index_entry *modes;
> +		int n_modes;
> +
> +		igt_require(intel_graphics_ver(dev_id) >= IP_VER(20, 0));
> +		n_modes = init_pat_index_modes(fd, &modes);
> +		subtest_pat_index_modes_with_regions(fd, modes, n_modes);
> +	}
> +
>  	igt_subtest("display-vs-wb-transient")
>  		display_vs_wb_transient(fd);
>  
> -- 
> 2.43.0
> 
