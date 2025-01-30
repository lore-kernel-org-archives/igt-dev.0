Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB56AC0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 10:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC8810E17A;
	Thu, 30 Jan 2025 10:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC6PORkj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8B510E17A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738232441; x=1769768441;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=m715vRtoRMbl/9O3fnYVkh4jcu2NyCXfLhYz4iaObZE=;
 b=aC6PORkjhmFNBGtq7SEorzVF0/UB/YiUgXk/QaUT1FDGCAQf9FdWAkLR
 58ORcb+/Rx8wAMxtdTTa3B3di7anr0l2/kWRe7Zsq2MzbdajLOYvFnx/8
 3FFPM2hC79kEEvfQhntayzGRNr18XJzm9s3WvJ2MfwyeXGnOkJCDPxLkA
 nAiOQri74ZyGglCMeI8ZFP3JDJhXiFRYRSYsI6ALrTeo6XFwjvUgKTK/w
 s7buOHshXps6BExX96j8VLoppV4WKNNmdWxRv7lZkkKwodV5d5L2ZiunC
 OpAOXTs/PEMTkp/EaGcdXGTiJVNq2Ks0PFoNuKzGBf5M/NVZw49pA6AgS w==;
X-CSE-ConnectionGUID: 7Wv2m1r+TxWir/17BzKSlg==
X-CSE-MsgGUID: 5OZqx5MhThyEAipLzCH6HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="61241378"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="61241378"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:20:41 -0800
X-CSE-ConnectionGUID: BdmpfIYmRH28C2ZzNd7oLQ==
X-CSE-MsgGUID: HlrLJeolRpiFZYlkiPbCUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114436811"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:20:39 -0800
Date: Thu, 30 Jan 2025 11:20:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_device_scan: limit fetched device
 attributes from udev
Message-ID: <20250130102036.5mapewh7xwp5oisg@zkempczy-mobl2>
References: <20250128083014.27713-1-zbigniew.kempczynski@intel.com>
 <20250129144849.qqedsxwloqtsikhg@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129144849.qqedsxwloqtsikhg@kamilkon-desk.igk.intel.com>
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

On Wed, Jan 29, 2025 at 03:48:49PM +0100, Kamil Konieczny wrote:
> Hi Zbigniew,
> On 2025-01-28 at 09:30:14 +0100, Zbigniew Kempczyński wrote:
> > Tests don't need all attributes so default device scanning is now
> > limited to small list directly used in device filters. To be backward
> > compatible tools like lsgpu still may scan whole attribute list what
> > keeps this behavior intact.
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  lib/igt_device_scan.c | 69 ++++++++++++++++++++++++++++++-------------
> >  lib/igt_device_scan.h |  1 +
> >  tools/lsgpu.c         |  2 +-
> >  3 files changed, 50 insertions(+), 22 deletions(-)
> > 
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index c36b0efa90..15f6bf5728 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -22,6 +22,7 @@
> >   *
> >   */
> >  
> > +#include "drmtest.h"
> 
> Could you add a note here why this is needed? Something like
> 
> #include "drmtest.h" /* for macro ARRAY_SIZE */

I don't think we should go this way, even if I use only ARRAY_SIZE from
this header. If someone will modify the code and start using different
macro from this header this comment will be outdated and incorrect.

--
Zbigniew
