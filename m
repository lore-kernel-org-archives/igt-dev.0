Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A64D6CFA1
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 19:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6805310EA6C;
	Thu, 22 Jan 2026 19:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKnZ6OGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FF710EA64
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769110506; x=1800646506;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X/u4JQiYPGgm0LjuDtt1m2dwqqa3iifxbfhpq0ZCXRU=;
 b=fKnZ6OGFk0LhQE+8xw0cuFYWkwWGDNKp8yYTjAe/GSYPRLL+82tSaedm
 AB4MGrcC7WoflKsKPecBVuMWezMvetFOO+zaTzvCwajymYWQ5eW7KFiSj
 lyO2K8R7hUVXDL8Ei+IMcQO4WX+5q73kOdycZxt/YgwykvQEADWrwKghO
 qbIiJNzeXbyrgzFGu3xRONqFLe3pRZqhJTitu5WwYSKXOgsFOEkIPPE2H
 APejd/DQPyz0grpIf8Ulpoces2OfnZA5+PUoLPtah1zrOXXfU0WCbVCRo
 mcjKijXfwNtRJp+W6V4HLlqj1ZnogPochGgN16Lq55MED7KM05WXuAYwh Q==;
X-CSE-ConnectionGUID: 3qlIyiiQSPuiqkuskFmG6A==
X-CSE-MsgGUID: CW6KnT3FT7CzoBjxUkrrMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="80989539"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="80989539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 11:35:06 -0800
X-CSE-ConnectionGUID: b1AnfSpwRuWFxF+TVmowQQ==
X-CSE-MsgGUID: RXWZLYZfThOuy5KN2UnJfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="207078619"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 11:35:05 -0800
Date: Thu, 22 Jan 2026 20:34:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com,
 aurabindo.pillai@amd.com
Subject: Re: [PATCH] README: Update oneliner build command for igt_runner
Message-ID: <20260122193447.ihluvbpfnsevs7ge@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, aurabindo.pillai@amd.com
References: <20260122170901.644692-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260122170901.644692-1-alex.hung@amd.com>
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

Hi Alex,
On 2026-01-22 at 10:09:01 -0700, Alex Hung wrote:
> This fixes the following warning:
> 
> WARNING: Running the setup command as `meson [options]` instead of
> `meson setup [options]` is ambiguous and deprecated.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Good catch! It was corrected in meson.sh but somehow left here.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  README.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index c0382ce43..b4b9a37ea 100644
> --- a/README.md
> +++ b/README.md
> @@ -88,7 +88,7 @@ running.
>  The test suite can be run using the `run-tests.sh` script available in the
>  `scripts/` directory. To use it make sure that `igt_runner` is built, e.g.:
>  
> -    meson -Drunner=enabled build && ninja -C build
> +    meson setup -Drunner=enabled build && ninja -C build
>  
>  `run-tests.sh` has options for filtering and excluding tests from test
>  runs:
> -- 
> 2.43.0
> 
