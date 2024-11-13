Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80616D41C0A
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 06:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4410E19B;
	Wed, 13 Nov 2024 06:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xg/Ao8rg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09DE10E19B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 06:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731480535; x=1763016535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5qPqcKylH629i41oz2zixpfrEGR73D3lcAT09GK/VZ8=;
 b=Xg/Ao8rg2wRa7B1bojsW7fYakpbYefmEN0+OvzNfzXoYiskrqlUYncyV
 vvIOww/YSDdZ05ABf1bhDmdUxE2O4jmlmR9KSkHKjPw0Zx2QAZNbuCONy
 XIs5BknJVAWir5+vYcJWRp0WAMEDRROKOcVCeOCvf14EfiH5QBCpKBBIc
 8S84QGvOcCW14FFRbiWlOHfQimKtbbPcoG36Pw4aQnORt1rv///ExYYsT
 qE+/UfbDDOiLRJ182VDo9WynS4rk+09HhSU7b33jmJjyMougtSqusgvrb
 dAeby3gwptQC5ulPF/cvDEtYKVmcCQp/XcetNxUzKf4V6URg+1tsnjmtL g==;
X-CSE-ConnectionGUID: Ma/NOtT+Rd6D2Tj96ZCnlw==
X-CSE-MsgGUID: uMlpxBljQfehtxlprPHGLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42471521"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42471521"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 22:48:54 -0800
X-CSE-ConnectionGUID: eLUXKoAkRJ2ZJh19NLDzyg==
X-CSE-MsgGUID: KzQy2wN/SW6QJ5O2Hz/H3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="88193420"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.168])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 22:48:52 -0800
Date: Wed, 13 Nov 2024 07:48:49 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib: sync PCI ID macros with kernel
Message-ID: <20241113064849.udg2ey5bglp35eyf@zkempczy-mobl2>
References: <20241106185846.1218835-1-ngai-mint.kwan@linux.intel.com>
 <20241107170833.u7e2s6fjpk7qvdks@kamilkon-desk.igk.intel.com>
 <87iksyeplx.fsf@intel.com>
 <20241112110901.omdnfywpzfvsw2mh@zkempczy-mobl2>
 <87cyj0d7co.fsf@intel.com>
 <20241112115745.qwb2qqovpntdn6uz@zkempczy-mobl2>
 <871pzgd2r1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pzgd2r1.fsf@intel.com>
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

On Tue, Nov 12, 2024 at 03:02:10PM +0200, Jani Nikula wrote:

<cut>

> >
> > I see no __KERNEL__ in current xe_pciids.h and i915_pciids.h so
> > there's some change from my perspective. intel_vbt_defs.h also
> > doesn't contain any kernel conditional inside. I think author
> > of this change should provide additional documentation about this
> > (not me) - commit message for me is not enough. Till this change
> > I haven't noticed any __KERNEL__ usage in igt codebase and I think
> > if it appears it should be documented what's for dead code is
> > imported to the project.
> 
> See igt commit e966143f5c5f ("lib/intel_device_info: use dedicated macro
> for struct pci_id_match init"). INTEL_VGA_DEVICE has been unused in igt
> since then.
> 
> I wrapped the macro in #ifdef __KERNEL__ in kernel commit fc9cb46bdca8
> ("drm/i915/pciids: use designated initializers in INTEL_VGA_DEVICE()")
> to avoid it being used in igt again.

Rationale of your change is clear to me - isolation of INTEL_VGA_DEVICE()
to use in the kernel only. My problems are when I see such thing in the
igt header

#ifdef __KERNEL__

... some definitions ...

#endif

1. is someone really is setting up __KERNEL__ in igt build system?
   What's for it is here? (cognitive problem)
2. this conditional is not necessary here, let's remove it.
   (dead code problem)

I guess you will not accept change in which I would remove __KERNEL__
conditional from the header (2).

> 
> I'm not going to document this further in igt.

I'm asking for the documenting of this change not for me, but for
other developers who might be confused by this conditional in the
future. Especially we want to copy this header from the kernel.
If you still think this is not necessary I have no other arguments
to convince you to add some note to README.md.

--
Zbigniew

> 
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
