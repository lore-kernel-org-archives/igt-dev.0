Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D2EC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 12:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADA010E631;
	Wed, 14 May 2025 12:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMb3QQ7H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BF810E631
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747227111; x=1778763111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=psPoiP1iBts+1XaXF58akIaLxT60fJCBHmuVtb7bJNo=;
 b=EMb3QQ7HD8Er6MmnPauXr7DhZfMNr666yGhKpaMeDtAcCJxRo+Cfr9cU
 eLcQr7VtjQBhJD8CE3M7DuiGWdAGPwhzUIglVl+fJG8mls0bP/8dBZsB6
 T+9dx1iSoMCcqLuj1kEYcznoIo+W/Lnba2+d/9qtRLy1W8faiIrYVa5hw
 z2LgR44L9olg8L5SKdSb9nRqOaAW9opADRE/RA+bmA5RKH+WqW4aXKV8Q
 4zpcQ3wWCGGFVF1nIY7U1L17+Z4ByNzArtoRnN0QGfIRBqVawLnIvAq2B
 CAFiMlsubSBnp0NPD0JIVI5x59oJdJxZmMBhWUAPqZFfkWpM5dJeDcTns g==;
X-CSE-ConnectionGUID: VP1FdNV6SZOUrELLqHvPiA==
X-CSE-MsgGUID: UsxexaoGSRW5+y5hqkV3ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59778667"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="59778667"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:51:51 -0700
X-CSE-ConnectionGUID: ooHHXKozSYe9V6O0WirqHg==
X-CSE-MsgGUID: +UEuFB+fRG2Oso7Np7V10Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="168973882"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:51:48 -0700
Date: Wed, 14 May 2025 14:51:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 09/15] lib/igt_core: Add print_backtrace placeholder
 for Android
Message-ID: <7p2jkz4qazlg6rnbfcnzp6ia36mddpw3winrrhucvr7cbarzbc@nobym64h5bnl>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-10-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507160148.53857-10-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:42PM +0000, Jeevaka Prabu Badrappan wrote:
> As libunwind is not built for Android, print_backtrace placeholder
> aded with not implemented log.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 6c89e136b..e7d979042 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -381,6 +381,12 @@ static bool stderr_needs_sentinel = false;
>  
>  static int _igt_dynamic_tests_executed = -1;
>  
> +#ifdef ANDROID
> +static void print_backtrace(void)
> +{
> +	igt_info("backtrace not implemented\n");
> +}
> +#else
>  static void print_backtrace(void)
>  {
>  	unw_cursor_t cursor;
> @@ -441,6 +447,7 @@ static void print_backtrace(void)
>  	if (dwfl)
>  		dwfl_end(dwfl);
>  }
> +#endif /* ANDROID */

You mean '/* !ANDROID */?

--
Zbigniew

>  
>  __attribute__((format(printf, 2, 3)))
>  static void internal_assert(bool cond, const char *format, ...)
> -- 
> 2.34.1
> 
