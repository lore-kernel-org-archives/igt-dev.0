Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C261BD6ACFE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 12:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B86F10E424;
	Thu, 18 Dec 2025 12:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjaebvuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318C410E401
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766062778; x=1797598778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qYX4v9Ncwoo82epi99xAbTMeaF/5rucLFyw+uNRCAT4=;
 b=UjaebvuPtaPg99Y/lqRam8rFU4GRwEAtwvzZaDZUnkvWnuFscu4ZLqUb
 fo4MGVZDQ+gL+qCGunHCTJeYWnj4IgNAH0CtVvEZYUez5QALQg9ZdKrfQ
 qTJ0TKN3Ym/kqOMIFZI+txkQQrYLlQ2/PFb2mK3nkeBQAgszAXHDC02g5
 S1ExPxy5JQxIB5eDa8lvReDIUQEiwJnYMnxZug4HIwsmBlgHEWi6BLq6K
 NIzpYolaiC3YEXDwb23qjcETRgIyjK6oHYDkvDn0tQqHNbHHZ7ynWP2rT
 ha0ImFSqB0qBDjrzWqzOi3zihchfzf83ad1qJwk2aMBG1m6YrfeSEd+qX A==;
X-CSE-ConnectionGUID: MsK3rlI+S1yLRqvx8HVwCA==
X-CSE-MsgGUID: snZqIqDlRym9umjXhgMBBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67009969"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67009969"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:38 -0800
X-CSE-ConnectionGUID: OkbMoBukQUiV2iIW2KmYMw==
X-CSE-MsgGUID: XBiaOXQkQPGXz812xugShA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198574208"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.118])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:36 -0800
Date: Thu, 18 Dec 2025 13:59:34 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH i-g-t] tests/panthor/panthor_vm: Fix subtest name
Message-ID: <jjdxqptsd6jsqjidydryaz4vdifnmybch4knepru3elycpsepe@cqqvjo5epari>
References: <20251218125703.52741-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218125703.52741-1-kamil.konieczny@linux.intel.com>
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

On Thu, Dec 18, 2025 at 01:57:03PM +0100, Kamil Konieczny wrote:
> All subtests name should be uniqe and unfortunatly last commit

s/unfortunatly/unfortunately/

with this:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> created two with the same name:
> 
> grep -n igt_subtest tests/panthor/panthor_vm.c
> [cut]
> 82:     igt_subtest("vm_unbind_identical_hugepage_single") {
> 101:    igt_subtest("vm_unbind_identical_hugepage_single") {
> 
> Fix this and rename second one into vm_unbind_identical_hugepage_single_partial
> 
> Cc: "Adrián Larumbe" <adrian.larumbe@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Fixes: 83bb1884b7ab ("panthor: Allow specifying offset when mapping a BO against a VM")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/panthor/panthor_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> index 2ac867c75..76a669843 100644
> --- a/tests/panthor/panthor_vm.c
> +++ b/tests/panthor/panthor_vm.c
> @@ -98,7 +98,7 @@ int igt_main() {
>  	}
>  
>  	igt_describe("Requested unmapping is identical to existing huge page mapping, but only a subset of the object's pages are mapped in the VM");
> -	igt_subtest("vm_unbind_identical_hugepage_single") {
> +	igt_subtest("vm_unbind_identical_hugepage_single_partial") {
>  		uint32_t vm_id;
>  		struct panthor_bo bo;
>  		uint64_t bo_size = SZ_4M;
> -- 
> 2.52.0
> 
