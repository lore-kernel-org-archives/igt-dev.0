Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D0FC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE4710EB52;
	Fri, 16 May 2025 17:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oC+p1e1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CBE10EB54
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747417596; x=1778953596;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hHbS22J5VrNDRBHBB3y4itB+U8sZbAW1pwoV9KGkbBk=;
 b=oC+p1e1FT1R7h1w6rakqKnN/cGK0S6Ccqk8YGcoWSh4cdPsfThb6ye95
 ugufDyrQYe0Ubh1uqoJpH9nWllxZFudwXEYqGehr1HO7JGZhHofV5Coke
 YRWFiPL28AaeQiznF5wQMpB42+k5xtnaJt2Qv7R4XU60S/dlNPDf8XtHv
 hIsFEED/S/iMAohjLqr3vq6ZHOmcwT8N81ok/vQUJ5Kt7JGygMP/l2LXk
 aYox6Tb6hnxojfN7bm6g4xatUimwnNdgazMPAOnN4vSDPL8aa9wHRaCuU
 9q0xzS8m0xRHJJEduTh4lZrVEk9UrT9FauYJvdXQxsAt4B7nQUIdln2co A==;
X-CSE-ConnectionGUID: SStHeHuXR9yQxwN9vxbvUw==
X-CSE-MsgGUID: Trv56oVwSeaGwyLax1GRrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53215656"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="53215656"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:46:36 -0700
X-CSE-ConnectionGUID: JMBuOaHNSfqgKcEqwHVNDQ==
X-CSE-MsgGUID: h4KlweXaQ8Gerzxsqze/+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="143636809"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 10:46:34 -0700
Date: Fri, 16 May 2025 19:46:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v7 09/14] lib/igt_core: Implement conditional
 backtrace support using HAVE_LIBUNWIND
Message-ID: <20250516174631.elj5cyme4djqno6x@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
 <20250516171153.74079-10-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516171153.74079-10-jeevaka.badrappan@intel.com>
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
On 2025-05-16 at 17:11:48 +0000, Jeevaka Prabu Badrappan wrote:

imho subject could be improved,
[PATCH i-g-t v7 09/14] lib/igt_core: Implement conditional backtrace support using HAVE_LIBUNWIND

You didn't do any implementation here, only a 'dummy' one or a workaround.
so for example:
[PATCH i-g-t v7 09/14] lib/igt_core: Add a dummy workaround when libunwind is not present

> Add a log message indicating "backtrace not implemented" in the
> print_backtrace function and return when HAVE_LIBUNWIND is not defined.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

This looks good
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_core.c | 4 ++++
>  meson.build    | 3 +++
>  2 files changed, 7 insertions(+)
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
> diff --git a/meson.build b/meson.build
> index 6a580bd7e..b88098234 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -147,6 +147,9 @@ else
>  endif
>  
>  libunwind = dependency('libunwind', required : get_option('libunwind'))
> +if libunwind.found()
> +	config.set('HAVE_LIBUNWIND', 1)
> +endif
>  build_info += 'With libunwind: @0@'.format(libunwind.found())
>  
>  libdw = dependency('libdw', required : true)
> -- 
> 2.49.0
> 
