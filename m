Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C5FC5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 19:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E4E10E0F5;
	Mon, 24 Aug 2026 19:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQZa4Xea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAAA10E0F5
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 19:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787598036; x=1819134036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6Sppy0Y0+5Qpd9VojMpF1vEmrgBuwfBEsYuYH/wLwWw=;
 b=cQZa4XeaP5iZD6sJZ0TBz45z5AbZwLEuh+TLBVXJNnOJDtwNF3x2g/19
 GwUQT9VTZhKVV76XSnZXa7wVNFuCJPACJgn3jEqPfl1/t3mp4lFDy/oKf
 p8f7sJvL40OaVvnUCea11CzE+QittjP1Ed4ZtDU+CUTHlH4iUXBp/DG4Z
 ATAOepryoDBrMVbmW/UHCpYmnTb0AbGsrFCPvxLvKjqUBdBSo6gsovg61
 SeGvkbYXYkTzbaxpZG1HCsqgGloHBPBgJ+xPHTlV7u1asrdyQMXGlniNi
 MUkylTsNhqRc/5lGxmNdQuJBwcBifQPV4BROi1RMU8WjPvugIkcA36dQ1 Q==;
X-CSE-ConnectionGUID: 3+PeDePIQ8Oi+Y0NyiJ/OA==
X-CSE-MsgGUID: 8wHMyXzmSzqI2b5CWmuOcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99582198"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="99582198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:00:35 -0700
X-CSE-ConnectionGUID: DWT6B3muQcGTSRsO+/5JpQ==
X-CSE-MsgGUID: gPSGQlbiRMiMrYOf0Ua78Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="291930100"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:00:33 -0700
Date: Mon, 24 Aug 2026 21:00:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 3/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-memory-pressure subtest
Message-ID: <20260824190031.dcfbfwxjeluvqjlc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260818040845.548727-1-nishit.sharma@intel.com>
 <20260818040845.548727-4-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818040845.548727-4-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-08-18 at 04:08:39 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Add memory-pressure coverage for the GT reset stress harness. This extends
> concurrent reset+submission testing to include BO memory pressure while
> preserving default behavior for existing subtests.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_reset.c | 48 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 407775cfc..825fc6aa1 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -29,6 +29,7 @@
>  
>  #define SYNC_OBJ_SIGNALED	(0x1 << 0)
>  #define LEGACY_MODE_ADDR	0x1a0000
> +#define PRESSURE_COUNT		32
>  
>  static void ignore_gt_reset_warnings_in_dmesg(void)
>  {
> @@ -133,6 +134,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  #define MULTI_QUEUE			(0x1 << 14)
>  #define SECONDARY_QUEUE			(0x1 << 15)
>  #define RESET_SYNC_MODE			(0x1 << 16)
> +#define MEM_PRESSURE_STRESS		(0x1 << 17)
>  
>  /**
>   * SUBTEST: %s-cat-error
> @@ -657,6 +659,30 @@ struct gt_thread_data {
>  	bool do_reset;
>  };
>  
> +static void pressure_bo_create(int fd, uint32_t vm, int gt,
> +			       uint32_t *bos, int *count)
> +{
> +	int i;
> +
> +	*count = 0;
> +	for (i = 0; i < PRESSURE_COUNT; i++) {
> +		bos[i] = xe_bo_create(fd, vm, xe_bb_size(fd, SZ_2M),
> +				      vram_if_possible(fd, gt),
> +				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		if (!bos[i])
> +			break;
> +		(*count)++;
> +	}
> +}
> +
> +static void pressure_bo_destroy(int fd, uint32_t *bos, int count)
> +{
> +	int i;
> +
> +	for (i = 0; i < count; i++)
> +		gem_close(fd, bos[i]);
> +}
> +
>  static void do_resets(struct gt_thread_data *t)
>  {
>  	while (!*(t->exit)) {
> @@ -676,7 +702,10 @@ static void submit_jobs(struct gt_thread_data *t)
>  	uint64_t addr = 0x1a0000;
>  	size_t bo_size = xe_bb_size(fd, SZ_4K);
>  	uint32_t bo;
> +	uint32_t pressure_bos[PRESSURE_COUNT];
>  	uint32_t *data;
> +	int pressure_count;
> +	int i = 0;
>  
>  	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, t->gt),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> @@ -685,6 +714,9 @@ static void submit_jobs(struct gt_thread_data *t)
>  
>  	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
>  
> +	if (t->flags & MEM_PRESSURE_STRESS)
> +		pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
> +
>  	while (!*(t->exit)) {
>  		struct drm_xe_engine_class_instance instance = {
>  			.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> @@ -707,8 +739,19 @@ static void submit_jobs(struct gt_thread_data *t)
>  		xe_exec(fd, &exec);
>  		xe_exec_queue_destroy(fd, exec.exec_queue_id);
>  		(*t->num_submit)++;
> +
> +		if ((t->flags & MEM_PRESSURE_STRESS) && !(i % 128)) {
> +			pressure_bo_destroy(fd, pressure_bos, pressure_count);
> +			pressure_count = 0;
> +			pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
> +		}
> +
> +		i++;
>  	}
>  
> +	if (t->flags & MEM_PRESSURE_STRESS)
> +		pressure_bo_destroy(fd, pressure_bos, PRESSURE_COUNT);
> +
>  	munmap(data, bo_size);
>  	gem_close(fd, bo);
>  	xe_vm_destroy(fd, vm);
> @@ -744,6 +787,10 @@ static void *gt_reset_thread(void *data)
>   * Description: Stress concurrent GT resets and job submissions with sync resets
>   * Test category: stress test
>   *
> + * SUBTEST: gt-stress-reset-memory-pressure
> + * Description: Stress concurrent GT resets and job submissions under memory pressure
> + * Test category: stress test
> + *
>   */
>  static void
>  gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
> @@ -962,6 +1009,7 @@ int igt_main()
>  	const struct section ssections[] = {
>  		{ "reset-concurrent-submit", 0 },
>  		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
> +		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
>  		{ NULL },
>  	};
>  	int gt;
> -- 
> 2.43.0
> 
