Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B48CCFD316
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 10:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE1510E0A3;
	Fri, 11 Oct 2024 10:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eguoK7G+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA8F10E0A3
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728641755; x=1760177755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rNOBLE4G6aUs3Ub5Cj/jClS/ebwYByNfmTGudAlrwO8=;
 b=eguoK7G+Dz1qbFvesvQS/twOvjvL9lDvz6ZNF0O2A8fj6worgaYmrk0v
 azqboprZD6p13NHNvB36RMBgNAVdwQmmmFuk0SiSgLu9Aepa7pJjZJUZ4
 X1zJ/hvanGPDzSGyw0kfRZCzClo00YecS0L1nysVziaUSiXXuPMbwr2kS
 Id93BYuv/f7OGW0EwHue69hNOE6uJ0bsrd/jZOvQx/hZILiZtb+om5tNL
 I/MqCgN90p2vjHiJFzXoq2VKW+ZWc9g1ohNKmNfsQGCJPzZhs5CMqx9Ij
 fcvX6rm8hHaqZPINMe2wRKOrlUNMYoEUU/0Q5X3Ax7iPQqcd2prdA7+zR Q==;
X-CSE-ConnectionGUID: Yo4QCD53RweVmdRrimfWfQ==
X-CSE-MsgGUID: 0ZbjOJxMQ0GV6fOpzRwWRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28177610"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="28177610"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 03:15:54 -0700
X-CSE-ConnectionGUID: uoON0XQ/Q6qYHFcxSwVH3Q==
X-CSE-MsgGUID: AN/U1wKvRleK9iGxHNLKaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76978810"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 11 Oct 2024 03:15:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Oct 2024 13:15:50 +0300
Date: Fri, 11 Oct 2024 13:15:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_GitLab=2EPipeline?= =?utf-8?Q?=3A?= warning
 for intel: igt_draw and intel_bufops improvements
Message-ID: <Zwj61mAuOxU7EaCX@intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <172831556479.1199107.12823113622696577179@2413ebb6fbb6>
 <Zwgt2ay9A_cRL3Qn@intel.com>
 <20241011070017.f7gnnoaxi4g56b63@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011070017.f7gnnoaxi4g56b63@zkempczy-mobl2>
X-Patchwork-Hint: comment
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

On Fri, Oct 11, 2024 at 09:00:17AM +0200, Zbigniew Kempczyński wrote:
> On Thu, Oct 10, 2024 at 10:41:13PM +0300, Ville Syrjälä wrote:
> > On Mon, Oct 07, 2024 at 03:39:24PM -0000, Patchwork wrote:
> > > == Series Details ==
> > > 
> > > Series: intel: igt_draw and intel_bufops improvements
> > > URL   : https://patchwork.freedesktop.org/series/139556/
> > > State : warning
> > > 
> > > == Summary ==
> > > 
> > > Pipeline status: FAILED.
> > > 
> > > see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1285113 for the overview.
> > > 
> > > build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744864):
> > >   [1900/1907] Generating xe_tests.rst with a custom command.
> > >   [1901/1907] Generating kms_tests.rst with a custom command.
> > >   [1902/1907] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
> > >   ninja: build stopped: subcommand failed.
> > >   ninja: Entering directory `build'
> > >   [1/848] Generating version.h with a custom command.
> > >   [2/8] Linking target runner/runner_test.
> > >   [3/8] Linking target assembler/intel-gen4asm.
> > >   [4/8] Generating intel-ci-tests with a custom command.
> > >   FAILED: docs/testplan/intel-ci-tests 
> > >   /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
> > >   /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
> > 
> > Do I need to add something? Who the heck knows?
> > Can the person who added all this crap provide
> > the patch to fix it?
> > 
> > We've reached a point where making any changes to igt means
> > spending 10% of time on actual work, and the remaining 90%
> > is spent dealing with the idiotic "documentation" stuff.
> 
> I've checked gem_draw.c and it seems it is i915 specific. Instead
> of adding 'Driver requirement' field to i915_test_config.json, remove
> it from from gem_draw.c.

Pretty sure I tried that and it still complained about something.
Hmm, tried it again and it does seem to help. I must have had
something else "wrong" when I tried it the first time. It still
warns about "mega features" (whatever that is) but at least it
doesn't fail the build anymore. Thanks.

-- 
Ville Syrjälä
Intel
