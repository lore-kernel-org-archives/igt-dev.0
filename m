Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6706C61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 10:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCAD10E609;
	Wed, 11 Jun 2025 10:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzgOIjCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B4810E279
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749636982; x=1781172982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QU5b9YoKYl2MDjqJa+QO4DMY1GKkd9v74xidG6U4Se4=;
 b=UzgOIjCJjMc/5XZkEEvp8q+h3BgXmgRVViKXLUSqqIF4jm90Qi2BThgd
 Iqa25Vvy60LwC9z3wNQS3CoKITitQR4oxaEQHP2euvH5thEbOlvAHGhgG
 V8nVWs8KkmAjHs/tl2VHyqnHDN4p+T5FYozs7bzBf4FaGxtWkMrrRCqRF
 Ts2yYcQGO0QqktMMZDyLx/Z5PXODvn9XDy4NNdrwG8jjhbOe5mZl5D0hm
 uX9nlslYTPvlhIypusGyAU/DK/qnT3F4Ss5zWlClunjc44V8sERR3132z
 UXyCwCmHfeKU8YR2KNQPLSzAByCKNI36cG6mE5LgdhC5eEL30NlumC+tT A==;
X-CSE-ConnectionGUID: r+1EL/3RTleLY+1nmhYoFA==
X-CSE-MsgGUID: 8BEtKOViSlOij+ExZn1dqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51874883"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51874883"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:16:22 -0700
X-CSE-ConnectionGUID: mauX3T76T8uFgcfgbsZ1Gg==
X-CSE-MsgGUID: VsuFhpQEQAe7TZGe8oxaYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="148067379"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:16:18 -0700
Date: Wed, 11 Jun 2025 12:16:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t 3/3] tests/kms_async_flip: skip subtest on AMD if
 invalid condition
Message-ID: <20250611101605.tql5ik4th75t762a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Melissa Wen <mwen@igalia.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 kernel-dev@igalia.com
References: <20250601191459.46759-1-mwen@igalia.com>
 <20250601191459.46759-4-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250601191459.46759-4-mwen@igalia.com>
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

Hi Melissa,
On 2025-06-01 at 16:14:46 -0300, Melissa Wen wrote:
> Async page flips can fail for any driver-specific reasons, i.e. when the
> driver can't commit to async page flip request due to hw limitations,
> the commit is rejected with -EINVAL since there is one or more
> conditions that make the request invalid. These limitations vary between
> vendors and hw versions. In case of AMD devices, async page flip cannot
> be perfomed if fb memory type changes (VRAM vs GTT), but framebuffer
> allocation type cannot be controlled by any userspace configuration.
> 
> Allow EINVAL failures on AMD device and skip the test. Async flips can
> be still validated by the performance comparison assert if no EINVAL.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Are you ok with merging this one patch first?
This should also be tested again, as i915.Full were not run.

Regards,
Kamil

> ---
>  tests/kms_async_flips.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 97128cfad..065ac9c49 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -410,7 +410,12 @@ static void test_async_flip(data_t *data)
>  
>  		ret = perform_flip(data, frame, flags);
>  
> -		if (frame == 1 && data->allow_fail)
> +		/* AMD cannot perform async page flip if fb mem type changes,
> +		 * and this condition cannot be controlled by any userspace
> +		 * configuration. Therefore allow EINVAL failure and skip the
> +		 * test for AMD devices.
> +		 */
> +		if ((frame == 1 && data->allow_fail) || is_amdgpu_device(data->drm_fd))
>  			igt_skip_on(ret == -EINVAL);
>  		else
>  			igt_assert_eq(ret, 0);
> -- 
> 2.47.2
> 
