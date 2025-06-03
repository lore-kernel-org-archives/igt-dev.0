Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D98C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 08:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6DF10E1C6;
	Tue,  3 Jun 2025 08:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOxq/gJi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7E510E1C6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748938465; x=1780474465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MxAtB6jRc7k3m5eChxPjBkJGLd8u6uV7UN1oqMqRiGg=;
 b=iOxq/gJi/34EX/BXeOUe+9B63dvZG72MnEGxsgAF4mBzjyNaNS7HwmSg
 Z/zC5w0jktRpVFOI+PTEGFvuG8k27EgkiusBGuemyIKPhLrvkf0C6Wm0j
 k+3lTxBkeIpEDKmVoklIBz5LO7QGJVdgHFuu5D7nY5Mv3IeVSpaBcyewk
 gF49NEmdatuhOw1mYCGVVChkwcLnDp5/hETzgVTOSEDf75uwgE8bA0uyh
 XwzA6CvRwTrzvDLztcsBiGs76zibuiWePCgtsO8v0x/WgswTR7MPfQsOl
 9CdO8ez1EdoGqt6vFwPqfsBBi4X++XNCy/Gtfq2mLAMfOX8+/N3tIhzXf g==;
X-CSE-ConnectionGUID: 3SyWrSiMRHCE3U5ouGkJBg==
X-CSE-MsgGUID: Xe/9y7HZRdegfgxjxdXBvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51068811"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="51068811"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 01:14:23 -0700
X-CSE-ConnectionGUID: USQU9D0NT9mv3RIYhHgWpA==
X-CSE-MsgGUID: 0o+mkYgSSq+5K4i0FDxh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="149665412"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 01:14:19 -0700
Date: Tue, 3 Jun 2025 10:14:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: aditya.chauhan@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] Revert "tests/intel/xe_exec_system_allocator: Add
 GPU platform PTL for sys allocator tests"
Message-ID: <20250603081404.dmmtsznb3lx5m62j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 aditya.chauhan@intel.com, igt-dev@lists.freedesktop.org
References: <20250603053629.222192-1-aditya.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603053629.222192-1-aditya.chauhan@intel.com>
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

Hi aditya.chauhan,
On 2025-06-03 at 11:06:29 +0530, aditya.chauhan@intel.com wrote:
> From: Aditya Chauhan <aditya.chauhan@intel.com>
> 
> This reverts commit c7c948b8de5dc4178ee5ed2106f7c3f160def170.
> SVM development is limited to post PV platforms as of now.
> 
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Ramadevi Gandi<ramadevi.gandi@intel.com>
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_system_allocator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 06daac8c2..9528c9449 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -9,7 +9,7 @@
>   * Mega feature: USM
>   * Sub-category: System allocator
>   * Functionality: fault mode, system allocator
> - * GPU: LNL, BMG, PVC, PTL
> + * GPU: LNL, BMG, PVC
>   */
>  
>  #include <fcntl.h>
> -- 
> 2.34.1
> 
