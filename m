Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778DCC83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 05:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238BF10E058;
	Thu,  3 Jul 2025 05:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esLBU1/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77A110E058
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 05:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751520019; x=1783056019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S7Vy0X0yb9xVlhHMysao88EvNng0saZ8cGEnOGfCFSE=;
 b=esLBU1/xjTTVNbKh6M2yQp2uF5S0Z2vGDnQw8LJHS10g04F0/mX1ceFj
 qBr6QFDF3oQoWRA6kwfm6a6u38/yROs+xHRyvDAX/W4mOZkQVfR/ZXKlq
 2a/a6LDBd533EIFQvxCVhmsCI/ZiTw4MvVm7fxllbos9k6NLWDf3V2iRY
 mvhw2woPmP7NFpR8c0h6EleTctqjlVUx4tbcP/CVm5X05OmfRwF0qS4Fy
 x+G7FwWmsQF6ADO5U+1QmTps1iJtRpbJAwz9prRKhLPkXlrUZeF7iigmi
 Drel5Jo/DyjdzVxuHwsMDLm41/xvsNQ5cyk9OxLh6CJk7MRr94SHHCVxC A==;
X-CSE-ConnectionGUID: qLlPLrRqSkCQR3YLNLPZqA==
X-CSE-MsgGUID: waA4WfGKSFurAyyEHhvkJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64881375"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64881375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:20:19 -0700
X-CSE-ConnectionGUID: wnU4FNo8SsmKglmuhlUHnA==
X-CSE-MsgGUID: N327gkz5TTGxkcORVU9xiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153681278"
Received: from savramon-mobl1 (HELO localhost) ([10.245.244.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:20:17 -0700
Date: Thu, 3 Jul 2025 07:20:15 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 7/7] tests/xe: Don't assume max GT ID is num_gt
 - 1
Message-ID: <agstlmny5qhaxlfqswoh63wwzimdvwbimdfjlv6depjdezesnq@fz24s6ynixzd>
References: <20250702193254.2613121-9-matthew.d.roper@intel.com>
 <20250702193254.2613121-16-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702193254.2613121-16-matthew.d.roper@intel.com>
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

On Wed, Jul 02, 2025 at 12:33:02PM -0700, Matt Roper wrote:
> On future platforms GT IDs may not be consecutive.  The GT mask should
> be consulted when determining whether a GT is valid, and the maximum GT
> ID (not the GT count) should be used when allocating array storage space
> for GTs.
> 
> v2:
>  - Correct xe_compute handling; we need to loop over GTs without already
>    having a driver fd open (and without holding one over the loop since
>    that will break the semantics of adjusting ccs_mode), so the usual GT
>    iterator isn't suitable for this special case.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/intel/xe_compute.c | 40 ++++++++++++++++++++++++++++++++--------
>  tests/intel/xe_gt_freq.c |  8 ++++----
>  2 files changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 955edf082..5e9140902 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -41,6 +41,21 @@ static bool get_num_cslices(u32 gt, u32 *num_slices)
>  	return ret > 0;
>  }
>  
> +/* Grab GT mask in places where we don't have or want to maintain an open fd */
> +static uint64_t get_gt_mask(void)
> +{
> +	int fd = drm_open_driver(DRIVER_XE);
> +	uint64_t mask;
> +
> +	mask = xe_device_get(fd)->gt_mask;
> +	drm_close_driver(fd);
> +
> +	return mask;
> +}
> +
> +#define for_each_bit(__mask, __bit) \
> +	for ( ; __bit = ffsll(__mask) - 1, __mask != 0; __mask &= ~(1ull << __bit))
> +
>  /**
>   * SUBTEST: ccs-mode-basic
>   * GPU requirement: PVC
> @@ -48,13 +63,18 @@ static bool get_num_cslices(u32 gt, u32 *num_slices)
>   * Functionality: ccs mode
>   */
>  static void
> -test_ccs_mode(int num_gt)
> +test_ccs_mode(void)
>  {
>  	struct drm_xe_engine_class_instance *hwe;
>  	u32 gt, m, ccs_mode, vm, q, num_slices;
>  	int fd, gt_fd, num_gt_with_ccs_mode = 0;
> +	uint64_t gt_mask = get_gt_mask();
>  
> -	for (gt = 0; gt < num_gt; gt++) {
> +	/*
> +	 * The loop body needs to run without any open file descriptors so we
> +	 * can't use xe_for_each_gt() which uses an open fd.
> +	 */
> +	for_each_bit(gt_mask, gt) {
>  		if (!get_num_cslices(gt, &num_slices))
>  			continue;
>  
> @@ -119,13 +139,18 @@ test_ccs_mode(int num_gt)
>   * Functionality: ccs mode
>   */
>  static void
> -test_compute_kernel_with_ccs_mode(int num_gt)
> +test_compute_kernel_with_ccs_mode(void)
>  {
>  	struct drm_xe_engine_class_instance *hwe;
>  	u32 gt, m, num_slices;
>  	int fd, gt_fd, num_gt_with_ccs_mode = 0;
> +	uint64_t gt_mask = get_gt_mask();
>  
> -	for (gt = 0; gt < num_gt; gt++) {
> +	/*
> +	 * The loop body needs to run without any open file descriptors so we
> +	 * can't use xe_for_each_gt() which uses an open fd.
> +	 */
> +	for_each_bit(gt_mask, gt) {
>  		if (!get_num_cslices(gt, &num_slices))
>  			continue;
>  
> @@ -180,11 +205,10 @@ test_compute_square(int fd)
>  
>  igt_main
>  {
> -	int xe, num_gt;
> +	int xe;
>  
>  	igt_fixture {
>  		xe = drm_open_driver(DRIVER_XE);
> -		num_gt = xe_number_gt(xe);
>  	}
>  
>  	igt_subtest("compute-square")
> @@ -195,8 +219,8 @@ igt_main
>  
>  	/* ccs mode tests should be run without open gpu file handles */
>  	igt_subtest("ccs-mode-basic")
> -		test_ccs_mode(num_gt);
> +		test_ccs_mode();
>  
>  	igt_subtest("ccs-mode-compute-kernel")
> -		test_compute_kernel_with_ccs_mode(num_gt);
> +		test_compute_kernel_with_ccs_mode();
>  }
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 689e0296a..2c9080428 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -399,17 +399,17 @@ igt_main
>  	int gt;
>  	struct drm_xe_engine_class_instance *hwe;
>  	uint32_t *stash_min, *stash_max;
> -	int num_gts;
> +	int max_gt;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
>  
>  		igt_require(xe_sysfs_gt_has_node(fd, 0, "freq0"));
> -		num_gts = xe_number_gt(fd);
> +		max_gt = xe_dev_max_gt(fd);
>  
>  		/* The defaults are the same. Stashing the gt0 is enough */
> -		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * num_gts);
> -		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * num_gts);
> +		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * max_gt);
> +		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * max_gt);
>  
>  		xe_for_each_gt(fd, gt) {
>  			stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
> -- 
> 2.49.0
> 
