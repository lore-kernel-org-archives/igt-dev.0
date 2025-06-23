Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87463C77B7C
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 17:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656FA10E013;
	Mon, 23 Jun 2025 17:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy+TWlyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4209510E013
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 17:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750700617; x=1782236617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gDwY6i/Z+vYdv41RGFcpSnzlO9TN0hHRYHJKMQUqbOE=;
 b=Oy+TWlybWABbNJjvxh4t8IZmdBK7GQwXBsuME35Jxekw+/RWbxtSvbPQ
 gnRqLZWC0gpskvetapCzKbgsKnDmXNzxPwRVy7j54xFoqZ0b2NB1JmD3B
 NLBFTacaumQvztsshrzPs4Q9sVNehBTvCIdP2pWELrbDUlkQ39BtxOVOp
 kgws6w35XXMQ9e9R4gcJvNpF18htpzekITpiO5hp/6556hB96sUAvXmCe
 GoCeONZX7Q1D6MwU0C4qBm5+v+OTo0kojGLBWcSWky6AdOV/HtnM71OIk
 aWjvDW2hh4vGKsrX6x+WM1ciLn/c52rumZoyoUv8sbAoo4BRqg/bOESXQ g==;
X-CSE-ConnectionGUID: ntuxmHihQDmGKP0hMR679g==
X-CSE-MsgGUID: zetVymJzTH24CT/sY5/lfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53009560"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="53009560"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 10:43:36 -0700
X-CSE-ConnectionGUID: ML4TTW2xSsu5aLtrtwjrHA==
X-CSE-MsgGUID: arWbtb07QgG/uQ0MQNCw0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="175273218"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 10:43:35 -0700
Date: Mon, 23 Jun 2025 19:43:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, andi.shyti@linux.intel.com,
 krzysztof.niemiec@intel.com
Subject: Re: [PATCH i-g-t] lib/i915: Avoid non-canonical address dereference
 in gem_has_relocations()
Message-ID: <20250623174322.makdvu24epdh2nag@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, andi.shyti@linux.intel.com,
 krzysztof.niemiec@intel.com
References: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
 <pljh6w3ikkehzyhdwvey4277vklqffg5dfledtm3hcuoer6hzt@atyhhoyamrjm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <pljh6w3ikkehzyhdwvey4277vklqffg5dfledtm3hcuoer6hzt@atyhhoyamrjm>
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

Hi Krzysztof,
On 2025-06-18 at 11:39:40 +0000, Krzysztof Karas wrote:
> Hi Sebastian,
> 
> > Fix a general protection fault in igt@gem_exec_big@single caused by
> > passing a non-canonical address via relocs_ptr. The test previously
> > used a stack-allocated relocation entry, which resulted in an invalid
> > pointer being passed to the kernel, triggering a crash.
> Did this happen as a result using freed heap allocated data?
> 
> > 
> > This patch replaces the stack-allocated `reloc` with a NULL pointer,
> > ensuring the kernel correctly interprets the absence of relocations and
> > avoids undefined behavior.
> > 
> > A corresponding kernel patch to sanitize user input for relocs_ptr has
> > been submitted to the i915 mailing list to further harden the interface.
> I noticed that the mentioned patch has been met with some
> pushback from the community. If you believe it is required on
> the i915 side and worth mentioning here, then please move this
> note into the section below "---". Otherwise, please remove
> that part.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
> > 
> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > ---
> >  lib/i915/gem_submission.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> > index 7d1c3970f..a03b2e369 100644
> > --- a/lib/i915/gem_submission.c
> > +++ b/lib/i915/gem_submission.c
> > @@ -421,10 +421,10 @@ unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
> >  
> >  bool gem_has_relocations(int i915)
> >  {
> > -	struct drm_i915_gem_relocation_entry reloc = {};
> > +	struct drm_i915_gem_relocation_entry *reloc = NULL;

These seems to be wrong, you need to fill up reloc structure
with some sensible value(s).

Regards,
Kamil

> >  	struct drm_i915_gem_exec_object2 obj = {
> >  		.handle = gem_create(i915, 4096),
> > -		.relocs_ptr = to_user_pointer(&reloc),
> > +		.relocs_ptr = to_user_pointer(reloc),
> >  		.relocation_count = 1,
> >  	};
> >  	struct drm_i915_gem_execbuffer2 execbuf = {
> > -- 
> > 2.34.1
> > 
> 
> After addressing the comment above:
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> Best Regards,
> Krzysztof
> 
