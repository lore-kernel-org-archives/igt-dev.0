Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA6CD24442
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 19:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6784810E9BF;
	Thu, 10 Oct 2024 19:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZu0a7hS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F23710E9BF
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728589277; x=1760125277;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=oacx8VYDqTuvwzVUrrXv1Nk3Y73zTOEVCQm/uVo7u0c=;
 b=GZu0a7hSxL8Sld8oGjvc+re1SAbRMxbeDVAt8NIC5/Y7phIf6Uxr0Svo
 tAawjIy/glOpJndiNkSboG/+lF1UVtjx+vDdmEFc0yyViornzE8xIJ/re
 kRwn4O7UolHQmQ+zWfeo9tW1B7RSq1hvRZNQzr0eSZHDVEKd6KOGNYVC0
 gJK3kVhK7476sDjtRHF4VoAmdfKBEm6s300VJkpZHSUIXp4dXXGyH2/gE
 K4/4XXeRlsAdXkRlr5URTaQ27tKL4sFtz+kHMCUNXu2hkIPnfBpe5wGRh
 ktnY0WOUxMaZvQZ9zIwtuQJCYPLbBWYcAWKUR+ub5fRSmeVaRj8TyWIw5 g==;
X-CSE-ConnectionGUID: rh97v9WsRwiy082ZrlSs7A==
X-CSE-MsgGUID: +9TpQkAVRBG5KEeibffXeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38615902"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="38615902"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 12:41:16 -0700
X-CSE-ConnectionGUID: 1uLBHFVITACsSKrtotWB0w==
X-CSE-MsgGUID: x+85fptNQ3KHH2U0WfijiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="76786649"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 10 Oct 2024 12:41:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Oct 2024 22:41:13 +0300
Date: Thu, 10 Oct 2024 22:41:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_GitLab=2EPipeline?= =?utf-8?Q?=3A?= warning
 for intel: igt_draw and intel_bufops improvements
Message-ID: <Zwgt2ay9A_cRL3Qn@intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <172831556479.1199107.12823113622696577179@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172831556479.1199107.12823113622696577179@2413ebb6fbb6>
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

On Mon, Oct 07, 2024 at 03:39:24PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel: igt_draw and intel_bufops improvements
> URL   : https://patchwork.freedesktop.org/series/139556/
> State : warning
> 
> == Summary ==
> 
> Pipeline status: FAILED.
> 
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1285113 for the overview.
> 
> build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64744864):
>   [1900/1907] Generating xe_tests.rst with a custom command.
>   [1901/1907] Generating kms_tests.rst with a custom command.
>   [1902/1907] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
>   ninja: build stopped: subcommand failed.
>   ninja: Entering directory `build'
>   [1/848] Generating version.h with a custom command.
>   [2/8] Linking target runner/runner_test.
>   [3/8] Linking target assembler/intel-gen4asm.
>   [4/8] Generating intel-ci-tests with a custom command.
>   FAILED: docs/testplan/intel-ci-tests 
>   /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/kms_test_config.json /builds/gfx-ci/igt-ci-tags/tests/intel/xe_test_config.json --intelci-testlist docs/testplan/intel-ci-tests
>   /builds/gfx-ci/igt-ci-tags/tests/intel/gem_draw.c:10: Error: unrecognized line. Need to add field at /builds/gfx-ci/igt-ci-tags/tests/intel/i915_test_config.json?

Do I need to add something? Who the heck knows?
Can the person who added all this crap provide
the patch to fix it?

We've reached a point where making any changes to igt means
spending 10% of time on actual work, and the remaining 90%
is spent dealing with the idiotic "documentation" stuff.

-- 
Ville Syrjälä
Intel
