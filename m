Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CF8D2447B
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 06:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB44A10EA3E;
	Fri, 11 Oct 2024 06:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eq5SGX0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE4E10EA3E
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 06:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728628652; x=1760164652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WYmQlSfZVQA2QUOv4wWgBfmgQ4QDsY0agkKoUgjDbKg=;
 b=eq5SGX0BYY+TCAHSpgenzhaNjgRGnXSsB3DpKgu6EJHFjciFdcCM/L9y
 SfzmnJw2b73q6TSNhCrr4/2eVLP1zBvBHu1khOqoD3/R4StxTWhew03HU
 v1vhDcX6+8F5OPSjzPbcj04Z9PCHRvOQrFwBBmhG4imzqe10QiS+/pxVo
 5m+8DwPzPbpIp3SvoYhZfEMjlgdGQOroxOUXgCBiT75JcpFl7xXtOuEiY
 kej5X9Fga7QoS179VNMW7HmPwxzKElFxuYDLFIRo8zl2LbCVhP/Uyv/3w
 9nY/p30FSxC7OBTWQXFXT+liMlY2j9krow2Sr0EBDS7MrYRKlf1xbRn+D w==;
X-CSE-ConnectionGUID: fdYefKg6Sm+qDk3wd/hlxw==
X-CSE-MsgGUID: j7A2PqiFSquxHLkF8gSJZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28159773"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="28159773"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 23:37:32 -0700
X-CSE-ConnectionGUID: MHOnnjqiRSmSvIA1/nWALA==
X-CSE-MsgGUID: VlV6NVDxQc+JP+tyXfS60Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="80824403"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.161])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 23:37:30 -0700
Date: Fri, 11 Oct 2024 08:37:27 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_GitLab=2EPipeline?= =?utf-8?Q?=3A?= warning
 for intel: igt_draw and intel_bufops improvements
Message-ID: <20241011063727.wbjyxi442hpf6w34@zkempczy-mobl2>
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

There're people who are using this so my personal opinion about
this doesn't matter. Try to add:

tests/intel/i915_test_config.json
@@ -91,6 +91,11 @@
                 "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
             }
         },
+        "Driver requirement": {
+            "_properties_": {
+                "description": "Describes any Driver specific requrirement, like i915/xe."
+            }
+        },

This should fix one of the issues.

--
Zbigniew

> 
> -- 
> Ville Syrjälä
> Intel
