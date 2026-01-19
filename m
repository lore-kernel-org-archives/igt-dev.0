Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EABED29C33
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 15:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13CB10E4A5;
	Mon, 19 Jan 2026 15:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqvSQL/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1A210E4A5
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768837975; x=1800373975;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qpJs81elvkGFEctQoGJ57Z5wSxtpKG+fTpBy8jhKv68=;
 b=QqvSQL/9RoqJcyg0UWYbMKVz8hmhYdwp3bUKY8s2ZFnbYZssfDGZt3G9
 cgCzyXQki4wuzDYvUmgKERFetF1cjkAuNf2rbEtfxfhU0LEMcuCfdNJkA
 Wis8Pdtig4Dsc2SgORRQQ74YP6vs8pLPojuGR0zph/EACor43DIG5Bndq
 4QeWpeLpZd6vQYD6AHGA7zmYz8Sd73J9sGxzfBs5EQz8RhVq96PGP6ov6
 uEjjvNGxxRK0t5nyOh08QrIZBV+1/kxjSV1vcBm3/adMQxHKW2pLFHYU+
 lfH9zEX9tskRR+Tn3m9q5ms+1urZfw2NtyRT3oTsNkMBOqrX4Edr5OnMV Q==;
X-CSE-ConnectionGUID: ipwednfVQgKqAJJKeXxxag==
X-CSE-MsgGUID: aGRVRRbqRlGotCPMkaWcog==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73911352"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="73911352"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:52:55 -0800
X-CSE-ConnectionGUID: H29OzrZGRCChSQ2AMru1Qg==
X-CSE-MsgGUID: oSZUdKNIQNqL1QTIwrAkPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="210385810"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:52:54 -0800
Date: Mon, 19 Jan 2026 16:52:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/5] lib/xe/xe_legacy: Init LONG_SPIN ctx_ticks after open
Message-ID: <20260119155252.3zkwtxxl2hpyvhyv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
 <20260117000456.26207-3-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117000456.26207-3-shuicheng.lin@intel.com>
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
On 2026-01-17 at 00:04:53 +0000, Shuicheng Lin wrote:
> Avoid computing LONG_SPIN ctx_ticks before any CLOSE_FD re-open logic.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> ---
>  lib/xe/xe_legacy.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index d4f060f76..17d0839be 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -64,9 +64,6 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	struct xe_spin_opts spin_opts = {
>  		.preempt = flags & PREEMPT,
> -#define THREE_SEC	(3 * 1000000000ull)
> -		.ctx_ticks = flags & LONG_SPIN ?
> -			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
>  	};
>  	int i, b;
>  	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
> @@ -79,6 +76,10 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & CLOSE_FD)
>  		fd = drm_open_driver(DRIVER_XE);
>  
> +#define THREE_SEC	(3 * 1000000000ull)
> +	if (flags & LONG_SPIN)
> +		spin_opts.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, THREE_SEC);
> +
>  	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * (n_execs + extra_execs);
>  	bo_size = xe_bb_size(fd, bo_size);
> -- 
> 2.34.1
> 
