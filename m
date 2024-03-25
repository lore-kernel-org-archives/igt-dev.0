Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC23CD11BF
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 14:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F251210E948;
	Mon, 25 Mar 2024 14:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+lwWSpp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604DC10E94A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711378013; x=1742914013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wDFA1b4iPGXliM6B3/dBdsJcCVtBmsFlKbGKc+LhqC0=;
 b=X+lwWSppeKbYFrUcBuLMRKyRTX5QPi8CCQyZEOtFWeVdtfDeBGBrNNNx
 +XkV9OtWp26H6LxOkkf2mXeTSnorxZBndE1CuVFyUIHttrBo3U6NQ3Bcm
 irQFGYnnb4lTG+N0v2MvPKqbRDxW9PMnPacgQ7P23g2wbhd6N9RmhYbP3
 XaPORvwNhvrcwifelF48BV3TD/TCmHbfmsyki9FynsyXjt/OTjIfgIGgw
 s1Vdk3/JAR4Mv37EPBPx1RVnOCLB5Lbrv+f1lbzBz4gq8q7vpkD8W1Tim
 Ni1IGMwsYS2P14jMkP6isEM7ZQR7bU1oXXQ6i2PthMCcCGgR+X9zBR/8w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="23833847"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="23833847"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20104969"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 07:46:51 -0700
Date: Mon, 25 Mar 2024 15:46:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 01/12] tests/intel: Unify Blitter subcategory for
 i915 and Xe
Message-ID: <20240325144648.dloupzq2qrh3myrh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322124108.1825345-2-katarzyna.piecielska@intel.com>
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
On 2024-03-22 at 12:40:56 +0000, Katarzyna Piecielska wrote:
> After cleaning up test documentation for i915 tests some Xe tweaks are
> needed. Let's unify Blitter subcategory between Xe and i915.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_ccs.c        | 2 +-
>  tests/intel/xe_copy_basic.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index aec83a057..7d0f2f2a1 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -21,7 +21,7 @@
>  /**
>   * TEST: xe ccs
>   * Category: Hardware building block
> - * Sub-category: blitter
> + * Sub-category: Blitter
>   * Functionality: flat_ccs
>   * Description: Exercise gen12 blitter with and without flatccs compression on Xe
>   * Test category: functionality test
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 66c666eac..25e8adca0 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -22,8 +22,8 @@
>  /**
>   * TEST: Test to validate copy commands on xe
>   * Category: Software building block
> - * Sub-category: Copy
> - * Functionality: blitter
> + * Sub-category: Blitter
> + * Functionality: copy
>   */
>  
>  /**
> -- 
> 2.34.1
> 
