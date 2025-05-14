Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6458C3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 14:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADBC10E26F;
	Wed, 14 May 2025 14:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYVm59Bl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A992110E26F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747233123; x=1778769123;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nkXyDHwWOl1GD6vESNTL9Xa6axYlrjjdSUTZMDec6RM=;
 b=MYVm59Bl5kz+58dA9XCzLRx7he0gG1oNjV/x68rpJ5huHYJl8XLRB3u7
 scTY1oVaYpFCrobIRjJ4i/k9VbPAtjE+44TxZgXBSKhQJpj+WDGyj26jL
 18URDRXcA1bhQwt0ikSJBg415l3hNDOtrIMeIxxeouUAG2XakucdG5Xt1
 3/29+3pS9OzrAejV9R3yJ7TudHu1+lbGiApctaU4FK7gdhxq63yo001nT
 B1Q2UhpYy3hZMMN2dPw8OT1lD32mAD0zGOsWb8hk8Cf9fdJbga2AmFQv4
 50ZgqXrbyRVbIrCro73thoq2mo0rFxQKcghgXCdfEViYmgOVfFZ2Exu+L w==;
X-CSE-ConnectionGUID: HsC4tT8AQe2ekjRkkJ1J8A==
X-CSE-MsgGUID: Sm6wKlwjTsSF5Ka2RcA/ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52938664"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="52938664"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:32:02 -0700
X-CSE-ConnectionGUID: REGIN9wTQJCbJIe7pOxOew==
X-CSE-MsgGUID: GOlZ4MIGQDmjtZfPz5N0Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138965671"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:32:00 -0700
Date: Wed, 14 May 2025 16:31:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 09/15] lib/igt_core: Add print_backtrace placeholder
 for Android
Message-ID: <20250514143157.cysy5erqvtarkqoh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-10-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Hi Jeevaka,
On 2025-05-07 at 16:01:42 +0000, Jeevaka Prabu Badrappan wrote:
> As libunwind is not built for Android, print_backtrace placeholder
> aded with not implemented log.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

Looks OK, one thing - why not using HAVE_LIBUNWIND instead and
make it conditional depending on existence of this lib?

+cc Zbigniew

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

Move this #ifdef/#else/#endif inside a function.

Regards,
Kamil

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
>  
>  __attribute__((format(printf, 2, 3)))
>  static void internal_assert(bool cond, const char *format, ...)
> -- 
> 2.34.1
> 
