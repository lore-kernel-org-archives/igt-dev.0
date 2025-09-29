Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22636CAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 18:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF47710E24D;
	Mon, 29 Sep 2025 18:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOODsAV6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C178210E24D
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759169470; x=1790705470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SRvo/R0jmgEhYP5pXIydK6yreG+VqVowcM3HPFQHjaQ=;
 b=nOODsAV6eN176CqnQFRh3ZR1j72YX7nl29eBC2QNmdlxaHn6pYAsLoUZ
 SWtJWVtWDdWaeRYqHo2xVjZ19BWjO0S9btgbEHH6dl+0rzyPn6iMolUgP
 cfySfOwfWNPZMSMbq0zKBiUnAXwqgxxqOuBlahfnOvjSy5cl7NBDmvtuQ
 L7FCbqo9C/QZJRSwFgCzX1fC18htGXeUAhd+6gXi7DgMKi5U2VhRMzjHs
 oZ6OzO9VwqpFwsWIDYxRuYXuuHY6+hvhwhTbLIfY0NNO9Rkliag+AgCsQ
 vysuyv/AeX985wleRkwfzK4N88minOyaDMk2Z1B9+gAxlW+9n0VLwtC1m w==;
X-CSE-ConnectionGUID: eeKlYSJ7T7ecdT/7Aq/HbA==
X-CSE-MsgGUID: /hvUIh6zQKWT9wabXMjnUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72096797"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="72096797"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 11:11:10 -0700
X-CSE-ConnectionGUID: Gkzm5ZIeTCufxgA0TpZGRw==
X-CSE-MsgGUID: ZsEm7QxtQzOrf6r9GxuP9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178728125"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 11:11:09 -0700
Date: Mon, 29 Sep 2025 21:11:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/7] lib/gt: Fix IGT_NO_FORCEWAKE handling
Message-ID: <aNrLukKlUUFcrNsa@intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-2-ville.syrjala@linux.intel.com>
 <pyt6omty62zzgrcedpr2fxdefmvst6frwvckri7nxmt7bo6pk7@jmc7pwo4x5pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pyt6omty62zzgrcedpr2fxdefmvst6frwvckri7nxmt7bo6pk7@jmc7pwo4x5pw>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Sep 24, 2025 at 08:22:22AM -0500, Lucas De Marchi wrote:
> On Mon, Sep 22, 2025 at 07:09:43PM +0300, Ville Syrjälä wrote:
> >From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> >igt_open_forcewake_handle_for_pcidev() forgets to check for
> >the IGT_NO_FORCEWAKE environment variable, which is a real
> >problem when one wants to frob the registers without forcing
> >power state changes in the hardware (eg. to observe display
> >low power watermark residencies/etc.)
> >
> >Add the missing IGT_NO_FORCEWAKE check.
> >
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Fixes: 114b9ff31d19 ("lib/igt_gt: Add igt_open_forcewake_handle_for_pcidev()")
> >Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> We should also probably update this comment in lib/intel_mmio.c:
> 
>         /* Find where the forcewake lock is. Forcewake doesn't exist
>          * gen < 6, but the debugfs should do the right things for us.
>          */
>         ret = igt_open_forcewake_handle_for_pcidev(pci_dev);
>         if (ret < 0)
>                 mmio_data->key = FAKEKEY;
> 
> because it's not only about gen < 6, but rather that it can also be
> bypassed.
> 
> Also odd that there's no way to differentiate a real error from a fake
> forcewake.

Are there real errors? I suppose in some cases you might consider the
lack of a driver to be an error, but for me it basically never is.

I suppose one way we could deal with this is to have the caller of
intel_register_access_init() specify whether it wants forcewake or
not. For display stuff we'd never want it, wheras gt stuff (is
presume there is some?) would perhaps always want it.

intel_reg is a much harder problem because sometimes you want
forcewake and sometimes you don't. That could be the case even
for registers that need forcewake because you may want to see
how the hw behaves when you don't have the required forcewake.

And I typically use both intel_reg and other display specific
tools simultaneously so the env variable takes care of everything
for me. Even if we changed the display tools to not take forcewake
I'd still need to set the env variable for intel_reg.

-- 
Ville Syrjälä
Intel
