Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F11D0EE00
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 17:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD4B10E55F;
	Tue, 25 Nov 2025 17:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ev4TImJy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D802210E55F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 17:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764090740; x=1795626740;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=x3SfcV3jDikntQ/za2/uhDG9UNSKjBUVhDO7Qy7uMys=;
 b=ev4TImJy8PCrbDK2cZwpwV3XaZPMuEmPofaJJVF9YNnY4f7yUTGEbUmK
 gGEEjmAEnLom5NKf2EAinpRJ9QrCvbSb3FjLm+gNuu3lNSoNw2PTOjH8Y
 nCRVAEuKpu4PomobtljSCWihdY/4F5VRIrnlCaXEYGCWiUV6uqQkiZoEa
 U4qWTSjZgYQxwQYvQX4I5BuHIV9U4+OpLC97qZlDnMPtA5nmrr5K3fvMR
 rKBRgp/N/30IupagaikAmzGAphizGExAS8FURLY1o+FPaP7T7g0rsbsr/
 mBgVhTyLcwtuPGHpBubjiTdOXWwwRykcmoHFN/RuxQc3SWJtzPrLGsFG4 A==;
X-CSE-ConnectionGUID: AiCjutnnSLq2F06h8YILYQ==
X-CSE-MsgGUID: f7S3FYbORcW9bk6/GhbGOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="88767752"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="88767752"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 09:12:19 -0800
X-CSE-ConnectionGUID: 1ouWzB+uTOu/WnHbsRr/rA==
X-CSE-MsgGUID: VdIOxJEeT/Opcc9QUcK4VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="192782471"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO localhost)
 ([10.124.222.230])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 09:12:18 -0800
Date: Tue, 25 Nov 2025 19:12:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t 0/7] igt: Help out coccinelle
Message-ID: <aSXjb54y-dt2_w6h@intel.com>
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <20251125134427.r6i3d7iec5atxmgo@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125134427.r6i3d7iec5atxmgo@kamilkon-DESK.igk.intel.com>
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

On Tue, Nov 25, 2025 at 02:44:27PM +0100, Kamil Konieczny wrote:
> Hi Ville,
> On 2025-11-20 at 21:14:08 +0200, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Coccinelle has trouble parsing a lot of the magic macros
> > used throughout igt. Convert some of the macros to a form
> > coccinelle understands, and provide a pre-made iterators.cocci
> > script that people can include in their own scripts to help
> > coccinelle with the iterator macros.
> > 
> > Ville Syrjälä (7):
> >   igt: Make igt_fixture look like an iterator
> >   igt: Make igt_subtest_group look like an iterator
> >   igt: Make igt_main look more like a function
> >   igt: Make igt_simple_main look more like a function
> >   igt: Make igt_main*() look like normal function definition
> >   igt: Make igt_simple_main*() look like normal function definition
> >   scripts/cocci: Add iterators.cocci
> 
> All of those changes are mostly one-line sed modifications,
> could they be just a part of bigger script to prepare
> sources in some temporary place and then just run
> cocinnelle over it? And moving those changes back into
> igt source.
> 
> Or prepare changes in-place, do actual work and then reversing
> sed changes in generated patches.

Why on earth would we want to undo the sed changes? That would
just mean you have to redo and undo them every time you run
cocci.

The sane thing is to make the syntax closer to standard
C so that normal tools can parse it. And that is what this
series does.

-- 
Ville Syrjälä
Intel
