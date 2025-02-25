Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C86BC021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 13:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0457F10E69C;
	Tue, 25 Feb 2025 13:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLYUYnwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A6810E69C
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740491180; x=1772027180;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f/XREChJkNdPR/SEHuMxAVs8D9CAZf/nrPmnnfhUaCc=;
 b=LLYUYnwcEsVGF8waudB3eOyKOr29ynr4oMhoCF7pDdxbMwHdiBqiddBP
 cIIBw5TCyqM9YcqhmEX+XtKcGFpG9fXdny8yHrQd/YV5i8GXfoscbSySQ
 OQKG3PrPWgX42Sr33YQm6Yth1M/94LNaK4SoS8EgiVETGuR4KhrULJux5
 zL0CQI6UUOtsnJ6DLOZpQPxNGuZZeOJCnUxJZ9YI3k7YeaXqq1QOyzmns
 f6Vuc5nJbZnQjcr+MMDhCpR8Htz+Tu9dT2X0wpFzgkV/25/+OAhGZjQG/
 ToYPrhQ9CWr7CFgFlL1GftDFmuFsR1KNFD3lX/IFujV/xnPqJ9KR7wXKF g==;
X-CSE-ConnectionGUID: 91kawj0QSJq1mcrXmD7kcw==
X-CSE-MsgGUID: BTctR2Z0SouHZinT+R9QxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45081013"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="45081013"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:46:20 -0800
X-CSE-ConnectionGUID: JYp7GjUsR7KuEefRhjljuw==
X-CSE-MsgGUID: Re7bIzwdRjeHclwVfr2HxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121365835"
Received: from ykhaled-mobl.ger.corp.intel.com (HELO [10.245.114.21])
 ([10.245.114.21])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:46:17 -0800
Message-ID: <d07d932d-bfb3-4cf4-b12c-a885c62867a9@linux.intel.com>
Date: Tue, 25 Feb 2025 14:46:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
 <20250131123454.ilhzogs6a2w7s3on@kamilkon-desk.igk.intel.com>
 <17fe9952-7b2e-46fd-af1f-cd7cbea2cebd@linux.intel.com>
 <20250211161734.nm6dsq3ahhcn7hvz@zkempczy-mobl2>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250211161734.nm6dsq3ahhcn7hvz@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Zbigniew,

On 11.02.2025 17:17, Zbigniew Kempczyński wrote:
[...]

> 
> I'm looking at the code and I have impression this should be part of
> the runner, not igt library. Do I understand correctly that your
> code will be used by the runner only and not by the tests?
> 
> Regarding your above question, I think runner should use as much as
> minimal from lib/ directory, because this is collection of functions
> designed for tests, not for runner. I think generic code like data
> structures (lists) are fine, but not the others. Imagine you'll
> incidentally try to use igt_require() - follow the call and see
> the pitfall there.
> 
> So if my understanding is correct and this code should be part of the
> runner only your test might be moved to the runner_tests.c.
> 
> BTW please rebase on top of current master, there were changes in
> the runner/settings.c file that affects this series.

I sent V5 a few moments ago and I included the AMD folks who sent a patch
to add kmemleaks integration as a library for tests. Please have a look at
the last comment from AMD explaining why adding a lib for tests:

https://patchwork.freedesktop.org/series/145011/

I feel we should work with them to avoid duplication functionality. What
are your toughs?

Thanks!


[...]
