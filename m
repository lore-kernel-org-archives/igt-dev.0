Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F097C282EC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D959210E8B6;
	Thu, 13 Mar 2025 14:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lI+ryUWd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FB510E8B6
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741876114; x=1773412114;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7LLACZMiFpSrD4A14OZNDSXdGmi91zmZRvAAOHN8S5w=;
 b=lI+ryUWdsO34NJ3vjsCBXb5YGkokBEqYVZcrVwuErcf0n4fV8g78glum
 NVPdLL4SxkO+6QsDF+KBBZL/E6CDDdmuA+bz9EKq36R25ZE9W27hC2gXb
 YD9SMIQKWPw46tW+oSZFl3BGz9ltOQEPL+PggcAYqDgvAPYG72dV7fcbQ
 Juzfu4f4DhvHiGJO1M0B+Dk6eczuB961J2tOWRo/yNLXN7khFZBGwR/9K
 PTVjIN1riVGCGryp3oyyxOVTIwhRU+dbBkPmjJ5uCvDFSOkypfsKK2q8V
 1e0f0Wb29KMBTIRsiTPBwiGD5aECvqgRnPjTl6bQBCA8wlbxdOmCQYxcj g==;
X-CSE-ConnectionGUID: 4j/yAGYTRrCsXBU8GDxjXg==
X-CSE-MsgGUID: J29gjeQfTOOfga3dOo2KZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="30586450"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="30586450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:28:33 -0700
X-CSE-ConnectionGUID: Xpo4U4etRreOALvWjrM2Xw==
X-CSE-MsgGUID: zPF9XCFuRkWgvQ6Eczs8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="151834114"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:28:31 -0700
Date: Thu, 13 Mar 2025 15:28:28 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pawel Sikora <pawel.sikora@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Thomas Wood <thomas.wood@intel.com>
Subject: Re: [PATCH i-g-t 1/1] lib/igt_core: capture logs for child processes
Message-ID: <20250313142828.wiyd4sv5azlqeswk@zkempczy-mobl2>
References: <20250313125004.3881354-1-pawel.sikora@linux.intel.com>
 <20250313125004.3881354-2-pawel.sikora@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Thu, Mar 13, 2025 at 01:50:04PM +0100, Pawel Sikora wrote:
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
>  	if (test_child)
>  		exit(exitcode);
>  
> -	_igt_log_buffer_dump();
> -

I've tested your patch and it seems without it forked children
don't flush collected log (with backtrace). With runner there's
mixed collected interleaved logs but separated children backtraces
are better readable.

So from me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


>  	if (test_multi_fork_child)
>  		exit(exitcode);
>  
> -- 
> 2.34.1
> 
