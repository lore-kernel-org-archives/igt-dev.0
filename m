Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5C3CD6E55
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 16:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8392C113576;
	Mon,  1 Jun 2026 16:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1AR5RmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724B1113574
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 16:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780330499; x=1811866499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nqDeYXQx30uUiQ6fZCMZ9kT6VqQRSRkaG3eyVP4MoTc=;
 b=D1AR5RmWmwLrj6S0zJzi8nJkjt7x84i5xtIHEQX9cQ+KSl1EByAsrtPs
 Nuhi9IvTSmC45x2m5Mjiqj3KPmf5tk+U7AZuuDmtBE0UiAiXjUlitzdOy
 bIYYiVS3Q7BmTi50Z5aZSaGMsDrM1/DarC+0EtaxjNYV2cBiFw4y6Fz0V
 RyfDOq7Tntl7VAajDqGlglLd3zAmfsA7L5fcSwTDzmwAIgyUzG7Pdef+n
 9Vh1bHXxiC2ZAile0MTWgDwoEklJ3Jn5fofN92YFbYsFPqWTeV/S/yTmW
 AASAOLlHcAIX7VDe+rD19tzzAMznAFUFc3buTRMjG49VTKBm5/9wn8J7L w==;
X-CSE-ConnectionGUID: RA5pf2ZjQmeQgjJK28hbsg==
X-CSE-MsgGUID: nMH6/1i7S8eFW/YXXfyyZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80824597"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80824597"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 09:14:59 -0700
X-CSE-ConnectionGUID: ne8ZHTJmQ1Wj+s1m+nkd2Q==
X-CSE-MsgGUID: UQzD4yvLRMmDOSUBpCulVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="248531964"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:14:57 -0700
Date: Mon, 1 Jun 2026 18:14:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH i-g-t v5 0/2] tools/igt_power: fix Xe crash via drmtest
 path helpers
Message-ID: <20260601161455.xwokorpiuub7krxs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
References: <20260601124620.19636-1-sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601124620.19636-1-sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-06-01 at 14:46:18 +0200, Sebastian Brzezinka wrote:
> v5:
> - rename __drm_open_driver_path() to drm_open_driver_path() since
>   xe_device_get() internally uses igt_assert(), making the __ no-assert
>   prefix semantically incorrect
> - add name[0] != 0 check after __get_drm_device_name() to guard against
>   an empty driver name being treated as a valid DRM device

Something strange happend here, your cover letter is detached
from other mails from this series.

Regards,
Kamil

> 
> v4:
> - rename drm_open_driver_path to __drm_open_driver_path (no asserts/requires)
> - add DRM_IOCTL_VERSION check to verify fd is a DRM device before proceeding
> - split the single patch into two: lib helper addition and igt_power
> 
> v3:
> - remove redundant if (fd >= 0) guards on both close call sites
> 
> v2:
> - move Xe cache setup/teardown out of igt_power
> - add drm_open_driver_path() and use __drm_close_driver()
> - drop the direct xe/xe_query dependency from igt_power
> 
> Sebastian Brzezinka (2):
>   lib/drmtest: add drm_open_driver_path()
>   tools/igt_power: initialize xe_device cache
> 
>  lib/drmtest.c     | 30 ++++++++++++++++++++++++++++++
>  lib/drmtest.h     |  1 +
>  tools/igt_power.c |  6 +++---
>  3 files changed, 34 insertions(+), 3 deletions(-)
> 
> -- 
> 2.53.0
> 
