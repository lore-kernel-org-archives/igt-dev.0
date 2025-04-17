Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531FDC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 07:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0324A10EA12;
	Thu, 17 Apr 2025 07:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mbw20Mdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D6B10EA12
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 07:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744873299; x=1776409299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iff8DzMpInpPnyixVv04wMHk5W3EsqZb6eErTmJE4AA=;
 b=Mbw20MdcRmGvudVFpII6B46DwL3ifIR+AfunYiawEQRA2syfeiMVb6fb
 uR6R27HhOpi2T+LwSH0B9uaWJBi2C6sBG/+tN6i98zDRKYuy6yKurdZqd
 Av/2RUKiCb927zM3B2nP3u6GF7Q1K3S9vBJolhAskuwgRMzaYfzfsxNfv
 +XEYYqz9fxrOTF3GCiULfRnP34BXl/sTzQH5QFmRsbcxfQbbsxFlHbEWS
 E7ob9cp5r+YrnCw3ZLx2PahzVr5+z4qtWkhR6sCVNpT5jwZnQhpvBN1KM
 tV6aOczk455i3JIwH5r6J8qdfNxJ4Iz+7LHh2iNoHu2a1sfHBPFXFxk03 A==;
X-CSE-ConnectionGUID: C78CeJlZT1mmeW4u5CQFLA==
X-CSE-MsgGUID: da11fQv3Quq/e8CQMC0fig==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46369965"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46369965"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 00:01:39 -0700
X-CSE-ConnectionGUID: zjLOoQ2gR6CAvQkN94cxqQ==
X-CSE-MsgGUID: gdrrHeZdQsuoOfTAsUb+Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="161757922"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 00:01:37 -0700
Date: Thu, 17 Apr 2025 09:01:36 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib/xe/spin: Use READ_ONCE, WRITE_ONCE macros in Xe spin
 library
Message-ID: <20250417070136.wrhvv44cgz723ww3@zkempczy-mobl2>
References: <20250416161025.361516-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416161025.361516-1-matthew.brost@intel.com>
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

On Wed, Apr 16, 2025 at 09:10:25AM -0700, Matthew Brost wrote:
> Without the READ_ONCE macro is xe_spin_started(), a compiler may choose
> to read the value of spin->start exactly once rather than every call of
> xe_spin_started(). If the initial read is before the GPU batch execution
> flips spin->start to a non-zero value, the test will hang forever. This
> was shown on Chrome.

I missed this explanation about Chrome. May you point out the affected
code? I'm really curious about how it looks like.

--
Zbigniew


> 
> For uniformity, update xe_spin_end to use WRITE_ONCE too.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  lib/xe/xe_spin.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 0de0b1f2e9..65c29284aa 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -145,7 +145,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>   */
>  bool xe_spin_started(struct xe_spin *spin)
>  {
> -	return spin->start != 0;
> +	return READ_ONCE(spin->start) != 0;
>  }
>  
>  /**
> @@ -162,7 +162,7 @@ void xe_spin_wait_started(struct xe_spin *spin)
>  
>  void xe_spin_end(struct xe_spin *spin)
>  {
> -	spin->end = 0;
> +	WRITE_ONCE(spin->end, 0);
>  }
>  
>  /**
> -- 
> 2.34.1
> 
