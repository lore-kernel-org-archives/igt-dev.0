Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3F0C3600C
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 10:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E509910E3BF;
	Mon, 31 Mar 2025 10:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kk3sqprc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415DA10E3BF
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743416055; x=1774952055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c05cFYp6kpStW6itatRwQDmIhAxkf0c2KUy5u/L+gsg=;
 b=kk3sqprciDr5H++EvO5wdtIpHT21lieajTRPst5GOsAqbkyXW7X7zTaa
 tiH4BODmuDtp0cm3bcgih9u7zJyImxqbCVrO1pDL/btrMOwwpHt4g93VT
 /zOCwJVDmKn6mrtUUMpCdeeNREJp+C17Z82ngb0yE6Kp/sCZL4p6qIiDF
 0A1XPwiBiQupQbbCgvnBSHKvUvru/sgnZ3oQcyO6xyIDZo1ntJY9THmuf
 ndotH314owyZf/E1iG7zKSbBoxG82UfLcfydUqHUkYSn+UCeXjqToM6Si
 MB2qj2kuGXlDOQac2krC/Ef4M138LJB2feU2qRfsGLHqzLwtFH7c4DI9Z Q==;
X-CSE-ConnectionGUID: F+5xuPccTmSdjmoQv6mrSg==
X-CSE-MsgGUID: X5jr3rmuRiyIPNHz95K84g==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="55358433"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="55358433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:14:15 -0700
X-CSE-ConnectionGUID: KTm9qJRQSmSup12M2q1xxQ==
X-CSE-MsgGUID: eHIDiGERTyCCOHpcNy1/Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="125862126"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:14:14 -0700
Date: Mon, 31 Mar 2025 12:14:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 2/2] CONTRIBUTING: Add guide about igt libraries
Message-ID: <20250331101412.jng7xwv7kkzkc4sc@zkempczy-mobl2>
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
 <20250327153139.37746-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327153139.37746-3-kamil.konieczny@linux.intel.com>
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

On Thu, Mar 27, 2025 at 04:31:30PM +0100, Kamil Konieczny wrote:
> Add some general guide about adding new library function and
> a few guides for their usage outside of tests.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  CONTRIBUTING.md | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index b571b5e68..d85266a6c 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -38,6 +38,33 @@ The Code
>  
>  [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
>  
> +IGT libraries
> +-------------
> +- Tests and benchmarks are the main usage of IGT libraries, so they
> +  could use test specific macros/functions, for example igt_assert,
> +  igt_require, igt_skip, igt_info or igt_debug.
> +
> +- New library function could be written when it will have at least two
> +  different users, for example if it could be used by two or more tests.

I think there's some exception and single user could be allowed. When
it is very likely function will be used in the future I would accept
single user of such library function.

> +
> +- In a new library function():
> +  if it has macros (for example igt_assert/igt_require/igt_skip) then
> +    write also __function() counterpart without them;
> +  limit also usage of prints igt_info/igt_debug, this should be a part
> +    of test code.

What if function has some input requirements? As an example check
blt_block_copy() and emit_blt_block_copy(). How to handle such cases
without igt_assert?

> +
> +- Libraries and igt_runner
> +  Runner should not use lib functions. It is crucial for CI runs so using
> +  libraries puts a risk of bringing changes meant for tests which in turn
> +  could break runner.
> +  Note: You will find places where igt_runner uses lib functions - this will
> +  be on ToDo list to be fixed.

Agree, runner should be separated from igt library code.

--
Zbigniew

> +
> +- Libraries and tools/
> +  Tools should try to not use lib functions. Any abnormal condition should
> +  be simply reported by printf or fprintf to stdout/stderr and then tool
> +  should exit gracefully. Do not use igt_abort nor igt_assert, igt_print,
> +  igt_debug nor other testing/printing macros from igt lib/
>  
>  Sending Patches
>  ---------------
> -- 
> 2.49.0
> 
