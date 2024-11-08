Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FCFD5E147
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 08:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F6D10E923;
	Fri,  8 Nov 2024 08:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+TkC07p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1874510E923
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731053372; x=1762589372;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1Rv9W1smxgQxSzIqaxbpIeHUYKzEiqJK6wTQOEzvXWc=;
 b=L+TkC07pvvbIoUydcfLKQXsMA3MYyz/2v/ozqtX/4923xLPj1fl2Rowi
 U3UxnanRHv1ac7/LUgePxENfeiuAp3ZqtRI4AzLim6onoMFm1Pcyq5cWr
 AvZxvPXdrQpQXO0SZcuId8SYxYUz/JFRGjGA51ON4zRv9dsd9zLvh+eky
 0CnLSO9hn5dF8+s6pDvhXreXzr/nhVGJFhg1+8GJxEkUKMI0ieQXpQ2Oz
 dzBSUWXbsSDlk76b+hMz2g6mv9fLnNlSVVsqZm5SBIoDrs73bmE5+mY2x
 5f7HvzO6+Hj7nDoxw1Tz/hGz4oN1gHX9rxsFCYW0l8z9H4r18QeSttkQD A==;
X-CSE-ConnectionGUID: 6yHFFqB3TFKPmudGbui/dQ==
X-CSE-MsgGUID: w/Z+TpJVSBiY7u/AMsaBBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="48439072"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="48439072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 00:09:31 -0800
X-CSE-ConnectionGUID: Gre0a4c8QCWRybF9JNifwg==
X-CSE-MsgGUID: xI5ZkDkXSTi5w6blHtQ2xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="85437631"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.97.140])
 ([10.245.97.140])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 00:09:30 -0800
Message-ID: <c2c7da47-5020-49ee-8068-df5475f7a504@linux.intel.com>
Date: Fri, 8 Nov 2024 09:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe-fast-feedback: Add SR-IOV FLR test
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20241106182503.203956-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241106182503.203956-1-jakub1.kolakowski@intel.com>
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

LGTM
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 11/6/2024 7:25 PM, Jakub Kolakowski wrote:
> Add SR-IOV test to exercise Function Level Reset (FLR) on VF1 in BAT
> testing.
> Test being added:
> - igt@xe_sriov_flr@flr-vf1-clear
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index d9fb98aab..c56a7219a 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -176,6 +176,7 @@ igt@xe_query@query-invalid-query
>   igt@xe_query@query-invalid-size
>   igt@xe_spin_batch@spin-basic
>   igt@xe_spin_batch@spin-batch
> +igt@xe_sriov_flr@flr-vf1-clear
>   igt@xe_sysfs_defaults@engine-defaults
>   igt@xe_sysfs_scheduler@preempt_timeout_us-invalid
>   igt@xe_sysfs_scheduler@preempt_timeout_us-min-max

