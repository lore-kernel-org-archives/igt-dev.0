Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6654FC7115A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 16:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A58710E8CF;
	Wed, 18 Jun 2025 16:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ru8F0meQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DBE10E8CF
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750262544; x=1781798544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yUXcLAhE+LnrzGr+rwx87zq1syMoUDihiBs+rRubAZg=;
 b=Ru8F0meQg3WQpAxAMNS44lSh0ai8DujyTvHJHFvSwG5p2mcZ0clbvAd9
 WjZSNKm0DNNpprdxf5lQ+JKd4xgUP8fJiNXxypoGnTLaTa325NdIuLRk9
 vB028HIpMDkuas310SplIKgFvd7oFj3NmLLxD1gGwh17uP7VG0jxpblCL
 rCIwbRYe+e7AK0GJoQlpQZjCd04YUuSOwzqcXlvstYDm7FIBZu8O1cuBd
 b+yvmsISYtPZ7hoi+RvkZA9BnSzrrdPM+CBPHDE52VxxT+qZlFLkXLDMU
 H6mi8TrAPfA4s+CcY8Jk1B5NRf8NH7UfWt+1rx9w8GDXlc0vI9teDE9W0 A==;
X-CSE-ConnectionGUID: KEt9UjnmS6y3rIdZjkzEmw==
X-CSE-MsgGUID: d9Z3Hp0ZS1KBDLRBTIQJcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="69932683"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="69932683"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 09:02:22 -0700
X-CSE-ConnectionGUID: R3Lae9wEQpmVfG8sg6kxUQ==
X-CSE-MsgGUID: qNm5CIzcSMSInIg0g1407A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="155238792"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 09:02:19 -0700
Date: Wed, 18 Jun 2025 18:02:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH 2/3] lib/tests/igt_assert: use volatile cast in igt_assert
Message-ID: <20250618160217.pz7fjxupmmt2pxdt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
 <20250617-bump_fedora_to_42-v1-2-d04e6a0455fd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617-bump_fedora_to_42-v1-2-d04e6a0455fd@intel.com>
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

Hi Andrzej,
On 2025-06-17 at 16:05:24 +0200, Andrzej Hajda wrote:
> Newer versions of clang optimize code more aggresively.
> As a result change of variable in subtest is observed
> by caller only if it is cast to volatile.

Nice catch!
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/tests/igt_assert.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/tests/igt_assert.c b/lib/tests/igt_assert.c
> index 3523a46494822cd42f63047c0b5bbb5b39343c84..10c08f9860bb77faa35e4dd46e19d69c94897a7f 100644
> --- a/lib/tests/igt_assert.c
> +++ b/lib/tests/igt_assert.c
> @@ -46,7 +46,7 @@ void (*test_to_run)(void) = NULL;
>   */
>  #define CHECK_NEG(x) { \
>  	igt_subtest_f("XFAIL_simple_%d", __LINE__) { \
> -		(*exec_before)++; \
> +		(*(volatile int *)(exec_before))++; \
>  		x; \
>  		raise(SIGBUS); \
>  	} \
> 
> -- 
> 2.43.0
> 
