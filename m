Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E32CEBF8A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 10:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78B410ECAE;
	Fri, 27 Sep 2024 10:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JF3evFti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD2910ECAE
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727431562; x=1758967562;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CnaVVHD1YFt6hber7HprU5YbfFowsDUDsak5eDG/ULI=;
 b=JF3evFtiS157oomL4wBDM1A4Y8BZ2RhPvaFVRQ3PYLvW5QwvbAoHeLMV
 FM1x8+T40ApFZjKdvoZ95jBzsCohMSXnK92JaLzNDVCF/2wagAkOgWGHL
 D3g9xGz4t4mMBZaPmCthrRE+3otPJ5UNW02Sd3h5+IHS5MrmVCGQac80u
 yeU/NOhzOPL2XFQ4v7XZ9HsCJAm1OD7Rga6JcKkOlXSTXbU/AI0piEAnZ
 coNW/ut20vQxS2DpAtxQa/Aevl/+x4J03flQexuNZjv/TwW+rYOmMxIIU
 DNvK7RhwZCmFkvPpg7RfibSB2IWDp4qkRplaACNuhXg24VVoILUlslUOD w==;
X-CSE-ConnectionGUID: fPIvhLU4RLmcwim3+S7Esg==
X-CSE-MsgGUID: 0GpqPS2HQaGJ+1/IPeufOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30281017"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="30281017"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 03:06:01 -0700
X-CSE-ConnectionGUID: 83LUKbDUSzKqj7y/eeH7dg==
X-CSE-MsgGUID: /Wg2pjFsS4O+ihr9KLCRmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="77322577"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.17.24])
 ([10.246.17.24])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 03:06:01 -0700
Message-ID: <05ef47a7-663a-4fc4-a069-0c3f3f4c385b@linux.intel.com>
Date: Fri, 27 Sep 2024 12:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Skip syncobj_wait during
 the gt_reset
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
References: <20240925103141.3442-1-krishnaiah.bommu@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240925103141.3442-1-krishnaiah.bommu@intel.com>
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



On 9/25/2024 12:31 PM, Bommu Krishnaiah wrote:
> From: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
> 
> Skipping the syncobj_wait for the workloads which is submitted
> before gt reset, since After gt reset There is no expectation
> from the hardware/GuC/KMD that the workload will then
> re-execute and complete.
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
>   tests/intel/xe_exec_reset.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index b5d5f43ea..b1a7548c6 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -263,8 +263,9 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	}
>   
>   	for (i = 0; i < n_exec_queues && n_execs; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> +		if (!(flags & GT_RESET))
> +			igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX,

What happens when the user waits on syncobj in case of GT reset ?
Maybe there is no expectation that there will be re-execute, but 
shouldn't the syncobj be notified or a timeout hit ?

> +						0, NULL));
>   	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>   
>   	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> @@ -410,7 +411,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	}
>   
>   	for (i = 0; i < n_exec_queues && n_execs; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> +		if (!(flags & GT_RESET))
> +			igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>   					NULL));
>   	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>   

