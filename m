Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11252D74EE3
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 15:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9D910E2CF;
	Fri, 23 Jan 2026 15:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+vVBHIJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4B210E2CF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 15:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769181492; x=1800717492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HUMxQrZZF1736Uz1CQo9cHyFI1dexb4mP1l5FXIN2iU=;
 b=c+vVBHIJwVOyVbRbWhkru+ZlF/gzaVMqXl30Hi+zMJJLomjGCoMnhKiV
 bwH5J2/F5wbcaQIem7MCiAEEL6aXqlxFGEnQe+iiey+iRLkIIsxJmw46V
 thLDCV8J1g1oRESRYGnoB3pnDIhk8UziqSNPd9EIUKhqa5Qteg44zKO8d
 0bNkiW1fEaSOWS3yxLyMqZBIWSA+1qQOhMd16Ly2yNpeaQiLlh81oj0g4
 EFSQ5Xq8CK1CJSsQwem6qjUd8ONvyxolX6LmvQwrkdv1qwC1hnz/E20fg
 m0p5ZmbphFWVDxEGpjIjOjhi7tZCnxPofgviqM/Q/C8AJA2cNILqkINDL w==;
X-CSE-ConnectionGUID: 98FjCa9qQJStNUlPLHnuhA==
X-CSE-MsgGUID: v9Zo7onUQamBRwKeAQTi+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70343847"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70343847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 07:18:12 -0800
X-CSE-ConnectionGUID: z0UEWdx9Rne/UL7Rb4j4qA==
X-CSE-MsgGUID: hMezimNXRBKxypkUyY1p3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211172035"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:18:09 -0800
Date: Fri, 23 Jan 2026 16:18:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Soham Purkait <soham.purkait@intel.com>, igt-dev@lists.freedesktop.org,
 riana.tauro@intel.com, badal.nilawar@intel.com,
 kamil.konieczny@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH i-g-t v5 1/5] tools: Rename tools/gputop to
 tools/gputop.src
Message-ID: <20260123151806.n3isxtvdd55mugws@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
References: <20260122084526.538837-1-soham.purkait@intel.com>
 <20260122084526.538837-2-soham.purkait@intel.com>
 <20260123134528.d7px67wm2a35oc7s@kamilkon-DESK.igk.intel.com>
 <87o6mkighk.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o6mkighk.wl-ashutosh.dixit@intel.com>
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

Hi Dixit,,
On 2026-01-23 at 05:52:07 -0800, Dixit, Ashutosh wrote:
> On Fri, 23 Jan 2026 05:45:28 -0800, Kamil Konieczny wrote:
> >
> > Hi Soham,
> > On 2026-01-22 at 14:15:22 +0530, Soham Purkait wrote:
> >
> > I guess it is v6, not v5?
> >
> > > The GPUTOP source directory is renamed to gputop.src
> >
> > s/GPUTOP/gputop/
> > > under tools/ path.
> >
> > imho here a little more explanation why, like:
> >
> > to compile binary into build/tools/gputop file.
> >
> > This could be done at merge (unless another version is
> > needed).
> >
> > LGTM
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >
> > Regards,
> > Kamil
> >
> > >
> > > v1:
> > >  - Add meson build files accordingly to generate
> > >    the binary under tools. (Kamil)
> > >
> > > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > > ---
> > >  tools/{ => gputop.src}/gputop.c          |  0
> 
> Can't we name the directory 'gputop' if we are moving gputop.c into the
> directory.
> 
> tools/gputop/ looks better than tools/gputop.src, fwiw.
> 

While we can do it, I like to have build binary in
build/tools/gputop
not
build/tools/gputop/gputop

This folder could have other name, is 'gpu_top' good?

Regards,
Kamil

> 
> > >  tools/gputop.src/meson.build             |  1 +
> > >  tools/{gputop => gputop.src}/utils.c     |  0
> > >  tools/{gputop => gputop.src}/utils.h     |  0
> > >  tools/{gputop => gputop.src}/xe_gputop.c |  0
> > >  tools/{gputop => gputop.src}/xe_gputop.h |  0
> > >  tools/meson.build                        | 11 ++++++-----
> > >  7 files changed, 7 insertions(+), 5 deletions(-)
> > >  rename tools/{ => gputop.src}/gputop.c (100%)
> > >  create mode 100644 tools/gputop.src/meson.build
> > >  rename tools/{gputop => gputop.src}/utils.c (100%)
> > >  rename tools/{gputop => gputop.src}/utils.h (100%)
> > >  rename tools/{gputop => gputop.src}/xe_gputop.c (100%)
> > >  rename tools/{gputop => gputop.src}/xe_gputop.h (100%)
> > >
> > > diff --git a/tools/gputop.c b/tools/gputop.src/gputop.c
> > > similarity index 100%

[cut]
