Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C62ECE577
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 15:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DD710E5C1;
	Mon,  9 Sep 2024 15:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NK+tWZkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FB410E5C1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725896931; x=1757432931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZDgNsObIMXNKdV9Cczx38wAged5cjMY6RBxy0yppcr4=;
 b=NK+tWZkTfL0CteXkXb92JGvO6tSMEBg6wNmoziQPCVT8pKEMyXt90iT+
 9q+3pbTvG00eYxEgqCIRyYSEPx1Z5sM8mJy2A9veFq556cxW0hT/PsuCy
 sFx8wbKPjaorwYGbOeGGPg0BIMByRDNuBsdqZuSs52YI1m32FIQudBmo8
 Qt6mprsxM6lk+/pMJSAm41U78HodpT+OCJmpaF73JZuebgZc2SC2N4znm
 Gn7JCTsaWYE0CI+nK5Ar14WcoLzmzIAlTKV9Va8FjvtBbrz4B4iDZ152X
 O95huTtj9jXkjQdZCrOmW8xswV6q8vGRWRkduHqNCx+2FCKFW/7sZ3LbR g==;
X-CSE-ConnectionGUID: 6Ck2RxrETFeakGHAkgEvOg==
X-CSE-MsgGUID: SX0ELI9iSWu00UtcGXiV9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24101808"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24101808"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 08:48:51 -0700
X-CSE-ConnectionGUID: nJBPAzSyStKFkXzja4//zQ==
X-CSE-MsgGUID: qBr+z/WxQAafp1eOGo8Ykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="66333905"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:48:48 -0700
Date: Mon, 9 Sep 2024 17:48:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 K V P Satyanarayana <satyanarayana.k.v.p@intel.com>,
 C V Narasimha <narasimha.c.v@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/xe/xe_mmio: Fix assertion logic in
 xe_mmio_vf_access_init
Message-ID: <20240909154845.gab7r5u7qv72lrxp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 K V P Satyanarayana <satyanarayana.k.v.p@intel.com>,
 C V Narasimha <narasimha.c.v@intel.com>
References: <20240904084701.186664-1-marcin.bernatowicz@linux.intel.com>
 <20240904084701.186664-3-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240904084701.186664-3-marcin.bernatowicz@linux.intel.com>
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
On 2024-09-04 at 10:47:00 +0200, Marcin Bernatowicz wrote:
> Ensure igt_mmio is not null before proceeding.
> 

Please change order of patches in patchseries, first fixes
then addition of new test(s). Or this can be changed at merge
or I could merge patches 2/3 and 3/3 first?

> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
> Cc: C V Narasimha <narasimha.c.v@intel.com>
> ---
>  lib/xe/xe_mmio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
> index 57526d7cb..3e42b2e1c 100644
> --- a/lib/xe/xe_mmio.c
> +++ b/lib/xe/xe_mmio.c
> @@ -25,7 +25,7 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
>  
>  	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
>  
> -	igt_assert(!mmio->intel_mmio.igt_mmio);
> +	igt_assert(mmio->intel_mmio.igt_mmio);

Good catch, there is also "bool safe" in that struct,
it could help to document the meaning of this field.

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  
>  	mmio->fd = pf_fd;
>  	mmio->intel_mmio.safe = false;
> -- 
> 2.31.1
> 
