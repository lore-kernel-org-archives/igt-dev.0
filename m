Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAD5C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 06:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D7910E314;
	Mon, 19 May 2025 06:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F51uPLXV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0C610E386
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747637936; x=1779173936;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zpYaujXYTOhzZeNwGJR72qlTxOQdgQAUGHSawvuxcoE=;
 b=F51uPLXV/mMaAz4EFDnkzkhMCAXeNhdkM00nOHvbT8rbQ9boX2pVhfo8
 4ehxg8pH+G+2EREHWfcjlZ/xzx21YNPB8pMgi/uwvhcXEQImdpeBp6ZeB
 SOYnjadlqg8TPfXwxyN0pqdQnGzv/r4GjL2uqmIVhNisDACPLqtkP/TXM
 JnQSA+qaPezru7tvqMctxPK0RAAw4GDBiUm0+UVl9QRtWrH0UjK9bHbSW
 0xtda6tFbEXBJ7A9uU4lG+V/CMWAoEMZmULgbmdrh3YEhAA3GsZX89pOg
 ebkbp/I0MWM9Eunhi/K2sRvf5rmDhyuEtq6/DwZNT6MUXfMQKVeySg/UG g==;
X-CSE-ConnectionGUID: 417an2quRwCR1durDDymlw==
X-CSE-MsgGUID: 1lX8FfbmRcOPNBLDocmP8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="37141115"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="37141115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 23:58:56 -0700
X-CSE-ConnectionGUID: USPZ2y+6TQqPHOuGJfIc8g==
X-CSE-MsgGUID: XeAdGOTtTPCMBtQ75yA9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139698279"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 23:58:53 -0700
Date: Mon, 19 May 2025 08:58:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com, 
 sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v6 09/14] lib/igt_core: Implement conditional
 backtrace support using HAVE_LIBUNWIND
Message-ID: <vt2wkryso6d5lwgmnno4tta52mu2y3vkdy2llxmpehp52ssi43@qnau4ronoxow>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
 <20250516160551.58760-10-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516160551.58760-10-jeevaka.badrappan@intel.com>
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

On Fri, May 16, 2025 at 04:05:46PM +0000, Jeevaka Prabu Badrappan wrote:
> Add a log message indicating "backtrace not implemented" in the
> print_backtrace function and return when HAVE_LIBUNWIND is not defined.

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 1d7402cb7..097a556c9 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -383,6 +383,9 @@ static int _igt_dynamic_tests_executed = -1;
>  
>  static void print_backtrace(void)
>  {
> +#ifndef HAVE_LIBUNWIND
> +	igt_info("backtrace not implemented\n");
> +#else
>  	unw_cursor_t cursor;
>  	unw_context_t uc;
>  	int stack_num = 0;
> @@ -440,6 +443,7 @@ static void print_backtrace(void)
>  
>  	if (dwfl)
>  		dwfl_end(dwfl);
> +#endif
>  }
>  
>  __attribute__((format(printf, 2, 3)))
> -- 
> 2.49.0
> 
