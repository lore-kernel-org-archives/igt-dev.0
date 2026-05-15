Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99062CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 11:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F47A10E417;
	Fri, 15 May 2026 11:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMeRNxWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E32A10E417
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778844056; x=1810380056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Dfp2clcfHMHr4TglHOYPvmRi2IejNMnW035+xdHB65g=;
 b=mMeRNxWwe1iQwNF5rnUFJ+x42FTzLcIkIxZcFCk2p60xcaQMZ4ZE7jVB
 ilCxP08Nl0vORQ8dinEdEOfOWBoOa2elsx957arSytzbNnjDkGTgtg3F1
 gpEmcN+pdxKbQAdqnTrnG4PCSkhDkD5hCqS/K4vPuL0fCBv1AvqTpjgPc
 nGj6S0VL4btbuOwJuhKJ0gJ9U2jun02ZrXSiW6ueWMARJKq8/rihgodJ2
 RSubr6iKE4P6zNeWogaVAAYWNKBRmum3AMjWV1aPohnW7eqVep3AP08OD
 T/aNyRiWVdKLtBa0I4LvtwsLWlKCayiRc59ayzXuK5znzt8Nnv2aJbDs5 A==;
X-CSE-ConnectionGUID: rXn2Hns8QMWOv7knN5IdOg==
X-CSE-MsgGUID: uXEnKbXhQyWxegVNX8e3SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105255972"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="105255972"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 04:20:56 -0700
X-CSE-ConnectionGUID: baAKtrtLRNKiB3H1X8J0fg==
X-CSE-MsgGUID: 4u9MQGcNRw25FN0+MHNKqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242662628"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:20:54 -0700
Date: Fri, 15 May 2026 13:20:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t v3 1/5] tests/v3d_perfmon: Don't use the deprecated
 V3D_PERFCNT_NUM
Message-ID: <20260515112051.stovdjv4qiyp46kw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20260514201637.1811428-1-mcanal@igalia.com>
 <20260514201637.1811428-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514201637.1811428-2-mcanal@igalia.com>
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

Hi Maíra,
On 2026-05-14 at 17:14:53 -0300, Maíra Canal wrote:
> As described in the UAPI, one shouldn't use V3D_PERFCNT_NUM to retrieve
> the maximum number of performance counters, as this value is only valid
> for V3D 4.2. One should retrieve this parameter from the kernel using
> DRM_V3D_PARAM_MAX_PERF_COUNTERS.
> 
> Due to this inconsistency, the test "create-perfmon-invalid-counters" is
> currently failing in V3D 7.1 (Raspberry Pi 5).
> 
> Update the "create-perfmon-invalid-counters" test to the UAPI guideline
> by replacing V3D_PERFCNT_NUM with the value retrieved from
> DRM_IOCTL_V3D_GET_PARAM.
> 
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Thank you all, I merged it.

Regards,
Kamil

> ---
>  tests/v3d/v3d_perfmon.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
> index ac6f094c3..5045e8c81 100644
> --- a/tests/v3d/v3d_perfmon.c
> +++ b/tests/v3d/v3d_perfmon.c
> @@ -37,8 +37,18 @@ int igt_main()
>  	igt_subtest("create-perfmon-invalid-counters") {
>  		struct drm_v3d_perfmon_create create = {
>  			.ncounters = 1,
> -			.counters = { V3D_PERFCNT_NUM },
>  		};
> +		uint32_t total_perfcnt_num;
> +
> +		total_perfcnt_num = igt_v3d_get_param(fd, DRM_V3D_PARAM_MAX_PERF_COUNTERS);
> +		igt_assert(total_perfcnt_num || errno != EINVAL);
> +
> +		/* Fallback if kernel < v6.11 */
> +		if (!total_perfcnt_num)
> +			total_perfcnt_num = V3D_PERFCNT_NUM;
> +
> +		create.counters[0] = total_perfcnt_num;
> +
>  		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_CREATE, &create, EINVAL);
>  	}
>  
> -- 
> 2.54.0
> 
