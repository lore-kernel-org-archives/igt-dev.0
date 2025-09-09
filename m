Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA199CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 08:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640AE10E657;
	Tue,  9 Sep 2025 08:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDdO456i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FE110E650
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757406376; x=1788942376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d/TDJvi6lZVlVUi9Zdp9GPT37jgISJ+FRoqE1ps6mE4=;
 b=iDdO456iefpUlzhYWIFOmbQ7eK7Y0D3I7f2ShNwlDDvIX1gWBb/p4Qay
 ezEY7+pBnDcc8GtvJqmqkKLOcDpqg2EaTg01UdJnKyRj0UK+vLt0VJ5We
 6GMydMHJs0n3z5q0Mg+YW8nZgpmgPbhNBAZxIE39YdCdyLB3iZ22176Td
 6OE0/tKsqCFWIVcDkYbAWRNGriX90u2oBQSpee/oNRleQz5+zkbKFhXL5
 8vMg/6XEd4ECH/Cas7y/4HOOSjHb3agY7eU5uLSOsCZJfRDYc6movysfk
 BWIEbWhlzy4uRCvKLgN/FJM2Ui3qGaxjukmbr8AA9xXCHGU1EhZQGiQcJ w==;
X-CSE-ConnectionGUID: cOTBLDy1QNSkrLLi/VS3pA==
X-CSE-MsgGUID: xGAVe6OkTkiw0tdnoU+9kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="69937943"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="69937943"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:26:16 -0700
X-CSE-ConnectionGUID: dz+qcW3gTQGVCoX5hGBL/g==
X-CSE-MsgGUID: Q+gbBRbOTwSEerZWdfY+vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="177368499"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:26:14 -0700
Date: Tue, 9 Sep 2025 10:26:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_sriov_flr: Use xe_for_each_gt()
 for GT iteration
Message-ID: <20250909082612.uoj6t5lpttracmut@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250908160723.1723178-1-marcin.bernatowicz@linux.intel.com>
 <20250908160723.1723178-3-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908160723.1723178-3-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-09-08 at 18:07:23 +0200, Marcin Bernatowicz wrote:
> Switch from indexing with num_gts to xe_for_each_gt(),
> ensuring we use real GT IDs from gt_mask and not assume
> sequential numbering.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  tests/intel/xe_sriov_flr.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 448b63521..2138debfe 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -1012,13 +1012,13 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  	};
>  	const unsigned int num_checks = num_gts + 3;
>  	struct subcheck checks[num_checks];
> -	int i;
> +	int i = 0, gt_id;
>  
>  	memset(mmio, 0, sizeof(mmio));
>  
> -	for (i = 0; i < num_gts; ++i) {
> +	xe_for_each_gt(pf_fd, gt_id) {
>  		gdata[i] = (struct ggtt_data){
> -			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = i },
> +			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = gt_id },
>  			.mmio = &xemmio
>  		};
>  		checks[i] = (struct subcheck){
> @@ -1029,6 +1029,7 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  			.verify_vf = ggtt_subcheck_verify_vf,
>  			.cleanup = ggtt_subcheck_cleanup
>  		};
> +		i++;
>  	}
>  	checks[i++] = (struct subcheck) {
>  		.data = (struct subcheck_data *)&ldata,
> -- 
> 2.31.1
> 
