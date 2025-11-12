Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A4FCD3429
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 17:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F4C10E780;
	Wed, 12 Nov 2025 17:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akUfkrUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB5010E1D1
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762970068; x=1794506068;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T1aia6WAKlE4LhnaytQMhvrdSKm2tWwFk4jTFuQVIPE=;
 b=akUfkrUGHbRkRiAeHp4noS7mo7KkEltlxN75+1Lku0GzL4JVxKhK+BDx
 GPFhuKHmdTkl+1YJ3QPPHgPdGEzwPcNQuy+O/AoCaV6CwNEFvsbg67eIf
 JWQbal+hhXT3MqKdl1zxtqd2In5B+88vlTvmk3kKOcADEeydNjJiRJeDr
 EiPXJfOraix2JcZZ19SD9DFbaYMNf5DtdBD3wl5Zt1AZ8k1kHMtfIo0lp
 VhT7P9U8ZNcC3BXFZn7oGA3ReiKSgUjNld/g2l7kRiE7xBFk0m8DntIGX
 qWHrWmmXfHtUiUWYCILWaQmD8QveX5S6SfnYjGeVqLel3mioHNFhRdiUA Q==;
X-CSE-ConnectionGUID: Cbz6AmpeRCK2Ia+GIbKRNQ==
X-CSE-MsgGUID: QVNnujmTTyyBGsqZUCW3JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65077262"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="65077262"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 09:54:28 -0800
X-CSE-ConnectionGUID: /k8BFymDQmGeBd5zNjRL+Q==
X-CSE-MsgGUID: YIX5CBaYTpyHTlQNwDKg7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189282630"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 09:54:25 -0800
Date: Wed, 12 Nov 2025 18:54:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 07/18] tests/xe_exec_multi_queue: Add multiple placement
 test
Message-ID: <20251112175408.5v5262kluhmnxbue@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-8-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031183555.1882721-8-niranjana.vishwanathapura@intel.com>
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

Hi Niranjana,
On 2025-10-31 at 11:35:44 -0700, Niranjana Vishwanathapura wrote:
> Validate using virtual exec queues with multiple placements.

Please add 'intel/' prefix after 'tests/', so subject will be:

[PATCH 07/18] tests/intel/xe_exec_multi_queue: Add multiple placement test

Also do it in all other 'tests/xe_...' patches.

Regards,
Kamil

> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index c9ff25ffc..eb40e92d2 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -379,6 +379,31 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
>  	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs, flags);
>  }
>  
> +/**
> + * SUBTEST: virtual
> + * Description: Validate virtual queues with multiple placements
> + * Test category: functionality test
> + */
> +static void
> +test_exec_virtual(int fd, int gt, int class)
> +{
> +	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int n = 0;
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != class || hwe->gt_id != gt)
> +			continue;
> +
> +		eci[n++] = *hwe;
> +	}
> +
> +	if (n < 2)
> +		return;
> +
> +	test_exec(fd, eci, n, n, n, 0);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -404,6 +429,11 @@ igt_main
>  			xe_for_each_multi_queue_engine_class(class)
>  				test_sanity(fd, gt, class);
>  
> +	igt_subtest_f("virtual")
> +		xe_for_each_gt(fd, gt)
> +			xe_for_each_multi_queue_engine_class(class)
> +				test_exec_virtual(fd, gt, class);
> +
>  	for (const struct section *s = sections; s->name; s++) {
>  		igt_subtest_f("one-queue-%s", s->name)
>  			xe_for_each_multi_queue_engine(fd, hwe)
> -- 
> 2.43.0
> 
