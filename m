Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F57CCA470
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 14:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309CE10E69F;
	Tue,  7 Oct 2025 14:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdLkxXV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150C510E69F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759849032; x=1791385032;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hu3X3EA7Dg/BNqZczLL7tHBXdTGT1u5HfU/21Yd5tJI=;
 b=IdLkxXV9xXpgTwjzMtrE48qBt7tTZj/V43a5KtD+mxfLY+nBrOYhwFas
 RUE3h6xZ5giUVpQFTAAqw5AMvqkMJmD89VQlvHAQAoOdYRmLNYIs+7ksf
 5wTdbDokpplLc5+l0QX++UVtS+3JEK2CGv+GqFlhv4/hcvrCtKCR8th/a
 RAIgOQA4TWwrAn6yqK+w1e7MriWR5u6qlMxwV4ZwjKyCH1so8xP+7Ivpf
 EoNQnwz7e6zGARkW0ofc15jGu+YOkHPww2aPIIZxY91s5Gi8k0poZkPZD
 03ltoWEnPP0Zu1Fv1JBJUC/OOv6zQQkpnpgzHIKVGAACOgQ5tGGLojGgf A==;
X-CSE-ConnectionGUID: h6d08xKmRvubDQE3Bpo2qg==
X-CSE-MsgGUID: e5bFTqnJRpKEsJuY7Gmg+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="65882032"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65882032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 07:57:11 -0700
X-CSE-ConnectionGUID: K8FG6RPcTQiYljVWKrE0rw==
X-CSE-MsgGUID: wpZsUDYTTauT7H1rQq51eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180217056"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 07:57:10 -0700
Date: Tue, 7 Oct 2025 16:56:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t 1/2] benchmarks/gem_wsim: Fail on thread assertions
Message-ID: <20251007145654.gqbovjgjkg2ca5nl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250924110607.563913-1-marcin.bernatowicz@linux.intel.com>
 <20250924110607.563913-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250924110607.563913-2-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-09-24 at 13:06:06 +0200, Marcin Bernatowicz wrote:
> Call igt_thread_assert_no_failures() before returning so thread errors
> affect the exit status.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  benchmarks/gem_wsim.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 7a6b10028..098415b53 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -63,6 +63,7 @@
>  #include "i915/gem_mman.h"
>  
>  #include "igt_syncobj.h"
> +#include "igt_thread.h"
>  #include "intel_allocator.h"
>  #include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
> @@ -3362,5 +3363,7 @@ err:
>  	if (is_xe)
>  		xe_device_put(fd);
>  
> +	igt_thread_assert_no_failures();
> +

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	return exitcode;
>  }
> -- 
> 2.31.1
> 
