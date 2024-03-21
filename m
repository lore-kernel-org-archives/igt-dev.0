Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F60C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE6B10EC04;
	Thu, 21 Mar 2024 15:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIveRu+K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC32C10EC95
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035242; x=1742571242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tFLFWfiE4W8XUUA4fk5z4mL94zGdF7KFFzdzYtwIcFg=;
 b=iIveRu+KOU+/Nui9cq4obYptiQSw7mWh6vbp4I4M6YkjcXrazoDzcywX
 K+y5NPFwNPJwyniLLyaRfuBiyKT8hXgwcqA9XOa8w/82taHGLHnK7jB91
 Ju6r9k7y4+kbGPCePCJV42y82BMdleH7LB2+NMGXBfNcClYtbpAVHRcG9
 UI8dt7GNFvzZCaDIUjowKm20hz9mvN9o2sOWXZhTjDCl49OqCe579Figw
 Xb9580Wf10q8DFs7yQBSYTC5Jn9jLsZ0tFVdL6qMsNwei9hxzj2kWDl6K
 fDt4vQE8aV27QdNVeAQAjBj0C/9WkffEbNMUKGVOmNibNrUYsfiMT0iG4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5896437"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5896437"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="37662599"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:33:59 -0700
Date: Thu, 21 Mar 2024 16:33:56 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Turner <mattst88@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib: Inline igt_x86_features() into ifunc resolvers
Message-ID: <20240321153356.544hbqtwk5fcp7vl@zkempczy-mobl2>
References: <20240304221800.1161896-1-mattst88@gmail.com>
 <20240313090911.27uhiwrd6de256dc@zkempczy-mobl2>
 <CAEdQ38F2TANoeavq6UvBHE_4kYkeLViNDMY==8cCEKTikdP1Ow@mail.gmail.com>
 <20240321070310.iydocnqqgxxigisz@zkempczy-mobl2>
 <CAEdQ38FeutN1yPkK4ymmeb0YPeg85wo56s61w1wMQr9kPHspZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEdQ38FeutN1yPkK4ymmeb0YPeg85wo56s61w1wMQr9kPHspZw@mail.gmail.com>
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

On Thu, Mar 21, 2024 at 11:02:16AM -0400, Matt Turner wrote:
> On Thu, Mar 21, 2024 at 3:03 AM Zbigniew Kempczyński
> <zbigniew.kempczynski@intel.com> wrote:
> >
> > On Wed, Mar 20, 2024 at 11:09:11PM -0400, Matt Turner wrote:
> > > On Wed, Mar 13, 2024 at 5:09 AM Zbigniew Kempczyński
> > > <zbigniew.kempczynski@intel.com> wrote:
> > > >
> > > > On Mon, Mar 04, 2024 at 05:16:40PM -0500, Matt Turner wrote:
> > > > > Quoting https://sourceware.org/glibc/wiki/GNU_IFUNC
> > > > >
> > > > > > When LD_BIND_NOW=1 or -Wl,z,now is in effect symbols must be
> > > > > > immediately resolved at startup. In cases where an external function
> > > > > > call depends needs to be made that may fail if such a call has not
> > > > > > been initialized yet (PLT-based relocation which is processed later).
> > > > > > For example calling strlen in an IFUNC resolver built with -Wl,z,now
> > > > > > may lead to a segfault because the PLT is not yet resolved.
> > > > >
> > > > > We cannot rely on function calls through the PLT in ifunc resolvers as
> > > > > the PLT may not have been initialized yet.
> > > > >
> > > > > In practice, this causes crashes when igt is linked with -Wl,-z,now or
> > > > > when linked with the mold linker.
> > > > >
> > > > > To avoid this problem, we do two things:
> > > > >     1. move igt_x86_features() to igt_x86.h so its definition is
> > > > >        available to compilation units that call the function.
> > > > >     2. mark the ifunc resolvers with __attribute__((flatten)) to ensure
> > > > >        igt_x86_features() is inlined.
> > > > >
> > > > > Bug: https://bugs.gentoo.org/788625
> > > > > Bug: https://bugs.gentoo.org/925348
> > > > > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > > >
> > > > Hi.
> > > >
> > > > I started review of your code, but this this touches some linking intrisics
> > > > I'm not familiar with yet so I need more time to explore this. I hope
> > > > this is not a problem for you.
> > >
> > > Do you have any questions I can answer? I tried my best to explain the
> > > how and the why of the change in the commit message.
> >
> > I wanted to prepare better for the discussion - I extracted few
> > functions on which I'm reproducing segv issue when LD_BIND_NOW=1 is set.
> > I confirm, GOT doesn't contain valid function addresses so jump goes
> > to nowhere. I'm pretty sure intel_vbd_decode with LD_BIND_NOW=1 only
> > reveals the problem, but it lays within linker logic:
> >
> > # LD_BIND_NOW=1 LD_PRELOAD=./build/lib/libigt.so.0 LD_DEBUG=all ps
> >
> > ps definitely doesn't call igt_half_to_float() which in turn calls
> > unresolved igt_x86_features@plt. It looks linker first tries to
> > call all ifunc's to establish addresses, unfortunately it is doing
> > this before filling GOT. Backtrace shows we're still in _start
> > from /lib64/ld-linux-x86-64.so.2 so we even didn't get a chance
> > to get to the main().
> 
> Right, exactly. I believe ifuncs are resolved regardless of whether
> they're used.
> 
> > Before I'll give you my ack (I still want to experiment with this
> > one more day) - may you explain what for you need to bind relocs
> > immediately? This is slower than lazy binding as it resolves all
> > PLTs instead resolving only required symbols.
> 
> Gentoo/Hardened uses `-z now` to improve security. By binding upfront,
> the loader can mark the GOT as read-only for a security enhancement.
> See https://wiki.gentoo.org/wiki/Hardened/Toolchain for more details.
> 
> Apparently (according to that page) `-z now` will become the default
> in standard Gentoo profiles very soon.

I'm not going to block this change. igt_x86_features() is used only in
few places so there's not a problem to flattenize it. So from me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

