Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EB1C54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 15:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA11E10F2FC;
	Fri, 31 Jul 2026 15:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuR648gd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282EB10E208
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785513231; x=1817049231;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BA9onOaEpMgLYcPZ5hG8BOg1/TFC/C2etVJEC3ZFncw=;
 b=OuR648gd1qacHQHjkK036dAhjCtT5uXbZo6/0rWuPJkmdd7LycBMPJL7
 TPB4ff19o/sP21A/LzGXTGOJjXA1Getv5ykLJ+OxmyJSJw0jAfVXF1Mwe
 T6VyN+RMlHrymts5EP1jp6i/6UfCwsKYoW9AvbxgFuO6b4nPOqLQdnk6z
 gbalDrQFhCGfblPYCSyRaUW+1s66ZwbB8ayG+deKgZUilEqtMMT2RZyl8
 qdu9tk7ZADGToN3WMuzMxFJGoXjHJB+ZNks1xRMeiMg3vIfBTkKVPG8aU
 2fZEd47LrmasCv7NA7Z079zNh9CjlZN0dHHQfGoF7Q13PmnlGAEHCcVuO g==;
X-CSE-ConnectionGUID: DH33v6iXToKLhM+ctNRJ7w==
X-CSE-MsgGUID: yIEpPDD7TeKihvo7jX1D9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="103680686"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="103680686"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 08:53:51 -0700
X-CSE-ConnectionGUID: LV3lYjMoSWKQl/FAZPCjzw==
X-CSE-MsgGUID: UeySyX/UShmU1TYOLGm7+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="290556583"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.8])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 08:53:49 -0700
Date: Fri, 31 Jul 2026 17:53:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, adam.miszczak@linux.intel.com, 
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t 2/3] benchmarks/gem_wsim: fix ticks_delta assertion
 for non-inverted logic
Message-ID: <mwfdzjk5kie7blngoan25f4kycsw5e74afvpi3yqz6pqtwvirp@hbpkdon3fh4t>
References: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
 <20260731141806.890207-3-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731141806.890207-3-marcin.bernatowicz@linux.intel.com>
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

On Fri, Jul 31, 2026 at 04:18:05PM +0200, Marcin Bernatowicz wrote:
> xe_spin now stores elapsed ticks directly in ticks_delta (not inverted).
> Update the post-execution assertion accordingly.
> 

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  benchmarks/gem_wsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 8be44d0c8..462188708 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -2676,7 +2676,7 @@ static void xe_w_step_sync_and_verify(struct w_step *w)
>  
>  	if (!w->duration.unbound) {
>  		igt_assert(w->duration.requested_ticks && w->xe.data->spin.ticks_delta);
> -		igt_assert_lte(w->duration.requested_ticks, ~w->xe.data->spin.ticks_delta);
> +		igt_assert_lte(w->duration.requested_ticks, w->xe.data->spin.ticks_delta);
>  	}
>  }
>  
> -- 
> 2.43.0
> 
