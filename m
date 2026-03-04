Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F050AEF8FFC
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C06110EA78;
	Wed,  4 Mar 2026 17:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJf9gBrF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5D210EA78
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772643736; x=1804179736;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ciopUSCRDyWYXOrsCnRGzOhKEgeWG9h4yLRHQIC//RA=;
 b=LJf9gBrFTXPybwKNRiaEKDoYVafdf96buAZJAyZpW77dgw6mXUaTAQGD
 K3PskVgANDOftMgM0DKySp+EaceCFT5mQimkUdiYVGRHxl1A0vhYT6Pzu
 sTplqspGpmY97GXBmvO/sWCAYAyuqL9vCYm7h+d4SUvVDYLIvthzVt9Ud
 DKnRUGEgQPBGEwgOdzzQ+o+Z+gamnFeFEumGFFbl1ok4vVhdK2HCGgcvE
 9Mf4Tlm4QTup+AQxZeCVSIak5YuS88l7KWCVQzI98Tcs9D6B1FoVFkfc4
 hpjyS86VRL1FbFwmvHG782ZpRPzx/MMvPyMbJEqKZLcLw1eu+jBEaRPmP w==;
X-CSE-ConnectionGUID: iuB+HtpuT/C+MptJ1VWXpw==
X-CSE-MsgGUID: urgiIVu2SwWhzLlHqb8UTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73759728"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73759728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:02:15 -0800
X-CSE-ConnectionGUID: mfx7EiIdRUC7eJZFeQTZRw==
X-CSE-MsgGUID: fJiDXsFqRXyuLDkTfKX0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="248871863"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 09:02:13 -0800
Date: Wed, 4 Mar 2026 18:02:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
Subject: Re: [PATCH v4 2/5] intel-ci: Rename chamelium-only testlist to i915
 specific
Message-ID: <20260304170210.c32pclliiwc7emxh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
 <20260302101926.3015380-3-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302101926.3015380-3-mohammed.bilal@intel.com>
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

Hi Mohammed,
On 2026-03-02 at 15:49:23 +0530, Mohammed Bilal wrote:
> Rename chamelium-only.testlist to i915.chamelium-only.testlist.
> 
> v3:
> -Use move-fix-add approach (Kamil)
> 
> v4:
> -Restructure move-fix-add approach (Kamil)
> -Rename run-type labels(Swati)
> 
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  .../{chamelium-only.testlist => i915.chamelium-only.testlist} | 0
>  tests/intel-ci/meson.build                                    | 2 +-
>  tests/intel/kms_test_config.json                              | 4 ++--
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)
> 
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> similarity index 100%
> rename from tests/intel-ci/chamelium-only.testlist
> rename to tests/intel-ci/i915.chamelium-only.testlist
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index cf0023c63..1a13dd52a 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -2,7 +2,7 @@
>  
>  intelci_files = [
>    'README',
> -  'chamelium-only.testlist',
> +  'i915.chamelium-only.testlist',
>    'fast-feedback.testlist',
>    'fast-feedback-chamelium-only.testlist',
>    'i915.blocklist.txt',
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 61a70a9bb..4ed6e5405 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -15,13 +15,13 @@
>                      "include": [
>                          { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
>                          { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> +                        { "i915 FULL chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>  
>                          { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
>                          { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
>                      ],
>                      "exclude": [
> -                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
> +                        { "i915 BAT, i915 BAT chamelium, i915 FULL chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
>                              { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
>                      ]
>                  }
> -- 
> 2.48.1
> 
