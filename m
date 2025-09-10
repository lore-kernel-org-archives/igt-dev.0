Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91258CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 13:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2470C10E91E;
	Wed, 10 Sep 2025 13:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvR8RBPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB8410E91E
 for <IGT-Dev@lists.freedesktop.org>; Wed, 10 Sep 2025 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757509372; x=1789045372;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=btz0KBoz1KQHDSEvAe6ttI7ub/U2LHCWa6sysiscWwU=;
 b=UvR8RBPsBJ99gRjmGyFd9v+/1T+zREG25ZlKLx0jUAm6nBiMWuPu5rqX
 q6hG+nAbqBRq81QxmfZ0tCVXsQmsmz2x1/35eb8p5dN7H9AeK2Dj1JIVH
 1/tKOZ4/xhbGWF1/5/tA4ZU105uNfjpdosFjNRP6ixpdyevaxtnuqIy+S
 5KRZngoZlSw3jFNKgQ8gVfvqDk4K46kWKpHbei/IdTiMnSpHzFHsMyU/q
 535NObxgMiFa0oVgjWnh61F3uCd8rcR6iMthHdjYUBT8DdiHoYMOmVWOu
 CoHHVPSxZGpNrDJl3ha0zwUO0Xezuj1IKV5XgYDCF1wKQNCD7QMAoaOai A==;
X-CSE-ConnectionGUID: a97slWMXQgKpEpGIVngJsg==
X-CSE-MsgGUID: 5vndpRlGQgqcTdLB/BAIOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59879633"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59879633"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 06:02:52 -0700
X-CSE-ConnectionGUID: HR9UqTCPRUK+BTpVyXgp+A==
X-CSE-MsgGUID: ecbsVt6DQ7KT8aHKGt9Wrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="172982865"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 06:02:50 -0700
Date: Wed, 10 Sep 2025 15:02:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Add GuC load to
 list of injection functions
Message-ID: <20250910130248.53f5akdohdrvoq5x@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John.C.Harrison@Intel.com, IGT-Dev@Lists.FreeDesktop.Org
References: <20250909225219.547308-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909225219.547308-1-John.C.Harrison@Intel.com>
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

Hi John.C.Harrison,
On 2025-09-09 at 15:52:18 -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Failures in the GuC load path had been suppressed by the KMD for
> various reasons. They have now been re-instated and support for
> injecting failures to test that code path has been added. So add
> the matching test.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 04de2bfd54a1..9e98b3ada94e 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -241,6 +241,7 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
>   * Functionality: fault
>   *
>   * arg[1]:
> + * @guc_wait_ucode:			guc_wait_ucode
>   * @wait_for_lmem_ready:		wait_for_lmem_ready
>   * @xe_add_hw_engine_class_defaults:	xe_add_hw_engine_class_defaults
>   * @xe_device_create:			xe_device_create
> @@ -547,6 +548,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  		unsigned int flags;
>  		bool pf_only;
>  	} probe_fail_functions[] = {
> +		{ "guc_wait_ucode" },
>  		{ "wait_for_lmem_ready" },
>  		{ "xe_add_hw_engine_class_defaults" },
>  		{ "xe_device_create" },
> -- 
> 2.49.0
> 
