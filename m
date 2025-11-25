Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E83D0E6E3
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 13:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBBC10E3FE;
	Tue, 25 Nov 2025 13:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hA+hEF8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A1810E3FE
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764078574; x=1795614574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c/wCA1XaQXUM2MIPyXV7Y9QhxCQEbqxzOra4qBG1fl0=;
 b=hA+hEF8h5RjL4OAlj/qDnP4Bt0enIl/6JKiFiZYVYsGBiaPnSIJC0ied
 HtN3MPoYuHK9/Z6ajbx9qpgEqkXzzFy6FO7HaGfNFFiY7xaDSnxEIRi59
 d6pTkHy22YbFkDQfD5FvWvlzio8c6+hVTvAVcpopQBPgUe39nbi2wPD/9
 IRKmHdJz7aUw76dvD/9CXrY42KF+WMmpF0QT5R+B5kMq8i+LnUK5DNtzT
 JJbPTa5HCO6m4t7PA4Gx1r4nF9mds75Peu1U+fppk3Bw120zC2T4PuUTa
 hvcYZt79/EBKqf86SkZ43eKX3p8g5i7DB6WftIlgNgZgrPOvzdZqxvKUY A==;
X-CSE-ConnectionGUID: hAydH6XOTO2Qgrvd/kJrCw==
X-CSE-MsgGUID: FGeO6vLmSa+2zyiYGmyrTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65985641"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65985641"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:49:34 -0800
X-CSE-ConnectionGUID: DrPjnbQiT76gKh5gKplggA==
X-CSE-MsgGUID: E4vDBHZDSUq80RYWmRJYHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192730060"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:49:33 -0800
Date: Tue, 25 Nov 2025 14:49:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 0/7] igt: Help out coccinelle
Message-ID: <20251125134913.xrcxcm2r322v2bnt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <b1d1fc5f-09d8-4046-b99c-77677a5b2b06@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1d1fc5f-09d8-4046-b99c-77677a5b2b06@linux.intel.com>
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

Hi Peter,
On 2025-11-24 at 19:12:12 +0100, Peter Senna Tschudin wrote:
> Hi Ville,
> 
> I need to see the value proposition before supporting ~2000 lines of churn.
> 
> - Can you share the specific Coccinelle scripts that require these changes?
> - What transformations are you planning that can't work with the current
> syntax?
> - Have you attempted these transformations and confirmed current syntax
> blocks them?
> 
> More importantly: Coccinelle provides mechanisms to handle non-standard
> macros (iterator declarations, custom isomorphisms, virtual rules,
> etc.). Have you exhausted all options for teaching Coccinelle about our
> existing macro syntax before concluding we need to modify the codebase
> itself?

I agree with Peter, can cocci learn to ignore igt_fixture and other
macros? Or handle them in proper way?

Regards,
Kamil

> 
> It seems backwards to change ~2000 code locations to accommodate a tool
> when the tool is designed to be configurable for exactly these situations.
> 
> Without concrete examples of problems being solved and evidence that
> Coccinelle-side solutions were explored, this looks like speculative
> refactoring with unclear ROI.
> 
> Thanks,
> 
> Peter
> 
> On 11/20/2025 8:14 PM, Ville Syrjala wrote:
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
> > 
[cut]

> >  472 files changed, 1930 insertions(+), 1875 deletions(-)
> >  create mode 100644 scripts/iterators.cocci
> > 
> 
