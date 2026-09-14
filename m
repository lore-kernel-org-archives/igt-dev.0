Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAF2C88E72
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 18:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C3410E1F7;
	Mon, 14 Sep 2026 18:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSNzDfoC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936B710E1F7
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789411343; x=1820947343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dopT6QUoNmlpcshnYIWXGlO+h+0FZZ3rP3bZFbnHoQ4=;
 b=mSNzDfoClKdk7iQHzqhsyZ/kMoGh2r8A50eHB7s5JcpSQNmSGMeeuSlN
 SBzGa4gbIWftV1rVicVIKiraz4caONJIoIQsZ7tHvT3Iw6cz+vI64Jera
 9AHiveh2v92m8xuQ96Jf2+xWc9W4P0x+xbSf7qbMuYpR0qDNFhQrNns3S
 cYy/7p8UQYC0zmEo+IOmYr46ViXygqitipJV2uc34L4poJ9+fXqT24CV2
 toQhIRhqROPMPIITegoEvKwFtwNIw8svROJVyUfDRAHb/C6If+PwG1+h+
 WhUkRoY7OuS0RLiFWWsGlwU2n+wvAOSIp0+OsY9KKCmm0AZxBVsIlI7Ko Q==;
X-CSE-ConnectionGUID: YHvOyKZiRkiiXEIxe2K5Rg==
X-CSE-MsgGUID: k7CNYwzBTtKl7WKROjJd3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89709972"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89709972"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 11:42:22 -0700
X-CSE-ConnectionGUID: q8/OBiyPSyauUK05EK+Iqw==
X-CSE-MsgGUID: DDgoqpCVT9C6WAq5LnQH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="268429646"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 11:42:21 -0700
Date: Mon, 14 Sep 2026 20:42:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, alex.zuo@intel.com, nishit.sharma@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Update gt reset dmesg
 ignore regex
Message-ID: <20260914184205.og5fxxvwplgzsohr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, alex.zuo@intel.com,
 nishit.sharma@intel.com
References: <20260914164330.436487-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914164330.436487-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2026-09-15 at 00:43:30 +0800, Jonathan Cavitt wrote:
> The error logging function in gt_reset_worker was recently updated from
> xe_gt_err to xe_log_err_fatal, resulting in several of the error
> messages being changed or updated.  These new error messages are still
> expected, so update the igt_emit_ignore_dmesg_regex list in the reset
> fault case to reflect the updated messaging protocol.
> 
> There's also occassional reports of GGTT tlb invalidation failures
> caused by some race condition on the wedged GT.  These are safe and can
> also be ignored.

Thank you for taking car ot this. Few nits below.

> 
> Fixes: aafc4bcf3361 ("tests/intel/xe_exec_reset: add GT reset fault injection stress coverage")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index e12279d23d..d673ad92f3 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -928,8 +928,12 @@ static int try_vm_create(int fd)
>  
>  static void ignore_gt_reset_fault_dmesg(void)
>  {
> -	igt_emit_ignore_dmesg_regex("reset failed \\(-ECANCELED\\)"
> -				    "|declared device .* as wedged"
> +	igt_emit_ignore_dmesg_regex("\\(-ECANCELED\\) .* GT: reset failed"
> +				    "|\\(-EIO\\) WEDGED: Device declared wedged!"

Please drop final '!', so only:

				    "|\\(-EIO\\) WEDGED: Device declared wedged"

> +				    "|IOCTLs and executions are now blocked!"

Same here, drop '!' from end.

> +				    "|For recovery procedure, refer to .*"

Here, final ' .*' is useless, just drop it, so it will become:

				    "|For recovery procedure, refer to"

> +				    "|Please file a _new_ bug report at .*"

Same, here, better
				    "|Please file a _new_ bug report at"

With above fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Before merge please wait for full Xe testing and see if that was
enough.

Regards,
Kamil

> +				    "|Failed to invalidate GGTT \\(-ENOTRECOVERABLE\\)"
>  				    "|GPU HANG"
>  				    "|Failed to reset");
>  }
> -- 
> 2.53.0
> 
