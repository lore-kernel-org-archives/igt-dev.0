Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1466C369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 13:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A97210E2AB;
	Fri, 25 Apr 2025 13:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzanyqKx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36AA10E2AB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745587259; x=1777123259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HvZRUqdtPzJOWQxmRM1gL9tZIm0+08TpnohaXc90QaU=;
 b=BzanyqKxrRbvVxTouAjmyBki78UgE9e9Z7X7c1ONCL+dTE3x3etfzQgn
 +QW9yDLFGvJ2/A0T2rctuyPjft2uvl50SClr1X3mrf4BcnblNL96jjTaH
 BZP722EvRxwfY65glzjI14Me0q4uaH2HQY7y7zIm2HBlPqWtPRkzRPU9m
 u1wQs5pSrqBYAP7wq94aCvJECpLWYbJ+2S3N1L9AOF/dhhAkw4iGomtY9
 KHi4dG9IIz2BHcIdYMxuV9b8VyB7lX6bZ3Uv6kOLx5+Gph+Tyu8TdHAs+
 qGirWDcIOnmjZjn1stHlQYWrFY/6rOsiQ8idIqTnb4sQnP/kO7+jvdcWD w==;
X-CSE-ConnectionGUID: DRDihNPnSuuyTqH4gKJOjQ==
X-CSE-MsgGUID: PDt0eoE5Toqbxi2DLv+7RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="34865396"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="34865396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 06:20:59 -0700
X-CSE-ConnectionGUID: nwykvM+UQoa++hrWwCVqng==
X-CSE-MsgGUID: xu5N4TeWSaGX0JdMHs2IQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="163865922"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 06:20:58 -0700
Date: Fri, 25 Apr 2025 15:20:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] lib/igt_facts: Fix potential NULL pointer
 dereference
Message-ID: <20250425132055.ewasqqeeigfigxtw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250425094904.221857-1-peter.senna@linux.intel.com>
 <20250425094904.221857-3-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425094904.221857-3-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-04-25 at 11:49:04 +0200, Peter Senna Tschudin wrote:
> If both udev_device_get_sysattr_value and udev_device_get_sysname fail,
> pci_addr will remain NULL, which could lead to issues when using it
> later in asprintf. Ignore cards when pci_addr cannot be extracted.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_facts.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> index d38be0726..47a2c98a5 100644
> --- a/lib/igt_facts.c
> +++ b/lib/igt_facts.c
> @@ -537,6 +537,10 @@ static void igt_facts_scan_pci_drm_cards(const char *last_test)
>  								 "address");
>  			if (!pci_addr)
>  				pci_addr = udev_device_get_sysname(pci_dev);
> +			if (!pci_addr) {
> +				udev_device_unref(drm_dev);
> +				continue;
> +			}
>  		} else {
>  			/* Some GPUs are platform devices. Ignore them. */
>  			pci_addr = NULL;
> -- 
> 2.43.0
> 
