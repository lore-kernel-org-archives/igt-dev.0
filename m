Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C031CAC5A0
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 13:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4158110E8BB;
	Thu, 18 Sep 2025 13:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVuse7yy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A265610E8BB
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758202864; x=1789738864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PKibFcmlOvG7hYVsyo3VaMLRDmtD0SAloSYEjV5eA74=;
 b=MVuse7yyY1eGHIO4CgHRP/etXBbIiR45Uur9B03hy5otZ0humP9RnxdU
 /0ACTU9weDyp53YSm+rKLTfRMIXwzJe/z0rVSHO/zL3wCJvMTaaEsOiR7
 Of1W3bp04wnThNrIZkwELi+CWynGe0aeAj0RNh6x3Cy8lHJCsy5Nd8IQE
 dd8hzQgrRhm2pvTB9qOFMCWxPfbyPPR7CVXYbVV0zbW1SYktAiP4V8vyY
 m1vCn/BqUO6Pa6bKqfaz7pkXkLFEesxIT4ALvVuAQ6nDV9r0GBOlzlVLu
 mpQdEsSZLkjqJungtRt+qMVSwen0/EWIP2JilID4xiQOJsc2FzO8osIZY w==;
X-CSE-ConnectionGUID: t8Q/j/T8RTuZgP5pVmfaHw==
X-CSE-MsgGUID: ZtgoRwhvTCGuEcBVgZjlPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71958517"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="71958517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:41:01 -0700
X-CSE-ConnectionGUID: k8p/I3xxRRucMxyouPIRfg==
X-CSE-MsgGUID: ozlsXH87ToqEccqyyTxwYQ==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 06:40:58 -0700
Date: Thu, 18 Sep 2025 15:40:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v6] runner/executor: Abort if dmesg is flooded
Message-ID: <20250918134041.np42cnwjzt4n3bhj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250828103124.36280-1-kamil.konieczny@linux.intel.com>
 <955f10d6-fb39-4c50-b781-e2e6e0bc9dcb@linux.intel.com>
 <62e5b79c-7343-4f94-8c3a-dc4162c90888@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <62e5b79c-7343-4f94-8c3a-dc4162c90888@linux.intel.com>
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
On 2025-09-02 at 15:31:20 +0200, Peter Senna Tschudin wrote:
> After discussing with Kamil, I tested it again. I believe that there
> were two issues with my previous testing:
> 1. The first run of igt_runner takes a little longer than the second.
> This gave me a larger window to start the dmesg flooder
> 2. The BAT test list I am using has a bunch of skips which are not
> affected by the disk limit.
> 
> I changed the test to start the dmesg flooder *before* starting
> igt_runner. Then it always works as expected:

Thank you for testing, it shows that it is impossible to calculate
correct value for dmesg-ratio, so I will send new version with a
new option and with a description, so it will help to understand
its scope and limitations.

Regards,
Kamil

> 
> $ sudo dmesger.sh&
> 
> $ sudo IGT_PING_HOSTNAME='10.211.176.1'
> IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
> ./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
> --overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
> --use-watchdog --inactivity-timeout 90
> --abort-on-monitored-error=ping,taint --disk-usage-limit=128K --facts
> --test-list ~/igt/test-list /home/gta/igt/A0

[cut]

> 
> However the issue of setting an artificially low disk limit size such as
> 1K resulting in runner restarting instead of terminating seems like an
> issue:
> 
> $ sudo IGT_PING_HOSTNAME='10.211.176.1'
> IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
> ./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
> --overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
> --use-watchdog --inactivity-timeout 90
> --abort-on-monitored-error=ping,taint --disk-usage-limit
> =1K --facts --test-list ~/igt/test-list /home/gta/igt/D0
> [53.595429] Initializing watchdogs

[cut]

> 
> $ sudo IGT_PING_HOSTNAME='10.211.176.1'
> IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
> ./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
> --overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
> --use-watchdog --inactivity-timeout 90
> --abort-on-monitored-error=ping,taint --disk-usage-limit=1K --facts
> --test-list ~/igt/test-list /home/gta/igt/D1

[cut]

