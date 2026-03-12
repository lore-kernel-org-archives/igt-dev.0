Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0631067045
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFBF10EA56;
	Thu, 12 Mar 2026 15:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzAC7feJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FACC10EA57
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773330323; x=1804866323;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HCS3vGQcxrPaZp4WU1NemZAiUWKA5sQ9MK9URNpw2FA=;
 b=RzAC7feJyLljAIJancaJFe6/8R79PB4qjrVOdr9/op5Wlnph3BT0SAeJ
 IrDy8MRwexM0Ah4mpy22c3RPdTsoU8qBFRQKkb0fTQUC62dpqXP/pS/MA
 agzh1Lxb4k6/66Iaqv7SKf45rH+6vwQI+5Mhf/vuVPv6dz05z/NJr4oly
 ChBHodKmSdYP9cwDgDuVgmq/7rjlbNS/0OeFa78dwrIweGVjepLEAiEyH
 6q+n91qLgOBJcHDzRhHK7P+mOkx6kLH+73AN5ETh3GkI7FhuHODQXCc8M
 qLeYAUSmHixNbaFVRW6Y3sMZ6P3/uS1bTGAwHCvucl19QYfOJBucdP0l4 A==;
X-CSE-ConnectionGUID: W3T+jZGzSoCa5t66W1kgRQ==
X-CSE-MsgGUID: pFCXz+XTQDKZFxYWbv6NGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74541797"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74541797"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:45:23 -0700
X-CSE-ConnectionGUID: OBAtzWe+RFmBTuY8pVvc8w==
X-CSE-MsgGUID: e+kFRxjKQn+dd7YCUBGIrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220792854"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 08:45:21 -0700
Date: Thu, 12 Mar 2026 16:45:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, ryszard.knop@intel.com, karol.krol@intel.com
Subject: Re: [PATCH v5 2/6] intel-ci: Rename chamelium-only testlist to i915
 specific
Message-ID: <20260312154518.yn4f6avnpj2e34tv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, ryszard.knop@intel.com,
 karol.krol@intel.com
References: <20260305083906.3098168-1-mohammed.bilal@intel.com>
 <20260305083906.3098168-3-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305083906.3098168-3-mohammed.bilal@intel.com>
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
On 2026-03-05 at 14:09:02 +0530, Mohammed Bilal wrote:
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

Same here, mine and Swati r-b should be here.
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
