Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A6CC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 15:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46B810E2E7;
	Mon, 27 Jan 2025 15:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ec6aUsTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C360510E2E7
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737992366; x=1769528366;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3iOKseudY/wZ9ZOAdXxc6n/FRvsaRkh3uEmDmaXJVkE=;
 b=ec6aUsTP9g6fNNIf+gzEgO4SdwGKxtcEQW/JtYrF4LGaRbMH67X1c2DE
 5Mw0RsTyy3t1S4/RrZgEg7u7fy23mbHBRBzhU4HGzINePUoFvkX7E12qr
 DtQAuZUrl4w3KheNnqQKprJt/pIrBaRfTXfZ421w+Ef5S398dZiT2tPDb
 Zqtw03u5UJ/GIZI8DRE/0ynLpjgk/kJuJM3Rs8+Tqb8EX0J/qbFL8NQFI
 TOBnewSD/8G/rYL3k9pfr4FEo7k6qutYQuvdp4M5E8qGd+C0gDKQVKSGn
 ibzM1L6uKT9vgLOZ4D96WE3vOXmXl2lpuYaWeHHpz/5/XDh569mh0M9CX Q==;
X-CSE-ConnectionGUID: TA5nKPVvTlW8eq97J2o7bg==
X-CSE-MsgGUID: uoYcisuhTh2us/Aw6VmC0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49112044"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="49112044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 07:37:54 -0800
X-CSE-ConnectionGUID: y79nheilRSyADrI9sAgGhw==
X-CSE-MsgGUID: 4NY3kbSVRfmq2a+IPIehiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108283567"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.231])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 07:37:53 -0800
Date: Mon, 27 Jan 2025 16:37:49 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/3] lib/igt_device_scan: change device list
 variable visibility
Message-ID: <20250127153749.zso6hhex5mva7ypg@zkempczy-mobl2>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
 <20250123095208.72984-3-zbigniew.kempczynski@intel.com>
 <20250124162625.2lz3spps6vgfmie6@kamilkon-desk.igk.intel.com>
 <20250127044915.izkpkskylqw4gdyn@zkempczy-mobl2>
 <rjrjaq5o2c5ip7ejg22vqzntrnqvhztpvozufv6yvwmlvzygue@t6t6wtmmwcc3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rjrjaq5o2c5ip7ejg22vqzntrnqvhztpvozufv6yvwmlvzygue@t6t6wtmmwcc3>
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

On Mon, Jan 27, 2025 at 09:31:46AM -0600, Lucas De Marchi wrote:
> On Mon, Jan 27, 2025 at 05:49:15AM +0100, Zbigniew Kempczyński wrote:
> > On Fri, Jan 24, 2025 at 05:26:25PM +0100, Kamil Konieczny wrote:
> > > Hi Zbigniew,
> > > On 2025-01-23 at 10:52:07 +0100, Zbigniew Kempczyński wrote:
> > > 
> > > could you improve subject? something like:
> > > 
> > > lib/igt_device_scan: Fix multithreading for Xe
> > 
> > Yes, I can change it to sth like
> > 
> > 'lib/igt_device_scan: fix multithreading support in device scanning'
> > 
> > because it also affects i915 even if there's not used there.
> > 
> > > 
> > > > In commit: 2e8f3e06fb (tests/xe_evict|exec_threads: Use fd reopen
> > > > to avoid corrupting global data) I simply changed tests which
> > > > corrupted device list global variable. i915 didn't use opening
> > > > devices in multithreaded tests but this changed with xe.
> > > >
> > > > Device scan is now unconditional so we may change device list
> > > > variable visibility to TLS. With this reverting of above commit
> > > > should be safe (but I'm not sure is it worth to do this).
> > > >
> > > 
> > > What about adding Fixes: tag? It is not a kernel so no strict
> > > rules here, up to you.
> > 
> > I don't if any freedesktop issue was created for this, maybe Lucas
> > knows about it.
> 
> fdo issue would use a Closes:, not Fixes:
> 
> We do have some issues in which the device "disappears" after certain
> tests. They are usually created and closed as "cannot reproduce" after
> some time.
> 
> I don't think we can point to any bug with 100% confidence it actually
> closes it - there may be other bugs lurking around on either kernel or
> igt.
> 
> For this specific commit (not the one before) maybe we can point to the
> commit first using multiple threads, but I don't think it's really
> accurate.

So if you don't mind I would merge it as it is (patches 1-2) with reprase
of commit title as Kamil suggested for second patch. If you won't oppose
I'm going to merge this tomorrow (no negative answer means agreement).

--
Zbigniew

> 
> Lucas De Marchi
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > 
> > > You forgot about:
> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > LGTM so also:
> > > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > 
> > > > ---
> > > >  lib/igt_device_scan.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > > > index 44b632008b..c36b0efa90 100644
> > > > --- a/lib/igt_device_scan.c
> > > > +++ b/lib/igt_device_scan.c
> > > > @@ -247,7 +247,7 @@ struct igt_device {
> > > >  };
> > > >
> > > >  /* Scanned devices */
> > > > -static struct {
> > > > +static __thread struct {
> > > >  	struct igt_list_head all;
> > > >  	struct igt_list_head filtered;
> > > >  	bool devs_scanned;
> > > > --
> > > > 2.34.1
> > > >
