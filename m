Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED55ACD11BF
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602B210E968;
	Mon, 25 Mar 2024 15:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzNS5QqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15AA10E968
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379302; x=1742915302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=skS0RXV0uHLVbY35AZh3vyC4QMR8fcd4g9xsBs2FnDI=;
 b=BzNS5QqTFhdiX9UbXfe6BgwVwLPmZFtGb6AKPVQXAnV4YMiMTjG7/vmM
 XxEczLNNuHrMCWPsEv4+TLS5jgdUbOLZhg6dj8rTt4sgeqt5XLSqCmWIH
 4NdszxR9Ij0+oDO8JQE7C7Nnh78PnTSfcvdhnVtELOuiDJ9FUphfTS5QE
 xopGSKtidnhv7Ra0EwTVh2cdQmMDOXWzdBo5FskLFWS2HbgPoLApmM50/
 CD48YeBbDexGHtX1+/90HCVcvzT0PDymZdr/N2VzjLELzTh61QYZM/4Ju
 tMHK7EaDLOtM5xwYc0Myw/N3QijoUGf9wvPfH1D9rw4dpUYilMS4YO80r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6494574"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6494574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20326267"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:08:20 -0700
Date: Mon, 25 Mar 2024 16:08:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 06/12] tests/intel: Add xe_prime_self_import to DRM
 subcategory
Message-ID: <20240325150817.puorkjhddovujk5w@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-8-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240322124108.1825345-8-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-22 at 12:41:02 +0000, Katarzyna Piecielska wrote:
> Let's move xe_prime_self_import to DRM subcategory to unify with i915
> test documentation.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_prime_self_import.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
> index 8e7290e9e..f47733bb2 100644
> --- a/tests/intel/xe_prime_self_import.c
> +++ b/tests/intel/xe_prime_self_import.c
> @@ -28,7 +28,7 @@
>  /**
>   * TEST: Check whether prime import/export works on the same device
>   * Category: Software building block
> - * Sub-category: drm prime
> + * Sub-category: DRM
>   * Functionality: prime import/export
>   * Test category: functionality test
>   *
> -- 
> 2.34.1
> 
