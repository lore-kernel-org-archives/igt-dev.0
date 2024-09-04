Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B608CD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 12:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDC210E781;
	Wed,  4 Sep 2024 12:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfNCu4N2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA08E10E781
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 12:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725452092; x=1756988092;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+IGaHqk/8wK+lZmwJhDIOANXrMS1RDz3drB/dJeOFqA=;
 b=MfNCu4N2QujDZPqOZCNVmXWVxAbJtOfi2rHASPeU/ESzd4j7TDU5h1hR
 0+UxqLfi1Rtw0GeE4zl1CnpsdOtp33j0ss98WW4gfwB21ASLXOdYdNLIc
 tnjuAcEDaIJJTH6f40V4Qvnz2PzOfMZ6CFh75QH8ubjuOSYsX9Gb7j25A
 7LJ8LE6fweey5WWWtxqvS+qiICbss9ze2abJkwmRC+6kxeB3OkKgNeLNU
 i3zy5pLoa3YhpeHAXp0dUKh5JsNzdoKZnVmBkyksO3IAE5WN1ioGj7t6Z
 1rLZqc1fVP5AxmaFcnHI3lXVLv+6EuGO6+luPY1tGUC5RRdGRiVPU/mhv A==;
X-CSE-ConnectionGUID: dMCIUvl0Snuo3H6rC0J3Mw==
X-CSE-MsgGUID: XVvkXaezSringmbRAtgFrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41606069"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="41606069"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 05:14:52 -0700
X-CSE-ConnectionGUID: 00NB3tEZSh6ac/BUOWBJNA==
X-CSE-MsgGUID: pOdmyWfOQZ6T/ITPfPQC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65592984"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.40])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 05:14:47 -0700
Date: Wed, 4 Sep 2024 14:14:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v5 17/17] tests/xe_live_ktest: Add xe_eudebug live
 test
Message-ID: <20240904121444.hmjtj5bndubygxwb@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-18-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829144547.105371-18-christoph.manszewski@intel.com>
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

On Thu, Aug 29, 2024 at 04:45:47PM +0200, Christoph Manszewski wrote:
> xe_eudebug introduces a dedicated kunit test to the live test module.
> Add it to the list of live tests to be executed.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/intel/xe_live_ktest.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> index 4376d5df7..50af97ecc 100644
> --- a/tests/intel/xe_live_ktest.c
> +++ b/tests/intel/xe_live_ktest.c
> @@ -30,6 +30,11 @@
>   * Description:
>   *	Kernel dynamic selftests to check mocs configuration.
>   * Functionality: mocs configuration
> + *
> + * SUBTEST: xe_eudebug
> + * Description:
> + *	Kernel dynamic selftests to check eudebug functionality.
> + * Functionality: eudebug kunit
>   */
>  
>  static const char *live_tests[] = {
> @@ -37,6 +42,7 @@ static const char *live_tests[] = {
>  	"xe_dma_buf",
>  	"xe_migrate",
>  	"xe_mocs",
> +	"xe_eudebug",
>  };
>  
>  igt_main
> -- 
> 2.34.1
> 
