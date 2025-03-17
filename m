Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F91C35FF8
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 16:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FA710E141;
	Mon, 17 Mar 2025 16:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgmwB1EK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C75410E141
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742229561; x=1773765561;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oT2iAywn7hP0p+dAuXS801nl+AbxI/0ZTfpf1Z9/s24=;
 b=JgmwB1EKp2KatRlJ4noRF10+Prdd5MIiQasJqvzX6nOBSN6DGR7BhEpc
 mHeD56Cgj9j8ni4fJ4KU8gpjELXmrP34AzI0nNOPqoOgOI366Q8wfWsTd
 B75om243Dw7NURuzlS8ucyVc+GP5XjnI/DNINsoyvpu8PaK2bxCTaWzD3
 APUINey/MsOddzw+Qz8tr5AUyZU7SdOOdcZaekXE44Y/Bg0bJpoLSXnpi
 MW0LL0EPLUy9tK7lA3FSZG/Mk6fx8TEw9VZLqaKM0lacdruUTlyOr1dxE
 l0qeIrPt1MEmwzBtA8I67dmqKzRoygs7U76uv217wkHksEhww+En+Q18e Q==;
X-CSE-ConnectionGUID: vhyQef/fQSSZUiLE2cJ0pA==
X-CSE-MsgGUID: IzlHlYi5TAm9SGKcDCltxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43216920"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="43216920"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:39:21 -0700
X-CSE-ConnectionGUID: HK5ekfzqRzeAq1rWTzFZHw==
X-CSE-MsgGUID: y5odhXANRUKkFmHpDG8G+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="122939071"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:39:19 -0700
Date: Mon, 17 Mar 2025 17:39:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pawel Sikora <pawel.sikora@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t 1/1] lib/igt_core: capture logs for child processes
Message-ID: <20250317163907.lrhtwmbakoq3m65k@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pawel Sikora <pawel.sikora@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250313125004.3881354-1-pawel.sikora@linux.intel.com>
 <20250313125004.3881354-2-pawel.sikora@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313125004.3881354-2-pawel.sikora@linux.intel.com>
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

Hi Pawel,
On 2025-03-13 at 13:50:04 +0100, Pawel Sikora wrote:
> This change addresses the issue of missing logs for child
> processes in the IGT runner.
> 
> The '_igt_log_buffer_dump()' function is now called before
> exiting child processes, ensuring that logs are properly
> captured and not lost when IGT fails and child processes
> dump logs before exiting.
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@linux.intel.com>
> ---
>  lib/igt_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 9702a9417..33e5ca7cd 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1905,12 +1905,11 @@ void igt_fail(int exitcode)
>  		failed_one = true;
>  	}
>  
> -	/* Silent exit, parent will do the yelling. */
> +	_igt_log_buffer_dump();
> +

Can it be a conditional? As I remember this was a problem with
logs line interleaving one with another and it was solved by
igt_runner using comms, so I propose to use this only when comms
are active, see 8a3dc4020 lib/igt_core: Send logs to runner with comms

For example:
	/* If igt_runner uses comms it could grab each childs logs
	 * without them interleaving in stdout/stderr.
	 */
	has_comms = runner_connected();
	if (has_comms)
		_igt_log_buffer_dump();

  	if (test_child)
  		exit(exitcode);

	if (!has_comms)
		_igt_log_buffer_dump();

This will fix it for igt_runner with comms, leaving old behaviour
when no comms were used.
This is suggestion, if you do not like it at least add a comment
why was it added there.

Also I add Petri to Cc.

Regards,
Kamil

>  	if (test_child)
>  		exit(exitcode);
>  
> -	_igt_log_buffer_dump();
> -
>  	if (test_multi_fork_child)
>  		exit(exitcode);
>  
> -- 
> 2.34.1
> 
