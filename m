Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF8CC021B0
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 08:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4B910E181;
	Thu, 20 Feb 2025 08:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nh031mQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C13B10E181
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740038839; x=1771574839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oxXPatVIpHi49vOirT9nepM3tNAA9IyP/V78dBH0NEM=;
 b=nh031mQajCbl2TKrIerNRjcm7Liz4gdxBI3SyyAHj2s2ovJGSJC20FL0
 Ka1R2W3Ie+17xwJG2GimqeI7j5eqMTEm5JE6sln+nKkJKLH6QIdL281kp
 AAxobh3SuiyJCupTihDIBL3gmp42z8zicdV6WlhYi9j5iVjCd0rxoisOi
 zitLsNDwg0TaH2yzl5VyNwBUKKCSc2EQ1N9/Nn2w8ynxgjoSMjlXDBsMx
 jky9T2tNFZRyafE+nYWC/x+V9T8NKryCzsnfLImN3/sEHfNho9fCzwuJr
 1zpGBlrjfmn2CJRkbUCkDUdQ2GAuMFTtv0zegFesk0Sz9UbvFUm5BQXrz Q==;
X-CSE-ConnectionGUID: zuparTg/TkCvj2eX4Ua8tQ==
X-CSE-MsgGUID: li0+Reu1Q5qfcN7ot8nRWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40036614"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40036614"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 00:07:19 -0800
X-CSE-ConnectionGUID: Xkuug0HvQo6LQXEqww0UEw==
X-CSE-MsgGUID: o0gqnPmjR6+6/Avu/2jTTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="115638823"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 00:07:17 -0800
Date: Thu, 20 Feb 2025 09:07:15 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/5] tests/xe_compute: Update documentation
Message-ID: <20250220080715.kxnnfnxnglwzba5r@zkempczy-mobl2>
References: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
 <20250217081854.3219791-4-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217081854.3219791-4-priyanka.dandamudi@intel.com>
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

On Mon, Feb 17, 2025 at 08:18:52AM +0000, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> PTL support is added for compute and compute_preempt tests. Update the GPU
> requirement field.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/intel/xe_compute.c         | 2 +-
>  tests/intel/xe_compute_preempt.c | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 62beb24dc..558b46eba 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -164,7 +164,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>  /**
>   * SUBTEST: compute-square
>   * Sub-category: Compute square tests
> - * GPU requirement: TGL, PVC, LNL
> + * GPU requirement: TGL, PVC, LNL, PTL
>   * Description:
>   *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
>   *	for an input dataset..
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 7ce5c595a..5319dee7b 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -20,17 +20,17 @@
>  
>  /**
>   * SUBTEST: compute-preempt
> - * GPU requirement: LNL
> + * GPU requirement: LNL, PTL
>   * Description:
>   *      Exercise compute walker mid thread preemption scenario
>   *
>   * SUBTEST: compute-preempt-many
> - * GPU requirement: LNL
> + * GPU requirement: LNL, PTL
>   * Description:
>   *      Exercise multiple walker mid thread preemption scenario
>   *
>   * SUBTEST: compute-threadgroup-preempt
> - * GPU requirement: LNL
> + * GPU requirement: LNL, PTL
>   * Description:
>   *      Exercise compute walker threadgroup preemption scenario
>   */
> -- 
> 2.34.1
> 
