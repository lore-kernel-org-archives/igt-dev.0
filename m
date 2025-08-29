Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2091CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 11:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896F010EB88;
	Fri, 29 Aug 2025 11:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHrw8/EF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C4210EB88
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756466858; x=1788002858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cwA1Ad1ESu9Qi+yiUA8cfR6p5AufoDXj5c4hpXhF8qI=;
 b=cHrw8/EFyVDEEHkdSx9W9UsMmV/XwlEfufQ4xzyCAhUcuN/guRfXbL9I
 jWaciYvn1XUXEU1GUfbDb2mZZWbOs1FFTmSGlR3JBQTDk8QAKGMtPBxF4
 ZENUFq6DdGSDTwlEZRbhqqhtNlXxpOp+WTYMKFh2lLZyzoGj+sJ6Jj1EN
 SV1FXzbK28RLFL3e5pylYOc1mhvXLNwLfcsvosWlKt7oM0SUdfpx3ym7q
 qp6bmj8oU+z0P4FVk5M22ITyESze4jdTL9ED/+0I3D/C01i9mrmjAmdI/
 DlfKeiWrxoGaMhq+lR7Bj9o9PyHk/QKtan/tynLNZAklgAFwYItFCkWGC Q==;
X-CSE-ConnectionGUID: NykKZY00RdihqjZ4xHbrRQ==
X-CSE-MsgGUID: DzID6wH1R1+XKDmR9Mn53w==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58680586"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58680586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:27:38 -0700
X-CSE-ConnectionGUID: FEU5YbxgTQGrmKvCjSAFTg==
X-CSE-MsgGUID: XHxzH7noROqnvn3bIAp9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174732426"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 04:27:35 -0700
Date: Fri, 29 Aug 2025 13:27:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: mallesh.koujalagi@intel.com
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com
Subject: Re: [PATCH i-g-t 2/2] HAX: Added list of test cases to fastfeedback
 list
Message-ID: <20250829112732.yaodbjdvglnxyeb2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 mallesh.koujalagi@intel.com, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com
References: <20250828073114.1884451-1-mallesh.koujalagi@intel.com>
 <20250828073114.1884451-2-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828073114.1884451-2-mallesh.koujalagi@intel.com>
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

Hi mallesh.koujalagi,
On 2025-08-28 at 13:01:14 +0530, mallesh.koujalagi@intel.com wrote:
> From: Mallesh Koujalagi <mallesh.Koujalagi@intel.com>
> 
> List of test cases added to fast feedback list
> i915_pm_rps@basic-api
> i915_pm_rps@min-max-config-idle
> i915_pm_rps@min-max-config-loaded
> i915_pm_rps@waitboost
> i915_pm_rps@reset

Please subscribe to igt-dev mailing list, you can do it here:

https://lists.freedesktop.org/mailman/listinfo/igt-dev

When you want to experiment with HAX please send
series with HAX into Trybot first.

intel-gfx-trybot@lists.freedesktop.org
https://patchwork.freedesktop.org/project/igt-trybot/

Regards,
Kaml

> 
> Signed-off-by: Mallesh Koujalagi <mallesh.Koujalagi@intel.com>
> ---
>  tests/intel-ci/i915.fast-feedback.testlist | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
> index 2799bbaa5..69e45a597 100644
> --- a/tests/intel-ci/i915.fast-feedback.testlist
> +++ b/tests/intel-ci/i915.fast-feedback.testlist
> @@ -166,6 +166,12 @@ igt@gem_lmem_swapping@random-engines
>  igt@gem_lmem_swapping@verify-random
>  igt@i915_pm_rpm@module-reload
>  
> +igt@i915_pm_rps@basic-api
> +igt@i915_pm_rps@min-max-config-idle
> +igt@i915_pm_rps@min-max-config-loaded
> +igt@i915_pm_rps@waitboost
> +igt@i915_pm_rps@reset
> +
>  # Kernel selftests
>  igt@i915_selftest@live
>  igt@dmabuf@all-tests
> -- 
> 2.34.1
> 
