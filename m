Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35267C44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEFE10E59E;
	Mon, 13 Jul 2026 09:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JliopZ0D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A5810E59E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 09:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783936275; x=1815472275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PUoYhVtX4mkghjeQAuv6EcsWAKKzcUSj6mILvsYsSQA=;
 b=JliopZ0D60D/Xm/1ottzEspn7GnsHzmWEJ6dcqUqHRxEFByhtR5XegC/
 aQor7szPa8x2GlZWNw3anaT9HKjTGpGfLRACT06TYQCguAx9QT97FXmS3
 vCt05lvvf2jbFdbtZ4S5Qf8j1yiEXaEpZHXLrLHwqhj3o19oILxD2gLCN
 5KYJGPq6EG0kfud/FYcZ34sHpYUYMmc1Ghgz24dj6e7RA3f0y6aloI9Lq
 Lx6A+fHj2wQNFYqYtIJ/tM5G1w8c4T9vT26wQMbe07yuG6dOSmxgy0TIu
 FuW/exuCCNEbALN7+R5ueb+DexzPQXMulRkbW/mymRJrqNQwOsarpUBHb Q==;
X-CSE-ConnectionGUID: ILGsvuFeQmaaRTVM9KR3Vw==
X-CSE-MsgGUID: 0Or/qBXQTwqWQ9kBIK/8Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="110084533"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="110084533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:51:13 -0700
X-CSE-ConnectionGUID: 0mSRtL3IQ2i7E/LeNOJM4g==
X-CSE-MsgGUID: actDW/sJQ3yRCNEQBOSSjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260398785"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:51:10 -0700
Date: Mon, 13 Jul 2026 11:51:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t 1/2] tests/v3d: Expect EINVAL for empty multisync
 submissions
Message-ID: <20260713095108.i2wz4ursna7wt72c@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20260712210328.3690745-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260712210328.3690745-1-mcanal@igalia.com>
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
On 2026-07-12 at 18:00:57 -0300, Maíra Canal wrote:
> The kernel commit fb44d589bf31 ("drm/v3d: Reject empty multisync
> extension to prevent infinite loop") makes v3d_get_multisync_submit_deps()
> reject an empty multisync extension. Such an extension carries no
> synchronization information and serves no useful purpose. More than that,
> a self-referential empty extension could previously drive an unbounded
> loop in v3d_get_extensions().
> 
> The valid-multisync-submission subtests submitted a multisync extension
> without any syncobjs and expected the ioctl to succeed, which no longer
> holds against stable kernels that rejects empty multisync submissions.
> Rename them to empty-multisync-submission and expect -EINVAL instead,
> for both the CL and CSD submit paths.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/v3d/v3d_submit_cl.c  | 6 +++---
>  tests/v3d/v3d_submit_csd.c | 6 +++---
>  tests/v3d_ci/v3d.testlist  | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
> index 319fd7593..824b75793 100644
> --- a/tests/v3d/v3d_submit_cl.c
> +++ b/tests/v3d/v3d_submit_cl.c
> @@ -230,8 +230,8 @@ int igt_main()
>  		igt_v3d_free_cl_job(fd, job);
>  	}
>  
> -	igt_describe("Test a valid submission with a multisync without syncobjs.");
> -	igt_subtest("valid-multisync-submission") {
> +	igt_describe("Test an invalid submission with a multisync without syncobjs.");
> +	igt_subtest("empty-multisync-submission") {
>  		struct drm_v3d_multi_sync ms = { };
>  		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
>  
> @@ -243,7 +243,7 @@ int igt_main()
>  			igt_v3d_set_multisync(&ms, V3D_RENDER);
>  			job->submit->extensions = to_user_pointer(&ms);
>  
> -			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
> +			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
>  		}
>  
>  		igt_v3d_free_cl_job(fd, job);
> diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
> index 35da19350..ca429f1db 100644
> --- a/tests/v3d/v3d_submit_csd.c
> +++ b/tests/v3d/v3d_submit_csd.c
> @@ -214,8 +214,8 @@ int igt_main()
>  		igt_v3d_free_csd_job(fd, job2);
>  	}
>  
> -	igt_describe("Test a valid submission with a multisync without syncobjs.");
> -	igt_subtest("valid-multisync-submission") {
> +	igt_describe("Test an invalid submission with a multisync without syncobjs.");
> +	igt_subtest("empty-multisync-submission") {
>  		struct drm_v3d_multi_sync ms = { };
>  		struct v3d_csd_job *job = igt_v3d_empty_shader(fd);
>  
> @@ -227,7 +227,7 @@ int igt_main()
>  			igt_v3d_set_multisync(&ms, V3D_CSD);
>  			job->submit->extensions = to_user_pointer(&ms);
>  
> -			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, job->submit);
> +			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, job->submit, EINVAL);
>  		}
>  
>  		igt_v3d_free_csd_job(fd, job);
> diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
> index 106e9cf2d..976d7d40d 100644
> --- a/tests/v3d_ci/v3d.testlist
> +++ b/tests/v3d_ci/v3d.testlist
> @@ -27,7 +27,7 @@ igt@v3d/v3d_submit_cl@valid-submission
>  igt@v3d/v3d_submit_cl@single-out-sync
>  igt@v3d/v3d_submit_cl@single-in-sync
>  igt@v3d/v3d_submit_cl@simple-flush-cache
> -igt@v3d/v3d_submit_cl@valid-multisync-submission
> +igt@v3d/v3d_submit_cl@empty-multisync-submission
>  igt@v3d/v3d_submit_cl@multiple-job-submission
>  igt@v3d/v3d_submit_cl@multisync-out-syncs
>  igt@v3d/v3d_submit_cl@multi-and-single-sync
> @@ -45,7 +45,7 @@ igt@v3d/v3d_submit_csd@bad-multisync-in-sync
>  igt@v3d/v3d_submit_csd@valid-submission
>  igt@v3d/v3d_submit_csd@single-out-sync
>  igt@v3d/v3d_submit_csd@single-in-sync
> -igt@v3d/v3d_submit_csd@valid-multisync-submission
> +igt@v3d/v3d_submit_csd@empty-multisync-submission
>  igt@v3d/v3d_submit_csd@multiple-job-submission
>  igt@v3d/v3d_submit_csd@multisync-out-syncs
>  igt@v3d/v3d_submit_csd@multi-and-single-sync
> -- 
> 2.54.0
> 
