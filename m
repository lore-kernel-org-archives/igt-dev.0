Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74281C54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 15:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C0310FB11;
	Tue, 12 Mar 2024 15:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqO7DW/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE135112EFC
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710259159; x=1741795159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3GpBfuQ8qeRxWonHWHPnbbdt/psRMPCMeq11fSIL2PY=;
 b=JqO7DW/kTHvG3Ty9w7OOoKxIrCg2F5+PuTkuO8SjP4KAdZT4ITh9MJyZ
 ZO1y8KSZL0VYwQDGZJbdiP9tX+NZfdQh290KgBP91WB4okQcE3ywV0Huy
 C0U4jw1N2orTOJV+6QsWzu7QAtNAqQRaGTypfNTybI5hX5wr7NM8vIzc5
 yEbDGdgaThx6aOOD2IEG2MAvhZvBMVl1yxtzuqwHD5NdX+3eGxostetV8
 mnfNb9+ld+GTKlQ1cBi3XY0Yc5F7aBaHk8dhg+275gDfC/Ka3DiqPBbep
 70ZWgefKqCti0nbFyFzqbZP7C9iRYp8Az9CPlYNdpSo6ktbx9hWIJCbfJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4905048"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4905048"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 08:59:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16156428"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 08:59:18 -0700
Date: Tue, 12 Mar 2024 16:59:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 05/25] tests/intel: Let's introduce Workarounds
 subcategory
Message-ID: <20240312155900.nnils6v45mgd23da@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
 <20240312141419.1277931-6-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240312141419.1277931-6-katarzyna.piecielska@intel.com>
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
On 2024-03-12 at 14:13:59 +0000, Katarzyna Piecielska wrote:
> There is gem_workaround test that deserves it's own subcategory.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_workarounds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
> index d83c0a1db..43146f4b9 100644
> --- a/tests/intel/gem_workarounds.c
> +++ b/tests/intel/gem_workarounds.c
> @@ -36,8 +36,8 @@
>   * TEST: gem workarounds
>   * Category: Infrastructure
>   * Feature: workarounds
> - * Functionality: workarounds
> - * Sub-category: Context
> + * Functionality: context
> + * Sub-category: Workarounds

I did give you r-b but now that I know about names collision
it looks like Sub-category should be different from Feature,
what about:

 * Sub-category: GPU_Workarounds

Regards,
Kamil

>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> -- 
> 2.34.1
> 
