Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C00CCC6B08
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 14:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A00E10E615;
	Tue, 13 Oct 2026 14:01:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A99310E615
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791900012; x=1823436012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vvkBbeqOpvU98D/CYxLpxksjYHemFdsrM/yED35pLj0=;
 b=Xsuo6J6VYFp0IQoCO1SJVvXXE1eyT2FD5uQfs+t+akg3ye1cZ6uv7GL6
 luq8JSZMrBdZfvKAAMu1nzKY9Owb1WondU4SHtSnzCeGi0zCOXwLoa9ja
 px7Vp40gBV3tVs7zITQxHVe3H5DSUFD3+RZsPi+dXAFZPt5m1/HVafXxu
 fGEFYQLd1mX7xfgYT7VpWCuPVCJDVF586dtgPiH+KQGbXsqYxMZHZly4o
 zT27xp4ZEHYM1unIkjjeFDTEPKrQOoaH3bQxbn65EO0YtFkl1MmfLUOpc
 zinFm/PYgxjkRT42SPvB0QXd+xbBcs6Gwmytk/V4TvMaGz1WgJyuNz3RW A==;
X-CSE-ConnectionGUID: xvuS8H++SKi8LSl84He/tg==
X-CSE-MsgGUID: pkMa0OqVTim32h+z1hLzWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="499468"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="499468"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:00:11 -0700
X-CSE-ConnectionGUID: GOmdReXxRK+YC8yqGOwOjA==
X-CSE-MsgGUID: 0nRvslfZSpq+Gh1UDKw9fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1239697"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:00:09 -0700
Date: Tue, 13 Oct 2026 16:00:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH] tests/intel/xe_ccs: free CCS snapshot buffer in surf_copy
Message-ID: <20261013140007.bvvyczxdrukfbzey@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20261013041104.1107303-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013041104.1107303-1-nishit.sharma@intel.com>
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
On 2026-10-13 at 04:11:04 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Check the CCS snapshot allocation before using it, and release the
> buffer in surf_copy() cleanup to avoid leaking memory across calls.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. please use my @linux.intel.com e-mail, or both. Thanks!

> ---
>  tests/intel/xe_ccs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 4c5fe0311..574f6c06d 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -252,6 +252,7 @@ static void surf_copy(int xe,
>  		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>  	}
>  	ccscopy = (uint32_t *) malloc(ccssize);
> +	igt_assert(ccscopy);
>  	ccs = xe_bo_create_caching(xe, 0, ccs_bo_size, sysmem, 0, cpu_caching);
>  	ccs2 = xe_bo_create_caching(xe, 0, ccs_bo_size, sysmem, 0, cpu_caching);
>  
> @@ -361,6 +362,7 @@ static void surf_copy(int xe,
>  		blt_dump_corruption_info_32b(src, dst);
>  
>  	munmap(ccsmap, ccssize);
> +	free(ccscopy);
>  	gem_close(xe, ccs);
>  	gem_close(xe, ccs2);
>  	gem_close(xe, bb1);
> -- 
> 2.43.0
> 
