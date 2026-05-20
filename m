Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB39CD4F5E
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 06:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FDC10EEFA;
	Wed, 20 May 2026 06:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCpmrT/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B425B10EEFA
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 06:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779259496; x=1810795496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=t0QIcTkwJqGwGGmHsjXiCmgohTWG+J9QFBfMRXRgSgI=;
 b=cCpmrT/eel6r6Dusyv8KoiRtDEUH5OAREPR7P/9yfLZXdAj00huyL/G1
 okHEbKK9nLoTFl7g/VHoVlEQHJtoudpQ9eEfhL8UsntDnovSgUi2HVc8L
 ljnj7O9FvoKrDHhDOTv12KeDgoTg53fQ7xDeP3ZTnWrwgSfrqEnARXOca
 aSVnm+RlQi7GMCSIrMJkWysPUxD2i4lzdiWwkwBFVsGSZtBWbNVm3qMXi
 d1muQSEyhehxgQQIuVaNbmpanPWYjWTUNsv63nPP+IEDcYi/7aOJXL2Xw
 qKRyzGvkXBWD1m9y+MlGoLpHhRjIEzUPlXE68+guY3AMJr0shqA7AJXjV Q==;
X-CSE-ConnectionGUID: Co8qXIsWQTi2byaMKN95vQ==
X-CSE-MsgGUID: oMLwEFpeRWuYFNiRcwWQZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="67677373"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="67677373"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 23:44:55 -0700
X-CSE-ConnectionGUID: bPnJsaf3QmSzEKmFuGenEw==
X-CSE-MsgGUID: 8nFUC1XVSdGLj+g8mxXt/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="237066080"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:44:54 -0700
Date: Wed, 20 May 2026 08:44:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_pat: Use S3 instead of standby
Message-ID: <20260520064437.rushwu5ona6t2mrp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Karthik Poosa <karthik.poosa@intel.com>
References: <20260519091108.106853-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519091108.106853-2-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2026-05-19 at 11:11:09 +0200, Zbigniew Kempczyński wrote:
> Standby state is not available on CI, use S3 instead.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karthik Poosa <karthik.poosa@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_pat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 81c28677ac..dc14565d45 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -270,7 +270,7 @@ static void pat_sw_hw_compare(int fd, enum pat_test_opts opts)
>  		if (opts == PAT_RESET_GT)
>  			xe_force_gt_reset_sync(fd, gt);
>  		else if (opts == PAT_SUSPEND)
> -			igt_system_suspend_autoresume(SUSPEND_STATE_STANDBY, SUSPEND_TEST_NONE);
> +			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>  
>  		hw_entries = xe_get_pat_hw_config(fd, &pat_hw_config, gt);
>  		sw_entries = xe_get_pat_sw_config(fd, &pat_sw_config, gt);
> -- 
> 2.43.0
> 
