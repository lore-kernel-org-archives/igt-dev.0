Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50201D6ACF5
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 13:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AE110E282;
	Thu, 18 Dec 2025 13:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvSFLk/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1F610E282
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766064085; x=1797600085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ifMh1mPHKNvdNUGZ7Ss/8fLgTxrpZwk3KXnp62P+Ikg=;
 b=JvSFLk/JYmm9SRLl43E9ZbhiBegyTkbC7ror2pBuaZKsVDt9AFyTSU9y
 Ngjdi+BfzYDQphffxssEb/tZDf5arRONFVyQxnQYDV9V9kuwWJOGIEKO2
 tDW+E3zHIvgfgJKpG+NtTa2o0u/eJMbeB364BBFp5XQriDX04GIBOI2Vt
 FUE7wVNdO1rIPDHoeLooxumIrgDhQ7tWVYfy/vGUhvmqTsPQAyQs3GQgI
 tBxVgQeZk9D9d3h0goZsNzHI926CUv+zn4HB2UaPte4UOZDFp5kMdQTDr
 V84zg6sy9MQ8TyJ5lzvTDye64ZcESWezW7wlQ780f2B0NyHSNmISl00+b w==;
X-CSE-ConnectionGUID: hLEtbnwVRYi02ILs/Ltiqw==
X-CSE-MsgGUID: NJWBVfMCQWGvEXESpwl8jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67767680"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67767680"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 05:21:25 -0800
X-CSE-ConnectionGUID: hJ6mxhN1TLioqIBnhUWpXA==
X-CSE-MsgGUID: 3kh2G2WJQOe2m/ddnM+RgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="199410688"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 05:21:23 -0800
Date: Thu, 18 Dec 2025 14:21:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH i-g-t] tests/panthor/panthor_vm: Fix subtest name
Message-ID: <20251218132121.4lwwjhqvqv6v2b5p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20251218125703.52741-1-kamil.konieczny@linux.intel.com>
 <jjdxqptsd6jsqjidydryaz4vdifnmybch4knepru3elycpsepe@cqqvjo5epari>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jjdxqptsd6jsqjidydryaz4vdifnmybch4knepru3elycpsepe@cqqvjo5epari>
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

Hi Zbigniew,
On 2025-12-18 at 13:59:34 +0100, Zbigniew Kempczyński wrote:
> On Thu, Dec 18, 2025 at 01:57:03PM +0100, Kamil Konieczny wrote:
> > All subtests name should be uniqe and unfortunatly last commit
> 
> s/unfortunatly/unfortunately/
> 
> with this:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 

Thank you, I already merged it.

Regards,
Kamil

> --
> Zbigniew
> 
> > created two with the same name:
> > 
> > grep -n igt_subtest tests/panthor/panthor_vm.c
> > [cut]
> > 82:     igt_subtest("vm_unbind_identical_hugepage_single") {
> > 101:    igt_subtest("vm_unbind_identical_hugepage_single") {
> > 
> > Fix this and rename second one into vm_unbind_identical_hugepage_single_partial
> > 
> > Cc: "Adrián Larumbe" <adrian.larumbe@collabora.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Fixes: 83bb1884b7ab ("panthor: Allow specifying offset when mapping a BO against a VM")
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/panthor/panthor_vm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> > index 2ac867c75..76a669843 100644
> > --- a/tests/panthor/panthor_vm.c
> > +++ b/tests/panthor/panthor_vm.c
> > @@ -98,7 +98,7 @@ int igt_main() {
> >  	}
> >  
> >  	igt_describe("Requested unmapping is identical to existing huge page mapping, but only a subset of the object's pages are mapped in the VM");
> > -	igt_subtest("vm_unbind_identical_hugepage_single") {
> > +	igt_subtest("vm_unbind_identical_hugepage_single_partial") {
> >  		uint32_t vm_id;
> >  		struct panthor_bo bo;
> >  		uint64_t bo_size = SZ_4M;
> > -- 
> > 2.52.0
> > 
