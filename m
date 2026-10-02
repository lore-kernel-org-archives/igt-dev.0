Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26595CA5FD4
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 04:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FBA10E0BA;
	Fri,  2 Oct 2026 04:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dn9/o0RV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672AE10E0BA
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 04:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790916938; x=1822452938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NYxvnRuxtC+jQ9owLeBDvFlNYH1NdA4sZUquru68BqY=;
 b=Dn9/o0RV4uXTQ2VSBYVft0SYllfm5EMBqJmMuQ0cMZROJV9oinvWB2AO
 naldZlRAGU3hEm/1iUXI5+ahofyCy8Q8+0o/jiHtCLQCJHLYrlRjSPxSe
 5NVUGXY56MeC1umLQ85izKAJpf1xVo4ZI2yaVFGve/rMIWNQQsz6hOVw6
 +8YW6t6m1Pp4Nw/W9VBoG2mCf1WiV1BSrW0wWSSNnZ2Y6wmnNUB5rktAB
 e8wlph+dRn+Qt2eG7upKUIXd8NUCPRBzuvyfEw9yGOCqWMi3gmdBBOlS8
 h5TYAtWKNUW1kgUrm5fgCWBhsuwKxA7ha5Y8he5o5aMVjp/6n2kWwZCSd g==;
X-CSE-ConnectionGUID: 1z3zdhbXQe+i7jpbGVQPzw==
X-CSE-MsgGUID: HszkR6BfRm6e182OINWiqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94169689"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="94169689"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 21:55:38 -0700
X-CSE-ConnectionGUID: SNLbJgXdSZWH1fYwpjRfNA==
X-CSE-MsgGUID: dx8PftzuRHGHb+hPupUTLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="304127363"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 21:55:36 -0700
Date: Fri, 2 Oct 2026 06:55:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Xin Wang <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.d.roper@intel.com, 
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v14 1/4] lib/igt_core: add igt_destructor helper
 macro
Message-ID: <tfir2wxakudstbjfbbnri4qnjvu6w3i3nq4rn6gj2fgith5mxf@eb3guzuj6jsz>
References: <20260928172713.1341060-1-x.wang@intel.com>
 <20260928172713.1341060-2-x.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260928172713.1341060-2-x.wang@intel.com>
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

On Mon, Sep 28, 2026 at 10:27:04AM -0700, Xin Wang wrote:
> Add igt_destructor alongside igt_constructor to make it easy to run
> library teardown code when the binary unloads/exits.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/igt_core.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index c0908a8edb..c2565729b9 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -524,6 +524,18 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
>  	__attribute__((constructor)) \
>  	static void igt_unique(__igt_constructor_l)(void)
>  
> +/**
> + * igt_destructor:
> + *
> + * Convenience macro to run the provided code block when igt is exiting,
> + * after all tests have been run. This should be used for parts of the igt
> + * library that require de-initialization of objects with global context.
> + * This code block will be executed exactly once.
> + */
> +#define igt_destructor \
> +	__attribute__((destructor)) \
> +	static void igt_unique(__igt_destructor_l)(void)
> +
>  __noreturn __attribute__((format(printf, 1, 2)))
>  void igt_skip(const char *f, ...);
>  __noreturn __attribute__((format(printf, 5, 6)))
> -- 
> 2.43.0
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
