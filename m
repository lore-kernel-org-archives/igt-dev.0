Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A2ACA600B
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 15:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AE410E45C;
	Thu,  8 Oct 2026 15:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q00AtD2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C742810E45C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791472052; x=1823008052;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/+HhRUYqVus+ZuyB4a7EjiYixQLanSpd54MTDdvJZs4=;
 b=Q00AtD2ezTgkzrgCSxMWBqexOmH+CB43oTn8c+y9+0Dya61XNmmMWMTD
 CXw46y43Pmyal+X4nfEDbNkQ3ksuqtvZNNWg4HLvR2pWgVgD7XYIowb36
 HsE1o4/tnodO4OEqI1xx/nwagIgWLPpCEk9oJopApdSgiq3UzE+QMVFrf
 9zge7CfDVeqUqEB7cEVk0s4xA6k6V2smzJvbchnA+p+E0TNzHtYVQU0AB
 lFUGNqCPwBflTXMFjSSMXBUNRM1Vg+G6FHOwcz05TdaE4DVB+qlXffRan
 p191Nw81+ECo7PPgTmTCQwWWA6L1bnEdyQHQuA6KuNbqBEI+vllpPNKT9 Q==;
X-CSE-ConnectionGUID: km62scTZTqSug0rsIWbHNA==
X-CSE-MsgGUID: L/43bby4Qli9DG6pGlxnWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="255778"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="255778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 08:07:19 -0700
X-CSE-ConnectionGUID: NPzq/WZbQ82ieVGmq5eFUQ==
X-CSE-MsgGUID: QXhwwjY/QBad5pt5taqNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="426709"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 08:07:17 -0700
Date: Thu, 8 Oct 2026 17:07:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org, Nishit Sharma <nishit.sharma@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/4] tests/intel/xe_exec_reset: Fix gt reset fault dmesg
 ignore regex
Message-ID: <20261008150715.6eisnh7fxuyj7krj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org,
 Nishit Sharma <nishit.sharma@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
 <20261007210603.1350158-2-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007210603.1350158-2-shuicheng.lin@intel.com>
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
On 2026-10-07 at 21:06:00 +0000, Shuicheng Lin wrote:
> igt_emit_ignore_dmesg_regex() passes the regex to igt_runner through
> /dev/kmsg, and the kernel escapes '\' as "\x5c" in kmsg records.
> igt_runner compiles the ignore regex from the escaped record, so
> "\(-ECANCELED\)" turns into "\x5c(-ECANCELED\x5c)", which requires a
> literal backslash and never matches. As a result the expected
> "(-ECANCELED) ... GT: reset failed" and "(-EIO) WEDGED" errors are
> reported as dmesg-warn/dmesg-fail in gt-reset-fault-injection.
> 
> Use bracket expressions for the literal parentheses so the regex
> survives kmsg escaping.
> 
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 50771af53..901ce2f3f 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -928,12 +928,17 @@ static int try_vm_create(int fd)
>  
>  static void ignore_gt_reset_fault_dmesg(void)
>  {
> -	igt_emit_ignore_dmesg_regex("\\(-ECANCELED\\) .* GT: reset failed"
> -				    "|\\(-EIO\\) WEDGED: Device declared wedged"
> +	/*
> +	 * The regex is passed to igt_runner through /dev/kmsg, which escapes
> +	 * '\\' as "\\x5c", so use bracket expressions instead of backslash
> +	 * escapes for literal parentheses.

Maybe this should be added to this lib function's description?

> +	 */
> +	igt_emit_ignore_dmesg_regex("[(]-ECANCELED[)] .* GT: reset failed"
> +				    "|[(]-EIO[)] WEDGED: Device declared wedged"

Or drop first '(' and replace ')' with dot? Will be simpler:

	igt_emit_ignore_dmesg_regex("-ECANCELED.* GT: reset failed"
				    "|-EIO. WEDGED: Device declared wedged"

>  				    "|IOCTLs and executions are now blocked"
>  				    "|For recovery procedure, refer to"
>  				    "|Please file a _new_ bug report at"
> -				    "|Failed to invalidate GGTT \\(-ENOTRECOVERABLE\\)"
> +				    "|Failed to invalidate GGTT [(]-ENOTRECOVERABLE[)]"

Here also imho it could be simple:

				    "|Failed to invalidate GGTT .-ENOTRECOVERABLE"


Regards,
Kamil

>  				    "|GPU HANG"
>  				    "|Failed to reset");
>  }
> -- 
> 2.43.0
> 
