Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FADC4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 12:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326B810E33B;
	Thu, 16 Jul 2026 12:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIIt6WeK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA17F10E230
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784205310; x=1815741310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l2SNMYxokEmvOgzZ+h+H70/seNdzZAT3rc7DG9Z4g08=;
 b=jIIt6WeKiHNIs0AR2ubFZX8l2SWx1abg7JOweXNAfGqHsRT8aN8+trSQ
 DLyMnhghqAcirmaf54wf6M11515K10vfhLu6LQ//XwlIMMclbbm5dMobK
 hxm1bzYM7mu4PZnXUBhNR0Zcyb+/R3KvRL2YX2XHWXfjqPY892jTqNxwz
 xvuy7/EuYB2GfOM1zKNHf0yZ8gZ4VJPXUteh+F4Sr8kBbXlQ8dpM9XkkF
 Z6zwwFTurNdVubAVgrupOH/Id5grtPdglRW0h3L7CLxdcNquWZlM9HShn
 GLa5qDVq9Z4LbIotR7bg6E2gfdnL3Iq2DCj1rf8tZCHZHDO9o12lV3mcd Q==;
X-CSE-ConnectionGUID: hlrgEtNeTru4THwvGeXcnQ==
X-CSE-MsgGUID: G8pGgHMsTWyyDq75cnBwIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="85061844"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="85061844"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 05:35:10 -0700
X-CSE-ConnectionGUID: rAobEBJnRa6AEBTlItT6Fg==
X-CSE-MsgGUID: waeC8V7yRBabT4yar0saew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="279762236"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 05:35:08 -0700
Date: Thu, 16 Jul 2026 14:34:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.niemiec@intel.com,
 Pawel Sikora <pawel.sikora@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 05/31] lib/igt_tools_stub: add stubs needed by
 tools
Message-ID: <20260716123452.sw2whblnmvqrto6y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.niemiec@intel.com,
 Pawel Sikora <pawel.sikora@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <7f05cdb527300126c8cd32363f5cb961846bcb42.1784117512.git.sebastian.brzezinka@intel.com>
 <puhkn5xjeoh2ds6f64tfihuenvcze5jvkz2dq6kabsrlqp2ize@uvws2lsm55uk>
 <20260716101312.75mjhktkn4fmcxno@kamilkon-DESK.igk.intel.com>
 <DJZX8GDG33PW.237GU9G5Q8407@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DJZX8GDG33PW.237GU9G5Q8407@intel.com>
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

Hi Sebastian,
On 2026-07-16 at 12:25:17 +0200, Sebastian Brzezinka wrote:
> Hi Kamil,
> 
> On Thu Jul 16, 2026 at 12:13 PM CEST, Kamil Konieczny wrote:
> > Hi all,
> > On 2026-07-16 at 06:09:42 +0000, Krzysztof Karas wrote:
> >> Hi Sebastian,
> >> 
> >> On 2026-07-15 at 14:15:15 +0200, Sebastian Brzezinka wrote:
> >> > Add stubs for functions used by tools when linking without the
> >> > full libigt.so: __igt_skip_check, igt_exit, igt_debugfs_open and
> >> > igt_open_forcewake_handle_for_pcidev.
> >> This patch does more than that: it unifies the comment style in
> >> the file. This is a nit though, so consider it only if you would
> >> prepare another version.
> >> 
> >> > 
> >> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> >> > Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >> > ---
> >> >  lib/igt_tools_stub.c | 83 ++++++++++++++++++++++++++++++++++++++++----
> >> >  1 file changed, 76 insertions(+), 7 deletions(-)
> >> > 
> >> > diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
> >> > index 9a0ec6217..21dc53f3f 100644
> >> > --- a/lib/igt_tools_stub.c
> >> > +++ b/lib/igt_tools_stub.c
> >> > @@ -21,12 +21,27 @@
> >> >   * IN THE SOFTWARE.
> >> >   *
> >> >   */
> >> > +#include <fcntl.h>
> >> > +#include <limits.h>
> >> > +#include <stdarg.h>
> >> > +#include <stdio.h>
> >> > +#include <stdlib.h>
> >> > +#include <sys/stat.h>
> >> > +#include <sys/sysmacros.h>
> >> > +#include <unistd.h>
> >> > +
> >> >  #include "igt_core.h"
> >> > +#include "igt_debugfs.h"
> >> >  
> >> > -/* Stub for igt_log, this stub will simply print the msg on stderr device.
> >> > - * Domain and log level are ignored.
> >> > +/*
> >> > + * Forward declaration only - avoids pulling in the heavy igt_gt.h header.
> >> > + * The type is used as an opaque pointer; this stub always returns -1.
> >> >   */
> >> This is a nit, so consider it only if you would prepare another
> >> version of this series:
> >> The comment should be moved right before the function declaration.
> >> > +struct pci_device;
> >> >  
> >> > +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
> >> > +
> >> > +/* Stub for igt_log: print message to stderr; domain and log level are ignored. */
> >> >  void igt_log(const char *domain, enum igt_log_level level, const char *format, ...)
> >
> > This will be a second documentation for a function.
> > Question for Pawel: could it be a problem for our documentation generation?
> > Do we need an exclusion for stub functions?
> For what it's worth, this documentation style was already there. It's
> not my invention, so it should be ok, as long as the previous comments
> don't break the docs build.
> 

Yes, it is not a blocker, I just wanted to point out that doc
generation could need some adjustments.

Regards,
Kamil


> -- 
> Best regards,
> Sebastian
> 
