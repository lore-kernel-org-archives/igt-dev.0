Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78272C83038
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 15:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDEA10E5CA;
	Tue,  1 Jul 2025 15:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZobNnlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6062110E5C9
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751385502; x=1782921502;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5aZrIAe2eKzhmefAbNX/pN76GNAAeBFFZNyAIjsRjZU=;
 b=eZobNnlwwnsMtJMZVb5uqz7hio7ZZTewLVlgUeaUVZog1J632vt9JCGr
 GJCm5cAGUMxHiXqa2gWLLeVNnIOxcFP5UbxC5nhLoBTBRJ0Q1ywZ0Pc8p
 y3wBjFi+I8SARO+wbG+TGQvd/6tGd/ZMZtB7AKsHI0xOEamYdExIAZEx8
 kqTfw8x/tnTvuEHW1dRRb8mXFLeChwFb/NdoqkO+8VnhqukYKwG0kFOAZ
 4C5fKpgAicb2J9DvsQobVPjpltz3WIXHbSQ4kNGLhJ27xc0OuJCp9ctaA
 VmKwjmVbmaqZkvhAXYHwbQQ2v40srUhMAtfqtOGOfGt3JKix6I1rduysZ Q==;
X-CSE-ConnectionGUID: v6xe3eAWQtuS/VuK4J6DlA==
X-CSE-MsgGUID: PlSlYCbmS0eLgpChZ4k57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53528807"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53528807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 08:58:21 -0700
X-CSE-ConnectionGUID: sil2bnhCT96907E+hxr2BA==
X-CSE-MsgGUID: t7PDDZ8XQCqDoAaZlh6+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="190992177"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 08:58:19 -0700
Date: Tue, 1 Jul 2025 17:58:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH igt 1/9] drm/recovery: Wait for devcore to become available
Message-ID: <20250701155803.mqaptav2i4mkfl6e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630180903.77990-2-robin.clark@oss.qualcomm.com>
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

Hi Rob,
On 2025-06-30 at 11:08:55 -0700, Rob Clark wrote:
> From: Rob Clark <rob.clark@oss.qualcomm.com>

Please change subject, it is now:
[PATCH igt 1/9] drm/recovery: Wait for devcore to become available

and it should be:
[PATCH igt 1/9] tests/msm/msm_recovery: Wait for devcore to become available

or little shorter:
[PATCH igt 1/9] tests/msm/msm_recovery: Wait for devcore

After a resend I will ack it, I have also few nits for other
patches.

Regards,
Kamil

> 
> The devcore could take some time to show up, so add a igt_wait() with
> timeout so we don't fail the test if the devcore is not immediately
> available.
> 
> This addresses a source of flakeyness.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/msm_recovery.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
> index fbe26e687ed3..433392079bd4 100644
> --- a/tests/msm/msm_recovery.c
> +++ b/tests/msm/msm_recovery.c
> @@ -44,8 +44,12 @@ read_and_clear_devcore(void)
>  	glob_t glob_buf = {0};
>  	int ret, fd;
>  
> -	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
> -	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
> +	/* The devcore shows up asynchronously, so it might not be
> +	 * immediately available:
> +	 */
> +	if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
> +			   GLOB_NOSORT, NULL, &glob_buf) != GLOB_NOMATCH,
> +		      1000, 100))
>  		return;
>  
>  	fd = open(glob_buf.gl_pathv[0], O_RDWR);
> -- 
> 2.50.0
> 
