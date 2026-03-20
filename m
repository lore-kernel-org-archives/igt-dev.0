Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719BA108B907
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B3710E226;
	Fri, 20 Mar 2026 11:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PURZ6+7Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CFF10E54A
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774007845; x=1805543845;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I/WFg00X3BoOmUpCnfSH7tppszR1qIaqh73HuzuEniQ=;
 b=PURZ6+7Z2BbpaQf755gebJwt0qpHMURgDCoG5U5H2pPXhb88hG7YPKPu
 7fhmh2QBhibAF5zwMtiZOVCPPaT4t/YfV7fAjCUa4tA/26QU4l/mUvz+H
 Q+J6JIw1hKHI5OJvwl9138t2fF/6L91nIT9BEQ0EMypPHSyK2gqozcASZ
 sRWPeaVBBXJqXY++w7VwwaOeC1Q7xrybj+VmcLy3hFina4rcLG30TzWlN
 NvbQS8Ter2nTUgEubMYp6oXnlE6oIZKn0PvI0NtaiSVSJrE/pP8Zqy2CP
 SNzD5ogpZj0ujZSVSe78hZBAdhPA3gtD9DNRjAZJpIgarR+KTomJrcn1u g==;
X-CSE-ConnectionGUID: MEYnM1zUQn2oQ2MV6Ox6nw==
X-CSE-MsgGUID: kmz2LdfJR3udAQljkX64Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74999865"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74999865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:57:25 -0700
X-CSE-ConnectionGUID: hOrwCL1fQHmfrnhTAGuDOw==
X-CSE-MsgGUID: CMOrsP+JRnKXxhdpVG6KcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223485913"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.32])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:57:23 -0700
Date: Fri, 20 Mar 2026 13:57:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_pipe_stress: use CRTC index
 not pipe for vblank ioctl
Message-ID: <ab02IKwdvnVkB9BI@intel.com>
References: <20260320113143.2882422-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320113143.2882422-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Mar 20, 2026 at 01:31:42PM +0200, Jani Nikula wrote:
> The vblank ioctl expects CRTC index, not pipe. Fix the pipe vs. CRTC
> index mixup by switching to use igt_crtc_get_vblank().
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  tests/intel/kms_pipe_stress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 85ab2ec50621..a0ce3c4d7ecb 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -591,7 +591,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
>  
>  		igt_pipe_crc_start(data->pipe_crc[pipe]);
>  		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc);
> -		kmstest_get_vblank(data->display.drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
> +		igt_crtc_get_vblank(crtc, DRM_VBLANK_NEXTONMISS);
>  		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc2);
>  		igt_pipe_crc_stop(data->pipe_crc[pipe]);
>  		igt_assert_crc_equal(&crc, &crc2);
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
