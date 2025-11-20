Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3F3CF9C40
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 16:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996D110E783;
	Thu, 20 Nov 2025 16:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+YLO1Yq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9913F10E77E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763655600; x=1795191600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dwG0cssJ9gAYNEg0hg7J4y6+ygiDL1ukXuR3MMLEUrc=;
 b=H+YLO1YqN2i1wmDHNALHsYBZuzuC8wgRcLWlqekEKKYCjrS4bF8vhWNp
 fkqCmgr61tdXJtvY3370FQWHnlO9D8a0j2LLTF5exRNk5fyXr3TaVI+Ne
 gC7+bXpO1quni2TFAMfpgK+2dYB3bRfB9+m0p45GrE1ywiYq5T8Uewyyk
 i57ixE+UyaF+9HXfXNbbpDkuYLJSqXA/kHWK+T0V6PB7Nb+6s7QXSVA0H
 tFpqqodsJ8Znuk4ZbiREjqbtPkUZ64s4EDQNAxb4YOv625yEDjdigV5H2
 JmF5iqLgjaI+1HIeOyadfw0Onq7ZJeMQEi5qZukcfwoysDnli/5SNbwnH Q==;
X-CSE-ConnectionGUID: zQT3L5cISTC8pzqqtuOlsQ==
X-CSE-MsgGUID: 6B5qf3nySwOAetYO70Tbkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="68338496"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="68338496"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:19:59 -0800
X-CSE-ConnectionGUID: mBKz0AKDRNyk0Q6wfSlQ/A==
X-CSE-MsgGUID: Y0BVJKKYRWCO3NLykAkgpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191432509"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:19:57 -0800
Date: Thu, 20 Nov 2025 17:19:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v1 2/3] lib/xe/xe_spin: Export xe_spin_sync_wait
Message-ID: <20251120161954.s7bxdtt24ywprtot@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
References: <20251113124936.3878794-1-soham.purkait@intel.com>
 <20251113124936.3878794-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251113124936.3878794-3-soham.purkait@intel.com>
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

Hi Soham,
On 2025-11-13 at 18:19:35 +0530, Soham Purkait wrote:
> Make function xe_spin_sync_wait() public
> Which waits for the spin batch associated with the
> given igt_spin object to complete by waiting
> on its syncobj after spin end is executed.
> 
> v1:
>  - Add simple commit message. (Kamil)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/xe/xe_spin.c | 10 +++++++++-
>  lib/xe/xe_spin.h |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 9909f4e03..9c0651f9a 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -302,7 +302,15 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
>  	return spin;
>  }
>  
> -static void xe_spin_sync_wait(int fd, struct igt_spin *spin)
> +/*
> + * xe_spin_sync_wait:

Add also @fd: description.

> + * @spin: spin state from igt_spin_new()
> + *
> + * This helper waits for the spin batch associated with the
> + * given igt_spin object to complete by waiting on its syncobj.
> + * This function asserts that the wait succeeds.

Imho better:
 * This function asserts when the wait fails.

Regards,
Kamil

> + */
> +void xe_spin_sync_wait(int fd, struct igt_spin *spin)
>  {
>  	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0, NULL));
>  }
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index af32ab563..1cd578e2d 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -77,6 +77,7 @@ void xe_spin_reset(int fd, igt_spin_t *spin);
>  bool xe_spin_started(struct xe_spin *spin);
>  void xe_spin_wait_started(struct xe_spin *spin);
>  void xe_spin_end(struct xe_spin *spin);
> +void xe_spin_sync_wait(int fd, struct igt_spin *spin);
>  
>  /*
>   * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
> -- 
> 2.34.1
> 
