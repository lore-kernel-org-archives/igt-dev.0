Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42B8E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 04:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429E810E046;
	Thu, 19 Dec 2024 04:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2+HTQgM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EFC10E046
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 04:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734582102; x=1766118102;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KQ1OdKvZ+kcxOd/BlADF5XGNH0fl1gEWG29nx2uuxh0=;
 b=U2+HTQgMPU+7fEhB3CatfcvOGEDMdJ9ouTpacjG4RDVD8XvkYQclT/U1
 Keyvb9dYsqizWJkd/RgEtFOTNuP3tpP0BkE2CJXXTVL+2/X/lI6HqpwDZ
 TW79gM3ZjFgqgJbBmvNjVIx6i7me85o7ywSCsM5J/tbKW5RskWms278eY
 95pAp8CExL+oTleEdsENoDM4iEUG1Xw6GbpiWvsiSx07KAHvhb/0qGSZo
 Jz5hJfSLSl/2oBNCc6rWHrSVIzDdN0dBZsfWbXbVGAT6W+ktpCn51I7T3
 MIhBTgNxHhvX0+5ht6b6YkiIHdu9WUybxFOHxE7TdRljc1nmKM6H9gDCk g==;
X-CSE-ConnectionGUID: HXzqdM74QjOp7Q8PfA/oCg==
X-CSE-MsgGUID: VEIu6idHSXShQ0OGEikCOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46498162"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="46498162"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 20:21:42 -0800
X-CSE-ConnectionGUID: 917cVUEPT5uWjhvny8GQ3g==
X-CSE-MsgGUID: SBR/tVjSQeie2to0jXpybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="98132050"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 20:21:40 -0800
Date: Thu, 19 Dec 2024 05:21:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH] tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork
Message-ID: <20241219042136.umcawqokomvdlgfz@zkempczy-mobl2>
References: <20241218160808.65340-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218160808.65340-1-jonathan.cavitt@intel.com>
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

On Wed, Dec 18, 2024 at 04:08:08PM +0000, Jonathan Cavitt wrote:
> Several xe_cork functionalities were recently unified into the xe_spin
> library.  During this process, it was asserted that we always pass a
> valid cork to the various xe_cork helper functions (namely,
> xe_cork_sync_start, xe_cork_sync_end, and xe_cork_destroy).
> 
> While this assertion should normally hold, in xe_drm_fdinfo
> specifically, some subtests declare the existence of an xe_cork but
> bypass its initialization through xe_cork_create because the cork is
> otherwise unused.  However, the cork itself is unconditionally destroyed
> at the end of the tests, as prior to the unification under xe_spin,
> passing a NULL pointer to the destroy function (previously
> spin_ctx_destroy) would simply exit the function early.  Unfortunately,
> passing a NULL pointer to the destroy function now (xe_cork_destory)
> hits the new assertion, resulting in an error.
> 
> Do not run xe_cork_destroy on a NULL pointer if a NULL pointer is
> expected in the subtest.

Thanks for the fix. Finally I've requested to assert in destroy path
instead of silently returing on NULL pointer. This caused these issues.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Fixes: 2feb1d6718a ("lib/xe/xe_spin: move the spinner related functions to lib")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3869
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Pravalika Gurram <pravalika.gurram@intel.com>
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_drm_fdinfo.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 66a181d5ba..e83c55c646 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -447,7 +447,9 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>  		close(new_fd);
>  	}
>  
> -	xe_cork_destroy(fd, ctx);
> +	if (flags & TEST_BUSY)
> +		xe_cork_destroy(fd, ctx);
> +
>  	xe_vm_destroy(fd, vm);
>  }
>  
> @@ -663,7 +665,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>  		close(fd_spill);
>  	}
>  
> -	xe_cork_destroy(fd, ctx);
> +	if (flags & TEST_BUSY)
> +		xe_cork_destroy(fd, ctx);
>  
>  	xe_vm_destroy(fd, vm);
>  }
> -- 
> 2.43.0
> 
