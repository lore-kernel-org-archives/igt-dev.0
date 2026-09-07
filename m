Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13579C79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 09:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D4310E754;
	Mon,  7 Sep 2026 09:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGXu235a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402FB10E737
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788774135; x=1820310135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kh21N/hgaiLMHZZgNRaDKZbqXmGi6bkDuqQaXaU0u/k=;
 b=SGXu235aHNPaHV8Loi+VqZwOBd3v8Mk9/VPVrpZA/heQjDH5yn6DfYFM
 VH71iYRHbOUrw6X0EK4zNulGaJ2O2ACC+tUCU/ObAqholNN03FJKG4p//
 yhSN5N4KsnrxGzQdqJPxJJ1T4YNohSCHJ9vRn5Dx63axiyuJU5cCnGXEe
 UBT0O/+DuGBG2ERJw5Sxo0fuJE3zG4ejl77hJSZzJAGMwsEZ45GDYANbr
 MlbdiGoPGfxz69699W/lg7GqesoSdpMoEMy6biCh/dy47XV2nzKSAz0b3
 tyC+pXgckeoWv0bYq91YIshVTUmjSm/XUBr7o5b8tJHa6ouWiq6sb86uy A==;
X-CSE-ConnectionGUID: 8z7M4FPpS8qjP3n7AkcS0g==
X-CSE-MsgGUID: j7Oohn8wQeqq81S+NbVMpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100531596"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100531596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:42:15 -0700
X-CSE-ConnectionGUID: XH1WaH8eROGNLi0+hqI+IQ==
X-CSE-MsgGUID: 6AblSQD1T5ivLsVgIG1/dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="275951476"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 02:42:13 -0700
Date: Mon, 7 Sep 2026 11:42:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH v2] tests/intel: Avoid stale errno
Message-ID: <20260907094210.cagn5wrow57p3q4w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com
References: <20260904100042.583658-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904100042.583658-2-sk.anirban@intel.com>
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
On 2026-09-04 at 15:30:43 +0530, Sk Anirban wrote:
> Commit <e311ed2c7> ("lib/igt_core: do not reset errno in igt_gettime")
> removed an incidental errno reset that used to mask stale errno at
> subtest entry. Now a stale errno from an earlier, unrelated probe can
> survive into a later assertion failure and gets printed as a
> misleading "Last errno" hint, e.g. in xe_gt_freq's throttle_basic_api:
> 
>   CRITICAL: Failed assertion: !strcmp(throttle_reasons, "none")
>   CRITICAL: Last errno: 2, No such file or directory
>   CRITICAL: GT 0 is throttled due to: pl4
> 
> The real cause is the GT being throttled; "Last errno: 2" is stale
> and unrelated, making triage confusing.
> 
> Fix this by clearing errno right where it is known to go stale.
> 
> v2: Update fix path (Kamil)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/xe/xe_gt.c                | 1 +
>  tests/intel/xe_gt_freq.c      | 1 +
>  tests/intel/xe_pm.c           | 1 +
>  tests/intel/xe_pm_residency.c | 1 +
>  tests/intel/xe_pmu.c          | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 8f54b6e25..3d8b4f68a 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -224,6 +224,7 @@ bool xe_gt_is_in_c6(int fd, int gt)
>  		return true;
>  
>  	igt_debug("GT%d C-state is %s\n", gt, gt_c_state);
> +	errno = 0;
>  
>  	return false;
>  }
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 19306dc41..886537862 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -397,6 +397,7 @@ int igt_main()
>  			stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
>  			stash_max[gt] = xe_gt_get_freq(fd, gt, "max");
>  		}
> +		errno = 0;
>  	}
>  
>  	igt_subtest("throttle_basic_api") {
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 7faba7c2b..543f46f5b 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -990,6 +990,7 @@ int igt_main()
>  
>  		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>  		update_debug_mask_if_ci(DRM_UT_KMS);
> +		errno = 0;
>  	}
>  
>  	for (const struct s_state *s = s_states; s->name; s++) {
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index bfae1f844..e976048a9 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -574,6 +574,7 @@ int igt_main()
>  
>  		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>  		igt_require(xe_sysfs_gt_has_node(fd, 0, "gtidle"));
> +		errno = 0;
>  	}
>  
>  	igt_describe("Validate GT C6 on idle");
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index a8ceac46c..5b098c45c 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -1076,6 +1076,7 @@ int igt_main()
>  		xe_perf_device(fd, xe_device, sizeof(xe_device));
>  		num_engines = xe_number_engines(fd);
>  		has_engine_active_ticks = has_event(xe_device, "engine-active-ticks");
> +		errno = 0;
>  	}
>  
>  	igt_describe("Validate PMU gt-c6 residency counters when idle");
> -- 
> 2.43.0
> 
