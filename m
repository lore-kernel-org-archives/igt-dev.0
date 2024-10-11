Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049C3CFD30C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 10:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B309610E0A3;
	Fri, 11 Oct 2024 10:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUSGC5aA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9C710E0A3
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 10:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728642351; x=1760178351;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=y2oeEP+vUB7jM6BeCjPyYBq1DuvsNnVBWFDqTHxjbWo=;
 b=lUSGC5aAa2bJPIWzzZ70fqSHHKfv4D6lbwRDXOaTZb2j96cHeAt2N2Yo
 3Q9hpN8pX+effEvgC1tuprqYzArRIeNaBawgf9LyBtS9i4+ZeB/bAZ9Ep
 1aaLC15ObkChsW8IhpTTRBL5rjNeiIDgIhfd3iw2GMA8qu4NiXjA8N1yg
 +wGRTAPaNpP4HHg0PyH2jtWhLPqOrmaIHDUnufEiFDOHLL5yQH4YsL9eC
 TNYlTersU7K3sdaMaEDJt473xg77IdAL/p9HuqfFzbbG71XQ9husWsco7
 GXKAmCvjwMfRWVQeXQn4Pq/YRpWm6jaYIt8fDz586aU00xcLKDp9naOAz A==;
X-CSE-ConnectionGUID: Igjx6+2jRrKzxh5jjqWCoQ==
X-CSE-MsgGUID: Adbf5qoUTkOZvphXCYSI8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28178263"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="28178263"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 03:25:51 -0700
X-CSE-ConnectionGUID: vOwkx0NjSsOn9FIguxBRUA==
X-CSE-MsgGUID: 7ets2ZdWQ7GPzj8QY7F4Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76979976"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 11 Oct 2024 03:25:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Oct 2024 13:25:48 +0300
Date: Fri, 11 Oct 2024 13:25:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_GitLab=2EPipeline?= =?utf-8?Q?=3A?= warning
 for intel: igt_draw and intel_bufops improvements
Message-ID: <Zwj9LA36PvNfmzqm@intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <172831556479.1199107.12823113622696577179@2413ebb6fbb6>
 <Zwgt2ay9A_cRL3Qn@intel.com>
 <20241011063727.wbjyxi442hpf6w34@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011063727.wbjyxi442hpf6w34@zkempczy-mobl2>
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

On Fri, Oct 11, 2024 at 08:37:27AM +0200, Zbigniew Kempczyński wrote:
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
> There're people who are using this so my personal opinion about
> this doesn't matter.

Who are those people? They need to step up and fix this mess.

At the *very least* the inane arg[1] stuff needs to be nuked
from orbit and instead the test names must be made to support
real wildcards of some sort (ie. without having to painstakingly
list each and every value for every damn wildcard).

Hmm. Seems if I stick a '*' into a test name then the
documentation build scripts just seem to ignore it or
something. I'll probably just start using that even if it
doesn't do what some people want. They can come in and
fix their crazy scripts themselves.

-- 
Ville Syrjälä
Intel
