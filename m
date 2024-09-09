Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B58ECE577
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 15:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F007810E5C3;
	Mon,  9 Sep 2024 15:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrDYgFq0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DDE10E5C3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725897142; x=1757433142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OfzuRgCKlziTQZE4IKiiChACJ9Eo/6wh5eDPCE/Y5nE=;
 b=RrDYgFq0rAfBFEfuW1lxWD21IghkfQMqqzKhD6Zw/ZSrAnf+ALUnMwMx
 0BiKYOlOXfDkb1dcSHtU79q1BXNZGaU80g4cKiSnboLnvdPJ//9oLi+/F
 6A2JTx4rGviSdSXf3wGtuk4oDDvqW2khzTklwUN7TnBmynKbFEUBsU8k4
 +Bb0RZfvdJRDu6luhhfHq9V9ixhc6RjdlrSXh6bcyJxNOYMKN/2NMAfEi
 G5Xnb9uDB2YShO88kPzam8WqXrcLKla+eP00La+hvEYqJtD0G1yagCa01
 c6APgwUscO/57jdAE2EgOEjL0tMu/K/2C+OmvQMUKWPqiySGl6QuYv5xr Q==;
X-CSE-ConnectionGUID: P58Fl4UTSTaIJCxZHf1uYw==
X-CSE-MsgGUID: vbDKi6nJQBSsl/eNcVHuWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="47122330"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="47122330"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 08:52:21 -0700
X-CSE-ConnectionGUID: HmaTneMVSsuXFIqNSIlPVg==
X-CSE-MsgGUID: C1EhFeb7T3ObvJQh6blPmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="71499419"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:52:19 -0700
Date: Mon, 9 Sep 2024 17:52:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 K V P Satyanarayana <satyanarayana.k.v.p@intel.com>,
 C V Narasimha <narasimha.c.v@intel.com>
Subject: Re: [PATCH i-g-t 3/3] lib/xe/xe_mmio: Remove redundant PCI system
 cleanup
Message-ID: <20240909155216.nw7lzssqjyy4eija@kamilkon-DESK.igk.intel.com>
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
 <20240904084701.186664-4-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240904084701.186664-4-marcin.bernatowicz@linux.intel.com>
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
On 2024-09-04 at 10:47:01 +0200, Marcin Bernatowicz wrote:
> Remove igt_pci_system_cleanup from xe_mmio_access_fini as it cleans up
> all libpciaccess state and invalidates all handles, not just single
> xe_mmio. It should be used at the end of libpciaccess usage.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
> Cc: C V Narasimha <narasimha.c.v@intel.com>
> ---
>  lib/xe/xe_mmio.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
> index 3e42b2e1c..0817c12f6 100644
> --- a/lib/xe/xe_mmio.c
> +++ b/lib/xe/xe_mmio.c
> @@ -55,7 +55,6 @@ void xe_mmio_access_fini(struct xe_mmio *mmio)
>  {
>  	mmio->intel_mmio.pci_device_id = 0;
>  	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
> -	igt_pci_system_cleanup();

What about documenting this here as a comment?

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  }
>  
>  /**
> -- 
> 2.31.1
> 
