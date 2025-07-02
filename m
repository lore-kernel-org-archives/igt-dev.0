Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AC8C83F04
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 13:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CA610E702;
	Wed,  2 Jul 2025 13:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UML9M7Qv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E4E10E702
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751463110; x=1782999110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+FoKEGlJwKaY0MXlRRyq5zdJB7Th+V2uKKa85SQ1+wM=;
 b=UML9M7QvGwhemNlZpuB/DLqanyhf2/ZYH4VfjTkDbuSMkDxHZ5dCtW0d
 RtKLTmw1xZ+BcdNLyjLOXBA4eQNprRSCDZJgQG6oG91oEjdKL3TRD0d9J
 F7IEx4oVKdcYRhASwKGnKALgDFOhCc8ysWLEnwH5Qr5RyKQNOtCK7GVwA
 s7Tuxpr+9AWpvGexFADS/MFhFO3c10JOrVWALFlYdvDjgYop6gSID/SNR
 phRLb49/YMUPbl7r5xRH9SQsCCD3D2Vo7KWE+JjwI876URyPeDX8loExQ
 E4Ds2qvQivjCJANz87W9ClhmxTWkFA6G+bhNl73ZCfFsfra4zScQCr+qx A==;
X-CSE-ConnectionGUID: vCQ4fX76Qy+zq6+eFKRs7g==
X-CSE-MsgGUID: upWrQ7z8RvuRywbqAKv30w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57567418"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="57567418"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:31:49 -0700
X-CSE-ConnectionGUID: LWyK6UPlT02O5E1nPhxnVw==
X-CSE-MsgGUID: K5SL4lGNTMuYCXQS4b+xlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="185022413"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:31:49 -0700
Date: Wed, 2 Jul 2025 15:31:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] DO NOT MERGE fast-feedback.testlist: Reorder
 dmabuf and i915_selftest
Message-ID: <20250702133146.zs7xkb273lrkhghb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250701103405.23478-1-peter.senna@linux.intel.com>
 <20250701153151.27638-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701153151.27638-1-peter.senna@linux.intel.com>
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
On 2025-07-01 at 17:31:51 +0200, Peter Senna Tschudin wrote:
> DO NOT MERGE
> 
> Trying to determine what is causing the tests to fail.

Please use IGT Trybot for this as you are using i915.

https://patchwork.freedesktop.org/project/igt-trybot/

You could also put only few tests in fast-feedback.testlist
and prevent FULL run, see for example:

https://patchwork.freedesktop.org/patch/572750/?series=128015&rev=2

Regards,
Kamil

> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> v3:
>  - move test to the very top
> v2:
>  - move the test higher
> 
>  tests/intel-ci/fast-feedback.testlist | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 82395e7ea..5d86b0911 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -1,6 +1,9 @@
>  # Try to load the driver if it's not available yet.
>  igt@i915_module_load@load
>  
> +# Just to test
> +igt@dmabuf@all-tests
> +
>  # Keep alphabetically sorted by default
>  igt@core_auth@basic-auth
>  igt@fbdev@eof
> @@ -168,4 +171,3 @@ igt@i915_pm_rpm@module-reload
>  
>  # Kernel selftests
>  igt@i915_selftest@live
> -igt@dmabuf@all-tests
> -- 
> 2.43.0
> 
