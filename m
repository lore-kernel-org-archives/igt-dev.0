Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7380CCCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 13:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274B410E141;
	Thu,  6 Nov 2025 13:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFkdgBxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773ED10E141
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762434061; x=1793970061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=67Uqpe/f+BkwevbW7Nfy3Ru8xLxqbaIuAG1arJbtok0=;
 b=eFkdgBxjTvnKAKf26hboLsZXqje2Upl24RYrsu+h/6+kxT0YPNbq741u
 4xonAQAQoe3L8UPFEwcOXLDTOFOuvZX9P6fpPDdYGiP73zwetRCfsMqpA
 jnnXF4ppTm4h5dOarIaFBhx9Nbbqmj/uKW7kj6BF38erDc4/rJGdECvNi
 l0J2CVHcCs4zSAsGwZG0JIun/3YorV7pLxQNBf8s4hSCa4tMgQJpfphoq
 k3jSvXOY8006+zqcOBn7Gd0vgRgom9BfuBzm5jjkybY370/gZd/IL9zDV
 ct70aAoHKMMm6jSdj/EGHL47F82MTlt/NMAA7FFx6HAHS7N7ao0xcv2tL g==;
X-CSE-ConnectionGUID: +lirbYtjR7CFJUwKdeV0Xg==
X-CSE-MsgGUID: 3ThfBIeNSPyjfceL+vCjMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="68217950"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="68217950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:01:01 -0800
X-CSE-ConnectionGUID: JOCisb6rQTSJ9VCMOjvp2Q==
X-CSE-MsgGUID: RUclB10CTvmcAqc4B4Okyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="218507126"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:00:59 -0800
Date: Thu, 6 Nov 2025 14:00:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 riana.tauro@intel.com
Subject: Re: [PATCH] tests/intel-ci/xe: Drop xe_survivability from fast
 feedback
Message-ID: <20251106130057.or7inatubc4pq35v@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, riana.tauro@intel.com
References: <20251106122556.2307208-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106122556.2307208-2-sk.anirban@intel.com>
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

Hi Sk,
On 2025-11-06 at 17:55:57 +0530, Sk Anirban wrote:

Thank you for addressing this quickly. Imho subject could be
improved:

[PATCH] intel-ci: Fix xe-fast-feedback testlist

> Remove xe_survivability tests from xe-fast-feedback.testlist.
> 

Also here:

Fixes: d5e9a5b29adc ("tests/intel/xe_survivability: Add new test runtime survivability")
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

I will make those corrections at merge soon,
no need for resend.

With above
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 5f27baafb..017e3ba2a 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -185,8 +185,6 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
>  igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
>  igt@xe_sysfs_scheduler@job_timeout_ms-invalid
>  igt@xe_sysfs_scheduler@job_timeout_ms-min-max
> -igt@xe_survivability@i2c-functionality
> -igt@xe_survivability@runtime-survivability
>  #igt@xe_vm@bind-once
>  #igt@xe_vm@scratch
>  igt@xe_vm@shared-pte-page
> -- 
> 2.43.0
> 
