Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3B9C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 09:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD7F10EB57;
	Thu, 22 May 2025 09:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBfxu7yN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCF810EB57
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747904656; x=1779440656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kBOg9he4Wgcwsw1pPQwiE2SqlKbamngLMJwrKRsouro=;
 b=ZBfxu7yNlxsOBIK/PBQ7N5d1AoqUvX+4eFL9ApumQ7CjAtZ9UAi0fxQ6
 eIGCCfhd2gJaCxH8jJ1X9q35i57Y1PEzGH/G8JdjxArQsFSkUc0N1W3iA
 rPZCBJVFF3FFJVkkcw2BfmOS1zqFO8HKA9qI5FZT3puRKMHcVv+38KjpV
 IJRS+tSTjFNnqINgSjQy8hofXQP83aYDSSJnvb4LgnRzQNBFQT0XhI5IJ
 Bz36GXmW3OgAQ/5vNNF8tV/JISCVIcRJm9sGWe45nIlWrV5Ydnf6fmRNg
 9K9sY5Hz2BJjqxeDSvCBPMunZnoabdO7px2eOHK1brzwJwhTLt5NDKLy4 w==;
X-CSE-ConnectionGUID: 5k/XghfrTEirOZJ7MG7GAw==
X-CSE-MsgGUID: usYvRsDpT02HseL7NPqceQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50074209"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50074209"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 02:04:14 -0700
X-CSE-ConnectionGUID: fsj6FSUCS12UBy8R6/Zxdg==
X-CSE-MsgGUID: 3RecBfMaQ/WEjeJGZ8Wayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140912702"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 02:04:13 -0700
Date: Thu, 22 May 2025 11:04:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/igt_core: Workaround igt_thread failure when
 libunwind is not present
Message-ID: <20250522090411.75j6urn2eifcxmiu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250521183120.87121-1-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521183120.87121-1-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-05-21 at 18:31:20 +0000, Jeevaka Prabu Badrappan wrote:
> igt_thread test expects the test failure accompanied by a stack trace
> and it matches the trace prefix "Stack trace: " to determine test result.
> 
> With the commit "Add a dummy workaround when libunwind is not present",
> this trace prefix "Stack trace: " is not printed, resulting in an
> igt_thread test failure.
> 
> There are 2 solutions to fix this issue:
> 1. Print the trace "Stack trace: not implemented"
> 2. Run the failure test only if libunwind is present.
> 
> This patch implements the first approach.

Looks good, I tested it with container build-debian-minimal so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw I will adjust a little your subject and description and
will merge it soon as this fixes our GitLab CI pipeline.

Regards,
Kamil

> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index f698494e1..b06cdfd89 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -378,7 +378,7 @@ static int _igt_dynamic_tests_executed = -1;
>  static void print_backtrace(void)
>  {
>  #ifndef HAVE_LIBUNWIND
> -	igt_info("backtrace not implemented\n");
> +	igt_info("Stack trace: not implemented\n");
>  #else
>  	unw_cursor_t cursor;
>  	unw_context_t uc;
> @@ -2242,7 +2242,7 @@ xprintf(const char *fmt, ...)
>  static void print_backtrace_sig_safe(void)
>  {
>  #ifndef HAVE_LIBUNWIND
> -	igt_info("backtrace not implemented\n");
> +	igt_info("Stack trace: not implemented\n");
>  #else
>  	unw_cursor_t cursor;
>  	unw_context_t uc;
> -- 
> 2.49.0
> 
