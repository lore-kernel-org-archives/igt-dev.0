Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA70C02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 12:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5F210E50F;
	Mon, 27 Jan 2025 12:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibfkhmhK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C71210E50F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737982582; x=1769518582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O7SUh36ZVvyliVvrSYCbKgYR/qI1aEddqTd1calX5P4=;
 b=ibfkhmhKD1Az/bomTHHrpC9sB+KF2XLsnq44XdaJEAofSUugiVRYfORX
 zvSNtWnQLO69Yf47CvIbRAwgb2RpfdxK5AWBZNPMaaSs/E60GCbZvn+9C
 uoD0bNdlb8Sdc2c6MMuVPImBcPK+nY6hCmEH/WQsFqSoeJcbRkVy77ohY
 FblyKjPbC1JL/Fwk74e/vQmuy4c3JJFr9kB/vkOKvQU3InBEkEiszMnKe
 pupImiNVTV2/z1lsWQz25HPRqCEg5yWNehJT0k2t8RbFLbih39ZBmRpCJ
 GOR+jC8+hesvumKbszJBf+9fi8vb+ESwXW2JDFWBFhuNClTe2slLHzhCP Q==;
X-CSE-ConnectionGUID: v2ohrL01Tr+ohL4hMsoFEQ==
X-CSE-MsgGUID: x6kUyU1qSvS6m2LpkL/IbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38690546"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="38690546"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 04:56:22 -0800
X-CSE-ConnectionGUID: UMecAcpiQiyEk6AQeW3Lmg==
X-CSE-MsgGUID: eO8qysopTKaTzz4wYnYqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108539411"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 04:56:21 -0800
Date: Mon, 27 Jan 2025 13:56:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_mix_modes: Use IGT comparison
 functions
Message-ID: <20250127125603.wzwklpmq2ipicq53@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
References: <20250127101425.21082-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250127101425.21082-1-francois.dugast@intel.com>
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

Hi Francois,
On 2025-01-27 at 11:14:25 +0100, Francois Dugast wrote:
> With igt_assert() the logs were only telling us that the comparison had
> failed. With igt_assert_lt() the logs provide the actual values that
> were compared, which helps debugging.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_mix_modes.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> index 0bcd49cc0..59887d2aa 100644
> --- a/tests/intel/xe_exec_mix_modes.c
> +++ b/tests/intel/xe_exec_mix_modes.c
> @@ -169,10 +169,10 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
>  			 * depending on the execution mode.
>  			 */
>  			if (engine_execution_mode == EXEC_MODE_LR)
> -				igt_assert(igt_nsec_elapsed(&tv) < 0.5 * duration_ns);
> +				igt_assert_lt(igt_nsec_elapsed(&tv), 0.5 * duration_ns);
>  			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE &&
>  				 job_type == SPINNER_INTERRUPTED)
> -				igt_assert(igt_nsec_elapsed(&tv) > duration_ns);
> +				igt_assert_lt(duration_ns, igt_nsec_elapsed(&tv));
>  		}
>  	}
>  
> -- 
> 2.43.0
> 
