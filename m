Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7896E7716E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 12:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EEF10E26B;
	Wed,  4 Dec 2024 12:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJDyooLT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB47C10E26B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 12:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733316715; x=1764852715;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=elWM06V4tBLvdQNEL4sqhRrJgBLow/mCCpq6zV4OmB4=;
 b=jJDyooLTIBI3c/OPepn3gnMlxgGS1qZXjQfPbzL9dYsBRfjePd5Ax15u
 Y9yUYlsYUtpHK07egncZDnPGDRp6aReHQRKPdO7C5VCQ9B1E11pudHgzm
 AAHrHffByaxaEZExqyVH23sUQlMXwa39fenXuHwPtxmlMU6O+nf7uJkiO
 tZ06dmt0AZU3EVqgXSus8tBtJubF2jbagS+xmBceh5xY4CcL6kZwv6Tum
 FbueuHNB6Z6Q/w8V13yld77qXwLUdQfLVXuf6O9CgYeVd9xevRj5auGVm
 WASBM6gzwQYCpX7Dx54XOHfYcH5rWMOyFXedPFexnxWEEiASNN5OpcsqA w==;
X-CSE-ConnectionGUID: 7buW5GDVTlOsGuQxFDQIyA==
X-CSE-MsgGUID: C16BnXgQSduCs07+xYbe2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44244977"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44244977"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 04:51:49 -0800
X-CSE-ConnectionGUID: DqvsPdT5TLi+jzxoeNS2sQ==
X-CSE-MsgGUID: 9UIEl8jJR4eFHldHsFvutQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94214427"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 04:51:47 -0800
Date: Wed, 4 Dec 2024 13:51:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, sai.gowtham.ch@intel.com
Subject: Re: [PATCH] lib/xe/xe_gt: Guard against fopen failure in
 xe_gt_stats_get_count
Message-ID: <20241204125129.oh4w7ofesp2i2nzf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, sai.gowtham.ch@intel.com
References: <20241203202600.56749-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203202600.56749-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-12-03 at 20:26:00 +0000, Jonathan Cavitt wrote:
> The function xe_gt_stats_get_count currently performs an fopen on the
> /sys/kernel/debug/dri/0/gt*/stats directory without checking that the
> fopen is successful.  This can cause a system crash when trying to
> perform fgets on a NULL pointer on unsuccessful cases.
> 
> Check the results of fopen and guard against this.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3212
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  lib/xe/xe_gt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index cee892af96..101b887a41 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -159,6 +159,8 @@ int xe_gt_stats_get_count(int fd, int gt, const char *stat)
>  	sprintf(path, "/sys/kernel/debug/dri/0/gt%d/stats", gt);
>  	f = fopen(path, "r");
>  
> +	igt_assert_f(f, "Failed to open /sys/kernel/debug/dri/0/gt%d/stats", gt);

It turns SIGSEGV into igt assert fails, not best solution.
Could you just reuse solution from the same file above?

sprintf(path, "/sys/kernel/debug/dri/%d/gt%d/stats",
        minor(st.st_rdev), gt);

Btw there is also fclose() missing.

Regards,
Kamil

> +
>  	while (fgets(tlb_path, sizeof(tlb_path), f)) {
>  		if (strstr(tlb_path, stat) != NULL) {
>  			sscanf(tlb_path, "%*[^:]: %d", &count);
> -- 
> 2.43.0
> 
