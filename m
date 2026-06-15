Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AB8CD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 13:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DD610E456;
	Mon, 15 Jun 2026 13:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqeJEHh5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D7810E42B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781529945; x=1813065945;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oCHxGSCYwZLBmx1te+sOeboRJ66qDKAu3TtCdaqx9sM=;
 b=mqeJEHh5aSc6yIIp4UBgsG1mJ2z3dOYRbiqGbjSo4v8kHHOLvw6Tla12
 qGeAwFPfhq119m0agcGLqnh49oHtbcvzLu+95IsDmVi6yOWJj8WLMDgGB
 gKBJwMMLN7BsZ4MA0dHmFVfH5eso6TkTthibHqyn2ZjUXAzJgCc42g7Gw
 FF1PYf/GDB/vPZ8Jy0XWaDni/palds+VT/aWTcqLNqNyM0j1cmin23B/k
 X2hhn+MzmRXWAa+zJBUZnCLwh5la+761w5xSB5XFizATccDyohEEJbLxz
 2lLZLnpvUrUVPzyPjRHambsoJNb37+qKNKadOI8CMSjL5OG3SyB0NgZnk A==;
X-CSE-ConnectionGUID: WUjf0T1SSQaq267/TAMjYQ==
X-CSE-MsgGUID: n42FYg8YTwKQ2d3diLPTSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="92940267"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="92940267"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 06:25:44 -0700
X-CSE-ConnectionGUID: 1BjuR/CBQnmKAjKw4WEyNw==
X-CSE-MsgGUID: 5SPfwsLeTvC6kCaKeSGBjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="251393337"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 06:25:43 -0700
Date: Mon, 15 Jun 2026 15:25:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Sobin Thomas <sobin.thomas@intel.com>, igt-dev@lists.freedesktop.org,
 piotr.piorkowski@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v2] tests/xe_debugfs: Add debugfs entry read/write
 validation in root-dir
Message-ID: <20260615132525.auyklbqr42ddg6tv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, piotr.piorkowski@intel.com,
 kamil.konieczny@intel.com
References: <20260615043050.603026-1-sobin.thomas@intel.com>
 <5cb5116d1d72fae6d6bc5059d935f7bc8e448469@intel.com>
 <20260615120206.gier5oocmvhcmdi3@kamilkon-DESK.igk.intel.com>
 <7c671909119e5ffb63f79f8b93ffde751eb873b9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c671909119e5ffb63f79f8b93ffde751eb873b9@intel.com>
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

Hi Jani,
On 2026-06-15 at 15:58:24 +0300, Jani Nikula wrote:
> On Mon, 15 Jun 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Hi Jani,
> > On 2026-06-15 at 14:10:22 +0300, Jani Nikula wrote:
> >> On Mon, 15 Jun 2026, Sobin Thomas <sobin.thomas@intel.com> wrote:
> >> > Extend the root-dir subtest to validate additional optional Xe debugfs
> >> > entries. Optional entries are those that may not be present on all
> >> > platforms or configurations — their absence is not treated as a failure.
> >> >
> >> > - dgfx_pkg_residencies: Validate counter reads (non-empty)
> >> > - dgfx_pcie_link_residencies: Validate PCIE LINK string content
> >> > - sriov_info: Validate entry is non-empty
> >> > - workarounds: Validate entry is non-empty
> >> > - atomic_svm_timeslice_ms: Validate integer read/write
> >> > - poor_man_system_atomic_support: Validate boolean read/write
> >> > - disable_late_binding: Validate boolean read/write
> >> >
> >> > v2: Fixed the optional file check and added fail count.
> >> >     Replaced igt_debug with igt_info in few places  (kamil)
> >> 
> >> Why is the plumbing in this patch so xe focused? Looks like a lot of
> >> this could be IGT generic and driver agnostic, with just the debugfs
> >> hierarchy and filenames and requirements for each file described per
> >> driver.
> >> 
> >> BR,
> >> Jani.
> >> 
> >
> > imho we should keep core_debugfs free of driver-specific checks,
> > as it do not know which entries are safe to write to. Also, it
> > is good to have a simple read-all core tests for sysfs/debugs and
> > keep them simple.
> >
> > Thats why driver-specific checks should be done in
> > driver-specific test.
> 
> I don't think you understood what I meant at all.

Well, feel free to write quick and short rfc with your proposed
changes in code. I could comment on that.

Btw did you mean that 'validate entry is non-empty' could be
dropped from this patch? Now as I look again, they are already
checked by core_debugsfs (or at least should be checked).

Regards,
Kamil


> 
> BR,
> Jani.
> 
> >
> > Regards,
> > Kamil
> >
> >> 
> >> >
> >> > Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> >> > ---
> >> >  tests/intel/xe_debugfs.c | 198 ++++++++++++++++++++++++++++++++++++---
> > [cut]
> 
> -- 
> Jani Nikula, Intel
