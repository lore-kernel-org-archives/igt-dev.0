Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56973C54E41
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 17:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD47610E4F9;
	Tue,  5 Mar 2024 17:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuVoh/pY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6A10E24F
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709659876; x=1741195876;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YPZue9WB+oMgqmpmfgA6O5eAxrzriuSJOaGeKUZJ0vQ=;
 b=EuVoh/pY8fnV+NE6NYlLa7oYEPJB5aWsecHLSlZom9c9mZAO6CYuVndg
 8D3i1x3WHmYtFa2ceXqsfumOiEvgvq5ue5OZKrO2WiA+XwyqWwf5b1YF+
 FCczaXsUf1L1K5ZR5Bz3T6MG/S6Rk66luLx1zK2t4yVfpMmkoBUsq50tJ
 sGFM5gQmODG1CEHr6J9xHn4h05gTWmyuWTFYfl1zSsHVsPqh9ijUaZfsy
 xMwHT9T7RvqB0npkOMj6zRPHa3TQQORLEviGKcPQ0yM4GAKuIfXIuhAP6
 Tss4Q2cAXxD/Ox+a/tkHupBk79b3tMR2mWNHWB9G2AnhbB1zeCjUBJ6zH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4107074"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4107074"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="47002324"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:31:14 -0800
Date: Tue, 5 Mar 2024 18:31:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Allow to load kunit from alias
Message-ID: <20240305173110.le7tevhhiqtklo55@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240222193044.3004471-1-lucas.demarchi@intel.com>
 <20240304160529.rr2z4dmzbkeyih4o@kamilkon-desk.igk.intel.com>
 <zqmldqo5fr4bpuegclkh2we7twqwijppjin2ry5uktgh5yyobx@wixslkby4fbh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <zqmldqo5fr4bpuegclkh2we7twqwijppjin2ry5uktgh5yyobx@wixslkby4fbh>
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

Hi Lucas,
On 2024-03-05 at 08:23:28 -0600, Lucas De Marchi wrote:
> On Mon, Mar 04, 2024 at 05:05:29PM +0100, Kamil Konieczny wrote:
> > Hi Lucas,
> > On 2024-02-22 at 11:30:44 -0800, Lucas De Marchi wrote:
> > > Instead of only allowing to load the from the module name, also allow it
> > > from alias by using kmod_module_new_from_lookup(). With that a user can
> > > have their on aliases and the kernel can also export a compat alias for
> > > future module renames.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > It is somehow test listing failing: ./dmabuf --list
> > 
> > tests/dmabuf:
> > Checking invalid option handling...
> > Checking valid option handling...
> > Checking subtest enumeration...
> > test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
> > FAIL: tests/dmabuf
> 
> how did you find what was the test failing?  The new version is still
> failing, although dmabuf --list does return the same as before.
> 
> thanks
> Lucas De Marchi

This was just:
meson test -C build

but your v2 now build ok on my local machine.

From error build link:
https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55851077/raw

I guess it is failing on:

Warning: Documented igt@dmabuf@all-tests doesn't exist on source files
Warning: Documented igt@i915_selftest@live doesn't exist on source files
Warning: Documented igt@i915_selftest@mock doesn't exist on source files
Warning: Documented igt@i915_selftest@perf doesn't exist on source files
  ninja: build stopped: subcommand failed.

I do see new CI script there which I cannot find locally:

[1154/1787] Generating i915_selftest.testlist with a meson_exe.py custom command.

Mauro could you help spotting what is a problem here?

Regards,
Kamil

