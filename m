Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75ECCD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 12:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5685E10F543;
	Fri, 19 Jun 2026 12:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REbqKPbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDD010F543
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781870985; x=1813406985;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bqrIht3kHGPAGbKuvmnenFEeedxQf2qyUyRF4AEywiA=;
 b=REbqKPbfexfOIo5XrgExbP73JUmI0FUg3h7s2XYxK+L0wI0rGzGAVFLV
 CUxcmk0hTFaPec7/mpGO3Trl7OtkHqmAnxDykYGT5DgTP/AegDphvMnU8
 oEmhEiIJsXVQVo5ITlekTw6UeN6VLHFS9UStg/gl2BJ8o6bs3Hki8p32O
 ME4vHs3G2D8gyyg/H/Ri6RUI2pGZif3VU49XpMeZxguEGEAoMRlRSWQkc
 IKo8daxjGVgI2MIaAIXHScsZuai9HE8StLQgwUZWdGkB5VnlxhW4TkyFr
 eMCpG9L3fa46t3S9xix6Ybn6Mgo5ysKirxkJNG4o2QuEiiGfA1UwHHsbI w==;
X-CSE-ConnectionGUID: nUxsxRuXTDePlsWykfKpkA==
X-CSE-MsgGUID: kjVJH3wnQDqtNKP2xlOJdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82825947"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="82825947"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 05:09:45 -0700
X-CSE-ConnectionGUID: dtHvFmJvSpeQiSNMhOWGeg==
X-CSE-MsgGUID: DRwTtPSMSwu3jHfx4pVkIw==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 05:09:42 -0700
Date: Fri, 19 Jun 2026 14:09:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 vinay.belgaumkar@intel.com
Subject: Re: [PATCH] tests/xe_pmu: Fix gt-frequency failure with raised min
 freq
Message-ID: <20260619120940.h7r5xgjcs4i4vjin@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com
References: <20260616193656.2131881-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616193656.2131881-2-sk.anirban@intel.com>
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
On 2026-06-17 at 01:06:57 +0530, Sk Anirban wrote:

small nit about subject, add 'intel/' in prefix:

[PATCH] tests/intel/xe_pmu: Fix gt-frequency failure with raised min



Regards,
Kamil

> The gt-frequency subtest can fail when the min frequency has
> already been raised above RPn before the test begins. Using that
> value as the original minimum prevents the later min_freq write
> from enabling the GuC ignore_efficient_freq parameter, so min_freq
> can keep moving toward RPe.
> 
> Save RPn as the minimum baseline instead, ensuring the min_freq
> write enables ignore_efficient_freq and the final restore check
> returns min_freq to RPn.
> 
> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/issues/8344
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/xe_pmu.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index fb4b871e7..4bbc801a1 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -903,10 +903,8 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>  	unsigned long config_rq_freq, config_act_freq;
>  	double min[2], max[2];
>  	uint32_t gt = eci->gt_id;
> -	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
> +	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "rpn");
>  	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
> -	uint32_t current_min;
> -	uint32_t orig_rpe;
>  	uint32_t vm;
>  	int pmu_fd[2];
>  
> @@ -956,9 +954,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>  	 * Restore min/max.
>  	 */
>  	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
> -	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
> -	current_min = xe_gt_get_freq(fd, gt, "min");
> -	igt_assert(current_min == orig_min || current_min == orig_rpe);
> +	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min);
>  
>  	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
>  		 min[0], min[1]);
> -- 
> 2.43.0
> 
