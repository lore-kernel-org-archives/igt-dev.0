Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0D3D58065
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 11:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F79910E60B;
	Mon, 25 Nov 2024 11:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkuRtycf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3260D10E60B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 11:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732534354; x=1764070354;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TExpeR8w7tICzpFM1x8nS8rmovEikD0999wQUAoXVoo=;
 b=lkuRtycf5cpkEntuhKLJqw49dP4mWGiwiD9ogEgsJbToEgn75BZyS1/Q
 NBi6sWX78eMFJtwzKUtKdk46yiYCGj/PNLdHI9QcwjWRTw/Xq/fVW+r3q
 MjynxPsxR8IFjG0wh+wOlcFHhSdC3oMHYORapK7ivi4Ir4kzrM4njcH8Y
 Rb0ShqjuNG5WSOTdws2OTjcs74dJnwrxBvqELQBkYRN0EucJdfi81brZq
 jBQMznbJO2ZV+CpBn/1x0xT2NirpE255QUbr0dE4LzfgbjI2j/h2qW8Zk
 1SxCG3pl4jN7gjsGku9IcsoRPzpl6l41fmFKZ6sscHD1N6WBYu7U5s1yL w==;
X-CSE-ConnectionGUID: KXKTzL1YSAms5bgSj+iS9w==
X-CSE-MsgGUID: LIcrPi1TQxavCuOAlNVpDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="31998779"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="31998779"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 03:32:33 -0800
X-CSE-ConnectionGUID: eVeIUD/XTIS+YHLXG9cBvA==
X-CSE-MsgGUID: 4sDHRw2zRWuFDfqJH1r9+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="95652150"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.224])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 03:32:33 -0800
Date: Mon, 25 Nov 2024 12:32:30 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v8] igt-runner fact checking
Message-ID: <20241125113230.x65tq7jcqoaazjzc@zkempczy-mobl2>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <9b26aa08-b762-4e5a-98b9-d7ccda7b1956@linux.intel.com>
 <20241125094949.gxqftc3fccggwfo5@zkempczy-mobl2>
 <923b0d07-a4bc-4c40-a4bc-65829360fb94@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <923b0d07-a4bc-4c40-a4bc-65829360fb94@linux.intel.com>
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

On Mon, Nov 25, 2024 at 11:21:08AM +0100, Peter Senna Tschudin wrote:
> 
> 
> On 25.11.2024 10:49, Zbigniew Kempczyński wrote:
> > On Thu, Nov 21, 2024 at 03:22:30PM +0100, Peter Senna Tschudin wrote:
> >> When using igt-runner, collect facts before each test and after the
> >> last test, and report when facts change. The facts are:
> >>  - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Intel Battlemage (Gen20)
> >>  - Associations between PCI GPU and DRM card: hardware.pci.drm_card_at_addr.0000:03:00.0: card1
> >>  - Kernel taints: kernel.is_tainted.taint_warn: true
> >>  - GPU kernel modules loaded: kernel.kmod_is_loaded.i915: true
> >>
> >> This change imposes little execution overhead and adds just a few
> >> lines of logging. The facts will be printed on normal igt-runner
> >> output. Here is a real example from our CI shwoing
> >> hotreplug-lateclose changing the DRM card number and tainting the
> >> kernel on the abort path:
> >>
> >>  [245.316207] [056/121] (816s left) core_hotunplug (hotreplug-lateclose)
> >>  [245.383596] Starting subtest: hotreplug-lateclose
> >>  [249.843361] Aborting: Lockdep not active
> >>  [249.858249] [FACT core_hotunplug (hotreplug-lateclose)] changed: hardware.pci.drm_card_at_addr.0000:00:02.0: card0 -> card1
> >>  [249.858392] [FACT core_hotunplug (hotreplug-lateclose)] new: kernel.is_tainted.taint_die: true
> >>  [249.859075] Closing watchdogs
> > 
> > <cut>
> > 
> > Regardless implementation - I wondered a bit about igt_runner and using
> > it by the others - instead of turning on gathering the facts from the
> > default I would add separate option to enable it. I see -f/--facts would
> > appropriate. This would allow to enable/disable it from CI perspective
> > if we would notice some problems - instead reverting the code we can
> > just disable it from CI perspective.
> 
> Thank you for the input. Can you expand on the cost for others? It is just a few extra lines of log.
> 
> igt-facts are primarily looking for sub-tests that make changes to the environment, that cause issues downstream. Here is an example. Imagine test B runs after test A, and that there are 100 tests in between. If test A has tainted the kernel or changed modules loaded, it can cause B to fail. The value is identifying test A as the offender. Can you expand on how this is a problem for others?
> 
> The secondary goal is to report when weird stuff happens such as disappearing PCI GPU. As the facts goal is to detect events that are not expected to happen, having options to choose facts or to disable it makes no sense.

You're assuming gathering facts is mandatory feature for the runner.
I see it other way. Let's hear the voice from other devs and CI folks.

> 
> You mention folks who have non-PCI gpu. Covering their use case can be added later if they want. Lets wait for them to manifest interest instead of trying to come up with something perfect. Please :-)
> 
> Just to give you an idea of how pervasive the problem of tests changing the environment is: 49% of all test-lists from IGTPW_12121 had at least one kernel taint. With a little bit of an approximation we can estimate that each sub-test had a 25% chance of running in a tainted kernel.
> 
> For me having 25% chance of any sub-tests running in a tainted kernel is a problem, for everyone. Can you expand on why this would be different for others?
> 
> In short, my take is:
>  - overhead is low: just a few lines of code
>  - the value is there for everyone
>  - if we need to adapt facts for others, I will be happy to do it when others manifest
> 
> Can I get your reviewed-by? Please :-)

No. I just roughly read your code. I'm planning to do more detailed
review this week.

--
Zbigniew



> 
> Thanks
