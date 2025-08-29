Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43950CA0FF7
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 11:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E6B10EB87;
	Fri, 29 Aug 2025 11:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAIm97xw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF7510EB87
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756466311; x=1788002311;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i0S1FwHO1qqtOHABAowJ9ZiYqy8GyCFuc+Iswor96Qw=;
 b=EAIm97xwvTRjE8+ZonYVRFbTX8felKwfeE0RIUsddU0N44T0y/cz9eIN
 Rp+iTLQKXTuKVQMGpPVmWeFYif5UOc0IiSgGutbfNsMqX7mimNU5cmAF7
 v1R5W6ExxPqqVmb7KUzgbGUSvVahWx/DPmuQAXeeRFDX1q11EVGuDF3jn
 MRuh5LTSpEbUHgZqTuNb75MKukQgPkOPmCsqk3gvHyioPVpQ1J9m3Ul5u
 dutzd0ce36KhDedRLVn9RAEL3wsgq4kGyV4tKDrO9Q6JoY4oCwZzyzD+O
 hQbt6eJYvhH4GEz2JuIVkd7mi9o3i9kR27P3OQtXuTU7C8JQiPOcea6V1 A==;
X-CSE-ConnectionGUID: HZG9MDIdQEKr/KoGbsLKRg==
X-CSE-MsgGUID: BR2PryE4RtK2kLfvi5g0pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81341466"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81341466"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:18:30 -0700
X-CSE-ConnectionGUID: ofDGLS4FQROiz9LzaIFyzg==
X-CSE-MsgGUID: BcukN73ASumT7SWLzfcU1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169927427"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.112.195])
 ([10.245.112.195])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:18:29 -0700
Message-ID: <c2abf462-f367-43c6-9097-4d805cd9136d@linux.intel.com>
Date: Fri, 29 Aug 2025 13:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_test_config.json: Add SR-IOV
 testlists
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250825165346.504290-1-jakub1.kolakowski@intel.com>
 <20250825165346.504290-3-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250825165346.504290-3-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 8/25/2025 6:53 PM, Jakub Kolakowski wrote:
> Currently we have bat.testlist and full.testlist being generated
> by igt_doc.py script.
> Add SR-IOV testlists to be generated:
> - bat-vf.testlist
> - bat-vm.testlist
> - full-vm.testlist
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_test_config.json | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 27de0efaa..a754ccda8 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -11,12 +11,14 @@
>                   "default-testlist": "FULL",
>                   "update-from-file": {
>                       "exclude-type": "regex-ignorecase",
> -                    "append-value-if-not-excluded": "Xe FULL",
> +                    "append-value-if-not-excluded": "Xe FULL, Xe FULL VM",
>                       "include": [
> -                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
> +                        { "Xe BAT, Xe BAT VF, Xe BAT VM": "../intel-ci/xe-fast-feedback.testlist" }
>                       ],
>                       "exclude": [
> -                        { "Xe BAT, Xe FULL": "../intel-ci/xe.blocklist.txt" }
> +                        { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
> +                        { "Xe BAT VF": "../intel-ci/xe-sriov-vf.blocklist.txt"},
> +                        { "Xe BAT VM, Xe FULL VM": "../intel-ci/xe-sriov-vm.blocklist.txt"}
>                       ]
>                   },
>                   "order": [
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
