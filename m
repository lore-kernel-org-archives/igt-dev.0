Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F117C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 13:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36F3112A99;
	Mon, 11 Mar 2024 13:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiSVRu4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B79112A99
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710165468; x=1741701468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J7t9eYKyBGhLjpb754+sTLbZ6kqAeVmWs/Ma3r0F2bs=;
 b=DiSVRu4PWfoW1b86II2lL7mDn4e17dzy2XkmQ4yDevduUFd6BA4o07J5
 dvNR0Feu3KUMi95o9gHk9/0/0++Uqzkq9HiaR9N/xlMABbMaaSZFA6pCd
 a/SYF4xFOgQXr2jnXRqsjGSxhNwL9QJDU1qbLUvHkUrL9Rc7XB+AOMRUq
 B1sILtWXlLRb8BcBYdCKMKEw7eFaeM7419O5aNg0bSMUBtoxl+pNYbf5M
 kqk3em+Jjms6+BD0R/HJ329w6fMvEIQ3PIBhG+bnRGChRyn/zCQyMJj3Q
 WOOj2MzwKCcjyJSBC3Xvc0hM7m2GmIcdOeYJbedM7EicgDeMVp8WJl0EI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4705946"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4705946"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11249270"
Received: from unknown (HELO localhost) ([10.245.244.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:57:46 -0700
Date: Mon, 11 Mar 2024 14:57:44 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 07/25] tests/intel: Introduce GPGPU subcategory
Message-ID: <20240311135744.gvvy2hgmt4og3osq@zkempczy-mobl2>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-8-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240308083657.1092049-8-katarzyna.piecielska@intel.com>
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

On Fri, Mar 08, 2024 at 08:36:39AM +0000, Katarzyna Piecielska wrote:
> Let's introduce GPGPU subcategory.
> 
> v2: functionality s/gpgpu/gpgpu_fill/ to not trouble automation tools
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/gem_gpgpu_fill.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
> index ac283620e..3a6d66b35 100644
> --- a/tests/intel/gem_gpgpu_fill.c
> +++ b/tests/intel/gem_gpgpu_fill.c
> @@ -51,13 +51,13 @@
>  /**
>   * TEST: gem gpgpu fill
>   * Category: Server
> - * Functionality: command submission
> - * Run type: FULL
> - * Sub-category: Compute
> + * Functionality: gpgpu_fill
> + * Sub-category: GPGPU
>   * Test category: GEM_Legacy
> + * Feature: compute
> + * Run type: FULL
>   *
>   * SUBTEST: basic
> - * Feature: compute
>   */
>  
>  #define WIDTH 64
> -- 
> 2.34.1
>

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
