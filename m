Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AC1C44508
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 16:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A022310E080;
	Tue, 14 Jul 2026 16:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ynah4T2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24010E080
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 16:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784046777; x=1815582777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t25YaxTq9oS9Q2mE9fjJVu3rjmWNRvrJ50xjhZ3Pne8=;
 b=Ynah4T2GIIaKOvo6iz8ev8+qTTgJr5j0e3hZbEABDUy2fUhqFBg8XKhS
 eQv5hxTg1OtjJq0FAaf3URQ9SCw6fM5e8o4Fro7MhDOJzEneyQhuk1EzH
 6EW5oHR6K80U5t2mLxaZQS7QhzeIxHrMNOANr/hnp6ic038ytHt+obm0o
 oySUu7Xtz6B/bpH9LrAA+KdCKG39xZDsk02mPCTNZII5rGBHdFOSLUs8c
 858ukRaV5yo6DlKDZ2gC/vxQHRKHB88UhasezN9xlNCPTEPWOboa/UtLE
 keOYZ14OEn6Tdd4EGOQb4Qrhog8O14YPHUKOfqxEIH4syPpqxVYGoPfv2 w==;
X-CSE-ConnectionGUID: of4i5Yc2TgidEbfdgCmtPg==
X-CSE-MsgGUID: QWaMobZRR+uTdsVYTk8swA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95276079"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="95276079"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 09:32:55 -0700
X-CSE-ConnectionGUID: Bjhxo2igTKqZmuoTuCMeDQ==
X-CSE-MsgGUID: tHxPO49eSG+hDWpH6YysPQ==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 09:32:54 -0700
Date: Tue, 14 Jul 2026 18:32:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t] benchmarks/gem_wsim: skip -V verify on non-BATCH
 steps
Message-ID: <20260714163236.pqb7pxbonknghww4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20260714104349.1214243-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714104349.1214243-1-marcin.bernatowicz@linux.intel.com>
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
On 2026-07-14 at 12:43:49 +0200, Marcin Bernatowicz wrote:
> Only BATCH steps have completion sync state.
> Avoid syncobj_wait on control steps.
> 
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Fixes: 0b67d14c9df4 ("benchmarks/gem_wsim: Verify Xe spinner batch completion")
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  benchmarks/gem_wsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index bebb59f28..8be44d0c8 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -2669,7 +2669,7 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
>  
>  static void xe_w_step_sync_and_verify(struct w_step *w)
>  {
> -	if (!is_xe && w->type != BATCH)
> +	if (!is_xe || w->type != BATCH)
>  		return;
>  
>  	w_step_sync(w);
> -- 
> 2.43.0
> 
