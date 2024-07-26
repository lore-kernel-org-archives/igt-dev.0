Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7231DC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 18:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287BA10E046;
	Fri, 26 Jul 2024 18:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B78SSg5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E876510E046
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722018843; x=1753554843;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/IM2VoK3/tnCxZjoCz9OGb39Vk7CPuMEcQijEdrAko4=;
 b=B78SSg5zI1K5XexpX1w9KBSN/9uLkkUoVhajhwew79ytQ/TXv8eAAnN5
 OWWtk0P5E8VZhhpZbo2zvVSfHvIQnJPrsi6blsvEtSd6O0zauLYiaxGBw
 RooUCuEhNhuqUGPLQsXSXO6vqz4pvv0SW64U87kDRr/v9tB+ej3ZFryo0
 MbscMQtY1VkjKkbcBMUqPlWKpLw+yT8mGaIcwbUoAFccaDHQLk9oG/pAb
 nA1RSRUk4p6ziu356wKujMx6Vx67OFijorsyB18LLliU8rhC9ap3BC5Op
 zHAsa4dbdWKjUzbhR0INxG7WUPp6YeMT9++YKAejGVceZcKKspGrF5PeZ w==;
X-CSE-ConnectionGUID: 5+aAa6roTOOauloN5MwR2g==
X-CSE-MsgGUID: qeP2Z1QfRB+badn8Ch/KEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19518135"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19518135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 11:34:02 -0700
X-CSE-ConnectionGUID: C0YlUZq6RUG6K+R8tVetcg==
X-CSE-MsgGUID: /HbPk+w2RmKXtUqW5NgeQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53254466"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 26 Jul 2024 11:34:01 -0700
Received: from [10.246.27.12] (mwajdecz-MOBL.ger.corp.intel.com [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B5BD7332C8;
 Fri, 26 Jul 2024 19:33:59 +0100 (IST)
Message-ID: <cbc1d30e-e606-4d4f-bda6-117825e1f067@intel.com>
Date: Fri, 26 Jul 2024 20:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt:
 Blocklist for SR-IOV VF BAT runs
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
References: <20240726170959.1378586-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240726170959.1378586-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 26.07.2024 19:09, Marcin Bernatowicz wrote:
> Blocklist tests not applicable for Virtual Function (VF) BAT runs.
> The list extends xe.blocklist.txt to enable xe-fast-feedback.testlist
> execution on VF device.
> 
> V2:
> - Reduce blocklist to minimal, favoring SKIPs.
> - Demonstrated minimal time impact on ADLP with increased skips.
> 

likely you wanted to include below details after the --- mark

> Before:
> 
> summary:
>        name: vf_bats_results
>        ----  ---------------
>        pass:             171
>        fail:               0
>       crash:               0
>        skip:              56
>     timeout:               0
>        warn:               0
>  incomplete:               0
>  dmesg-warn:               0
>  dmesg-fail:               0
>     changes:               0
>       fixes:               0
> regressions:               0
>       total:             227
>        time:        00:00:25
> 
> After:
> 
> summary:
>        name: vf_bats_results
>        ----  ---------------
>        pass:             171
>        fail:               0
>       crash:               0
>        skip:             119
>     timeout:               0
>        warn:               0
>  incomplete:               0
>  dmesg-warn:               0
>  dmesg-fail:               0
>     changes:               0
>       fixes:               0
> regressions:               0
>       total:             290
>        time:        00:00:27
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/intel-ci/meson.build               |  1 +
>  tests/intel-ci/xe-sriov-vf.blocklist.txt | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 tests/intel-ci/xe-sriov-vf.blocklist.txt
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index f16243cbb..59323eda9 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -11,6 +11,7 @@ intelci_files = [
>    'xe.blocklist.txt',
>    'xe-fast-feedback.testlist',
>    'xe-fast-feedback-chamelium-only.testlist',
> +  'xe-sriov-vf.blocklist.txt',
>  ]
>  
>  install_data(sources : intelci_files, install_dir : datadir)
> diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> new file mode 100644
> index 000000000..870082f5b
> --- /dev/null
> +++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> @@ -0,0 +1,19 @@
> +##################################################################
> +# Block list for VF xe-fast-feedback runs

IIUC, the 'xe.blocklist.txt' is applied to both BAT and FULL runs

so if this file will also be applied on FULL runs, then comment above is
misleading, and if only BAT will be impacted, then filename does not
reflect that

> +##################################################################
> +# Prevent potential module reloads during tests

nit: decorations used in this file are so aggressive that it is hard to
see what's the comment and where's next section

> +##################################################################
> +igt@xe_module_load
> +##################################################################
> +# Not applicable on VF (requires PF)
> +##################################################################
> +igt@sriov_basic

per comment above we favor SKIPs, so maybe we don't need to block this?

> +##################################################################
> +# Modify tests to SKIP: No interface on VF.
> +##################################################################
> +igt@xe_gt_freq
> +igt@xe_pm_residency
> +##################################################################
> +# Blocked because of abort
> +##################################################################
> +igt@xe_debugfs@gt

1. do we really run debugfs tests in BAT ?
2. IIRC there was one case where VF will complain while reading the
debugfs, but maybe by time we enable the VF runs we could fix that
rather then add everything to the block list ?

