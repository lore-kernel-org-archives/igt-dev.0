Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DF0C27C44
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 17:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B9F113F6E;
	Wed, 29 May 2024 17:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8mOo/UH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240A4113E5C
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717002990; x=1748538990;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aJLeB7g8G4vK4zdxPBjzu8gweolTJbAtNmaQ7Eyxkw4=;
 b=D8mOo/UHC3CTb7M+WDQlXuEwSuT0INoBvy+gz9UPWroAwmz/iihsG6cx
 5vu1Ax9ARHTJXBW073o6dlmjBSJpQNRWa+EBCMopeZ+4iKC1Z1Vhy/5Dt
 g9sNwChXdMNmVBrHvHOPMS9bBA344b/suxEItI9KA8EF0BYsCQfez/vhA
 uTZPjC6jSHOepl2Et2pMl6g3ycyPC+raBJeeck6FmayUJdOtgUzEvsOLV
 at5TjzMtGDLrvTZeC4hwX/StNw25CHWH/VAu91QLm7EydQQH5tOt9uDis
 2D7SVAck4M3uk1rZMsP3RQF334JiATm7QbBVKKqvhEu0It87PgEu6adLX w==;
X-CSE-ConnectionGUID: KW0nMSUZRt6+UzYgmZxOeQ==
X-CSE-MsgGUID: Tc6l/sb2SXmI/2o9hd5bHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24078956"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24078956"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 10:16:29 -0700
X-CSE-ConnectionGUID: PH37cXV9TxOGVA52Ap5NHw==
X-CSE-MsgGUID: +h6PxnmLTu+6OvRlHPIe4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="36055369"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 10:16:27 -0700
Date: Wed, 29 May 2024 19:16:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luca@coelho.fi>, Luca Coelho <luciano.coelho@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector()
 return value in wait_for_connected_state()
Message-ID: <20240529171624.e5r5fljcxjjowtjx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Luca Coelho <luca@coelho.fi>,
 Luca Coelho <luciano.coelho@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
 <20240523084426.284894-2-luciano.coelho@intel.com>
 <20240524165835.txbj66ww34vrjm2q@kamilkon-DESK.igk.intel.com>
 <f003c69a790a56d7887effce1224b9601cf7b4bf.camel@coelho.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f003c69a790a56d7887effce1224b9601cf7b4bf.camel@coelho.fi>
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

Hi Luca,
On 2024-05-28 at 10:20:45 +0300, Luca Coelho wrote:
> On Fri, 2024-05-24 at 18:58 +0200, Kamil Konieczny wrote:
> > Hi Luca,
> 
> Hi Kamil,
> 
> 
> > On 2024-05-23 at 11:44:25 +0300, Luca Coelho wrote:
> > 
> > I have two nits, one about too long subject:
> > 
> > [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector() return value in wait_for_connected_state()
> 
> Yes, it's a bit too long, but I wanted to convey useful information in
> the subject...
> 
> 
> > imho better:
> > 
> > [PATCH i-g-t 1/2] lib/igt_chamelium: avoid NULL dereference in wait_for_connected_state()
> 
> Okay, this is descriptive enough, but loses the context of the problem
> with drmModeGetConnector(), which I'm addressing in this series.
> 
> 
> > or even shorter:
> > 
> > [PATCH i-g-t 1/2] lib/igt_chamelium: fix wait_for_connected_state()
> 
> IMHO this is way too generic.
> 
> What about this?
> 
> [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector() return in wait_for_connected_state()

imho still too long, another idea:

lib/igt_chamelium: check drmModeGetConnector() before using

Regards,
Kamil

> 
> It's still sligthly over 80 chars, but conveys the full message (I just
> remove "value" from it).  And the max 80 chars rule is so outdated that
> it's not very strict even in the kernel nowadays...
> 
> > Maybe that should be changed to something else? See my other
> > response.
> > 
> > > The drmModeGetConnector() function can return NULL in some cases, so
> > > we need to check the return value before accessing it.  This is not
> > > being checked in wait_for_connected_state(), so fix that.
> > > 
> > 
> > Also please add to Cc chromium devs, for example:
> > 
> > Cc: Mark Yacoub <markyacoub@chromium.org>
> > Cc: Manasi Navare <navaremanasi@chromium.org>
> > > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> 
> Done.  Thanks for pointing out!
> 
> --
> Cheers,
> Luca.
