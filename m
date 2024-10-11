Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80397D2447F
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 07:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E4110EA4D;
	Fri, 11 Oct 2024 07:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jP4Ke8BW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AE910EA4D
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 07:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728630025; x=1760166025;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4J+x9ecBLz7n24zjnHPMFTvuocqxRa0FeLGr601Cs4U=;
 b=jP4Ke8BW3Qo78a/qpDhOKVwV2BbzTCrDdbVT+uTXKCELNZiWlHl5aYEt
 qy+Cx20+BQLAdLHF775O1K9wANWNcr9ZcAd/QfYz08DNd/rItcCNX+67i
 5QNw3MG/CB5542oG+z/WU0TsvRlz0bYYvtzrSRHZ98hqVbIG2K3J3V94V
 MLFY0LGydfd9PxzQgFoLmWo1oRBNbmVQ+I2e4mw+vv4OvoMEzZJzip2eM
 a4WyvXG3ds2Lx3Q3oJnEYGF/tZYx6iyPem7675OaUFT+NJ6IQ/rfhGAt7
 wkTFnvn2BHYdAzl/oZrWzPoZnf91TFW/9IB/rxKBJctawTCczPGDD9zXj A==;
X-CSE-ConnectionGUID: H88XOoW9RAmyDGKk/JMBNA==
X-CSE-MsgGUID: wv2r/pJtTR6glIquJxJVOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28111953"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="28111953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 00:00:24 -0700
X-CSE-ConnectionGUID: /dSA9e+xRHe2PPRZO7Ar+A==
X-CSE-MsgGUID: /wNFH0gQQYe9r3ntujefKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="107691420"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.161])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 00:00:22 -0700
Date: Fri, 11 Oct 2024 09:00:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_GitLab=2EPipeline?= =?utf-8?Q?=3A?= warning
 for intel: igt_draw and intel_bufops improvements
Message-ID: <20241011070017.f7gnnoaxi4g56b63@zkempczy-mobl2>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <172831556479.1199107.12823113622696577179@2413ebb6fbb6>
 <Zwgt2ay9A_cRL3Qn@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zwgt2ay9A_cRL3Qn@intel.com>
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

On Thu, Oct 10, 2024 at 10:41:13PM +0300, Ville Syrjälä wrote:
> On Mon, Oct 07, 2024 at 03:39:24PM -0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: intel: igt_draw and intel_bufops improvements
> > URL   : https://patchwork.freedesktop.org/series/139556/
> > State : warning
> > 
> > == Summary ==
> > 
> > Pipeline status: FAILED.
> > 
> > see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1285113 for the overview.
> > 
> > build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744864):
> >   [1900/1907] Generating xe_tests.rst with a custom command.
> >   [1901/1907] Generating kms_tests.rst with a custom command.
> >   [1902/1907] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
> >   ninja: build stopped: subcommand failed.
> >   ninja: Entering directory `build'
> >   [1/848] Generating version.h with a custom command.
> >   [2/8] Linking target runner/runner_test.
> >   [3/8] Linking target assembler/intel-gen4asm.
> >   [4/8] Generating intel-ci-tests with a custom command.
> >   FAILED: docs/testplan/intel-ci-tests 
> >   /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
> >   /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?
> 
> Do I need to add something? Who the heck knows?
> Can the person who added all this crap provide
> the patch to fix it?
> 
> We've reached a point where making any changes to igt means
> spending 10% of time on actual work, and the remaining 90%
> is spent dealing with the idiotic "documentation" stuff.

I've checked gem_draw.c and it seems it is i915 specific. Instead
of adding 'Driver requirement' field to i915_test_config.json, remove
it from from gem_draw.c.

--
Zbigniew

> 
> -- 
> Ville Syrjälä
> Intel
