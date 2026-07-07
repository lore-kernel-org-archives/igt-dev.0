Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B23EC43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 09:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13D910E0CA;
	Tue,  7 Jul 2026 09:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ga0UNkXu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941FF10E0CA
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783417513; x=1814953513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j8o9WBhKR1TweUqLCOdtSESjqqQOyWN5mq6udKxl+u4=;
 b=Ga0UNkXuRlXYgsqBIm/Vf7bc/HTZUbEaYd/X1Sl4TXIu7J8JVjjzVtpT
 UkvNO97KiJS3iqS8WU0arIoQHuMS8ip5UHBj/uzVB16ilKSXw+F7BDBLT
 t2U+0+gfUfgFIBgfJBtnH7rAP4hw/xiEnkAZghXqYK7qAQ4jiDoP2ofx9
 gn0Lh2kYMSlkdmZZvuN1TjCi0NCvwYMx3kZC2PDjhGuXTXBMz/J3bwYln
 mGt9aGNCcGOTIJ5nBWcCAeHilZVkfMBAXtQYY0ivEdNO1hLB3xxT+ultY
 vAXyQbp7lAiAoUnWYzDgXYHfacGpIrjMhqdmfOBhusWgg/rTExdN3MYvS g==;
X-CSE-ConnectionGUID: Dze2N0y7R8axBjtAuB1pLg==
X-CSE-MsgGUID: 0+4WiCmGTo2IhgJrIGQ5cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="109602139"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="109602139"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 02:45:13 -0700
X-CSE-ConnectionGUID: FsA+5RJcR9y2unlCHqLKYA==
X-CSE-MsgGUID: AWFf8mT1TF2qKrWgVqcWEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="251284330"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:45:12 -0700
Date: Tue, 7 Jul 2026 11:44:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Ignore expected
 CAT error in fault subtest
Message-ID: <20260707094452.iw7libztvxnfvydy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260706181752.3039184-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706181752.3039184-1-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2026-07-06 at 18:17:52 +0000, Shuicheng Lin wrote:
> The 'fault' subtest submits an exec with a bogus batch address. The
> kernel nacks the unresolvable pagefault, which the GuC escalates to a
> memory CAT error and engine reset. The resulting 'CAT error' dmesg
> messages are expected, not a real failure.
> 
> Emit an ignore-dmesg regex to suppress them in CI. It matches both
> 'Memory CAT error reported by GuC!' and 'Engine memory CAT error'

Can you move this 'It matches...' (or repeat it) in comment in code?

> messages.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 24fc5b708d..fd7520e519 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2752,10 +2752,12 @@ int igt_main()
>  	igt_subtest("threads-shared-alloc-many-stride-malloc-race")
>  		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, false);
>  
> -	igt_subtest_f("fault")
> +	igt_subtest_f("fault") {

Please add a comment here and cite messages you want to skip.

> +		igt_emit_ignore_dmesg_regex("CAT error");

Can it be a little longer?  [Mm]emory CAT error
Or if you do not like [Mm] you could drop first letter 
and get "emory CAT error".

As these are cosmetic changes you can keep r-b from Matthew.

Regards,
Kamil

>  		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
>  				  FAULT, NULL);
> +	}
>  
>  	for (const struct section *s = psections; s->name; s++) {
>  		igt_subtest_f("partial-%s", s->name)
> -- 
> 2.43.0
> 
